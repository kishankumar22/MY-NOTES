export async function PUT(req: Request) {
  const startTime = performance.now(); // ⏱️ Performance measurement

  try {
    // 1. Auth (FAST - cached)
    const user = await getUserFromToken();
    if (!user) {
      return NextResponse.json({ success: false, error: 'Authentication required' }, { status: 401 });
    }

    const body = await req.json();
    const { action, Id } = body;

    // 🟢 EARLY RETURNS - Fast validation
    if (!Id) {
      return NextResponse.json({ success: false, error: 'Assignment ID is required' }, { status: 400 });
    }

    const assignmentId = parseInt(Id);

    // 🔥 SINGLE TRANSACTION FOR ALL OPERATIONS
    const result = await prisma.$transaction(async (tx) => {
      // 2. BASE ASSIGNMENT FETCH (MINIMAL - NO N+1)
      const baseAssignment = await tx.taskAssignment.findUnique({
        where: { Id: assignmentId },
        select: {
          Id: true,
          TaskId: true,
          UserId: true,
          Status: true,
          Level: true,
          HandedOverBy: true,
          CreatedBy: true,
          IsActive: true
        }
      });

      if (!baseAssignment) {
        throw new Error('Assignment not found');
      }

      // 3. ACTION HANDLERS
      if (action === 'refer_handover_task') {
        return await handleReferBack(tx, baseAssignment, body, user);
      }

      if (action === 'update_handover_task') {
        return await handleUpdateHandover(tx, baseAssignment, body, user);
      }

      if (action === 'review_task') {
        return await handleReviewTask(tx, baseAssignment, body, user);
      }

      // 4. DEFAULT UPDATE
      return await handleRegularUpdate(tx, baseAssignment, body, user);
    });

    const endTime = performance.now();
    console.log(`🚀 /api/task-handover completed in ${(endTime - startTime).toFixed(0)}ms`);

    return NextResponse.json({
      success: true,
      ...result,
      performance: `${(endTime - startTime).toFixed(0)}ms`
    });

  } catch (error: any) {
    const endTime = performance.now();
    logger.error('Failed to update assignment', { error, duration: `${(endTime - startTime).toFixed(0)}ms` });
    return NextResponse.json({ success: false, error: error.message || 'Failed to update assignment' }, { status: 500 });
  }
}

// 🟢 OPTIMIZED HANDLERS
async function handleReferBack(tx: any, assignment: any, body: any, user: any) {
  // 1. SINGLE QUERY - Get all needed data
  const [currentAssignment, previousAssignment, referToUser] = await Promise.all([
    tx.taskAssignment.findUnique({
      where: { Id: assignment.Id },
      select: { Status: true, Level: true, HandedOverBy: true, TaskId: true }
    }),
    tx.taskAssignment.findFirst({
      where: {
        TaskId: assignment.TaskId,
        Level: assignment.Level - 1,
        UserId: assignment.HandedOverBy
      },
      select: { Id: true, Status: true, HandedOverBy: true, CreatedBy: true }
    }),
    tx.user.findUnique({
      where: { Id: previousAssignment?.HandedOverBy || assignment.CreatedBy },
      select: { Id: true, Name: true, Role: { select: { Name: true } } }
    })
  ]);

  // Validations (FAST)
  if (currentAssignment.Status !== 'Completed') throw new Error('Can only refer back Completed assignments');
  if (!previousAssignment) throw new Error('Previous level assignment not found');
  if (previousAssignment.Status === 'Completed' || previousAssignment.Status === 'In Review') {
    return { success: false, error: 'Already referred back this task', alreadyReferred: true };
  }

  // SINGLE TRANSACTION BLOCK
  const [updatedAssignment, newHandover] = await Promise.all([
    tx.taskAssignment.update({
      where: { Id: previousAssignment.Id },
      data: {
        IsActive: true,
        Status: 'In Review',
        ReferredTo: referToUser.Id,
        ModifiedBy: user.Id,
        ModifiedOn: new Date(),
        ReviewStatus: 'Pending'
      }
    }),
    tx.taskHandover.create({
      data: {
        TaskId: assignment.TaskId,
        FromUserId: user.Id,
        ToUserId: referToUser.Id,
        FromLevel: assignment.Level,
        ToLevel: assignment.Level - 1,
        HandoverReason: `Task referred back to ${referToUser.Name}`,
        HandoverType: 'In Review',
        HandoverDate: new Date(),
        CreatedBy: user.Id,
        IsActive: true
      }
    })
  ]);

  // Update task (BATCH)
  await tx.task.update({
    where: { Id: assignment.TaskId },
    data: {
      Status: 'In Review',
      CurrentAssignee: referToUser.Id,
      CurrentLevel: assignment.Level - 1,
      ModifiedBy: user.Id,
      ModifiedOn: new Date()
    }
  });

  return {
    assignment: updatedAssignment,
    handover: newHandover,
    referToUser,
    message: `Task referred back to ${referToUser.Name}`
  };
}

