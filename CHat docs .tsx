import { NextResponse } from 'next/server';
import prisma from '@/app/lib/db';
import { logger } from '@/app/lib/logger';
import { getUserFromToken } from '@/app/lib/utils/getUserFromToken';
import { uploadFiles } from '../../lib/utils/uploadedFiles';
import fs from 'fs';
import path from 'path';

// Helper function to generate unique filename
const generateUniqueFileName = (basePath: string, fileName: string): string => {
  const ext = path.extname(fileName);
  const nameWithoutExt = path.basename(fileName, ext);
  
  let counter = 0;
  let newFileName = fileName;
  
  // Check if file exists and generate unique name
  while (fs.existsSync(path.join(basePath, newFileName))) {
    counter++;
    newFileName = `${nameWithoutExt}(${counter})${ext}`;
  }
  
  return newFileName;
};

// Helper function to sanitize filename
const sanitizeFileName = (fileName: string): string => {
  return fileName
    .replace(/[^a-zA-Z0-9._-]/g, '_')
    .replace(/_{2,}/g, '_')
    .replace(/^_|_$/g, '');
};

// Enhanced file upload function with unique naming
const uploadFilesWithUniqueNames = async (files: File[], pathSegments: string[]) => {
  try {
    const uploadPath = path.join(process.cwd(), 'public', ...pathSegments);
    
    if (!fs.existsSync(uploadPath)) {
      fs.mkdirSync(uploadPath, { recursive: true });
    }

    const uploadedFiles = [];

    for (const file of files) {
      if (!file || file.size === 0) continue;

      // Sanitize and generate unique filename
      const sanitizedName = sanitizeFileName(file.name);
      const uniqueFileName = generateUniqueFileName(uploadPath, sanitizedName);
      const filePath = path.join(uploadPath, uniqueFileName);

      // Convert File to Buffer
      const arrayBuffer = await file.arrayBuffer();
      const buffer = Buffer.from(arrayBuffer);

      // Write file to disk
      fs.writeFileSync(filePath, buffer);

      uploadedFiles.push({
        fileName: uniqueFileName,
        originalName: file.name,
        filePath: `/images/note/${uniqueFileName}`,
        fileSize: file.size,
        fileType: file.type || 'application/octet-stream'
      });
    }

    return uploadedFiles;
  } catch (error) {
    console.error('Error uploading files:', error);
    throw new Error('Failed to upload files');
  }
};

// Helper function to delete files
const deleteFiles = (filesJson: string | null) => {
  if (!filesJson) return;
  
  try {
    const files = JSON.parse(filesJson);
    files.forEach((fileInfo: any) => {
      const filePath = path.join(process.cwd(), 'public', 'images', 'note', fileInfo.fileName);
      if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
        logger.info(`✅ Deleted file: ${fileInfo.fileName}`);
      }
    });
  } catch (error) {
    logger.error('❌ Error deleting files:', error);
  }
};

// GET - Fetch user's notes with search and filter
export async function GET(request: Request) {
  try {
    const user = await getUserFromToken();
    if (!user) {
      return NextResponse.json(
        { success: false, error: 'Unauthorized' },
        { status: 401 }
      );
    }

    const { searchParams } = new URL(request.url);
    const search = searchParams.get('search') || '';
    const isPinned = searchParams.get('isPinned');
    const isActive = searchParams.get('isActive');
    const tags = searchParams.get('tags');
    const limit = parseInt(searchParams.get('limit') || '50');
    const fromDate = searchParams.get('fromDate');
    const toDate = searchParams.get('toDate');

    const whereClause: any = {
      UserId: user.Id
    };

    // Filter by active/archived status
    if (isActive !== null && isActive !== '') {
      whereClause.IsActive = isActive === 'true';
    }

    // Date range filter
    if (fromDate || toDate) {
      whereClause.CreatedOn = {};
      if (fromDate) {
        whereClause.CreatedOn.gte = new Date(fromDate);
      }
      if (toDate) {
        const endDate = new Date(toDate);
        endDate.setHours(23, 59, 59, 999);
        whereClause.CreatedOn.lte = endDate;
      }
    }

    // Search in title and content
    if (search) {
      whereClause.OR = [
        { 
          Title: { 
            contains: search
          } 
        },
        { 
          Content: { 
            contains: search
          } 
        }
      ];
    }

    // Filter by pinned status
    if (isPinned !== null && isPinned !== '') {
      whereClause.IsPinned = isPinned === 'true';
    }

    // Filter by tags
    if (tags) {
      whereClause.Tags = { 
        contains: tags
      };
    }

    const notes = await prisma.note.findMany({
      where: whereClause,
      orderBy: [
        { IsPinned: 'desc' },
        { ModifiedOn: 'desc' },
        { CreatedOn: 'desc' }
      ],
      take: limit,
      include: {
        User: {
          select: {
            Id: true,
            Name: true
          }
        }
      }
    });

    logger.info(`✅ Fetched ${notes.length} notes for user ${user.Name}`);
    return NextResponse.json({ success: true, notes });
  } catch (error) {
    logger.error('❌ Failed to fetch notes.', {
      error: error instanceof Error ? error.message : String(error),
      timestamp: new Date().toISOString()
    });
    return NextResponse.json(
      { success: false, error: 'Database error while fetching notes.' },
      { status: 500 }
    );
  }
}

// POST - Create new note with file upload
export async function POST(request: Request) {
  try {
    const user = await getUserFromToken();
    if (!user) {
      return NextResponse.json(
        { success: false, error: 'Unauthorized' },
        { status: 401 }
      );
    }

    const contentType = request.headers.get('content-type') || '';
    
    let title: string;
    let content: string;
    let tags: string[];
    let isPinned: boolean;
    let files: File[] = [];

    if (contentType.includes('multipart/form-data')) {
      // Handle form data with files
      const formData = await request.formData();
      title = formData.get('title') as string;
      content = formData.get('content') as string;
      const tagsString = formData.get('tags') as string;
      isPinned = formData.get('isPinned') === 'true';
      
      // Process tags
      if (tagsString) {
        try {
          tags = JSON.parse(tagsString);
        } catch {
          tags = tagsString.split(',').map(tag => tag.trim()).filter(Boolean);
        }
      } else {
        tags = [];
      }

      // Get files
      const fileEntries = formData.getAll('files') as File[];
      fileEntries.forEach(file => {
        if (file && file.size > 0) {
          files.push(file);
        }
      });
    } else {
      // Handle JSON data (backward compatibility)
      const body = await request.json();
      ({ title, content, tags = [], isPinned = false } = body);
    }

    if (!title || !content) {
      return NextResponse.json(
        { success: false, error: 'Title and content are required.' },
        { status: 400 }
      );
    }

    // Process tags properly
    const tagsString = Array.isArray(tags) && tags.length > 0 
      ? tags.join(',') 
      : null;

    // Upload files with unique names if any
    let filePathsArray: any[] = [];
    if (files.length > 0) {
      try {
        const uploadedFiles = await uploadFilesWithUniqueNames(files, ['images', 'note']);
        filePathsArray = uploadedFiles;
        
        logger.info(`✅ Uploaded ${uploadedFiles.length} files with unique names:`, uploadedFiles.map(f => f.fileName));
      } catch (uploadError) {
        logger.error('❌ Failed to upload files:', uploadError);
        return NextResponse.json(
          { success: false, error: 'Failed to upload files' },
          { status: 500 }
        );
      }
    }

    // Store file info as JSON
    const filesJson = filePathsArray.length > 0 ? JSON.stringify(filePathsArray) : null;

    const note = await prisma.note.create({
      data: {
        Title: title,
        Content: content,
        UserId: user.Id,
        CreatedBy: user.Name,
        Tags: tagsString,
        IsPinned: isPinned || false,
        Files: filesJson
      },
      include: {
        User: {
          select: {
            Id: true,
            Name: true
          }
        }
      }
    });

    logger.info(`✅ Created note ${note.Id} with ${filePathsArray.length} files by user ${user.Name}`);
    return NextResponse.json({ 
      success: true, 
      note,
      uploadedFiles: filePathsArray.map(f => ({
        fileName: f.fileName,
        originalName: f.originalName
      }))
    }, { status: 201 });
  } catch (error) {
    logger.error('❌ Failed to create note.', {
      error: error instanceof Error ? error.message : String(error),
      timestamp: new Date().toISOString()
    });
    return NextResponse.json(
      { success: false, error: 'Database error while creating note.' },
      { status: 500 }
    );
  }
}

// PUT - Update note with file upload
export async function PUT(request: Request) {
  try {
    const user = await getUserFromToken();
    if (!user) {
      return NextResponse.json(
        { success: false, error: 'Unauthorized' },
        { status: 401 }
      );
    }

    const contentType = request.headers.get('content-type') || '';
    
    let id: number;
    let title: string | undefined;
    let content: string | undefined;
    let tags: string[] | undefined;
    let isPinned: boolean | undefined;
    let isActive: boolean | undefined;
    let files: File[] = [];
    let removeFileIds: string[] = [];

    if (contentType.includes('multipart/form-data')) {
      // Handle form data with files
      const formData = await request.formData();
      id = parseInt(formData.get('id') as string);
      title = formData.get('title') as string || undefined;
      content = formData.get('content') as string || undefined;
      const tagsString = formData.get('tags') as string;
      isPinned = formData.get('isPinned') === 'true' ? true : undefined;
      isActive = formData.get('isActive') === 'true' ? true : undefined;
      const removeFilesString = formData.get('removeFiles') as string;
      
      // Process tags
      if (tagsString) {
        try {
          tags = JSON.parse(tagsString);
        } catch {
          tags = tagsString.split(',').map(tag => tag.trim()).filter(Boolean);
        }
      }

      // Process files to remove
      if (removeFilesString) {
        try {
          removeFileIds = JSON.parse(removeFilesString);
        } catch {
          removeFileIds = [];
        }
      }

      // Get new files
      const fileEntries = formData.getAll('files') as File[];
      fileEntries.forEach(file => {
        if (file && file.size > 0) {
          files.push(file);
        }
      });
    } else {
      // Handle JSON data (backward compatibility)
      const body = await request.json();
      ({ id, title, content, tags, isPinned, isActive } = body);
    }

    if (!id) {
      return NextResponse.json(
        { success: false, error: 'Note ID is required.' },
        { status: 400 }
      );
    }

    // Check if note belongs to user
    const existingNote = await prisma.note.findFirst({
      where: { Id: id, UserId: user.Id }
    });

    if (!existingNote) {
      return NextResponse.json(
        { success: false, error: 'Note not found or unauthorized.' },
        { status: 404 }
      );
    }

    // Process tags properly
    const tagsString = Array.isArray(tags) && tags.length > 0 
      ? tags.join(',') 
      : null;

    const updateData: any = {
      ModifiedBy: user.Name,
      ModifiedOn: new Date()
    };

    // Only update provided fields
    if (title !== undefined) updateData.Title = title;
    if (content !== undefined) updateData.Content = content;
    if (tags !== undefined) updateData.Tags = tagsString;
    if (isPinned !== undefined) updateData.IsPinned = isPinned;
    if (isActive !== undefined) updateData.IsActive = isActive;

    // Handle file operations
    let existingFiles: any[] = [];
    if (existingNote.Files) {
      try {
        existingFiles = JSON.parse(existingNote.Files);
      } catch {
        existingFiles = [];
      }
    }

    // Remove specified files
    if (removeFileIds.length > 0) {
      const filesToKeep = existingFiles.filter(file => !removeFileIds.includes(file.fileName));
      const filesToDelete = existingFiles.filter(file => removeFileIds.includes(file.fileName));
      
      // Delete files from filesystem
      filesToDelete.forEach(fileInfo => {
        const filePath = path.join(process.cwd(), 'public', 'images', 'note', fileInfo.fileName);
        if (fs.existsSync(filePath)) {
          fs.unlinkSync(filePath);
          logger.info(`✅ Deleted file: ${fileInfo.fileName}`);
        }
      });
      
      existingFiles = filesToKeep;
    }

    // Handle new files if any
    if (files.length > 0) {
      try {
        const uploadedFiles = await uploadFilesWithUniqueNames(files, ['images', 'note']);
        existingFiles = [...existingFiles, ...uploadedFiles];
        
        logger.info(`✅ Added ${uploadedFiles.length} new files with unique names:`, uploadedFiles.map(f => f.fileName));
      } catch (uploadError) {
        logger.error('❌ Failed to upload files during update:', uploadError);
        return NextResponse.json(
          { success: false, error: 'Failed to upload new files' },
          { status: 500 }
        );
      }
    }

    // Update files in database
    updateData.Files = existingFiles.length > 0 ? JSON.stringify(existingFiles) : null;

    const note = await prisma.note.update({
      where: { Id: id },
      data: updateData,
      include: {
        User: {
          select: {
            Id: true,
            Name: true
          }
        }
      }
    });

    logger.info(`✅ Updated note ${note.Id} by user ${user.Name}`);
    return NextResponse.json({ success: true, note });
  } catch (error) {
    logger.error('❌ Failed to update note.', {
      error: error instanceof Error ? error.message : String(error),
      timestamp: new Date().toISOString()
    });
    return NextResponse.json(
      { success: false, error: 'Database error while updating note.' },
      { status: 500 }
    );
  }
}

// DELETE - Hard delete note and associated files
export async function DELETE(request: Request) {
  try {
    const user = await getUserFromToken();
    if (!user) {
      return NextResponse.json(
        { success: false, error: 'Unauthorized' },
        { status: 401 }
      );
    }

    const { searchParams } = new URL(request.url);
    const id = parseInt(searchParams.get('id') || '0');

    if (!id) {
      return NextResponse.json(
        { success: false, error: 'Note ID is required.' },
        { status: 400 }
      );
    }

    // Check if note belongs to user
    const existingNote = await prisma.note.findFirst({
      where: { Id: id, UserId: user.Id }
    });

    if (!existingNote) {
      return NextResponse.json(
        { success: false, error: 'Note not found or unauthorized.' },
        { status: 404 }
      );
    }

    // Delete associated files if any
    deleteFiles(existingNote.Files);

    await prisma.note.delete({
      where: { Id: id }
    });

    logger.info(`✅ Permanently deleted note ${id} and associated files by user ${user.Name}`);
    return NextResponse.json({ success: true, message: 'Note permanently deleted.' });
  } catch (error) {
    logger.error('❌ Failed to delete note.', {
      error: error instanceof Error ? error.message : String(error),
      timestamp: new Date().toISOString()
    });
    return NextResponse.json(
      { success: false, error: 'Database error while deleting note.' },
      { status: 500 }
    );
  }
}