async function handleUpdateHandover(tx: any, assignment: any, body: any, user: any) {
  const { UserId, HandoverReason, HandedOverBy } = body;

  // Check existing assignment (SINGLE QUERY)
  const existingAssignment = await tx.taskAssignment.findFirst({
    where: {
      TaskId: assignment.TaskId,
      UserId: parseInt(UserId),
      Id: { not: assignment.Id }
    },
    select: { Id: true, Level: true, IsActive: true }
  });

  if (existingAssignment && !existingAssignment.IsActive) {
    // REACTIVATE EXISTING
    const reactivated = await tx.taskAssignment.update({
      where: { Id: existingAssignment.Id },
      data: {
        IsActive: true,
        HandedOverBy: parseInt(HandedOverBy),
        Status: 'Not Started',
        Progress: 0,
        WorkProgress: '0%',
        ReviewStatus: 'Pending',
        ModifiedBy: user.Id,
        ModifiedOn: new Date()
      }
    });

    await tx.task.update({
      where: { Id: assignment.TaskId },
      data: { CurrentAssignee: parseInt(UserId), CurrentLevel: existingAssignment.Level }
    });

    return { assignment: reactivated, isReactivated: true, message: 'Assignment reactivated' };
  }

  // NEW ASSIGNMENT
  const updated = await tx.taskAssignment.update({
    where: { Id: assignment.Id },
    data: {
      UserId: parseInt(UserId),
      HandedOverBy: parseInt(HandedOverBy),
      ModifiedBy: user.Id,
      ModifiedOn: new Date()
    }
  });

  await tx.task.update({
    where: { Id: assignment.TaskId },
    data: { CurrentAssignee: parseInt(UserId) }
  });

  return { assignment: updated, isReactivated: false, message: 'Assignment updated' };
}

async function handleReviewTask(tx: any, assignment: any, body: any, user: any) {
  const { reviewAction, reviewComments } = body;

  if (assignment.Status !== 'In Review') throw new Error('Can only review In Review assignments');

  const statusMap: any = {
    approve: { status: 'Completed', reviewStatus: 'Approved' },
    reject: { status: 'Reassigned', reviewStatus: 'Rejected' },
    request_changes: { status: 'In Progress', reviewStatus: 'Changes Requested' }
  };

  const { status, reviewStatus } = statusMap[reviewAction];

  const updated = await tx.taskAssignment.update({
    where: { Id: assignment.Id },
    data: {
      Status: status,
      ReviewStatus: reviewStatus,
      ReviewedAt: new Date(),
      CompletedAt: reviewAction === 'approve' ? new Date() : null,
      Remarks: reviewComments ? `${reviewComments}` : undefined,
      ModifiedBy: user.Id,
      ModifiedOn: new Date()
    }
  });

  // Update task status
  await tx.task.update({
    where: { Id: assignment.TaskId },
    data: {
      Status: status,
      CompletedDate: reviewAction === 'approve' ? new Date() : null,
      ModifiedBy: user.Id,
      ModifiedOn: new Date()
    }
  });

  return { assignment: updated, message: `Task ${reviewAction}d` };
}