=----------------------------
model Note {
  Id         Int       @id @default(autoincrement())
  Title      String
  Content    String    @db.Text
  UserId     Int
  User       User      @relation("UserNotes", fields: [UserId], references: [Id], onDelete: NoAction, onUpdate: NoAction)
  CreatedBy  String?
  CreatedOn  DateTime  @default(now())
  ModifiedBy String?
  ModifiedOn DateTime?
  IsActive   Boolean   @default(true)
  IsPinned   Boolean   @default(false)
  Tags       String?   // Store as JSON string: ["work", "personal"]
  Files      String?   // Store as JSON array of file paths: ["/images/note/file1.pdf", "/images/note/file2.jpg"]
  
  @@index([UserId])
  @@index([CreatedOn])
}


-'use client';

import React, { useState, useEffect, useRef } from 'react';
import { Note, CreateNoteData, UpdateNoteData, NotesFilters, ToastMessageData } from './note';
import { Search, Plus, Pin, PinOff, Edit2, Trash2, Tag, Clock, Archive, ArchiveRestore, X, AlertTriangle, Bold, Italic, Underline, AlignLeft, AlignCenter, AlignRight, List, ListOrdered, Type, Palette, Eye, Copy, FileText, Upload, Download, File as FileIcon, Calendar } from 'lucide-react';
import axiosInstance from '../lib/axios';
import { ToastMessage } from '../components/ToastMessage';
import DataLoader from '../components/DataLoader';

// API Response Type
interface ApiResponse<T = any> {
  success: boolean;
  data?: T;
  notes?: T;
  note?: T;
  message?: string;
  error?: string;
}

// File Modal Component with View/Download/Delete
interface FileModalProps {
  isOpen: boolean;
  onClose: () => void;
  files: any[];
  noteTitle: string;
  noteId: number;
  onFileDelete: (fileName: string) => void;
}

const FileModal: React.FC<FileModalProps> = ({ isOpen, onClose, files, noteTitle, noteId, onFileDelete }) => {
  const modalRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        onClose();
      }
    };

    if (isOpen) {
      document.addEventListener('keydown', handleEscape);
      document.body.style.overflow = 'hidden';
    }

    return () => {
      document.removeEventListener('keydown', handleEscape);
      document.body.style.overflow = 'unset';
    };
  }, [isOpen, onClose]);

  const handleBackdropClick = (e: React.MouseEvent) => {
    if (e.target === modalRef.current) {
      onClose();
    }
  };

  const handleDownload = (file: any) => {
    const link = document.createElement('a');
    link.href = file.filePath;
    link.download = file.originalName || file.fileName;
    link.target = '_blank';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  const handleDelete = async (fileName: string) => {
    if (!confirm('Are you sure you want to delete this file?')) return;
    
    try {
      const formData = new FormData();
      formData.append('id', noteId.toString());
      formData.append('removeFiles', JSON.stringify([fileName]));

      const response = await axiosInstance.put('/api/note', formData, {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      });

      if (response.data.success) {
        onFileDelete(fileName);
      }
    } catch (error) {
      console.error('Error deleting file:', error);
    }
  };

  const getFileIcon = (fileName: string) => {
    const ext = fileName.toLowerCase().split('.').pop();
    switch (ext) {
      case 'pdf':
        return '📄';
      case 'doc':
      case 'docx':
        return '📝';
      case 'xls':
      case 'xlsx':
        return '📊';
      case 'ppt':
      case 'pptx':
        return '📋';
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'webp':
        return '🖼️';
      case 'txt':
        return '📄';
      case 'sql':
        return '🗃️';
      default:
        return '📎';
    }
  };

  const formatFileSize = (bytes: number) => {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
  };

  if (!isOpen) return null;

  return (
    <div 
      ref={modalRef}
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/30 backdrop-blur-sm p-3"
      onClick={handleBackdropClick}
    >
      <div className="bg-white rounded-xl shadow-2xl w-full max-w-3xl max-h-[80vh] overflow-y-auto border border-gray-200">
        <div className="flex items-center justify-between p-4 border-b border-gray-200 bg-gradient-to-r from-blue-50 to-indigo-50">
          <h2 className="text-xl font-bold text-gray-900 flex items-center gap-2">
            <FileIcon className="h-5 w-5 text-blue-600" />
            Files - {noteTitle} ({files.length})
          </h2>
          <button
            onClick={onClose}
            className="text-gray-500 hover:text-gray-700 transition-colors p-1 rounded-full hover:bg-white/50"
          >
            <X className="h-5 w-5" />
          </button>
        </div>
        
        <div className="p-4">
          {files.length === 0 ? (
            <div className="text-center py-8">
              <FileIcon className="w-16 h-16 text-gray-300 mx-auto mb-4" />
              <p className="text-gray-500">No files attached to this note</p>
            </div>
          ) : (
            <div className="grid grid-cols-1 gap-3">
              {files.map((file, index) => (
                <div key={index} className="flex items-center justify-between p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
                  <div className="flex items-center gap-4 flex-1">
                    <span className="text-3xl">{getFileIcon(file.fileName)}</span>
                    <div className="flex-1">
                      <p className="font-medium text-gray-900 text-lg">{file.originalName || file.fileName}</p>
                      <div className="flex items-center gap-4 text-sm text-gray-500 mt-1">
                        <span>{file.fileName}</span>
                        {file.fileSize && <span>{formatFileSize(file.fileSize)}</span>}
                        {file.fileType && <span>{file.fileType}</span>}
                      </div>
                    </div>
                  </div>
                  <div className="flex items-center gap-2">
                    <button
                      onClick={() => handleDownload(file)}
                      className="flex items-center gap-2 px-3 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition-colors text-sm"
                      title="Download file"
                    >
                      <Download className="h-4 w-4" />
                      Download
                    </button>
                    <button
                      onClick={() => handleDelete(file.fileName)}
                      className="flex items-center gap-2 px-3 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg transition-colors text-sm"
                      title="Delete file"
                    >
                      <Trash2 className="h-4 w-4" />
                      Delete
                    </button>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

// Enhanced Rich Text Editor Component (same as before)
interface RichTextEditorProps {
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
  className?: string;
}

const RichTextEditor: React.FC<RichTextEditorProps> = ({ 
  value, 
  onChange, 
  placeholder = "Write your note content here...",
  className = ""
}) => {
  const editorRef = useRef<HTMLDivElement>(null);
  const [showColorPicker, setShowColorPicker] = useState(false);
  const [isActive, setIsActive] = useState({
    bold: false,
    italic: false,
    underline: false,
    alignLeft: false,
    alignCenter: false,
    alignRight: false,
  });

  const colors = [
    '#000000', '#FF0000', '#00FF00', '#0000FF', '#FFFF00', '#FF00FF', 
    '#00FFFF', '#FFA500', '#800080', '#008000', '#800000', '#008080',
    '#C0C0C0', '#808080', '#FFC0CB', '#A52A2A', '#D2691E', '#DC143C'
  ];

  useEffect(() => {
    if (editorRef.current && editorRef.current.innerHTML !== value) {
      editorRef.current.innerHTML = value;
    }
  }, [value]);

  const handleInput = () => {
    if (editorRef.current) {
      const content = editorRef.current.innerHTML;
      onChange(content);
      updateButtonStates();
    }
  };

  const updateButtonStates = () => {
    setIsActive({
      bold: document.queryCommandState('bold'),
      italic: document.queryCommandState('italic'),
      underline: document.queryCommandState('underline'),
      alignLeft: document.queryCommandState('justifyLeft'),
      alignCenter: document.queryCommandState('justifyCenter'),
      alignRight: document.queryCommandState('justifyRight'),
    });
  };

  const executeCommand = (command: string, value?: string) => {
    editorRef.current?.focus();
    document.execCommand(command, false, value);
    updateButtonStates();
    handleInput();
  };

  const formatText = (command: string) => {
    executeCommand(command);
  };

  const setHeading = (tag: string) => {
    if (!editorRef.current) return;
    
    const selection = window.getSelection();
    if (!selection || selection.rangeCount === 0) return;
    
    const range = selection.getRangeAt(0);
    let element = range.commonAncestorContainer;
    
    if (element.nodeType === Node.TEXT_NODE) {
      element = element.parentNode!;
    }
    
    while (element && element !== editorRef.current && 
           !['P', 'H1', 'H2', 'H3', 'H4', 'H5', 'H6', 'DIV'].includes((element as Element).tagName)) {
      element = element.parentNode!;
    }
    
    if (element && element !== editorRef.current) {
      const newElement = document.createElement(tag);
      newElement.innerHTML = (element as Element).innerHTML;
      element.parentNode?.replaceChild(newElement, element);
      
      const newRange = document.createRange();
      newRange.selectNodeContents(newElement);
      selection.removeAllRanges();
      selection.addRange(newRange);
    } else {
      executeCommand('formatBlock', tag);
    }
    
    handleInput();
  };

  const setAlignment = (alignment: string) => {
    executeCommand(alignment);
  };

  const createList = (type: 'insertOrderedList' | 'insertUnorderedList') => {
    executeCommand(type);
  };

  const setTextColor = (color: string) => {
    executeCommand('foreColor', color);
    setShowColorPicker(false);
  };

  const insertTab = () => {
    executeCommand('insertHTML', '&nbsp;&nbsp;&nbsp;&nbsp;');
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.ctrlKey || e.metaKey) {
      switch (e.key) {
        case 'b':
          e.preventDefault();
          formatText('bold');
          break;
        case 'i':
          e.preventDefault();
          formatText('italic');
          break;
        case 'u':
          e.preventDefault();
          formatText('underline');
          break;
      }
    }
    
    if (e.key === 'Tab') {
      e.preventDefault();
      insertTab();
    }
  };

  return (
    <div className="border border-gray-200 rounded-lg overflow-hidden">
      {/* Toolbar */}
      <div className="flex flex-wrap items-center gap-1 p-2 border-b border-gray-200 bg-gray-50">
        {/* Text Formatting */}
        <div className="flex items-center gap-1 border-r border-gray-300 pr-2 mr-1">
          <button
            type="button"
            onClick={() => formatText('bold')}
            className={`p-1.5 rounded hover:bg-gray-200 transition-colors ${
              isActive.bold ? 'bg-blue-100 text-blue-600' : 'text-gray-600'
            }`}
            title="Bold (Ctrl+B)"
          >
            <Bold className="h-4 w-4" />
          </button>
          <button
            type="button"
            onClick={() => formatText('italic')}
            className={`p-1.5 rounded hover:bg-gray-200 transition-colors ${
              isActive.italic ? 'bg-blue-100 text-blue-600' : 'text-gray-600'
            }`}
            title="Italic (Ctrl+I)"
          >
            <Italic className="h-4 w-4" />
          </button>
          <button
            type="button"
            onClick={() => formatText('underline')}
            className={`p-1.5 rounded hover:bg-gray-200 transition-colors ${
              isActive.underline ? 'bg-blue-100 text-blue-600' : 'text-gray-600'
            }`}
            title="Underline (Ctrl+U)"
          >
            <Underline className="h-4 w-4" />
          </button>
        </div>

        {/* Headings */}
        <div className="flex items-center gap-1 border-r border-gray-300 pr-2 mr-1">
          <select
            onChange={(e) => {
              if (e.target.value) {
                setHeading(e.target.value);
                e.target.value = '';
              }
            }}
            className="text-xs border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500 bg-white"
            defaultValue=""
          >
            <option value="" disabled>Format</option>
            <option value="P">Normal Text</option>
            <option value="H1">Heading 1</option>
            <option value="H2">Heading 2</option>
            <option value="H3">Heading 3</option>
          </select>
        </div>

        {/* Text Color */}
        <div className="relative border-r border-gray-300 pr-2 mr-1">
          <button
            type="button"
            onClick={() => setShowColorPicker(!showColorPicker)}
            className="p-1.5 rounded hover:bg-gray-200 transition-colors text-gray-600"
            title="Text Color"
          >
            <Palette className="h-4 w-4" />
          </button>
          
          {showColorPicker && (
            <div className="absolute top-full left-0 mt-1 bg-white border border-gray-200 rounded-lg shadow-lg p-2 z-10 grid grid-cols-6 gap-1">
              {colors.map((color) => (
                <button
                  key={color}
                  type="button"
                  onClick={() => setTextColor(color)}
                  className="w-5 h-5 rounded border border-gray-300 hover:border-gray-400 transition-colors"
                  style={{ backgroundColor: color }}
                  title={color}
                />
              ))}
            </div>
          )}
        </div>

        {/* Alignment */}
        <div className="flex items-center gap-1 border-r border-gray-300 pr-2 mr-1">
          <button
            type="button"
            onClick={() => setAlignment('justifyLeft')}
            className={`p-1.5 rounded hover:bg-gray-200 transition-colors ${
              isActive.alignLeft ? 'bg-blue-100 text-blue-600' : 'text-gray-600'
            }`}
            title="Align Left"
          >
            <AlignLeft className="h-4 w-4" />
          </button>
          <button
            type="button"
            onClick={() => setAlignment('justifyCenter')}
            className={`p-1.5 rounded hover:bg-gray-200 transition-colors ${
              isActive.alignCenter ? 'bg-blue-100 text-blue-600' : 'text-gray-600'
            }`}
            title="Align Center"
          >
            <AlignCenter className="h-4 w-4" />
          </button>
          <button
            type="button"
            onClick={() => setAlignment('justifyRight')}
            className={`p-1.5 rounded hover:bg-gray-200 transition-colors ${
              isActive.alignRight ? 'bg-blue-100 text-blue-600' : 'text-gray-600'
            }`}
            title="Align Right"
          >
            <AlignRight className="h-4 w-4" />
          </button>
        </div>

        {/* Lists */}
        <div className="flex items-center gap-1">
          <button
            type="button"
            onClick={() => createList('insertUnorderedList')}
            className="p-1.5 rounded hover:bg-gray-200 transition-colors text-gray-600"
            title="Bullet List"
          >
            <List className="h-4 w-4" />
          </button>
          <button
            type="button"
            onClick={() => createList('insertOrderedList')}
            className="p-1.5 rounded hover:bg-gray-200 transition-colors text-gray-600"
            title="Numbered List"
          >
            <ListOrdered className="h-4 w-4" />
          </button>
        </div>
      </div>

      {/* Editor Area */}
      <div
        ref={editorRef}
        contentEditable
        className={`min-h-[200px] p-3 focus:outline-none focus:ring-2 focus:ring-blue-500 ${className}`}
        onInput={handleInput}
        onKeyUp={updateButtonStates}
        onMouseUp={updateButtonStates}
        onKeyDown={handleKeyDown}
        onClick={() => setShowColorPicker(false)}
        style={{
          wordWrap: 'break-word',
          overflowWrap: 'break-word',
          lineHeight: '1.6'
        }}
        data-placeholder={placeholder}
        suppressContentEditableWarning={true}
      />

      <style jsx>{`
        [contenteditable]:empty:before {
          content: attr(data-placeholder);
          color: #9CA3AF;
          pointer-events: none;
          font-style: italic;
        }
        
        [contenteditable] h1 {
          font-size: 2em;
          font-weight: bold;
          margin: 0.67em 0;
          line-height: 1.2;
        }
        
        [contenteditable] h2 {
          font-size: 1.5em;
          font-weight: bold;
          margin: 0.75em 0;
          line-height: 1.3;
        }
        
        [contenteditable] h3 {
          font-size: 1.17em;
          font-weight: bold;
          margin: 0.83em 0;
          line-height: 1.4;
        }
        
        [contenteditable] p {
          margin: 0.5em 0;
          line-height: 1.6;
        }
        
        [contenteditable] ul {
          list-style-type: disc;
          margin: 1em 0;
          padding-left: 2em;
        }
        
        [contenteditable] ol {
          list-style-type: decimal;
          margin: 1em 0;
          padding-left: 2em;
        }
        
        [contenteditable] li {
          margin: 0.25em 0;
          line-height: 1.5;
        }
        
        [contenteditable] ul ul {
          list-style-type: circle;
          margin: 0.5em 0;
        }
        
        [contenteditable] ul ul ul {
          list-style-type: square;
        }
        
        [contenteditable] ol ol {
          list-style-type: lower-alpha;
          margin: 0.5em 0;
        }
        
        [contenteditable] ol ol ol {
          list-style-type: lower-roman;
        }
        
        [contenteditable]:focus {
          outline: none;
        }
      `}</style>
    </div>
  );
};

// Modal Component
interface ModalProps {
  isOpen: boolean;
  onClose: () => void;
  title: string;
  children: React.ReactNode;
  size?: 'sm' | 'md' | 'lg' | 'xl';
}

const Modal: React.FC<ModalProps> = ({ 
  isOpen, 
  onClose, 
  title, 
  children, 
  size = 'md' 
}) => {
  const modalRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleEscape = (e: KeyboardEvent) => {
      if (e.key === 'Escape') {
        onClose();
      }
    };

    if (isOpen) {
      document.addEventListener('keydown', handleEscape);
      document.body.style.overflow = 'hidden';
    }

    return () => {
      document.removeEventListener('keydown', handleEscape);
      document.body.style.overflow = 'unset';
    };
  }, [isOpen, onClose]);

  const handleBackdropClick = (e: React.MouseEvent) => {
    if (e.target === modalRef.current) {
      onClose();
    }
  };

  if (!isOpen) return null;

  const sizeClasses = {
    sm: 'max-w-sm',
    md: 'max-w-md',
    lg: 'max-w-2xl',
    xl: 'max-w-4xl'
  };

  return (
    <div 
      ref={modalRef}
      className="fixed inset-0 z-50 flex items-center justify-center bg-black/30 backdrop-blur-sm p-3"
      onClick={handleBackdropClick}
    >
      <div 
        className={`bg-white rounded-xl shadow-2xl w-full ${sizeClasses[size]} max-h-[95vh] overflow-y-auto border border-gray-200`}
      >
        <div className="flex items-center justify-between p-4 border-b border-gray-200 bg-gradient-to-r from-blue-50 to-indigo-50">
          <h2 className="text-xl font-bold text-gray-900">{title}</h2>
          <button
            onClick={onClose}
            className="text-gray-500 hover:text-gray-700 transition-colors p-1 rounded-full hover:bg-white/50"
          >
            <X className="h-5 w-5" />
          </button>
        </div>
        
        <div className="p-4">
          {children}
        </div>
      </div>
    </div>
  );
};

// Main NotesPage Component with File Upload
const NotesPage: React.FC = () => {
  const [notes, setNotes] = useState<Note[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [isCreating, setIsCreating] = useState<boolean>(false);
  const [editingNote, setEditingNote] = useState<Note | null>(null);
  const [isFileModalOpen, setIsFileModalOpen] = useState<boolean>(false);
  const [selectedFiles, setSelectedFiles] = useState<any[]>([]);
  const [selectedNoteTitle, setSelectedNoteTitle] = useState<string>('');
  const [selectedNoteId, setSelectedNoteId] = useState<number>(0);
  
  const [filters, setFilters] = useState<NotesFilters>({
    search: '',
    isPinned: undefined,
    isActive: 'true',
    limit: 50,
    fromDate: '',
    toDate: ''
  });

  const [toasts, setToasts] = useState<ToastMessageData[]>([]);
  const [actionLoading, setActionLoading] = useState<boolean>(false);
  const [tagInput, setTagInput] = useState<string>('');
  const [selectedFilesToUpload, setSelectedFilesToUpload] = useState<File[]>([]);

  // Form states
  const [formData, setFormData] = useState<CreateNoteData>({
    title: '',
    content: '',
    tags: [],
    isPinned: false,
    files: []
  });

  const showToast = (message: string, type: 'success' | 'error' = 'success') => {
    const id = Date.now().toString();
    const newToast: ToastMessageData = { id, message, type };
    setToasts(prev => [newToast, ...prev]);
  };

  const removeToast = (id: string) => {
    setToasts(prev => prev.filter(toast => toast.id !== id));
  };

  const fetchNotes = async () => {
    try {
      setLoading(true);
      const queryParams = new URLSearchParams();
      
      if (filters.search) queryParams.append('search', filters.search);
      if (filters.isPinned !== undefined) queryParams.append('isPinned', filters.isPinned.toString());
      if (filters.isActive !== undefined && filters.isActive !== 'all') {
        queryParams.append('isActive', filters.isActive.toString());
      }
      if (filters.tags) queryParams.append('tags', filters.tags);
      if (filters.limit) queryParams.append('limit', filters.limit.toString());
      if (filters.fromDate) queryParams.append('fromDate', filters.fromDate);
      if (filters.toDate) queryParams.append('toDate', filters.toDate);

      const response = await axiosInstance.get<any>(`/api/note?${queryParams}`);
      
      if (response.data.success && response.data.notes) {
        setNotes(response.data.notes);
      } else {
        showToast('Failed to fetch notes', 'error');
      }
    } catch (error) {
      console.error('Error fetching notes:', error);
      showToast('Error fetching notes', 'error');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchNotes();
  }, [filters]);

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = Array.from(e.target.files || []);
    setSelectedFilesToUpload(files);
    setFormData({ ...formData, files });
  };

  const removeSelectedFile = (index: number) => {
    const updatedFiles = selectedFilesToUpload.filter((_, i) => i !== index);
    setSelectedFilesToUpload(updatedFiles);
    setFormData({ ...formData, files: updatedFiles });
  };

  const handleCreateNote = async (e: React.FormEvent) => {
    e.preventDefault();
    
    try {
      setActionLoading(true);
      const formDataToSend = new FormData();
      
      formDataToSend.append('title', formData.title);
      formDataToSend.append('content', formData.content);
      formDataToSend.append('tags', JSON.stringify(formData.tags));
      formDataToSend.append('isPinned', formData.isPinned.toString());
      
      // Append files
      selectedFilesToUpload.forEach(file => {
        formDataToSend.append('files', file);
      });

      const response = await axiosInstance.post('/api/note', formDataToSend, {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      });
      
      if (response.data.success && response.data.note) {
        setNotes(prevNotes => [response.data.note!, ...prevNotes]);
        setFormData({ title: '', content: '', tags: [], isPinned: false, files: [] });
        setTagInput('');
        setSelectedFilesToUpload([]);
        setIsCreating(false);
        showToast(`Note created successfully with ${selectedFilesToUpload.length} files!`, 'success');
      } else {
        showToast(response.data.error || 'Failed to create note', 'error');
      }
    } catch (error: any) {
      console.error('Error creating note:', error);
      showToast(error.response?.data?.error || 'Error creating note', 'error');
    } finally {
      setActionLoading(false);
    }
  };

  const handleUpdateNote = async (e: React.FormEvent) => {
    e.preventDefault();
    
    if (!editingNote) return;

    try {
      setActionLoading(true);
      const formDataToSend = new FormData();
      
      formDataToSend.append('id', editingNote.Id.toString());
      formDataToSend.append('title', formData.title);
      formDataToSend.append('content', formData.content);
      formDataToSend.append('tags', JSON.stringify(formData.tags));
      formDataToSend.append('isPinned', formData.isPinned.toString());
      
      // Append new files if any
      selectedFilesToUpload.forEach(file => {
        formDataToSend.append('files', file);
      });

      const response = await axiosInstance.put('/api/note', formDataToSend, {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      });
      
      if (response.data.success && response.data.note) {
        setNotes(prevNotes => 
          prevNotes.map(note => 
            note.Id === editingNote.Id ? response.data.note! : note
          )
        );
        
        setEditingNote(null);
        setFormData({ title: '', content: '', tags: [], isPinned: false, files: [] });
        setTagInput('');
        setSelectedFilesToUpload([]);
        setIsCreating(false);
        showToast('Note updated successfully!', 'success');
      } else {
        showToast(response.data.error || 'Failed to update note', 'error');
      }
    } catch (error: any) {
      console.error('Error updating note:', error);
      showToast(error.response?.data?.error || 'Error updating note', 'error');
    } finally {
      setActionLoading(false);
    }
  };

  const handleTagInputChange = (value: string) => {
    setTagInput(value);
    
    if (value.trim()) {
      const processedTags = value
        .split(',')
        .map(tag => tag.trim())
        .filter(tag => tag.length > 0);
      
      setFormData({ ...formData, tags: processedTags });
    } else {
      setFormData({ ...formData, tags: [] });
    }
  };

  const handleModalClose = () => {
    setIsCreating(false);
    setEditingNote(null);
    setFormData({ title: '', content: '', tags: [], isPinned: false, files: [] });
    setTagInput('');
    setSelectedFilesToUpload([]);
  };

  const getFilesArray = (filesString: string | null): any[] => {
    if (!filesString) return [];
    try {
      return JSON.parse(filesString);
    } catch {
      return [];
    }
  };

  const handleViewFiles = (note: Note) => {
    const files = getFilesArray(note.Files);
    setSelectedFiles(files);
    setSelectedNoteTitle(note.Title);
    setSelectedNoteId(note.Id);
    setIsFileModalOpen(true);
  };

  const handleFileDelete = (fileName: string) => {
    setSelectedFiles(prev => prev.filter(file => file.fileName !== fileName));
    // Refresh the specific note
    fetchNotes();
    showToast('File deleted successfully!', 'success');
  };

  const handleDeleteNote = async (id: number) => {
    if (!confirm('Are you sure you want to permanently delete this note and all its files?')) return;
    
    try {
      setActionLoading(true);
      const response = await axiosInstance.delete<any>(`/api/note?id=${id}`);
      
      if (response.data.success) {
        setNotes(prevNotes => prevNotes.filter(note => note.Id !== id));
        showToast('Note and all files deleted permanently!', 'success');
      } else {
        showToast(response.data.error || 'Failed to delete note', 'error');
      }
    } catch (error: any) {
      console.error('Error deleting note:', error);
      showToast(error.response?.data?.error || 'Error deleting note', 'error');
    } finally {
      setActionLoading(false);
    }
  };

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    });
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 p-3 md:p-6">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="mb-6">
          <h1 className="text-3xl md:text-4xl font-bold text-gray-900 mb-2">My Notes</h1>
          <p className="text-gray-600">Create and organize your personal notes with rich formatting and file attachments</p>
        </div>

        {/* Search and Filters */}
        <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4 mb-6">
          <div className="flex flex-col gap-4">
            {/* Search and Action Buttons */}
            <div className="flex flex-col md:flex-row gap-3">
              <div className="flex-1 relative">
                <Search className="absolute left-3 top-2.5 h-4 w-4 text-gray-400" />
                <input
                  type="text"
                  placeholder="Search notes..."
                  className="w-full pl-10 pr-4 py-2 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent text-sm"
                  value={filters.search}
                  onChange={(e) => setFilters({ ...filters, search: e.target.value })}
                />
              </div>
              
              <button
                onClick={() => setIsCreating(true)}
                className="bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white px-6 py-2 rounded-lg flex items-center gap-2 transition-all shadow-sm font-medium whitespace-nowrap"
              >
                <Plus className="h-4 w-4" />
                New Note
              </button>
            </div>

            {/* Filters Row */}
            <div className="flex flex-wrap gap-3 items-center">
              {/* Date Range Filters */}
              <div className="flex items-center gap-2">
                <Calendar className="h-4 w-4 text-gray-500" />
                <input
                  type="date"
                  value={filters.fromDate}
                  onChange={(e) => setFilters({ ...filters, fromDate: e.target.value })}
                  className="px-2 py-1 border border-gray-200 rounded text-xs focus:ring-2 focus:ring-blue-500"
                  title="From Date"
                />
                <span className="text-gray-500 text-xs">to</span>
                <input
                  type="date"
                  value={filters.toDate}
                  onChange={(e) => setFilters({ ...filters, toDate: e.target.value })}
                  className="px-2 py-1 border border-gray-200 rounded text-xs focus:ring-2 focus:ring-blue-500"
                  title="To Date"
                />
              </div>

              {/* Status Filters */}
              <div className="flex bg-gray-100 rounded-lg p-0.5">
                <button
                  onClick={() => setFilters({ ...filters, isActive: 'true' })}
                  className={`px-3 py-1.5 rounded-md text-sm transition-colors ${
                    filters.isActive === 'true' 
                      ? 'bg-blue-200 text-blue-700 ring-2 ring-blue-400 shadow-sm font-medium' 
                      : 'text-gray-600 hover:text-green-700'
                  }`}
                >
                  Active
                </button>
                <button
                  onClick={() => setFilters({ ...filters, isActive: 'false' })}
                  className={`px-3 py-1.5 rounded-md text-sm transition-colors ${
                    filters.isActive === 'false' 
                      ? 'bg-blue-200 text-blue-700 ring-2 ring-blue-400 shadow-sm font-medium' 
                      : 'text-gray-600 hover:text-orange-700'
                  }`}
                >
                  Archived
                </button>
                <button
                  onClick={() => setFilters({ ...filters, isActive: 'all' })}
                  className={`px-3 py-1.5 rounded-md text-sm transition-colors ${
                    filters.isActive === 'all' 
                      ? 'bg-blue-200 text-blue-700 ring-2 ring-blue-400 shadow-sm font-medium' 
                      : 'text-gray-600 hover:text-blue-700'
                  }`}
                >
                  All
                </button>
              </div>
              
              <select
                className={`px-3 py-1.5 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 text-sm bg-white transition-all ${
                  filters.isPinned !== undefined 
                    ? 'bg-blue-200 text-blue-700 ring-2 ring-blue-400' 
                    : ''
                }`}
                value={filters.isPinned === undefined ? 'all' : filters.isPinned.toString()}
                onChange={(e) => {
                  const value = e.target.value;
                  setFilters({ 
                    ...filters, 
                    isPinned: value === 'all' ? undefined : value === 'true' 
                  });
                }}
              >
                <option value="all">All Notes</option>
                <option value="true">Pinned Only</option>
                <option value="false">Unpinned Only</option>
              </select>
            </div>
          </div>
        </div>

        {/* Toast Container */}
        {toasts.length > 0 && (
          <div className="fixed top-4 right-4 z-50 space-y-2">
            {toasts.map((toast) => (
              <ToastMessage
                key={toast.id}
                message={toast.message}
                type={toast.type}
                onClose={() => removeToast(toast.id)}
                duration={4000}
              />
            ))}
          </div>
        )}

        {/* Create/Edit Form Modal with File Upload */}
        <Modal
          isOpen={isCreating}
          onClose={handleModalClose}
          title={editingNote ? 'Edit Note' : 'Create New Note'}
          size="xl"
        >
          <form onSubmit={editingNote ? handleUpdateNote : handleCreateNote} className="space-y-4">
            {/* Note Title */}
            <div>
              <label className="flex items-center gap-2 text-sm font-semibold text-gray-700 mb-2">
                <FileText className="h-4 w-4 text-blue-600" />
                Note Title <span className="text-red-500">*</span>
              </label>
              <input
                type="text"
                placeholder="Enter note title..."
                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent text-lg font-medium"
                value={formData.title}
                onChange={(e) => setFormData({ ...formData, title: e.target.value })}
                required
              />
            </div>
            
            {/* Note Content */}
            <div>
              <label className="flex items-center gap-2 text-sm font-semibold text-gray-700 mb-2">
                <FileText className="h-4 w-4 text-blue-600" />
                Content <span className="text-red-500">*</span>
              </label>
              <RichTextEditor
                value={formData.content}
                onChange={(content) => setFormData({ ...formData, content })}
                placeholder="Write your note content here..."
              />
            </div>

            {/* File Upload */}
            <div>
              <label className="flex items-center gap-2 text-sm font-semibold text-gray-700 mb-2">
                <Upload className="h-4 w-4 text-blue-600" />
                Attach Files
              </label>
              <input
                type="file"
                multiple
                onChange={handleFileSelect}
                className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                accept=".png,.jpg,.jpeg,.pdf,.doc,.docx,.xls,.xlsx,.webp,.pptx,.txt,.csv,.gif,.sql"
              />
              {selectedFilesToUpload.length > 0 && (
                <div className="mt-3 space-y-2">
                  <p className="text-sm font-medium text-gray-700">Selected Files ({selectedFilesToUpload.length}):</p>
                  {selectedFilesToUpload.map((file, index) => (
                    <div key={index} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg border">
                      <div className="flex items-center gap-3">
                        <FileIcon className="h-5 w-5 text-gray-500" />
                        <div>
                          <p className="text-sm font-medium">{file.name}</p>
                          <p className="text-xs text-gray-500">{(file.size / 1024).toFixed(2)} KB</p>
                        </div>
                      </div>
                      <button
                        type="button"
                        onClick={() => removeSelectedFile(index)}
                        className="text-red-500 hover:text-red-700 p-1"
                      >
                        <X className="h-4 w-4" />
                      </button>
                    </div>
                  ))}
                </div>
              )}
            </div>
            
            {/* Tags and Pin */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="flex items-center gap-2 text-sm font-semibold text-gray-700 mb-2">
                  <Tag className="h-4 w-4 text-blue-600" />
                  Tags
                </label>
                <input
                  type="text"
                  placeholder="Enter tags separated by commas"
                  className="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500"
                  value={tagInput}
                  onChange={(e) => handleTagInputChange(e.target.value)}
                />
                {formData.tags && formData.tags.length > 0 && (
                  <div className="flex flex-wrap gap-2 mt-2">
                    {formData.tags.map((tag, index) => (
                      <span
                        key={index}
                        className="inline-flex items-center gap-1 px-2 py-1 bg-blue-100 text-blue-800 text-sm rounded-full"
                      >
                        <Tag className="h-3 w-3" />
                        {tag}
                      </span>
                    ))}
                  </div>
                )}
              </div>
              
              <div className="flex items-end">
                <label className="flex items-center gap-2 cursor-pointer bg-gray-50 p-3 rounded-lg border border-gray-200 hover:bg-gray-100 transition-colors w-full justify-center">
                  <input
                    type="checkbox"
                    checked={formData.isPinned}
                    onChange={(e) => setFormData({ ...formData, isPinned: e.target.checked })}
                    className="w-4 h-4 text-blue-600 rounded focus:ring-blue-500"
                  />
                  <Pin className="h-5 w-5" />
                  <span className="font-medium">Pin this note</span>
                </label>
              </div>
            </div>
            
            {/* Action Buttons */}
            <div className="flex gap-3 justify-end pt-4 border-t border-gray-200">
              <button
                type="button"
                onClick={handleModalClose}
                disabled={actionLoading}
                className="bg-gray-200 hover:bg-gray-300 text-gray-700 px-6 py-2.5 rounded-lg transition-colors disabled:opacity-50 font-medium"
              >
                Cancel
              </button>
              
              <button
                type="submit"
                disabled={actionLoading}
                className="bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white px-6 py-2.5 rounded-lg transition-all disabled:opacity-50 font-medium shadow-sm"
              >
                {actionLoading ? 'Processing...' : (editingNote ? 'Update Note' : 'Create Note')}
              </button>
            </div>
          </form>
        </Modal>

        {/* File Modal */}
        <FileModal
          isOpen={isFileModalOpen}
          onClose={() => setIsFileModalOpen(false)}
          files={selectedFiles}
          noteTitle={selectedNoteTitle}
          noteId={selectedNoteId}
          onFileDelete={handleFileDelete}
        />

        {/* Notes Grid */}
        {loading ? (
          <DataLoader />
        ) : (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            {notes.map((note) => {
              const tags = note.Tags ? note.Tags.split(',').map(tag => tag.trim()).filter(Boolean) : [];
              const files = getFilesArray(note.Files);
              
              return (
                <div
                  key={note.Id}
                  className={`bg-white rounded-xl shadow-sm border hover:shadow-lg transition-all duration-300 ${
                    note.IsPinned ? 'ring-2 ring-yellow-400 bg-yellow-50 border-yellow-200' : 'border-gray-200'
                  } ${!note.IsActive ? 'opacity-70 border-orange-200 bg-orange-50' : ''}`}
                >
                  <div className="p-5">
                    {/* Note Status */}
                    <div className="flex items-center gap-2 mb-3">
                      {!note.IsActive && (
                        <div className="flex items-center gap-1 px-2 py-1 bg-orange-100 text-orange-700 text-xs rounded-full">
                          <Archive className="h-3 w-3" />
                          <span className="font-medium">Archived</span>
                        </div>
                      )}
                      {note.IsPinned && (
                        <div className="flex items-center gap-1 px-2 py-1 bg-yellow-100 text-yellow-700 text-xs rounded-full">
                          <Pin className="h-3 w-3 fill-current" />
                          <span className="font-medium">Pinned</span>
                        </div>
                      )}
                    </div>
                    
                    {/* Note Title */}
                    <h3 className="font-bold text-gray-900 text-lg leading-tight mb-3 line-clamp-2 break-words">
                      {note.Title}
                    </h3>
                    
                    {/* Note Content Preview */}
                    <div 
                      className="text-gray-700 mb-4 prose prose-sm max-w-none overflow-hidden text-sm leading-relaxed line-clamp-4"
                      dangerouslySetInnerHTML={{ __html: note.Content }}
                    />
                    
                    {/* Tags */}
                    {tags.length > 0 && (
                      <div className="flex flex-wrap gap-1 mb-4">
                        {tags.slice(0, 3).map((tag, index) => (
                          <span
                            key={index}
                            className="inline-flex items-center gap-1 px-2 py-1 bg-blue-100 text-blue-800 text-xs rounded-full"
                          >
                            <Tag className="h-2.5 w-2.5" />
                            {tag}
                          </span>
                        ))}
                        {tags.length > 3 && (
                          <span className="text-xs text-gray-500 px-2 py-1">
                            +{tags.length - 3} more
                          </span>
                        )}
                      </div>
                    )}
                    
                    {/* File indicator */}
                    {files.length > 0 && (
                      <div className="flex items-center gap-2 mb-4 p-2 bg-gray-50 rounded-lg">
                        <FileIcon className="h-4 w-4 text-gray-600" />
                        <span className="text-sm text-gray-600 font-medium">
                          {files.length} file{files.length > 1 ? 's' : ''} attached
                        </span>
                      </div>
                    )}
                    
                    {/* Action Buttons */}
                    <div className="flex items-center gap-2 mb-4">
                      {files.length > 0 && (
                        <button
                          onClick={() => handleViewFiles(note)}
                          className="flex items-center gap-1 px-3 py-2 bg-purple-100 hover:bg-purple-200 text-purple-700 rounded-lg transition-colors text-sm font-medium"
                          title="View files"
                        >
                          <FileIcon className="h-4 w-4" />
                          Files
                        </button>
                      )}
                      <button
                        onClick={() => {
                          setEditingNote(note);
                          const existingTags = note.Tags ? note.Tags.split(',').map(tag => tag.trim()).filter(Boolean) : [];
                          setFormData({
                            title: note.Title,
                            content: note.Content,
                            tags: existingTags,
                            isPinned: note.IsPinned,
                            files: []
                          });
                          setTagInput(existingTags.join(', '));
                          setIsCreating(true);
                        }}
                        className="flex items-center gap-1 px-3 py-2 bg-blue-100 hover:bg-blue-200 text-blue-700 rounded-lg transition-colors text-sm font-medium"
                        title="Edit note"
                      >
                        <Edit2 className="h-4 w-4" />
                        Edit
                      </button>
                      <button
                        onClick={() => handleDeleteNote(note.Id)}
                        disabled={actionLoading}
                        className="flex items-center gap-1 px-3 py-2 bg-red-100 hover:bg-red-200 text-red-700 rounded-lg transition-colors text-sm font-medium disabled:opacity-50"
                        title="Delete note"
                      >
                        <Trash2 className="h-4 w-4" />
                        Delete
                      </button>
                    </div>
                    
                    {/* Note Info */}
                    <div className="flex items-center justify-between text-xs text-gray-500 pt-3 border-t border-gray-100">
                      <div className="flex items-center gap-1">
                        <Clock className="h-3 w-3" />
                        {formatDate(note.ModifiedOn || note.CreatedOn)}
                      </div>
                      <div className="text-right">
                        <div className="font-medium">
                          {note.ModifiedBy || note.CreatedBy || note.User.Name}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        )}

        {/* Empty State */}
        {notes.length === 0 && !loading && (
          <div className="text-center py-16">
            <div className="text-gray-400 mb-6">
              <div className="w-24 h-24 mx-auto bg-gradient-to-br from-gray-100 to-gray-200 rounded-full flex items-center justify-center">
                <FileText className="h-12 w-12" />
              </div>
            </div>
            <h3 className="text-2xl font-bold text-gray-900 mb-3">No notes found</h3>
            <p className="text-gray-500 mb-8 max-w-md mx-auto text-lg">
              Get started by creating your first note with rich text formatting and file attachments
            </p>
            <button
              onClick={() => setIsCreating(true)}
              className="bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white px-8 py-3 rounded-lg transition-all shadow-lg hover:shadow-xl font-medium text-lg"
            >
              Create Your First Note
            </button>
          </div>
        )}
      </div>
    </div>
  );
};

export default NotesPage;



// schema.prisma में Note model
model Note {
  Id         Int       @id @default(autoincrement())
  Title      String
  Content    String    @db.Text
  UserId     Int
  User       User      @relation("UserNotes", fields: [UserId], references: [Id], onDelete: NoAction, onUpdate: NoAction)
  CreatedBy  String?
  CreatedOn  DateTime  @default(now())
  ModifiedBy String?
  ModifiedOn DateTime?
  IsActive   Boolean   @default(true)
  IsPinned   Boolean   @default(false)
  Tags       String?   // Store as comma-separated string: "work,personal"
  Files      String?   // Store as JSON array: [{"fileName":"file(1).jpg","originalName":"file.jpg","filePath":"/images/note/file(1).jpg"}]
  
  @@index([UserId])
  @@index([CreatedOn])
}