async function handleRegularUpdate(tx: any, assignment: any, body: any, user: any) {
  const updateData: any = {
    ModifiedBy: user.Id,
    ModifiedOn: new Date()
  };

  // Map only provided fields
  const fields = ['Status', 'Progress', 'Remarks', 'WorkProgress', 'ReviewStatus', 'ReferredTo'];
  fields.forEach(field => {
    if (body[field] !== undefined) updateData[field] = body[field];
  });

  // Handle completion
  if (updateData.Status === 'Completed') {
    updateData.CompletedAt = new Date();
    if (updateData.Progress >= 100) {
      updateData.Progress = 100;
      updateData.WorkProgress = '100%';
    }
  }

  const updated = await tx.taskAssignment.update({
    where: { Id: assignment.Id },
    data: updateData
  });

  // Sync Level 1 task status
  if (assignment.Level === 1 && updateData.Status) {
    await tx.task.update({
      where: { Id: assignment.TaskId },
      data: {
        Status: updateData.Status,
        CompletedDate: updateData.Status === 'Completed' ? new Date() : null
      }
    });
  }

  return { assignment: updated, message: 'Assignment updated' };
}




async function handleReferBack(tx: any, assignment: any, body: any, user: any) {
  // 🟢 FIX 1: PREVIOUS ASSIGNMENT KO PEHLE FETCH KARO
  const previousAssignment = await tx.taskAssignment.findFirst({
    where: {
      TaskId: assignment.TaskId,
      Level: assignment.Level - 1,
      UserId: assignment.HandedOverBy
    },
    select: { Id: true, Status: true, HandedOverBy: true, CreatedBy: true }
  });

  if (!previousAssignment) throw new Error('Previous level assignment not found');

  // 🟢 FIX 2: ABA Promise.all() MEIN USE KARO (SAFE)
  const [currentAssignment, referToUser] = await Promise.all([
    tx.taskAssignment.findUnique({
      where: { Id: assignment.Id },
      select: { Status: true, Level: true, HandedOverBy: true, TaskId: true }
    }),
    tx.user.findUnique({
      where: { Id: previousAssignment.HandedOverBy || assignment.CreatedBy },
      select: { Id: true, Name: true, Role: { select: { Name: true } } }
    })
  ]);

  // Validations (FAST)
  if (currentAssignment?.Status !== 'Completed') throw new Error('Can only refer back Completed assignments');
  if (previousAssignment.Status === 'Completed' || previousAssignment.Status === 'In Review') {
    return { success: false, error: 'Already referred back this task', alreadyReferred: true };
  }
  if (!referToUser) throw new Error('Refer to user not found');

  // SINGLE TRANSACTION BLOCK
  const [updatedAssignment, newHandover] = await Promise.all([
    tx.taskAssignment.update({
      where: { Id: previousAssignment.Id },
      data: {
        IsActive: true,
        Status: 'In Review',
        ReferredTo: referToUser.Id,
        ModifiedBy: user.Id,
        ModifiedOn: new Date(),
        ReviewStatus: 'Pending'
      }
    }),
    tx.taskHandover.create({
      data: {
        TaskId: assignment.TaskId,
        FromUserId: user.Id,
        ToUserId: referToUser.Id,
        FromLevel: assignment.Level,
        ToLevel: assignment.Level - 1,
        HandoverReason: `Task referred back to ${referToUser.Name}`,
        HandoverType: 'In Review',
        HandoverDate: new Date(),
        CreatedBy: user.Id,
        IsActive: true
      }
    })
  ]);

  // Update task (BATCH)
  await tx.task.update({
    where: { Id: assignment.TaskId },
    data: {
      Status: 'In Review',
      CurrentAssignee: referToUser.Id,
      CurrentLevel: assignment.Level - 1,
      ModifiedBy: user.Id,
      ModifiedOn: new Date()
    }
  });

  return {
    assignment: updatedAssignment,
    handover: newHandover,
    referToUser,
    message: `Task referred back to ${referToUser.Name}`
  };
}
