/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 20-05-2025 18:18:05 ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [kishankk]    Script Date: 20-05-2025 18:18:05 ******/
CREATE USER [kishankk] FOR LOGIN [kishankk] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [kishanprisma]    Script Date: 20-05-2025 18:18:05 ******/
CREATE USER [kishanprisma] FOR LOGIN [kishanprisma] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [pleskuse]    Script Date: 20-05-2025 18:18:05 ******/
CREATE USER [pleskuse] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [pleskuser]    Script Date: 20-05-2025 18:18:05 ******/
CREATE USER [pleskuser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [kishankk]
GO
ALTER ROLE [db_owner] ADD MEMBER [pleskuse]
GO
/****** Object:  Table [dbo].[_prisma_migrations]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_prisma_migrations](
	[id] [varchar](36) NOT NULL,
	[checksum] [varchar](64) NOT NULL,
	[finished_at] [datetimeoffset](7) NULL,
	[migration_name] [nvarchar](250) NOT NULL,
	[logs] [nvarchar](max) NULL,
	[rolled_back_at] [datetimeoffset](7) NULL,
	[started_at] [datetimeoffset](7) NOT NULL,
	[applied_steps_count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bannerUrl] [nvarchar](1000) NOT NULL,
	[bannerName] [nvarchar](1000) NOT NULL,
	[bannerPosition] [int] NOT NULL,
	[created_on] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](1000) NOT NULL,
	[modify_on] [datetime2](7) NULL,
	[modify_by] [nvarchar](1000) NULL,
	[publicId] [nvarchar](1000) NOT NULL,
	[IsVisible] [bit] NOT NULL,
 CONSTRAINT [Banner_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[College]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[College](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[collegeName] [nvarchar](1000) NOT NULL,
	[location] [nvarchar](1000) NOT NULL,
	[establishYear] [int] NOT NULL,
	[contactNumber] [nvarchar](1000) NOT NULL,
	[email] [nvarchar](1000) NOT NULL,
	[status] [bit] NOT NULL,
	[createdBy] [nvarchar](1000) NOT NULL,
	[createdOn] [datetime2](7) NOT NULL,
	[modifiedBy] [nvarchar](1000) NULL,
	[modifiedOn] [datetime2](7) NULL,
 CONSTRAINT [College_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contactus]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contactus](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[EmailId] [nvarchar](100) NULL,
	[Subject] [nvarchar](150) NULL,
	[Message] [nvarchar](250) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_Contactus] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseName] [nvarchar](1000) NOT NULL,
	[collegeId] [int] NOT NULL,
	[courseDuration] [int] NOT NULL,
	[createdBy] [nvarchar](1000) NOT NULL,
	[createdOn] [datetime2](7) NOT NULL,
	[modifiedBy] [nvarchar](1000) NULL,
	[modifiedOn] [datetime2](7) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [Course_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseEnquiry]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseEnquiry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](1000) NOT NULL,
	[mobileNumber] [nvarchar](1000) NOT NULL,
	[email] [nvarchar](1000) NOT NULL,
	[course] [nvarchar](1000) NOT NULL,
	[isContacted] [bit] NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[modifiedAt] [datetime2](7) NULL,
	[modifiedby] [nvarchar](1000) NULL,
 CONSTRAINT [CourseEnquiry_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NOT NULL,
	[documentType] [nvarchar](1000) NOT NULL,
	[publicId] [nvarchar](1000) NOT NULL,
	[fileUrl] [nvarchar](1000) NOT NULL,
	[fileName] [nvarchar](1000) NOT NULL,
	[uploadDate] [datetime2](7) NOT NULL,
	[createdBy] [nvarchar](1000) NOT NULL,
	[createdOn] [datetime2](7) NOT NULL,
	[modifiedBy] [nvarchar](1000) NULL,
	[modifiedOn] [datetime2](7) NULL,
 CONSTRAINT [Documents_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMIDetails]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMIDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NOT NULL,
	[studentAcademicId] [int] NOT NULL,
	[emiNumber] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[dueDate] [datetime2](7) NOT NULL,
	[createdBy] [nvarchar](1000) NOT NULL,
	[createdOn] [datetime2](7) NOT NULL,
	[modifiedBy] [nvarchar](1000) NULL,
	[modifiedOn] [datetime2](7) NULL,
 CONSTRAINT [EMIDetails_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpensePayment]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpensePayment](
	[ExpensePaymentID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](500) NULL,
	[PaidAmount] [decimal](18, 2) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[ApproveBy] [nvarchar](100) NULL,
	[PaymentImage] [nvarchar](255) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[SupplierId] [int] NOT NULL,
	[PaymentMode] [nvarchar](50) NOT NULL,
	[TransactionId] [nvarchar](100) NOT NULL,
	[PaymentDate] [date] NOT NULL,
	[PaymentPublicId] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpensePaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[faculty_name] [nvarchar](1000) NOT NULL,
	[qualification] [nvarchar](1000) NOT NULL,
	[designation] [nvarchar](1000) NOT NULL,
	[profilePicUrl] [nvarchar](1000) NULL,
	[documents] [nvarchar](1000) NULL,
	[monthlySalary] [int] NULL,
	[yearlyLeave] [int] NULL,
	[created_on] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](1000) NOT NULL,
	[modify_on] [datetime2](7) NULL,
	[modify_by] [nvarchar](1000) NULL,
	[IsVisible] [bit] NOT NULL,
 CONSTRAINT [Faculty_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[galleryUrl] [nvarchar](1000) NOT NULL,
	[galleryName] [nvarchar](1000) NOT NULL,
	[galleryPosition] [int] NOT NULL,
	[created_on] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](1000) NOT NULL,
	[modify_on] [datetime2](7) NULL,
	[modify_by] [nvarchar](1000) NULL,
	[publicId] [nvarchar](1000) NOT NULL,
	[IsVisible] [bit] NOT NULL,
 CONSTRAINT [Gallery_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Galleryold]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Galleryold](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](250) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](150) NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HomeSlider]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomeSlider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](250) NULL,
	[Title] [nvarchar](150) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](150) NULL,
	[DisplayOrder] [int] NULL,
	[Heading] [nvarchar](250) NULL,
 CONSTRAINT [PK_HomeSlider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportantLinks]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportantLinks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LOGOUrl] [nvarchar](1000) NOT NULL,
	[linksUrl] [nvarchar](1000) NOT NULL,
	[logoName] [nvarchar](1000) NOT NULL,
	[logoPosition] [int] NOT NULL,
	[created_on] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](1000) NOT NULL,
	[modify_on] [datetime2](7) NULL,
	[modify_by] [nvarchar](1000) NULL,
	[publicId] [nvarchar](1000) NOT NULL,
	[IsVisible] [bit] NOT NULL,
 CONSTRAINT [ImportantLinks_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LatestPost]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LatestPost](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[post_title] [nvarchar](1000) NOT NULL,
	[post_slug] [nvarchar](1000) NOT NULL,
	[post_content] [nvarchar](max) NOT NULL,
	[created_by] [nvarchar](1000) NOT NULL,
	[created_on] [datetime2](7) NOT NULL,
	[modify_by] [nvarchar](1000) NULL,
	[modify_on] [datetime2](7) NULL,
	[isVisible] [bit] NOT NULL,
 CONSTRAINT [LatestPost_pkey] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MainPage]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainPage](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[PageTitle] [nvarchar](450) NULL,
	[PageDescription] [nvarchar](max) NULL,
	[ImageName] [nvarchar](250) NULL,
	[Deleted] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](150) NULL,
	[PageName] [nvarchar](150) NULL,
 CONSTRAINT [PK_MainPage] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[Heading] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayOnHome] [bit] NULL,
	[Deleted] [bit] NULL,
	[ImageName] [nvarchar](250) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](150) NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[notification_id] [int] IDENTITY(1,1) NOT NULL,
	[notification_message] [nvarchar](225) NOT NULL,
	[notification_url] [nvarchar](1000) NOT NULL,
	[public_id] [nvarchar](1000) NULL,
	[userId] [int] NOT NULL,
	[created_on] [datetime2](7) NOT NULL,
	[created_by] [nvarchar](1000) NOT NULL,
	[modify_by] [nvarchar](1000) NULL,
	[modify_on] [datetime2](7) NULL,
 CONSTRAINT [Notification_pkey] PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Page]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[pageId] [int] IDENTITY(1,1) NOT NULL,
	[pageName] [nvarchar](1000) NOT NULL,
	[pageUrl] [nvarchar](1000) NOT NULL,
	[created_by] [nvarchar](1000) NULL,
	[created_on] [datetime2](7) NOT NULL,
	[modify_by] [nvarchar](1000) NULL,
	[modify_on] [datetime2](7) NULL,
 CONSTRAINT [Page_pkey] PRIMARY KEY CLUSTERED 
(
	[pageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentHandover]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHandover](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paymentId] [int] NOT NULL,
	[studentId] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[receivedBy] [nvarchar](1000) NOT NULL,
	[handedOverTo] [nvarchar](1000) NOT NULL,
	[handoverDate] [datetime2](7) NOT NULL,
	[remarks] [nvarchar](1000) NULL,
	[verified] [bit] NOT NULL,
	[verifiedBy] [nvarchar](1000) NULL,
	[verifiedOn] [datetime2](7) NULL,
	[createdOn] [datetime2](7) NOT NULL,
	[modifiedOn] [datetime2](7) NULL,
	[createdBy] [nvarchar](1000) NULL,
	[modifiedBy] [nvarchar](1000) NULL,
 CONSTRAINT [PaymentHandover_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[permissionId] [int] IDENTITY(1,1) NOT NULL,
	[roleId] [int] NOT NULL,
	[pageId] [int] NOT NULL,
	[canCreate] [bit] NOT NULL,
	[canRead] [bit] NOT NULL,
	[canUpdate] [bit] NOT NULL,
	[canDelete] [bit] NOT NULL,
	[created_by] [nvarchar](1000) NULL,
	[created_on] [datetime2](7) NOT NULL,
	[modify_by] [nvarchar](1000) NULL,
	[modify_on] [datetime2](7) NULL,
 CONSTRAINT [Permission_pkey] PRIMARY KEY CLUSTERED 
(
	[permissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](250) NULL,
	[Heading] [nvarchar](150) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](150) NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[RId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Fathername] [nvarchar](150) NULL,
	[Mothername] [nvarchar](50) NULL,
	[Religion] [nvarchar](50) NULL,
	[Caste] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[PermanentAddress] [nvarchar](max) NULL,
	[CorrespondingAddress] [nvarchar](max) NULL,
	[Sex] [nvarchar](50) NULL,
	[EmailId] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[MobileNo] [nvarchar](50) NULL,
	[FatherMobileNo] [nvarchar](50) NULL,
	[Course] [nvarchar](50) NULL,
	[ClassX_Board] [nvarchar](150) NULL,
	[ClassX_PassingYear] [int] NULL,
	[ClassX_Overallpercentage] [decimal](18, 2) NULL,
	[ClassX_PCMPCBPercentage] [decimal](18, 2) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[ClassXII_Board] [nvarchar](150) NULL,
	[ClassXII_PassingYear] [int] NULL,
	[ClassXII_Overallpercentage] [decimal](18, 2) NULL,
	[ClassXII_PCMPCBPercentage] [decimal](18, 2) NULL,
	[Deleted] [bit] NULL,
	[DPharma_Board] [nvarchar](150) NULL,
	[DPharma_PassingYear] [int] NULL,
	[DPharma_Overallpercentage] [decimal](18, 2) NULL,
	[DPharma_PCMPCBPercentage] [decimal](18, 2) NULL,
	[ImageName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[RId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1000) NOT NULL,
 CONSTRAINT [Role_pkey] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScreenMaster]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScreenMaster](
	[ScreenId] [int] IDENTITY(1,1) NOT NULL,
	[ScreenName] [nvarchar](100) NULL,
	[DisplayName] [nvarchar](150) NULL,
	[Description] [nvarchar](250) NULL,
	[ScreenURL] [nvarchar](150) NULL,
	[Deleted] [bit] NULL,
	[CreatedBy] [nvarchar](150) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](150) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_ScreenMaster] PRIMARY KEY CLUSTERED 
(
	[ScreenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[SliderId] [int] IDENTITY(1,1) NOT NULL,
	[BigImage] [nvarchar](100) NULL,
	[SmallImage] [nvarchar](100) NULL,
	[ImageTitle] [nvarchar](150) NULL,
	[ImageDesc] [nvarchar](200) NULL,
	[DisplayOrder] [int] NULL,
	[IsDisplay] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[SliderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stdCollId] [nvarchar](1000) NULL,
	[fName] [nvarchar](1000) NOT NULL,
	[lName] [nvarchar](1000) NULL,
	[rollNumber] [nvarchar](1000) NOT NULL,
	[gender] [nvarchar](1000) NOT NULL,
	[fatherName] [nvarchar](1000) NOT NULL,
	[motherName] [nvarchar](1000) NOT NULL,
	[mobileNumber] [nvarchar](1000) NOT NULL,
	[fatherMobile] [nvarchar](1000) NULL,
	[alternateNumber] [nvarchar](1000) NULL,
	[dob] [datetime2](7) NOT NULL,
	[email] [nvarchar](1000) NOT NULL,
	[address] [nvarchar](1000) NOT NULL,
	[state] [nvarchar](1000) NOT NULL,
	[pincode] [nvarchar](1000) NOT NULL,
	[city] [nvarchar](1000) NOT NULL,
	[admissionMode] [nvarchar](1000) NOT NULL,
	[collegeId] [int] NOT NULL,
	[courseId] [int] NOT NULL,
	[admissionDate] [datetime2](7) NOT NULL,
	[studentImage] [nvarchar](1000) NULL,
	[category] [nvarchar](1000) NOT NULL,
	[isDiscontinue] [bit] NOT NULL,
	[isLateral] [bit] NOT NULL,
	[discontinueOn] [datetime2](7) NULL,
	[discontinueBy] [nvarchar](1000) NULL,
	[createdBy] [nvarchar](1000) NOT NULL,
	[createdOn] [datetime2](7) NOT NULL,
	[modifiedBy] [nvarchar](1000) NULL,
	[modifiedOn] [datetime2](7) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [Student_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAcademicDetails]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAcademicDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NOT NULL,
	[sessionYear] [nvarchar](1000) NOT NULL,
	[paymentMode] [nvarchar](1000) NOT NULL,
	[adminAmount] [float] NOT NULL,
	[feesAmount] [float] NOT NULL,
	[numberOfEMI] [int] NULL,
	[ledgerNumber] [nvarchar](1000) NULL,
	[courseYear] [nvarchar](1000) NULL,
	[createdBy] [nvarchar](1000) NOT NULL,
	[createdOn] [datetime2](7) NOT NULL,
	[modifiedBy] [nvarchar](1000) NULL,
	[modifiedOn] [datetime2](7) NULL,
 CONSTRAINT [StudentAcademicDetails_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentPayment]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPayment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NOT NULL,
	[studentAcademicId] [int] NULL,
	[paymentMode] [nvarchar](1000) NULL,
	[transactionNumber] [nvarchar](1000) NULL,
	[amount] [float] NULL,
	[handoverAmount] [float] NOT NULL,
	[receivedDate] [datetime2](7) NULL,
	[approvedBy] [nvarchar](1000) NULL,
	[amountType] [nvarchar](1000) NULL,
	[receiptUrl] [nvarchar](1000) NULL,
	[receiptPublicId] [nvarchar](1000) NULL,
	[courseYear] [nvarchar](1000) NULL,
	[sessionYear] [nvarchar](1000) NULL,
	[createdBy] [nvarchar](1000) NULL,
	[createdOn] [datetime2](7) NOT NULL,
	[modifiedBy] [nvarchar](1000) NULL,
	[modifiedOn] [datetime2](7) NULL,
 CONSTRAINT [StudentPayment_pkey] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierDocuments]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierDocuments](
	[DocumentId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[DocumentUrl] [nvarchar](500) NULL,
	[PublicId] [nvarchar](250) NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierExpenses]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierExpenses](
	[SuppliersExpenseID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[Reason] [nvarchar](255) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[ModifiedOn] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[SuppliersExpenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierPayment]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierPayment](
	[SPId] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](250) NULL,
	[PaidAmount] [decimal](18, 2) NULL,
	[IsApproved] [bit] NULL,
	[ApproveBy] [nvarchar](150) NULL,
	[PaymentImage] [nvarchar](250) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[SupplierId] [int] NULL,
	[PaymentMode] [nvarchar](50) NULL,
	[TransactionId] [nvarchar](150) NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentPublicId] [nvarchar](255) NULL,
 CONSTRAINT [PK_StaffExpense] PRIMARY KEY CLUSTERED 
(
	[SPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Email] [varchar](125) NULL,
	[PhoneNo] [varchar](75) NULL,
	[Address] [varchar](2000) NULL,
	[Deleted] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[Comment] [nvarchar](2000) NULL,
	[BankName] [varchar](75) NULL,
	[AccountNo] [varchar](75) NULL,
	[IFSCCode] [varchar](75) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](1000) NOT NULL,
	[mobileNo] [nvarchar](15) NOT NULL,
	[password] [nvarchar](1000) NOT NULL,
	[roleId] [int] NOT NULL,
	[created_on] [datetime2](7) NULL,
	[created_by] [nvarchar](1000) NULL,
	[modify_on] [datetime2](7) NULL,
	[modify_by] [nvarchar](1000) NULL,
 CONSTRAINT [User_pkey] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[_prisma_migrations] ([id], [checksum], [finished_at], [migration_name], [logs], [rolled_back_at], [started_at], [applied_steps_count]) VALUES (N'd172c171-53a8-4511-b16e-57a771312ef6', N'843e360491d3428b35a5cc278990b6a9f973bfd9f43eaf951b5757f533e5fa73', NULL, N'20250320092940_init', N'A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve

Migration name: 20250320092940_init

Database error code: 2714

Database error:
There is already an object named ''Role'' in the database.

   0: sql_schema_connector::apply_migration::apply_script
           with migration_name="20250320092940_init"
             at schema-engine\connectors\sql-schema-connector\src\apply_migration.rs:106
   1: schema_core::commands::apply_migrations::Applying migration
           with migration_name="20250320092940_init"
             at schema-engine\core\src\commands\apply_migrations.rs:91
   2: schema_core::state::ApplyMigrations
             at schema-engine\core\src\state.rs:226', NULL, CAST(N'2025-03-22T11:08:33.2730000+00:00' AS DateTimeOffset), 0)
INSERT [dbo].[_prisma_migrations] ([id], [checksum], [finished_at], [migration_name], [logs], [rolled_back_at], [started_at], [applied_steps_count]) VALUES (N'd70a00cd-cde8-4d31-8eea-1063fe548589', N'c3ccad76f35bafc63fa3d194254b1b08c05d0e02805eee3396b5e0e4ff016a9a', CAST(N'2025-05-06T12:52:35.5456443+00:00' AS DateTimeOffset), N'20250506125234_init', NULL, NULL, CAST(N'2025-05-06T12:52:35.4692518+00:00' AS DateTimeOffset), 1)
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (2, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739783919/banners/zmumqebfgusruhtpzsqr.jpg', N' JK Institutes of Pharmacy', 1, CAST(N'2025-02-17T09:18:38.1150000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-08T18:02:51.3900000' AS DateTime2), N'Kishan Kumar', N'banners/zmumqebfgusruhtpzsqr', 1)
INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (3, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739785411/banners/aeisivgxjmu8omueyx8z.gif', N'Chairman', 2, CAST(N'2025-02-17T09:43:30.4690000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-04-01T10:53:56.0720000' AS DateTime2), N'Kishan Kumar', N'banners/aeisivgxjmu8omueyx8z', 1)
INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (4, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739785433/banners/omttmz80dffpkz3kjnp9.jpg', N'Computer Lab', 3, CAST(N'2025-02-17T09:43:52.2170000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-04-01T09:15:25.1020000' AS DateTime2), N'Kishan Kumar', N'banners/omttmz80dffpkz3kjnp9', 1)
INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (6, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739787315/banners/j4htd13zcywmzqxjshls.jpg', N'Computer Lab', 4, CAST(N'2025-02-17T10:15:14.6430000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-02-17T11:05:11.7070000' AS DateTime2), N'Kishan Kumar', N'banners/j4htd13zcywmzqxjshls', 1)
INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (7, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739787342/banners/jwaoadvg1vlicp2mzbzh.jpg', N'Chairman', 5, CAST(N'2025-02-17T10:15:41.0960000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-02-26T10:51:02.0740000' AS DateTime2), N'Kishan Kumar', N'banners/jwaoadvg1vlicp2mzbzh', 1)
INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (8, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739787376/banners/ul5prxvaobenaijzjw5h.jpg', N'JK Institute Of Pharmacy', 6, CAST(N'2025-02-17T10:16:15.1210000' AS DateTime2), N'Kishan Kumar', NULL, NULL, N'banners/ul5prxvaobenaijzjw5h', 1)
INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (9, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739787419/banners/m7lsglkbdmmgdrnupofg.jpg', N'Lab', 7, CAST(N'2025-02-17T10:16:58.5580000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-12T18:01:13.2333333' AS DateTime2), N'Kishan Kumar', N'banners/m7lsglkbdmmgdrnupofg', 1)
INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (10, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739787443/banners/sj1mz4xnqwf1wjb4l3ki.jpg', N'LAB', 8, CAST(N'2025-02-17T10:17:22.8410000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-08T12:35:58.2700000' AS DateTime2), N'Kishan Kumar', N'banners/sj1mz4xnqwf1wjb4l3ki', 1)
INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (11, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739787508/banners/czvmoyhjoojyzecvo319.jpg', N'Lab', 9, CAST(N'2025-02-17T10:18:28.2170000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-03-18T09:38:55.1150000' AS DateTime2), N'Kishan Kumar', N'banners/czvmoyhjoojyzecvo319', 1)
INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (12, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739787566/banners/rqwoqo1cadlnhuwiz1nr.jpg', N'Lecture Hall', 10, CAST(N'2025-02-17T10:19:25.6200000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-03-31T12:24:50.4760000' AS DateTime2), N'Kishan Kumar', N'banners/rqwoqo1cadlnhuwiz1nr', 1)
INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (13, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739787637/banners/hti8rqhqxalsb3iciwbn.jpg', N'Library', 11, CAST(N'2025-02-17T10:20:36.6550000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-02-17T11:24:55.6990000' AS DateTime2), N'Kishan Kumar', N'banners/hti8rqhqxalsb3iciwbn', 1)
INSERT [dbo].[Banner] ([id], [bannerUrl], [bannerName], [bannerPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (18, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1747052540/banners/wus7e4qg3w2avgylanvk.jpg', N'Sports ', 17, CAST(N'2025-05-12T17:52:03.9766667' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-12T17:55:16.0100000' AS DateTime2), N'Kishan Kumar', N'banners/wus7e4qg3w2avgylanvk', 1)
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[College] ON 

INSERT [dbo].[College] ([id], [collegeName], [location], [establishYear], [contactNumber], [email], [status], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (1, N'JK Institute Of Pharmacy', N'Bulandshahr ', 2000, N'+91-5738-244213', N' info@jkiop.org', 1, N'Kishan kumar', CAST(N'2025-04-07T12:03:31.5466667' AS DateTime2), NULL, NULL)
INSERT [dbo].[College] ([id], [collegeName], [location], [establishYear], [contactNumber], [email], [status], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (2, N'JK Institute Of Pharmacy & Management', N'Bulandshahr', 2015, N'+91-5738-244213', N'info@jkipm.org', 1, N'Kishan kumar', CAST(N'2025-04-07T12:03:31.5466667' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[College] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [courseName], [collegeId], [courseDuration], [createdBy], [createdOn], [modifiedBy], [modifiedOn], [status]) VALUES (1, N'B. Pharma', 1, 4, N'admin', CAST(N'2025-04-07T12:03:33.7033333' AS DateTime2), NULL, NULL, 1)
INSERT [dbo].[Course] ([id], [courseName], [collegeId], [courseDuration], [createdBy], [createdOn], [modifiedBy], [modifiedOn], [status]) VALUES (2, N'D. Pharma', 2, 2, N'admin', CAST(N'2025-04-07T12:03:33.7033333' AS DateTime2), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseEnquiry] ON 

INSERT [dbo].[CourseEnquiry] ([id], [fullName], [mobileNumber], [email], [course], [isContacted], [createdAt], [modifiedAt], [modifiedby]) VALUES (1, N'Rahul kumar', N'6387478842', N'Rahulkumar73001@gmail.com', N'D. Pharma', 1, CAST(N'2025-05-07T08:29:20.9070000' AS DateTime2), CAST(N'2025-05-09T05:51:26.0166667' AS DateTime2), N'Kishan Kumar')
INSERT [dbo].[CourseEnquiry] ([id], [fullName], [mobileNumber], [email], [course], [isContacted], [createdAt], [modifiedAt], [modifiedby]) VALUES (2, N'Rajan Kumar', N'1387478842', N'rajan@gmail.com', N'B. Pharma', 1, CAST(N'2025-05-07T08:33:01.0830000' AS DateTime2), CAST(N'2025-05-09T05:50:55.1066667' AS DateTime2), N'Kishan Kumar')
INSERT [dbo].[CourseEnquiry] ([id], [fullName], [mobileNumber], [email], [course], [isContacted], [createdAt], [modifiedAt], [modifiedby]) VALUES (3, N'Kausar Raza ansari', N'6387478842', N'Kausar@gmail.com', N'M. Pharma', 1, CAST(N'2025-05-07T08:50:44.4250000' AS DateTime2), CAST(N'2025-05-09T05:49:13.0166667' AS DateTime2), N'Kishan Kumar')
INSERT [dbo].[CourseEnquiry] ([id], [fullName], [mobileNumber], [email], [course], [isContacted], [createdAt], [modifiedAt], [modifiedby]) VALUES (4, N'Shivam kumar', N'9839180448', N'shivam3@gmail.com', N'B. Pharma', 0, CAST(N'2025-05-09T08:44:18.9433333' AS DateTime2), NULL, NULL)
INSERT [dbo].[CourseEnquiry] ([id], [fullName], [mobileNumber], [email], [course], [isContacted], [createdAt], [modifiedAt], [modifiedby]) VALUES (5, N'Oswald ', N'1234567892', N'oswald@gmail.com', N'D. Pharma', 0, CAST(N'2025-05-09T09:51:04.1166667' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CourseEnquiry] OFF
GO
SET IDENTITY_INSERT [dbo].[Documents] ON 

INSERT [dbo].[Documents] ([id], [studentId], [documentType], [publicId], [fileUrl], [fileName], [uploadDate], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (32, 50, N'StudentImage', N'student_documents/StudentImage/xnsda5ephkn3fbds41ev', N'https://travelbookplus.com/studentimage/638300458101195775Image_Photo.jpg', N'11-05-2022_094435.jpeg', CAST(N'2025-04-29T09:22:43.5110000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-04-29T09:22:43.5110000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Documents] ([id], [studentId], [documentType], [publicId], [fileUrl], [fileName], [uploadDate], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (33, 55, N'StudentImage', N'student_documents/StudentImage/iyjqaymgcxpdmiku3ohw', N'https://travelbookplus.com/studentimage/638300458101195775Image_Photo.jpg', N'11-05-2022_094435.jpeg', CAST(N'2025-04-30T05:54:44.6560000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-04-30T05:54:44.6560000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Documents] ([id], [studentId], [documentType], [publicId], [fileUrl], [fileName], [uploadDate], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (35, 56, N'StudentImage', N'student_documents/StudentImage/xvek8fj0xj796qqc2ge9', N'http://res.cloudinary.com/dxqmmofie/image/upload/v1747312702/student_documents/StudentImage/xvek8fj0xj796qqc2ge9.jpg', N'OIP.jpg', CAST(N'2025-05-15T18:08:05.2466667' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-15T18:08:05.2466667' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-15T12:38:05.2400000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Documents] OFF
GO
SET IDENTITY_INSERT [dbo].[EMIDetails] ON 

INSERT [dbo].[EMIDetails] ([id], [studentId], [studentAcademicId], [emiNumber], [amount], [dueDate], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (143, 63, 137, 1, 500, CAST(N'2025-05-01T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-05T05:37:16.3230000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-05T05:37:16.3230000' AS DateTime2))
INSERT [dbo].[EMIDetails] ([id], [studentId], [studentAcademicId], [emiNumber], [amount], [dueDate], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (144, 63, 137, 2, 1000, CAST(N'2025-05-23T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-05T05:37:16.3230000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-05T05:37:16.3230000' AS DateTime2))
INSERT [dbo].[EMIDetails] ([id], [studentId], [studentAcademicId], [emiNumber], [amount], [dueDate], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (149, 56, 130, 1, 25000, CAST(N'2025-04-30T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-15T12:38:05.2266667' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-15T12:38:05.2266667' AS DateTime2))
INSERT [dbo].[EMIDetails] ([id], [studentId], [studentAcademicId], [emiNumber], [amount], [dueDate], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (150, 56, 130, 2, 25000, CAST(N'2025-05-30T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-15T12:38:05.2366667' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-15T12:38:05.2366667' AS DateTime2))
INSERT [dbo].[EMIDetails] ([id], [studentId], [studentAcademicId], [emiNumber], [amount], [dueDate], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (151, 66, 141, 1, 25000, CAST(N'2025-05-14T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-19T11:47:56.2033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[EMIDetails] ([id], [studentId], [studentAcademicId], [emiNumber], [amount], [dueDate], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (152, 66, 141, 2, 25000, CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-19T11:47:56.2100000' AS DateTime2), NULL, NULL)
INSERT [dbo].[EMIDetails] ([id], [studentId], [studentAcademicId], [emiNumber], [amount], [dueDate], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (153, 66, 142, 1, 20000, CAST(N'2025-05-14T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-19T06:24:08.3800000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-19T06:24:08.3800000' AS DateTime2))
INSERT [dbo].[EMIDetails] ([id], [studentId], [studentAcademicId], [emiNumber], [amount], [dueDate], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (154, 66, 142, 2, 25000, CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-19T06:24:08.3900000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-19T06:24:08.3900000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[EMIDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ExpensePayment] ON 

INSERT [dbo].[ExpensePayment] ([ExpensePaymentID], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (1, N'First Expense', CAST(1000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-20T11:41:30.900' AS DateTime), N'Kishan Kumar', NULL, NULL, 2, N'Cash', N'1231', CAST(N'2025-05-20' AS Date), NULL)
INSERT [dbo].[ExpensePayment] ([ExpensePaymentID], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (2, N'2nd', CAST(1000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-20T11:50:05.590' AS DateTime), N'Kishan Kumar', NULL, NULL, 2, N'Cheque', N'21', CAST(N'2025-05-20' AS Date), NULL)
INSERT [dbo].[ExpensePayment] ([ExpensePaymentID], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (3, N'book Payment', CAST(1000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-20T17:02:25.523' AS DateTime), N'Kishan Kumar', NULL, NULL, 1, N'Cheque', N'123', CAST(N'2025-05-20' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[ExpensePayment] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([id], [faculty_name], [qualification], [designation], [profilePicUrl], [documents], [monthlySalary], [yearlyLeave], [created_on], [created_by], [modify_on], [modify_by], [IsVisible]) VALUES (22, N'Mr. Jai Bhargava', N'M. Pharma', N'Principal', NULL, N'[{"title":"10 th","url":"https://res.cloudinary.com/dxqmmofie/image/upload/v1742818882/faculties/bc0yu393eo28gzrrvyyf.jpg"}]', NULL, NULL, CAST(N'2025-03-24T12:21:16.9940000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-03-25T05:59:17.8690000' AS DateTime2), N'Kishan Kumar', 1)
INSERT [dbo].[Faculty] ([id], [faculty_name], [qualification], [designation], [profilePicUrl], [documents], [monthlySalary], [yearlyLeave], [created_on], [created_by], [modify_on], [modify_by], [IsVisible]) VALUES (23, N'	Ms. Sunny', N'M. Pharma', N'Lecturer', NULL, N'[{"title":"Raect Js","url":"https://res.cloudinary.com/dxqmmofie/image/upload/v1743664427/faculties/j7vgl0qr2hmjfdxa5ypd.pdf"}]', 12000, 5, CAST(N'2025-03-25T05:59:48.8880000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-14T15:32:32.4300000' AS DateTime2), N'Kishan Kumar', 0)
INSERT [dbo].[Faculty] ([id], [faculty_name], [qualification], [designation], [profilePicUrl], [documents], [monthlySalary], [yearlyLeave], [created_on], [created_by], [modify_on], [modify_by], [IsVisible]) VALUES (24, N'Km Sonia', N'M. Pharma', N'Lecturer', NULL, NULL, NULL, NULL, CAST(N'2025-03-25T06:00:03.5910000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-14T15:29:35.1566667' AS DateTime2), N'Kishan Kumar', 1)
INSERT [dbo].[Faculty] ([id], [faculty_name], [qualification], [designation], [profilePicUrl], [documents], [monthlySalary], [yearlyLeave], [created_on], [created_by], [modify_on], [modify_by], [IsVisible]) VALUES (25, N'Mr. Niranjan Prashad', N'B. Pharma', N'Lecturer', NULL, NULL, 1200, 5, CAST(N'2025-03-25T06:00:50.4970000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-04-01T08:36:52.8430000' AS DateTime2), N'Kishan Kumar', 1)
INSERT [dbo].[Faculty] ([id], [faculty_name], [qualification], [designation], [profilePicUrl], [documents], [monthlySalary], [yearlyLeave], [created_on], [created_by], [modify_on], [modify_by], [IsVisible]) VALUES (26, N'Mr. Atul Kumar', N'B. Pharma', N'Lecturer', N'https://res.cloudinary.com/dxqmmofie/image/upload/v1742882497/faculties/rd2s7da9desmepgc89xr.jpg', N'[{"title":"12 ths ","url":"https://res.cloudinary.com/dxqmmofie/image/upload/v1743164938/faculties/nsj11oxrf0xlrlpd4jlj.jpg"},{"title":"10 ths ","url":"https://res.cloudinary.com/dxqmmofie/image/upload/v1743165014/faculties/jf7nzpfgipfd6iqguyhi.jpg"}]', 12000, 10, CAST(N'2025-03-25T06:01:30.5090000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-08T13:35:42.7733333' AS DateTime2), N'Kishan Kumar', 1)
INSERT [dbo].[Faculty] ([id], [faculty_name], [qualification], [designation], [profilePicUrl], [documents], [monthlySalary], [yearlyLeave], [created_on], [created_by], [modify_on], [modify_by], [IsVisible]) VALUES (27, N'Ms. Lakshmi', N'B. Pharma', N'Lecturer', NULL, NULL, NULL, NULL, CAST(N'2025-03-25T06:01:55.8890000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-04-01T07:10:38.3970000' AS DateTime2), N'Kishan Kumar', 1)
INSERT [dbo].[Faculty] ([id], [faculty_name], [qualification], [designation], [profilePicUrl], [documents], [monthlySalary], [yearlyLeave], [created_on], [created_by], [modify_on], [modify_by], [IsVisible]) VALUES (28, N'Km Anjali', N'B. Pharma', N'Lecturer', NULL, NULL, NULL, NULL, CAST(N'2025-03-25T06:02:16.0860000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-04-01T08:37:05.4500000' AS DateTime2), N'Kishan Kumar', 1)
INSERT [dbo].[Faculty] ([id], [faculty_name], [qualification], [designation], [profilePicUrl], [documents], [monthlySalary], [yearlyLeave], [created_on], [created_by], [modify_on], [modify_by], [IsVisible]) VALUES (30, N'Kishan Kumar', N'M. Pharma', N'Lecturer', NULL, NULL, 2, 4, CAST(N'2025-04-25T09:40:32.6410000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-14T15:29:16.0766667' AS DateTime2), N'Kishan Kumar', 1)
SET IDENTITY_INSERT [dbo].[Faculty] OFF
GO
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([id], [galleryUrl], [galleryName], [galleryPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (10, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739873939/galleries/qgx33ynclmefjrn7chve.jpg', N'Lab', 1, CAST(N'2025-02-18T10:18:58.6170000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-14T15:12:34.8033333' AS DateTime2), N'Kishan Kumar', N'galleries/qgx33ynclmefjrn7chve', 1)
INSERT [dbo].[Gallery] ([id], [galleryUrl], [galleryName], [galleryPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (11, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739873991/galleries/uvbnnw1ih937odu0ag1r.jpg', N'Lab', 2, CAST(N'2025-02-18T10:19:50.8120000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-19T15:17:43.8266667' AS DateTime2), N'Kishan Kumar', N'galleries/uvbnnw1ih937odu0ag1r', 1)
INSERT [dbo].[Gallery] ([id], [galleryUrl], [galleryName], [galleryPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (12, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739874027/galleries/pvefolwcirlptylgupan.jpg', N'lab', 3, CAST(N'2025-02-18T10:20:26.9570000' AS DateTime2), N'Kishan Kumar', NULL, NULL, N'galleries/pvefolwcirlptylgupan', 1)
INSERT [dbo].[Gallery] ([id], [galleryUrl], [galleryName], [galleryPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (13, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739874047/galleries/jyidkis6viwsb17bjll2.jpg', N'Lab', 4, CAST(N'2025-02-18T10:20:46.9240000' AS DateTime2), N'Kishan Kumar', NULL, NULL, N'galleries/jyidkis6viwsb17bjll2', 1)
INSERT [dbo].[Gallery] ([id], [galleryUrl], [galleryName], [galleryPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (14, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739874071/galleries/ylzb7wqvtuslzj73bkxo.jpg', N'Lab', 5, CAST(N'2025-02-18T10:21:10.4990000' AS DateTime2), N'Kishan Kumar', NULL, NULL, N'galleries/ylzb7wqvtuslzj73bkxo', 1)
INSERT [dbo].[Gallery] ([id], [galleryUrl], [galleryName], [galleryPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (15, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739874115/galleries/ofku3bpwyehg9c3a5o72.jpg', N'Library', 6, CAST(N'2025-02-18T10:21:55.3300000' AS DateTime2), N'Kishan Kumar', NULL, NULL, N'galleries/ofku3bpwyehg9c3a5o72', 1)
INSERT [dbo].[Gallery] ([id], [galleryUrl], [galleryName], [galleryPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (16, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739874140/galleries/b9zkphjkyny1ubqhqlbn.jpg', N'Library', 7, CAST(N'2025-02-18T10:22:20.4480000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-04-01T10:58:32.7960000' AS DateTime2), N'Kishan Kumar', N'galleries/b9zkphjkyny1ubqhqlbn', 1)
INSERT [dbo].[Gallery] ([id], [galleryUrl], [galleryName], [galleryPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (17, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739874164/galleries/cg7ti8mzaqeaqdtuj13q.gif', N'Chairman', 8, CAST(N'2025-02-18T10:22:44.1700000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-03-28T08:28:36.5960000' AS DateTime2), N'Kishan Kumar', N'galleries/cg7ti8mzaqeaqdtuj13q', 1)
INSERT [dbo].[Gallery] ([id], [galleryUrl], [galleryName], [galleryPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (18, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739874199/galleries/icze7trldlmh6bc9uvjg.jpg', N'Jk Consulatancy', 9, CAST(N'2025-02-18T10:23:18.9620000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-03-03T05:13:25.5670000' AS DateTime2), N'Kishan Kumar', N'galleries/icze7trldlmh6bc9uvjg', 1)
INSERT [dbo].[Gallery] ([id], [galleryUrl], [galleryName], [galleryPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (19, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739878220/galleries/dxfl3ls1qmhst7hdy8ha.jpg', N'Sports', 12, CAST(N'2025-02-18T11:30:19.2610000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-08T12:42:27.9866667' AS DateTime2), N'Kishan Kumar', N'galleries/dxfl3ls1qmhst7hdy8ha', 1)
SET IDENTITY_INSERT [dbo].[Gallery] OFF
GO
SET IDENTITY_INSERT [dbo].[Galleryold] ON 

INSERT [dbo].[Galleryold] ([Id], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (4, N'10-24-2017_190657.jpg', CAST(N'2017-03-04T12:19:04.477' AS DateTime), NULL, CAST(N'2017-10-24T19:06:57.093' AS DateTime), NULL)
INSERT [dbo].[Galleryold] ([Id], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (17, N'10-24-2017_190911.gif', CAST(N'2017-04-09T10:05:07.303' AS DateTime), NULL, CAST(N'2017-10-24T19:09:11.340' AS DateTime), NULL)
INSERT [dbo].[Galleryold] ([Id], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (18, N'12-06-2017_115308.jpg', CAST(N'2017-12-06T11:53:08.207' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Galleryold] ([Id], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (19, N'12-06-2017_115331.jpg', CAST(N'2017-12-06T11:53:31.900' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Galleryold] ([Id], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (20, N'12-06-2017_115400.jpg', CAST(N'2017-12-06T11:54:00.990' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Galleryold] ([Id], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (21, N'12-06-2017_115412.jpg', CAST(N'2017-12-06T11:54:12.313' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Galleryold] ([Id], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (22, N'12-06-2017_115418.jpg', CAST(N'2017-12-06T11:54:18.453' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Galleryold] ([Id], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (26, N'12-06-2017_115638.jpg', CAST(N'2017-12-06T11:56:38.680' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Galleryold] OFF
GO
SET IDENTITY_INSERT [dbo].[HomeSlider] ON 

INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (1, N'12-06-2017_105007.jpg', N'JK Institute Of Pharmacy', N'<ul style="box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 25px; list-style: none; position: relative; color: rgb(51, 51, 51); font-family: &quot;helvetica neue&quot;, helvetica, arial, sans-serif; font-size: 14px;">    <li style="box-sizing: border-box; line-height: 25px;">    <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: 11.25pt; text-align: justify;"><span style="font-size: 7pt; letter-spacing: 0.6pt; font-family: arial, sans-serif; color: rgb(48, 48, 48);">Education    is the fundamental base of human development. Skill, knowledge and experience    obtained through education define how people see to the world., develop their    future cover and what kind of life they can lead. Education is not only to    provide professional knowledge to the people but also make them civilized and    enhance their exploratory behavior.<o:p></o:p></span></p>    <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: 11.25pt; text-align: justify;"><span style="font-size: 7pt; letter-spacing: 0.6pt; font-family: arial, sans-serif; color: rgb(48, 48, 48);">jkiop    is a highly specialized organization dedicated to promoting and facilitating    individual personality development.<o:p></o:p></span></p>    <p class="MsoNormal" style="margin-bottom: 0.0001pt; line-height: 11.25pt; text-align: justify;"><span style="font-size: 7pt; letter-spacing: 0.6pt; font-family: arial, sans-serif; color: rgb(48, 48, 48);">We    have highly qualified professionals and excellent well equipped laboratory    facilities. We provide the framework and environment for you to make the choice    in education to realize your individual aspiration.<o:p></o:p></span></p>    <span style="font-size: 7pt; line-height: 115%; letter-spacing: 0.6pt; font-family: arial, sans-serif; color: rgb(48, 48, 48);">We    are committed to provide the excellence in teaching, learning, research and    develop the cream of the crop in pharmacy </span></li></ul>', NULL, NULL, CAST(N'2019-04-09T07:58:42.400' AS DateTime), NULL, 1, N'Main Entrance of the College')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (2, N'11-04-2022_121017.jpg', N'JK Institute Of Pharmacy', N'Independence day celebration BILSI', NULL, NULL, CAST(N'2022-11-04T12:10:17.040' AS DateTime), NULL, 2, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (3, N'03-28-2022_080353.jpg', N'Chairman', N'', NULL, NULL, CAST(N'2022-03-28T08:28:35.510' AS DateTime), NULL, 3, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (9, N'12-06-2017_094738.jpg', N'Computer Lab', N'fgdg dfbdfbb  fgb fgbb  dfgb fgbb fdgb fdgbb  dfb fdgbb dfbbdd fbdbddbd', NULL, NULL, CAST(N'2017-12-06T09:48:40.157' AS DateTime), NULL, 9, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (10, N'12-06-2017_095900.jpg', N'Computer Lab', N'Meetings with people and listen problems', NULL, NULL, CAST(N'2017-12-06T09:59:00.013' AS DateTime), NULL, 10, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (11, N'12-06-2017_105357.jpg', N'Chairman', N'', CAST(N'2017-12-06T09:18:19.237' AS DateTime), NULL, CAST(N'2022-03-28T08:29:35.110' AS DateTime), NULL, 1, N'Chairman')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (12, N'12-06-2017_105958.jpg', N'JK Institute Of Pharmacy', N'', CAST(N'2017-12-06T10:59:58.923' AS DateTime), NULL, NULL, NULL, 1, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (13, N'12-06-2017_110129.jpg', N'Lab', N'', CAST(N'2017-12-06T11:01:29.617' AS DateTime), NULL, NULL, NULL, 1, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (14, N'12-06-2017_110224.jpg', N'Lab', N'', CAST(N'2017-12-06T11:02:24.270' AS DateTime), NULL, NULL, NULL, 1, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (15, N'12-06-2017_110307.jpg', N'Lab', N'', CAST(N'2017-12-06T11:03:07.263' AS DateTime), NULL, NULL, NULL, 1, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (16, N'11-30-2023_075351.jpg', N'Lecture Hall', N'', CAST(N'2017-12-06T11:04:34.823' AS DateTime), NULL, CAST(N'2023-11-30T07:53:51.400' AS DateTime), NULL, 1, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (17, N'12-06-2017_110806.jpg', N'Library', N'', CAST(N'2017-12-06T11:08:06.327' AS DateTime), NULL, NULL, NULL, 1, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (18, N'12-06-2017_110820.jpg', N'Library', N'', CAST(N'2017-12-06T11:08:20.440' AS DateTime), NULL, NULL, NULL, 1, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (19, N'12-06-2017_110836.jpg', N'Library', N'', CAST(N'2017-12-06T11:08:36.080' AS DateTime), NULL, NULL, NULL, 1, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (20, N'12-06-2017_110847.jpg', N'Library', N'', CAST(N'2017-12-06T11:08:47.263' AS DateTime), NULL, NULL, NULL, 1, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (21, N'12-06-2017_111030.jpg', N'Sports', N'', CAST(N'2017-12-06T11:10:30.363' AS DateTime), NULL, NULL, NULL, 1, N'')
INSERT [dbo].[HomeSlider] ([Id], [ImageName], [Title], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder], [Heading]) VALUES (22, N'03-28-2022_075127.jpeg', N'JK Institute Of Pharmacy', N't', CAST(N'2022-03-28T07:51:27.783' AS DateTime), NULL, CAST(N'2022-03-28T07:51:49.120' AS DateTime), NULL, 1, N'JK Institute Of Pharmacy')
SET IDENTITY_INSERT [dbo].[HomeSlider] OFF
GO
SET IDENTITY_INSERT [dbo].[ImportantLinks] ON 

INSERT [dbo].[ImportantLinks] ([id], [LOGOUrl], [linksUrl], [logoName], [logoPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (27, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739867932/important-links/oov4tr6sf2p5aylua9qj.jpg', N'https://jkiop.org/', N' JK Institute Of Pharmacy', 1, CAST(N'2025-02-18T08:38:51.9320000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-08T12:55:06.7266667' AS DateTime2), N'Kishan Kumar', N'important-links/oov4tr6sf2p5aylua9qj', 1)
INSERT [dbo].[ImportantLinks] ([id], [LOGOUrl], [linksUrl], [logoName], [logoPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (28, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739946484/important-links/persudhohvbomezs2uhn.jpg', N'https://www.aicte-india.org/', N'AICT', 1, CAST(N'2025-02-18T08:39:37.8110000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-13T14:38:34.1700000' AS DateTime2), N'Kishan Kumar', N'important-links/sbvelapybkxmi9kvih3i', 1)
INSERT [dbo].[ImportantLinks] ([id], [LOGOUrl], [linksUrl], [logoName], [logoPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (29, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739868170/important-links/toyprawmgguka1lgciq5.jpg', N'https://pci.nic.in', N'PCi', 4, CAST(N'2025-02-18T08:42:49.6780000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-08T12:55:13.9800000' AS DateTime2), N'Kishan Kumar', N'important-links/toyprawmgguka1lgciq5', 1)
INSERT [dbo].[ImportantLinks] ([id], [LOGOUrl], [linksUrl], [logoName], [logoPosition], [created_on], [created_by], [modify_on], [modify_by], [publicId], [IsVisible]) VALUES (30, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1746688680/important-links/ebx42qswxqdu3pzq9f6l.jpg', N'https://bteup.ac.in/', N'BTE', 4, CAST(N'2025-05-08T12:47:45.8566667' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-08T12:49:29.2066667' AS DateTime2), N'Kishan Kumar', N'important-links/ebx42qswxqdu3pzq9f6l', 1)
SET IDENTITY_INSERT [dbo].[ImportantLinks] OFF
GO
SET IDENTITY_INSERT [dbo].[LatestPost] ON 

INSERT [dbo].[LatestPost] ([post_id], [post_title], [post_slug], [post_content], [created_by], [created_on], [modify_by], [modify_on], [isVisible]) VALUES (11, N'Admission open', N'admission-open-2025', N'<p><img src="https://res.cloudinary.com/dxqmmofie/image/upload/v1740387936/LatestPost/pkrlxagwjdokm5saxymq.jpg" style="width: 300px;" class="fr-fic fr-dib fr-fil"><strong>Admission open in jk</strong></p>', N'Kishan Kumar', CAST(N'2025-02-24T08:41:51.9950000' AS DateTime2), N'Kishan kumar', CAST(N'2025-03-19T09:30:21.2930000' AS DateTime2), 1)
INSERT [dbo].[LatestPost] ([post_id], [post_title], [post_slug], [post_content], [created_by], [created_on], [modify_by], [modify_on], [isVisible]) VALUES (12, N' Student List 2021-22', N' Student List 2021-22', N'<ul style=''box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 25px; list-style: circle; position: relative; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'' id="isPasted"><li style="box-sizing: border-box; line-height: 25px;"><a href="https://jkiop.org/images/StudentListFirstYear.pdf" target="_blank" style="box-sizing: border-box; background-color: transparent; color: rgb(47, 47, 47); text-decoration: none;">Student List D. Pharma 1st Year 2021-2022</a></li><li style="box-sizing: border-box; line-height: 25px; opacity: 0.75;"><a href="https://jkiop.org/images/Studentlist2ndyear.pdf" target="_blank" style="box-sizing: border-box; background-color: transparent; color: rgb(47, 47, 47); text-decoration: none;">Student List D. Pharma 2nd Year 2021-2022</a></li></ul>', N'Kishan Kumar', CAST(N'2025-02-24T09:11:39.6970000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-02-24T10:26:24.9280000' AS DateTime2), 1)
INSERT [dbo].[LatestPost] ([post_id], [post_title], [post_slug], [post_content], [created_by], [created_on], [modify_by], [modify_on], [isVisible]) VALUES (13, N'Date sheet for board examination', N'date-sheet-for-board-examination', N'<p><strong style=''box-sizing: border-box; font-weight: 700; color: rgb(255, 0, 0); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'' id="isPasted">Date sheet for board examination is available on BTE Website.</strong></p>', N'Kishan Kumar', CAST(N'2025-02-24T10:29:26.3650000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-02-24T10:48:14.0720000' AS DateTime2), 1)
INSERT [dbo].[LatestPost] ([post_id], [post_title], [post_slug], [post_content], [created_by], [created_on], [modify_by], [modify_on], [isVisible]) VALUES (14, N'Enquiry open for admission in session 2022-23', N'enquiry-open-for-admission-in-session-2022-23', N'<p><span style=''color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;'' id="isPasted"><strong>D. Pharma&nbsp;</strong></span></p><p><span id="isPasted"><strong><span style=''color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;'' id="isPasted"><strong>B. Pharma</strong></span></strong></span></p>', N'Kishan Kumar', CAST(N'2025-02-24T10:31:06.7410000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-03-26T05:54:24.0890000' AS DateTime2), 1)
INSERT [dbo].[LatestPost] ([post_id], [post_title], [post_slug], [post_content], [created_by], [created_on], [modify_by], [modify_on], [isVisible]) VALUES (15, N'2nd Sessional Examination Date Sheet', N'2nd-sessional-examination-date-sheet', N'<p style=''box-sizing: border-box; margin: 0px 0px 10px; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'' id="isPasted"><span style=''color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;'' id="isPasted"><strong>2nd Sessional examination Date Sheet</strong></span></p><div style=''box-sizing: border-box; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;''><br style="box-sizing: border-box;"></div><div style=''box-sizing: border-box; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;''>20/12/2017 - 22/12/2017 &nbsp;</div><p style=''box-sizing: border-box; margin: 0px 0px 10px; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'' id="isPasted">2nd Sessional examination Date Sheet</p><p><img src="https://res.cloudinary.com/dxqmmofie/image/upload/v1743406389/LatestPost/kvoypbmjnav7slb1dwzb.jpg" style="width: 300px;" class="fr-fic fr-dib fr-fil"></p><p style=''box-sizing: border-box; margin: 0px 0px 10px; color: rgb(51, 51, 51); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'' id="isPasted"><br></p>', N'Kishan Kumar', CAST(N'2025-02-24T10:33:07.5090000' AS DateTime2), NULL, CAST(N'2025-05-14T15:23:29.0400000' AS DateTime2), 1)
INSERT [dbo].[LatestPost] ([post_id], [post_title], [post_slug], [post_content], [created_by], [created_on], [modify_by], [modify_on], [isVisible]) VALUES (16, N'student List ', N'student-list-year', N'<p><strong>Time Table For Exam</strong><img src="https://res.cloudinary.com/dxqmmofie/image/upload/v1746692263/LatestPost/dinhitwrioprws9heiwh.jpg" style="width: 180px;" class="fr-fic fr-dib fr-fil" success="true" message="File uploaded successfully"></p>', N'Kishan Kumar', CAST(N'2025-05-08T13:48:29.5433333' AS DateTime2), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[LatestPost] OFF
GO
SET IDENTITY_INSERT [dbo].[MainPage] ON 

INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (1, N'Admissions', N'<div class="left_content" style="margin-top: -40px;"><div class="single_page"><h2 style="color: red;">APPROVAL OF COLLEGE : -</h2><h2 style="color: red;"><strong style="color: rgb(51, 51, 51); font-family: &quot;open sans&quot;, sans-serif; font-size: 12px;">1.<img alt="" src="/Images/pcilogo.jpg" />PCI</strong><span style="font-size: 12px; font-family: &quot;open sans&quot;, sans-serif; color: rgb(51, 51, 51);"> (Pharmacy council of India)</span></h2><h2 style="color: red;"><strong style="color: rgb(51, 51, 51); font-family: &quot;open sans&quot;, sans-serif; font-size: 12px;">2.<img alt="" src="/Images/aictelogo.jpg" />AICTE</strong><span style="font-size: 12px; font-family: &quot;open sans&quot;, sans-serif; color: rgb(51, 51, 51);"> (All India Council of technical Education)</span></h2><h2 style="color: red;"><strong style="color: rgb(51, 51, 51); font-family: &quot;open sans&quot;, sans-serif; font-size: 12px;">3.<img alt="" src="/Images/bteup.jpg" /> B.T.E</strong><span style="font-size: 12px; font-family: &quot;open sans&quot;, sans-serif; color: rgb(51, 51, 51);"> (Board of Technical Education)</span></h2><div class="single_page_content"><div class="post_commentbox" style="text-align: center;"><h4 style="color: red;">College Code:-680 </h4></div><br /><div><h2 style="color: red; margin-top: 85px;">COURSE OFFERED:-</h2><h3 style="text-align: center; margin-top: -40px;">DIPLOMA IN PHARMACY</h3></div><br /><ul>    <li><strong>Eligibility Criteria:</strong>    <p>    </p>    <ul>        <li>Candidates who have passed intermediate with 50% marks in (Physics + Chemistry +Maths/Bio).</li>    </ul>    <p></p>    </li>    <li><strong>Admission Process:</strong>    <p>    </p>    <ul>        <li>Admission is done both through Entrance test conducted by Board of Technical Education.</li>        <li> Direct management quota.</li>        <li>For obtaining prospectus and application form, contact at college campus.</li>    </ul>    <p></p>    </li>    <li><strong>Contact Details For Addmission:-</strong>    <p>    </p>    <ul>        <li>07409036444,09058781736, 07351220007</li>    </ul>    <p></p>    </li></ul></div></div></div>', N'', NULL, NULL, NULL, CAST(N'2019-04-09T08:04:57.150' AS DateTime), NULL, N'Admissions')
INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (2, N'Placement', N'<span style="font-size: 16px;">100% Placement assessment.   </span>', N'', NULL, NULL, NULL, CAST(N'2017-12-30T07:33:50.457' AS DateTime), NULL, N'Placement')
INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (3, N'Infrastructure', N'<div class="left_content">                    <div class="single_page">                        <div class="single_page_content">                            <ul>                                <li><strong>Computer Center</strong> <p>Theinstitute has a well-equipped computer lab having round the clock Wi-FiInternet facilities. It immensely helps the students to gain practicalexperience of working on computers and exposure to Information Technology.</p></li>                                <li><strong>Medicinal Plant Garden</strong> <p>TheGarden functions as an educational display of medicinal plants, herbs andspices and also as a conservatory source of standard specimens. The brickpathways, which crisscross the quarter - acre formal style garden, provide easyaccess for visitors to examine the labeled plants.</p></li>                                <li><strong>Seminar Hall</strong> <p>Theinstitute has well furnished seminar hall. The hall is equipped withstate-of-the-art audio-visual equipment like Slide and Film Projectors, withCordless Microphones. It helps the students to gain first hand information,knowledge, experience and exposure to functional areas of corporate sectorincluding organizational skills and etiquette. Personality development andcommunication skills workshop are organized regularly as we believe in overalldevelopment of our candidates.</p></li>                                <li><strong>Auditorium</strong> <p>TheInstitute has an auditorium for conducting seminars and cultural events.</p></li>                                <li><strong>SPORT</strong> <p>The campus has facilities for indoor &outdoor games</p></li>                                <li><strong>Lecture halls</strong> <p>Student-faculty interaction centre, a knowledge conceivingcentre thelecture halls are designed to accommodate classes of 75 students. Each lecturehall has a stage and teaching podium and wellventilated.</p></li>                                <li><strong>LIBRARY</strong> <p>Theinstitute has a central library which is open for students and staff membersfrom 9.30 a.m. to 4.00 p.m. on all working days. Library has a rich collectionof text books, reference books, national and international periodicals,journals and magazines, along with CD and video cassettes in all branches ofPharmacy. Books and editions are upgraded on a regular basis. </p></li>                            </ul>                        </div>                    </div>                </div>', N'', NULL, NULL, NULL, CAST(N'2017-12-30T11:58:51.800' AS DateTime), NULL, N'Infrastructure')
INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (4, N'About Us', N'<div class="left_content"><div class="single_page"><div class="single_page_content"><p class="MsoNormal" style="text-align: justify;"><strong><span style="font-size: 12pt; line-height: 115%; color: rgb(23, 54, 93);">J K Institute of Pharmacy is the LushGreen campus located at Bulandshahr-Khurja NH 91. The college started workingon 2017 with the generosity of Shri J K Singh a visionary and a legend.<o:p></o:p></span></strong></p><p class="MsoNormal" style="text-align: justify;"><strong><span style="font-size: 12pt; line-height: 115%; color: rgb(23, 54, 93);">The institute is approved by All IndiaCouncil for Technical Education (AICTE), the Pharmacy Council of India (PCI),New Delhi and Board of Technical Education (BTE), Govt. of Uttar Pradesh. Theinstitute has state-of-the-art infrastructure and instrumental facilities andprovides a serene atmosphere for academic excellence.<o:p></o:p></span></strong></p><p style="text-align: justify;"></p><p class="MsoNormal" style="text-align: justify;"><strong><span style="font-size: 12pt; line-height: 115%; color: rgb(23, 54, 93);">The institute houses a voluminouslibrary, classrooms with multimedia facilities, well equipped laboratories,modern Computer and Language labs, canteens, playground, auditorium and seminarhalls.  <o:p></o:p></span></strong></p><p></p></div></div></div>', N'', NULL, NULL, NULL, CAST(N'2019-04-09T08:14:04.300' AS DateTime), NULL, N'AboutUs')
INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (5, N'Facility', N'<div class="left_content">                    <div class="single_page">                        <div class="single_page_content">                            <ul>                                <li>Transport system from various location of Bulandshahr and Khurja.</li>                                <li>Cafeteria</li>                                <li>Training and Placement cell. </li>                            </ul>                        </div>                    </div>                </div>', N'', NULL, NULL, NULL, CAST(N'2017-12-30T12:12:20.870' AS DateTime), NULL, N'Facilities')
INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (6, N'Career', N'<span><img alt="" src="/Images/IMG-20171230-WA0014.jpg" width="730px" /></span>', N'', NULL, NULL, NULL, CAST(N'2017-12-30T12:37:21.583' AS DateTime), NULL, N'Career')
INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (7, N'Courses', N'<span style="font-size: 16px;"><strong>D. PHARMACY (50 Seat)</strong></span>', N'', NULL, NULL, NULL, CAST(N'2017-12-23T08:54:06.073' AS DateTime), NULL, N'Courses')
INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (8, N'Why Us', N'<span style="font-size: 14px; font-family: &quot;helvetica neue&quot;, helvetica, arial, sans-serif;">J K Institute of Pharmacy is the LushGreen campus located at Bulandshahr-Khurja NH 91. The college started workingon 2017 with the generosity of Shri J K Singh a visionary and a legend. The institute is approved by All IndiaCouncil for Technical Education (AICTE), the Pharmacy Council of India (PCI),New Delhi and Board of Technical Education, Govt. of Uttar Pradesh. Theinstitute has state-of-the-art infrastructure and instrumental facilities andprovides a serene atmosphere for academic excellence. The institute houses a voluminous library,classrooms with multimedia facilities, well equipped laboratories, modernComputer and Language labs, canteens, play ground, auditorium and seminarhalls.</span>', N'12-06-2017_114841.jpg', NULL, NULL, NULL, CAST(N'2022-11-05T09:59:15.393' AS DateTime), NULL, N'Whyus')
INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (9, N'PRINCIPAL', N'<span style="font-size: 14px; font-family: &quot;helvetica neue&quot;, helvetica, arial, sans-serif;">J K institute of Pharmacy aims to become a center of excellence in providing high quality education and training to individuals in acquiring extensive knowledge in the field of Pharmaceutical Sciences, so that they can enrich their lives, develop their confidence and become respectable and useful members of society and contribute further in the development of the nation.</span>', N'11-05-2022_094435.jpeg', NULL, NULL, NULL, CAST(N'2022-11-05T09:57:57.597' AS DateTime), NULL, N'Pharmacy')
INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (10, N'Chairman', N'<span style="font-size: 14px; font-family: &quot;helvetica neue&quot;, helvetica, arial, sans-serif;">J K Institute of Pharmacy is the Lush Green campus located at Bulandshahr-Khurja NH 91. The college started working on 2017 with the generosity of Shri J K Singh a visionary and a legend. The Institute is approved by All India Council for Technical Education (AICTE), the Pharmacy Council of India (PCI), New Delhi and Board of Technical Education, Govt. of Uttar Pradesh. The institute has state-of-the-art infrastructure and instrumental facilities and provides a serene atmosphere for academic excellence. The institute houses a voluminous library, classrooms with multimedia facilities, well equipped laboratories, modern Computer and Language labs, canteens, play ground, auditorium and seminar halls.</span>', N'12-04-2017_180215.jpg', NULL, NULL, NULL, CAST(N'2022-11-05T09:55:58.140' AS DateTime), NULL, N'Director')
INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (11, N'Faculty', N'<table border="0" cellpadding="0" cellspacing="0" width="100%" style="width: 100%;">    <colgroup>    <col width="52" style="width: 39pt;" />    <col width="64" style="width: 48pt;" />    <col width="158" style="width: 119pt;" />    <col width="157" style="width: 118pt;" />    <col width="183" style="width: 137pt;" />    <col width="2" style="width: 2pt;" />    </colgroup>    <tbody>        <tr height="29" style="height: 22.15pt;">        </tr>        <tr height="35" style="height: 26.45pt; font-weight: 700;">            <td class="xl64" style="height: 26.45pt; padding: 5px; border: 1px solid black; border-collapse: collapse;">S.NO.</td>            <td class="xl64" style="width: 200px; padding: 5px; border: 1px solid black; border-collapse: collapse;">Name  Of Faculty </td>            <td class="xl64" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Qualification </td>            <td class="xl64" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Designation </td>        </tr>        <tr height="33" style="height: 24.95pt;">            <td class="xl65" style="height: 24.95pt; padding: 5px; border: 1px solid black; border-collapse: collapse;">1</td>            <td class="xl66" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Mr. Jai Bhargava</td>            <td class="xl67" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">M. Pharma</td>            <td class="xl68" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Principal </td>        </tr>        <tr height="33" style="height: 24.95pt;">            <td class="xl65" style="height: 24.95pt; padding: 5px; border: 1px solid black; border-collapse: collapse;">2</td>            <td class="xl66" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Ms. Sunny</td>            <td class="xl67" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">M. Pharma</td>            <td class="xl68" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Lecturer</td>        </tr>        <tr height="33" style="height: 24.95pt;">            <td class="xl65" style="height: 24.95pt; padding: 5px; border: 1px solid black; border-collapse: collapse;">3</td>            <td class="xl66" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Km Sonia</td>            <td class="xl67" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">M. Pharma</td>            <td class="xl68" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Lecturer</td>        </tr>        <tr height="33" style="height: 24.95pt;">            <td class="xl65" style="height: 24.95pt; padding: 5px; border: 1px solid black; border-collapse: collapse;">4</td>            <td class="xl66" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Mr. Niranjan Prashad</td>            <td class="xl67" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">B. Pharma</td>            <td class="xl68" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Lecturer</td>        </tr>        <tr height="33" style="height: 24.95pt;">            <td class="xl65" style="height: 24.95pt; padding: 5px; border: 1px solid black; border-collapse: collapse;">5</td>            <td class="xl66" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Mr. Atul</td>            <td class="xl67" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">B. Pharma</td>            <td class="xl68" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Lecturer</td>        </tr>        <tr height="33" style="height: 24.95pt;">            <td class="xl65" style="height: 24.95pt; padding: 5px; border: 1px solid black; border-collapse: collapse;">6</td>            <td class="xl66" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Ms. Lakshmi</td>            <td class="xl67" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">B. Pharma</td>            <td class="xl68" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Lecturer</td>        </tr>        <tr height="33" style="height: 24.95pt;">            <td class="xl65" style="height: 24.95pt; padding: 5px; border: 1px solid black; border-collapse: collapse;">7</td>            <td class="xl66" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Km Anjali</td>            <td class="xl67" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">B. Pharma</td>            <td class="xl68" style="padding: 5px; border: 1px solid black; border-collapse: collapse;">Lecturer</td>        </tr>    </tbody></table>', N'', NULL, NULL, NULL, CAST(N'2022-03-28T06:33:33.663' AS DateTime), NULL, N'Faculty')
INSERT [dbo].[MainPage] ([PageId], [PageTitle], [PageDescription], [ImageName], [Deleted], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [PageName]) VALUES (1011, N'Misc', N'<div class="left_content"><div class="single_page"><div class="single_page_content"><ul>    <li><a href="/images/Placement and Carrire Guidance Cell.pdf" target="_blank">Placement and Carrier Guidance Cell</a></li>    <li><a href="/images/Anti Ragging Committee.pdf" target="_blank">Anti Ragging Committee</a></li>    <li><a href="/images/Anti Discrimination Cell.pdf" target="_blank" style="background-color: rgb(239, 240, 243);">Anti Discrimination Cell</a></li>    <li><a href="/images/D.Pharma Syllabus.pdf" target="_blank">D. Pharma Syllabus</a></li></ul></div></div></div>', N'', NULL, CAST(N'2022-03-28T06:45:17.210' AS DateTime), N'Admin', CAST(N'2022-03-28T07:24:09.890' AS DateTime), NULL, N'Misc')
SET IDENTITY_INSERT [dbo].[MainPage] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (1, N'Telerik.Web.UI.DialogHandler.aspx 404 - Editor - UI for ASP.NET', N'<h3 class="r" style="font-size: 18px; margin: 0px; padding: 0px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color: rgb(34, 34, 34); font-family: arial, sans-serif; background-color: rgb(255, 255, 255);"><a href="https://www.telerik.com/forums/telerik-web-ui-dialoghandler-aspx-404" style="color: rgb(102, 0, 153); cursor: pointer;">Telerik.Web.UI.DialogHandler.aspx 404 - Editor - UI for ASP.NET</a></h3>', 1, 1, N'', CAST(N'2017-12-04T17:19:23.600' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (2, N'Test new Title news', N'<h3 class="r" style="font-size: 18px; margin: 0px; padding: 0px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color: rgb(34, 34, 34); font-family: arial, sans-serif; background-color: rgb(255, 255, 255);"><a href="https://www.telerik.com/forums/telerik-web-ui-dialoghandler-aspx-404" style="color: rgb(102, 0, 153); cursor: pointer;">Telerik.Web.UI.DialogHandler.aspx 404 - Editor - UI for ASP.NET</a></h3>', 1, 1, N'', CAST(N'2017-12-04T17:20:08.097' AS DateTime), NULL, CAST(N'2017-12-06T11:41:45.580' AS DateTime), NULL, 0)
INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (3, N'Every 8-Week Fasenra Approved for Severe Eosinophilic Asthma', N'<h3 class="r" style="font-size: 18px; margin: 0px; padding: 0px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color: rgb(34, 34, 34); font-family: arial, sans-serif; background-color: rgb(255, 255, 255);">Eosinophilic asthma patients have limited treatment options and often rely on oral steroids to manage their symptoms, which can lead to serious side effects. This month, the FDA <a href="https://www.drugs.com/newdrugs/fda-approves-fasenra-benralizumab-severe-eosinophilic-asthma-4633.html" style="color: rgb(54, 85, 162); font-weight: 600; font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; white-space: normal; background-color: rgb(255, 255, 255);">approved</a><span style="color: rgb(36, 36, 36); font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; white-space: normal;"> AstraZeneca’s </span><a href="https://www.drugs.com/fasenra.html" style="color: rgb(54, 85, 162); font-weight: 600; font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; white-space: normal; background-color: rgb(255, 255, 255);">Fasenra</a><span style="color: rgb(36, 36, 36); font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; white-space: normal;"> (benralizumab), an interleukin-5 receptor monoclonal antibody used as an add-on maintenance treatment for severe eosinophilic </span><a href="https://www.drugs.com/condition/asthma.html" style="color: rgb(54, 85, 162); font-weight: 600; font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; white-space: normal; background-color: rgb(255, 255, 255);">asthma</a><span style="color: rgb(36, 36, 36); font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; white-space: normal;">. It’s given as a subcutaneous injection once every 4 weeks for the first 3 doses, and then once every 8 weeks thereafter. In </span><a href="https://www.drugs.com/history/fasenra.html" style="color: rgb(54, 85, 162); font-weight: 600; font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; white-space: normal; background-color: rgb(255, 255, 255);">studies</a><span style="color: rgb(36, 36, 36); font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; white-space: normal;">, Fasenra reduced the annual asthma exacerbation rate by up to 51% compared to placebo, and significantly reduced oral steroid use. Adverse events include headache, fever, sore throat and allergic reactions.</span></h3>', 1, 1, N'', CAST(N'2017-12-04T17:20:19.790' AS DateTime), NULL, CAST(N'2017-12-06T12:02:59.107' AS DateTime), NULL, 0)
INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (4, N'Telerik.Web.UI.DialogHandler.aspx 404 - Editor - UI for ASP.NET', N'<h3 class="r" style="font-size: 18px; margin: 0px; padding: 0px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color: rgb(34, 34, 34); font-family: arial, sans-serif; background-color: rgb(255, 255, 255);"><a href="https://www.telerik.com/forums/telerik-web-ui-dialoghandler-aspx-404" style="color: rgb(102, 0, 153); cursor: pointer;">Telerik.Web.UI.DialogHandler.aspx 404 - Editor - UI for ASP.NET</a></h3>', 1, 1, N'', CAST(N'2017-12-04T17:22:39.833' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (5, N'sessional exam', N'<h3 class="r" style="font-size: 18px; margin: 0px; padding: 0px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color: rgb(34, 34, 34); font-family: arial, sans-serif; background-color: rgb(255, 255, 255);"><a href="https://www.telerik.com/forums/telerik-web-ui-dialoghandler-aspx-404" style="color: rgb(102, 0, 153); cursor: pointer;">2</a>nd sessional exam date will allowance soon </h3>', 1, 1, N'', CAST(N'2017-12-06T10:54:17.280' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (6, N'2ND SESSIONAL EXAMINATION DATE SHEET WILL DECLARED SOON', N'', 1, 1, N'', CAST(N'2017-12-06T11:47:13.623' AS DateTime), NULL, CAST(N'2017-12-30T07:54:57.993' AS DateTime), NULL, 1)
INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (7, N'First-In-Class Hemlibra is Cleared for Hemophilia A with Inhibitors', N'<a href="https://www.drugs.com/hemlibra.html" style="color: rgb(54, 85, 162); font-weight: 600; font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; background-color: rgb(255, 255, 255);">Hemlibra</a><span style="color: rgb(36, 36, 36); font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; background-color: rgb(255, 255, 255);"> (emicizumab-kxwh), from Genentech, is a bispecific factor IXa- and factor X-directed antibody now </span><a href="https://www.drugs.com/newdrugs/fda-approves-hemlibra-emicizumab-kxwh-hemophilia-inhibitors-4639.html" style="color: rgb(54, 85, 162); font-weight: 600; font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; background-color: rgb(255, 255, 255);">approved</a><span style="color: rgb(36, 36, 36); font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; background-color: rgb(255, 255, 255);"> to prevent or reduce the frequency of bleeding episodes in adult and pediatric patients with </span><a href="https://www.drugs.com/condition/hemophilia-a-with-inhibitors.html" style="color: rgb(54, 85, 162); font-weight: 600; font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; background-color: rgb(255, 255, 255);">hemophilia A with inhibitors</a><span style="color: rgb(36, 36, 36); font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; background-color: rgb(255, 255, 255);"> who have developed antibodies called Factor VIII (FVIII) inhibitors. Hemophilia A is an inherited blood-clotting disorder that primarily affects males. Hemlibra is a first-in-class subcutaneous injection that works by bridging other factors in the blood to restore blood clotting. In two </span><a href="https://www.drugs.com/history/hemlibra.html" style="color: rgb(54, 85, 162); font-weight: 600; font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; background-color: rgb(255, 255, 255);">clinical studies</a><span style="color: rgb(36, 36, 36); font-family: -apple-system, blinkmacsystemfont, &quot;segoe ui&quot;, &quot;segoe ui symbol&quot;, roboto, helvetica, arial, sans-serif; font-size: 17px; background-color: rgb(255, 255, 255);">, there was an 87 percent reduction in the rate of bleeds that needed treatment. Common side effects include injection site reactions, headache, and joint pain (arthralgia).</span>', 1, 1, N'', CAST(N'2017-12-06T12:03:38.053' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (8, N'2ND Sessional Exam Date Declared ', N'2ND Sessional Exam Date Declared ', 1, 1, N'', CAST(N'2018-01-01T06:54:25.860' AS DateTime), NULL, NULL, NULL, 2)
INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (1008, N'Enquiry open for admission in session 2022-23. ', N'D. Pharma<div><br /></div><div>B. Pharma</div>', 1, NULL, N'', CAST(N'2018-02-28T07:21:25.897' AS DateTime), NULL, CAST(N'2022-03-28T08:10:36.737' AS DateTime), NULL, 0)
INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (1009, N'3rd Sessional Examination will be held in last week of April 2019', N'3rd Sessional Examination will be held in last week of April 2019', 1, 1, N'', CAST(N'2018-04-21T07:55:57.843' AS DateTime), NULL, CAST(N'2019-04-05T11:28:39.053' AS DateTime), NULL, 1)
INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (1010, N'Student List 2021-22', N'<div class="left_content"><div class="single_page"><div class="single_page_content"><ul>    <li><a href="/images/Studentlist2ndyear.pdf" target="_blank">Student List D. Pharma 1st Year 2021-2022</a></li> <li><a href="/images/StudentListFirstYear.pdf" target="_blank">Student List D. Pharma 2nd Year 2021-2022</a></li>    </ul></div></div></div>', 1, 1, N'03-28-2022_081545.pdf', CAST(N'2022-03-28T08:15:45.290' AS DateTime), NULL, CAST(N'2022-03-28T08:22:06.413' AS DateTime), NULL, 2)
INSERT [dbo].[News] ([NewsId], [Heading], [Description], [DisplayOnHome], [Deleted], [ImageName], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (1011, N'Student List 2021-22', N'<div class="left_content"><div class="single_page"><div class="single_page_content"><ul>    <li><a href="/images/StudentListFirstYear.pdf" target="_blank">Student List D. Pharma 1st Year 2021-2022</a></li>    <li><a href="/images/Studentlist2ndyear.pdf" target="_blank">Student List D. Pharma 2nd Year 2021-2022</a></li></ul></div></div></div>', 1, NULL, N'', CAST(N'2022-03-28T08:26:56.423' AS DateTime), NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([notification_id], [notification_message], [notification_url], [public_id], [userId], [created_on], [created_by], [modify_by], [modify_on]) VALUES (15, N'React cheetheet', N'https://res.cloudinary.com/dxqmmofie/image/upload/v1739867352/notifications/qtedsurvqwxntkdzlg9b.pdf', N'notifications/qtedsurvqwxntkdzlg9b', 1, CAST(N'2025-02-18T08:29:12.2850000' AS DateTime2), N'Kishan Kumar', NULL, NULL)
INSERT [dbo].[Notification] ([notification_id], [notification_message], [notification_url], [public_id], [userId], [created_on], [created_by], [modify_by], [modify_on]) VALUES (17, N'Black Box Ai', N'https://www.blackbox.ai/', NULL, 1, CAST(N'2025-02-18T09:59:01.2240000' AS DateTime2), N'Kishan Kumar', NULL, NULL)
INSERT [dbo].[Notification] ([notification_id], [notification_message], [notification_url], [public_id], [userId], [created_on], [created_by], [modify_by], [modify_on]) VALUES (18, N'Result Declare', N'https://jkiop.org/nd-sessional-examination-date-sheet-LatestPost8', NULL, 1, CAST(N'2025-02-26T10:57:30.6130000' AS DateTime2), N'Kishan Kumar', NULL, NULL)
INSERT [dbo].[Notification] ([notification_id], [notification_message], [notification_url], [public_id], [userId], [created_on], [created_by], [modify_by], [modify_on]) VALUES (19, N'Latest Post', N'https://jkiop.org/', NULL, 1, CAST(N'2025-02-26T11:33:51.4400000' AS DateTime2), N'Kishan Kumar', N'Kishan Kumar', CAST(N'2025-05-14T14:25:24.0400000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Page] ON 

INSERT [dbo].[Page] ([pageId], [pageName], [pageUrl], [created_by], [created_on], [modify_by], [modify_on]) VALUES (1, N'Add notifications', N'/addnotifications', N'Kishan Kumar', CAST(N'2025-03-11T12:40:10.8020000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-03-22T10:49:59.0650000' AS DateTime2))
INSERT [dbo].[Page] ([pageId], [pageName], [pageUrl], [created_by], [created_on], [modify_by], [modify_on]) VALUES (3, N'Banner', N'/addbanner', N'Kishan Kumar', CAST(N'2025-03-12T08:25:35.7610000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-08T13:52:05.2566667' AS DateTime2))
INSERT [dbo].[Page] ([pageId], [pageName], [pageUrl], [created_by], [created_on], [modify_by], [modify_on]) VALUES (4, N'update Gallery image', N'/addpicingallery', N'Kishan Kumar', CAST(N'2025-03-17T09:33:36.0100000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Page] ([pageId], [pageName], [pageUrl], [created_by], [created_on], [modify_by], [modify_on]) VALUES (5, N'update Logo Image', N'/addimportentlinks', N'Kishan Kumar', CAST(N'2025-03-17T10:42:04.7140000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Page] ([pageId], [pageName], [pageUrl], [created_by], [created_on], [modify_by], [modify_on]) VALUES (6, N'Addfaculity', N'/addfaculity', N'Kishan Kumar', CAST(N'2025-03-17T10:52:39.1140000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Page] ([pageId], [pageName], [pageUrl], [created_by], [created_on], [modify_by], [modify_on]) VALUES (7, N'Add Latest Post', N'/latestpost', N'Kishan Kumar', CAST(N'2025-03-17T11:00:08.7690000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Page] ([pageId], [pageName], [pageUrl], [created_by], [created_on], [modify_by], [modify_on]) VALUES (8, N'Create Page', N'/page-management', N'Kishan Kumar', CAST(N'2025-03-17T11:12:54.3420000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Page] ([pageId], [pageName], [pageUrl], [created_by], [created_on], [modify_by], [modify_on]) VALUES (9, N'Assign page to role', N'/assign-page-to-role', N'Kishan Kumar', CAST(N'2025-03-17T11:19:57.3180000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Page] ([pageId], [pageName], [pageUrl], [created_by], [created_on], [modify_by], [modify_on]) VALUES (10, N'Adduser', N'/adduser', N'Kishan Kumar', CAST(N'2025-03-17T11:47:22.1890000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-08T13:56:48.7366667' AS DateTime2))
INSERT [dbo].[Page] ([pageId], [pageName], [pageUrl], [created_by], [created_on], [modify_by], [modify_on]) VALUES (11, N'Student List', N'/student', N'Kishan Kumar', CAST(N'2025-05-08T13:54:07.3866667' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Page] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentHandover] ON 

INSERT [dbo].[PaymentHandover] ([id], [paymentId], [studentId], [amount], [receivedBy], [handedOverTo], [handoverDate], [remarks], [verified], [verifiedBy], [verifiedOn], [createdOn], [modifiedOn], [createdBy], [modifiedBy]) VALUES (15, 43, 55, 1000, N'Kishan Kumar', N'Kausar Raza', CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), N'fees', 1, N'Kausar Raza', CAST(N'2025-05-03T07:41:12.4590000' AS DateTime2), CAST(N'2025-05-03T07:41:12.4590000' AS DateTime2), NULL, N'Kausar Raza', NULL)
INSERT [dbo].[PaymentHandover] ([id], [paymentId], [studentId], [amount], [receivedBy], [handedOverTo], [handoverDate], [remarks], [verified], [verifiedBy], [verifiedOn], [createdOn], [modifiedOn], [createdBy], [modifiedBy]) VALUES (16, 47, 56, 500, N'Kishan Kumar', N'Kausar Raza', CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), N'FEES', 1, N'Kausar Raza', CAST(N'2025-05-03T09:59:42.9260000' AS DateTime2), CAST(N'2025-05-03T09:59:42.9260000' AS DateTime2), NULL, N'Kausar Raza', NULL)
INSERT [dbo].[PaymentHandover] ([id], [paymentId], [studentId], [amount], [receivedBy], [handedOverTo], [handoverDate], [remarks], [verified], [verifiedBy], [verifiedOn], [createdOn], [modifiedOn], [createdBy], [modifiedBy]) VALUES (17, 48, 55, 500, N'Kausar Raza', N'Kishan Kumar', CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), N'FEE', 1, N'Kishan Kumar', CAST(N'2025-05-03T10:04:07.8990000' AS DateTime2), CAST(N'2025-05-03T10:04:07.8990000' AS DateTime2), NULL, N'Kishan Kumar', NULL)
INSERT [dbo].[PaymentHandover] ([id], [paymentId], [studentId], [amount], [receivedBy], [handedOverTo], [handoverDate], [remarks], [verified], [verifiedBy], [verifiedOn], [createdOn], [modifiedOn], [createdBy], [modifiedBy]) VALUES (18, 42, 56, 1000, N'Kausar Raza', N'Kishan Kumar', CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), N'FEE', 1, N'Kishan Kumar', CAST(N'2025-05-03T10:05:15.8580000' AS DateTime2), CAST(N'2025-05-03T10:05:15.8580000' AS DateTime2), NULL, N'Kishan Kumar', NULL)
INSERT [dbo].[PaymentHandover] ([id], [paymentId], [studentId], [amount], [receivedBy], [handedOverTo], [handoverDate], [remarks], [verified], [verifiedBy], [verifiedOn], [createdOn], [modifiedOn], [createdBy], [modifiedBy]) VALUES (19, 42, 56, 1000, N'Kausar Raza', N'Kishan Kumar', CAST(N'2025-05-08T00:00:00.0000000' AS DateTime2), N'fee', 1, N'Kishan Kumar', CAST(N'2025-05-08T10:50:36.7966667' AS DateTime2), CAST(N'2025-05-08T10:50:36.7966667' AS DateTime2), NULL, N'Kishan Kumar', NULL)
INSERT [dbo].[PaymentHandover] ([id], [paymentId], [studentId], [amount], [receivedBy], [handedOverTo], [handoverDate], [remarks], [verified], [verifiedBy], [verifiedOn], [createdOn], [modifiedOn], [createdBy], [modifiedBy]) VALUES (20, 48, 55, 100, N'Kausar Raza', N'Kishan Kumar', CAST(N'2025-05-09T00:00:00.0000000' AS DateTime2), N'fees', 1, N'Kishan Kumar', CAST(N'2025-05-09T06:01:52.7533333' AS DateTime2), CAST(N'2025-05-09T06:01:52.7533333' AS DateTime2), NULL, N'Kishan Kumar', NULL)
INSERT [dbo].[PaymentHandover] ([id], [paymentId], [studentId], [amount], [receivedBy], [handedOverTo], [handoverDate], [remarks], [verified], [verifiedBy], [verifiedOn], [createdOn], [modifiedOn], [createdBy], [modifiedBy]) VALUES (21, 42, 56, 2000, N'Kausar Raza', N'Kishan Kumar', CAST(N'2025-05-15T00:00:00.0000000' AS DateTime2), N'fees amount', 1, N'Kishan Kumar', CAST(N'2025-05-15T10:52:08.0133333' AS DateTime2), CAST(N'2025-05-15T10:52:08.0133333' AS DateTime2), NULL, N'Kishan Kumar', NULL)
SET IDENTITY_INSERT [dbo].[PaymentHandover] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([permissionId], [roleId], [pageId], [canCreate], [canRead], [canUpdate], [canDelete], [created_by], [created_on], [modify_by], [modify_on]) VALUES (1, 1, 1, 1, 1, 1, 1, N'Kishan Kumar', CAST(N'2025-03-12T09:54:57.2550000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T07:38:15.8533333' AS DateTime2))
INSERT [dbo].[Permission] ([permissionId], [roleId], [pageId], [canCreate], [canRead], [canUpdate], [canDelete], [created_by], [created_on], [modify_by], [modify_on]) VALUES (2, 1, 3, 1, 1, 1, 1, N'Kishan Kumar', CAST(N'2025-03-12T10:08:14.8420000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T07:38:15.8733333' AS DateTime2))
INSERT [dbo].[Permission] ([permissionId], [roleId], [pageId], [canCreate], [canRead], [canUpdate], [canDelete], [created_by], [created_on], [modify_by], [modify_on]) VALUES (3, 2, 1, 1, 1, 1, 1, N'ss', CAST(N'2025-03-17T07:15:45.1790000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T07:38:15.9266667' AS DateTime2))
INSERT [dbo].[Permission] ([permissionId], [roleId], [pageId], [canCreate], [canRead], [canUpdate], [canDelete], [created_by], [created_on], [modify_by], [modify_on]) VALUES (4, 1, 4, 1, 1, 1, 1, N'Kishan Kumar', CAST(N'2025-03-17T09:34:09.2610000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T07:38:15.8800000' AS DateTime2))
INSERT [dbo].[Permission] ([permissionId], [roleId], [pageId], [canCreate], [canRead], [canUpdate], [canDelete], [created_by], [created_on], [modify_by], [modify_on]) VALUES (5, 1, 5, 1, 1, 1, 1, N'Kishan Kumar', CAST(N'2025-03-17T10:43:46.7370000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T07:38:15.8866667' AS DateTime2))
INSERT [dbo].[Permission] ([permissionId], [roleId], [pageId], [canCreate], [canRead], [canUpdate], [canDelete], [created_by], [created_on], [modify_by], [modify_on]) VALUES (6, 1, 6, 1, 1, 1, 1, N'Kishan Kumar', CAST(N'2025-03-17T10:53:15.0670000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T07:38:15.8933333' AS DateTime2))
INSERT [dbo].[Permission] ([permissionId], [roleId], [pageId], [canCreate], [canRead], [canUpdate], [canDelete], [created_by], [created_on], [modify_by], [modify_on]) VALUES (7, 1, 7, 1, 1, 1, 1, N'Kishan Kumar', CAST(N'2025-03-17T11:01:39.8740000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T07:38:15.9000000' AS DateTime2))
INSERT [dbo].[Permission] ([permissionId], [roleId], [pageId], [canCreate], [canRead], [canUpdate], [canDelete], [created_by], [created_on], [modify_by], [modify_on]) VALUES (8, 1, 8, 1, 1, 1, 1, N'Kishan Kumar', CAST(N'2025-03-17T11:15:28.4620000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T07:38:15.9066667' AS DateTime2))
INSERT [dbo].[Permission] ([permissionId], [roleId], [pageId], [canCreate], [canRead], [canUpdate], [canDelete], [created_by], [created_on], [modify_by], [modify_on]) VALUES (9, 1, 9, 1, 1, 1, 1, N'Kishan Kumar', CAST(N'2025-03-17T11:28:49.7780000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T07:38:15.9133333' AS DateTime2))
INSERT [dbo].[Permission] ([permissionId], [roleId], [pageId], [canCreate], [canRead], [canUpdate], [canDelete], [created_by], [created_on], [modify_by], [modify_on]) VALUES (10, 1, 10, 1, 1, 1, 0, N'Kishan Kumar', CAST(N'2025-03-18T07:01:16.8100000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T07:38:15.9200000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [ImageName], [Heading], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (8, N'01-01-2018_070404.jpg', N'2nd Sessional examination Date Sheet', N'2nd Sessional examination Date Sheet<div><br /></div><div>20/12/2017 -  22/12/2017 </div>', CAST(N'2018-01-01T07:04:04.157' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Post] ([Id], [ImageName], [Heading], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (1008, N'', N'Enquiry open for admission in session 2022-23 ', N'D. Pharma<div><br /></div><div>B. Pharma</div>', CAST(N'2018-02-28T07:17:35.320' AS DateTime), NULL, CAST(N'2022-03-28T08:07:03.387' AS DateTime), NULL, 1)
INSERT [dbo].[Post] ([Id], [ImageName], [Heading], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (1009, N'', N'Date sheet for board examination', N'<span style="color: rgb(255, 0, 0);"><strong>Date sheet for board examination is available on BTE Website</strong></span>', CAST(N'2018-03-31T08:34:28.933' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Post] ([Id], [ImageName], [Heading], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (1010, N'', N'SPORTS ', N'<span style="color: rgb(0, 153, 0);">SPORTS WILL BE CONDUCTED ON 31/03/2018</span><div><strong><br /></strong></div><div><br /></div>', CAST(N'2018-03-31T08:37:43.103' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Post] ([Id], [ImageName], [Heading], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [DisplayOrder]) VALUES (1013, N'', N'Student List 2021-22', N'<div class="left_content"><div class="single_page"><div class="single_page_content"><ul>    <li><a href="/images/StudentListFirstYear.pdf" target="_blank">Student List D. Pharma 1st Year 2021-2022</a></li>    <li><a href="/images/Studentlist2ndyear.pdf" target="_blank">Student List D. Pharma 2nd Year 2021-2022</a></li></ul></div></div></div>', CAST(N'2022-03-28T08:23:31.137' AS DateTime), NULL, CAST(N'2022-03-28T08:25:30.567' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (1, N'Utility Bill', N'sdfsd', N'sdadsad', N'asdasd', N'asdasd', N'General', N'H 228', N'Khadda Colony,Jaitpur', N'Male', N'ISLAM@DIRECT-PHARMACY.CO.UK', CAST(N'1996-01-18' AS Date), N'9891387595', N'9891387595', N'D.Pharma', N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-06-15T10:09:51.000' AS DateTime), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (2, N'Utility Bill', N'sdfsd', N'sdadsad', N'asdasd', N'asdasd', N'OBC', N'H 228', N'Khadda Colony,Jaitpur', N'Male', N'ISLAM@DIRECT-PHARMACY.CO.UK', CAST(N'2003-10-17' AS Date), N'9891387595', N'7966138443', N'D.Pharma', N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-06-16T10:41:42.000' AS DateTime), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'c2696ab6-7510-4a60-a2d2-e6cd482a70cbPRFPRN2522KSR-123988.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (3, N'Rishav kumar', N'Satish kumar', N'Nisha devi', N'Hindu', N'Singh', N'OBC', N'Tehsil anoopshahr, Distt Bulandshahr UP', N'Same', N'Male', N'manoj_cai@yahoo.co.in', CAST(N'2003-05-16' AS Date), N'9389484228', N'9389484228', N'D.Pharma', N'Up board allahabad', 2018, CAST(63.66 AS Decimal(18, 2)), CAST(54.50 AS Decimal(18, 2)), CAST(N'2020-07-05T14:09:57.000' AS DateTime), NULL, N'Up board allahabad', 2020, CAST(57.20 AS Decimal(18, 2)), CAST(56.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'3914d92f-0900-41e5-842c-0b7c5fc23161C0DBDDDD-0667-49E8-A841-0A3BB6452306.jpeg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (4, N'TEJASWI BHARDWAJ', N'SUMIT NARAYAN SHARMA', N'MADHVI SHARMA', N'HINDU', N'BRAHMIN', N'General', N'H NO.55 CHAMAN VIHAR KHURJA BULANDSHAHR UP 203131', N'H NO.55 CHAMAN VIHAR KHURJA BULANDSHAHR UP 203131', N'Female', N'narayansumit5@gmail.com', CAST(N'2003-02-16' AS Date), N'9927700466', N'9927700466', N'D.Pharma', N'CBSE BOARD', 2018, CAST(59.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-07-17T09:05:29.000' AS DateTime), NULL, N'CBSE BOARD', 2020, CAST(61.00 AS Decimal(18, 2)), CAST(52.66 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'990d6949-6718-4f9d-98b6-c3cbf63eb300index.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (5, N'Lokendra gaur', N'Jai Kumar', N'Hirdesh Sharma', N'Hindu', N'Brahman', N'General', N'356 Devi Mandir Wali Gali Satha Bulandshahr UP', N'356 Devi Mandir Wali Gali Satha Bulandshahr UP', N'Male', N'No', CAST(N'2002-07-06' AS Date), N'8006302020', N'7060123231', N'D.Pharma', N'CBSE Board', 2018, CAST(80.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), CAST(N'2020-07-26T18:42:34.000' AS DateTime), NULL, N'CBSE Board', 2020, CAST(71.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'a169d58c-3b51-433f-af56-dac28f4e454aCamScanner 06-29-2020 18.46.43_1.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (6, N'mohammad kawish', N'sohrab khan', N'noor e aain', N'islam', N'rajpoot genral', N'General', N'distic badaun village kakrala ward no 6', N'dist badaun village kakrala', N'Male', N'mohdkawish4u@gmail.com', CAST(N'1998-08-10' AS Date), N'7037388367', N'9410428933', N'D.Pharma', N'board of high school and intermediate education uttar pradesh', 2013, CAST(78.16 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-09-05T08:55:43.000' AS DateTime), NULL, N'board of high school and intermediate education uttar pradesh', 2019, CAST(64.16 AS Decimal(18, 2)), CAST(62.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'61708abf-22ff-4f3f-a954-7be804baeb296481e840-9a9f-49cb-8966-4013ca.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (7, N'GAURAV KUMAR', N'UDHAL SINGH', N'GAYATRI DEVI', N'HINDU', N'JATAV', N'SC', N'VILL FAIZPURA MAU POST SURAJPUR MAKHENA ANUPSHAHR DIST BULANDSHAHR 202390', N'VILL FAIZPURA MAU POST SURAJPUR MAKHENA ANUPSHAHR DIST BULANDSHAHR 202390', N'Male', N'gauravkumarsimple@gmail.com', CAST(N'2000-07-02' AS Date), N'9568173785', N'9758885277', N'D.Pharma', N'UP BOARD', 2015, CAST(57.83 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-10-03T11:45:52.000' AS DateTime), NULL, N'UP BOARD', 2017, CAST(58.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'b2068885-d7db-49dd-bbb5-dbb4be3ce6fephoto.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (8, N'GAURAV KUMAR', N'UDHAL SINGH', N'GAYATRI DEVI', N'HINDU', N'JATAV', N'SC', N'VILL FAIZPURA MAU POST SURAJPUR MAKHENA ANUPSHAHR DIST BULANDSHAHR 202390', N'VILL FAIZPURA MAU POST SURAJPUR MAKHENA ANUPSHAHR DIST BULANDSHAHR 202390', N'Male', N'gauravkumarsimple@gmail.com', CAST(N'2000-07-02' AS Date), N'9568173785', N'9758885277', N'D.Pharma', N'UP BOARD', 2015, CAST(57.83 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-10-03T11:49:40.000' AS DateTime), NULL, N'UP BOARD', 2017, CAST(58.00 AS Decimal(18, 2)), CAST(56.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'21af2d0a-97ac-4968-9323-211647238519photo.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (9, N'GAURAV KUMAR', N'UDHAL SINGH', N'GAYATRI DEVI', N'HINDU', N'JATAV', N'SC', N'VILL FAIZPURA MAU POST SURAJPUR MAKHENA ANUPSHAHR DIST BULANDSHAHR 202390', N'VILL FAIZPURA MAU POST SURAJPUR MAKHENA ANUPSHAHR DIST BULANDSHAHR 202390', N'Male', N'gauravkumarsimple@gmail.com', CAST(N'2000-07-02' AS Date), N'9568173785', N'9758885277', N'D.Pharma', N'UP BOARD', 2015, CAST(57.83 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-10-03T11:50:06.000' AS DateTime), NULL, N'UP BOARD', 2017, CAST(58.00 AS Decimal(18, 2)), CAST(56.00 AS Decimal(18, 2)), NULL, N'NA', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'8885bea1-6348-4d88-b618-fe2b03022ad0photo.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (10, N'GAURAV KUMAR', N'UDHAL SINGH', N'GAYATRI DEVI', N'HINDU', N'JATAV', N'SC', N'VILL FAIZPURA MAU POST SURAJPUR MAKHENA ANUPSHAHR DIST BULANDSHAHR 202390', N'VILL FAIZPURA MAU POST SURAJPUR MAKHENA ANUPSHAHR DIST BULANDSHAHR 202390', N'Male', N'gauravkumarsimple@gmail.com', CAST(N'2000-07-02' AS Date), N'9568173785', N'9758885277', N'D.Pharma', N'UP BOARD', 2015, CAST(57.83 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-10-03T11:51:04.000' AS DateTime), NULL, N'UP BOARD', 2017, CAST(58.00 AS Decimal(18, 2)), CAST(56.00 AS Decimal(18, 2)), NULL, N'NA', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'f0e8c797-8259-413d-b40a-9a4898bc2ce4photo.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (11, N'Reshma Khatoon', N'Gyasuddin Ansari', N'Naimul Nisha', N'Mushlim', N'Mushlim', N'OBC', N'Chirgoda Khash padrauna kushinagar uttar pardesh', N'Chirgoda Khash padrauna kushinagar uttar pardesh', N'Female', N'chanfld1244alam@gmail.com', CAST(N'2004-09-15' AS Date), N'6391749845', N'9648139333', N'D.Pharma', N'up board', 2018, CAST(82.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2021-01-13T14:55:00.000' AS DateTime), NULL, N'up board', 2020, CAST(74.80 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'e1038c90-b660-4cbb-9592-174b0b39e19cWhatsApp Image 2021-01-13 at 9.48.00 AM (1).jpeg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (12, N'test kumar', N'testa kumar', N'testb kumar', N'muslim', N'muslim', N'General', N'fjukukf,je fkksr 445', N'dvgdsvggbvd', N'Male', N'test@gmail.com', CAST(N'1992-01-06' AS Date), N'7855865658', N'5423168552', N'D.Pharma', N'cbse', 2013, CAST(96.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), CAST(N'2021-05-27T19:11:33.000' AS DateTime), NULL, N'cbse', 2015, CAST(92.00 AS Decimal(18, 2)), CAST(92.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'8abd9a13-09b1-428c-8d1c-64de64d46e4cpayload-x86.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (14, N'RAYIZ AHMED', N'JUMA', N'ZATOON', N'Muslim', N'Bakerwal', N'ST', N'Jij chakalsalta reasi', N'Jij chakalsalta reasi', N'Male', N'drrayizahmedkhan@gmail.com', CAST(N'1995-04-20' AS Date), N'9858012767', N'9858594914', N'D.Pharma', N'Jkboard', 2011, CAST(56.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2021-06-05T07:43:44.000' AS DateTime), NULL, N'Jkboard', 2013, CAST(59.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'Jk exam controllr', 2016, CAST(70.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'cba4421f-3d63-4f46-aeaa-7fbf7b0626b5rps20200415_194818_copy_151x283.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (15, N'RAYIZ AHMED', N'JUMA', N'ZATOON', N'Muslim', N'Bakerwal', N'ST', N'Jij chakalsalta reasi', N'Jij chakalsalta reasi', N'Male', N'drrayizahmedkhan@gmail.com', CAST(N'1995-04-20' AS Date), N'9858012767', N'9858594914', N'D.Pharma', N'Jkboard', 2011, CAST(56.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2021-06-05T07:44:29.000' AS DateTime), NULL, N'Jkboard', 2013, CAST(59.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'Jk exam controllr', 2016, CAST(70.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'c1cf78a5-b171-4a3d-9877-9611aa8da548rps20200415_194818_copy_151x283.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (18, N'HEMANT CHAUHAN', N'MUKESH CHAUHAN', N'RAJESH DEVI', N'HINDU', N'RAJPUT', N'General', N'MURARI NAGAR SIDDHARTH PUBLIC SCHOOL SHIKARPUR ROAD KHURJA', N'MURARI NAGAR SIDDHARTH PUBLIC SCHOOL SHIKARPUR ROAD KHURJA', N'Male', N'Hemantchauhan805@gmail.com', CAST(N'1997-02-10' AS Date), N'9045502473', N'9045502473', N'D.Pharma', N'CBSE', 2011, CAST(60.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2021-07-13T16:56:50.000' AS DateTime), NULL, N'CBSE', 2014, CAST(59.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'a9a74e9b-3aee-43f1-a155-738bc5602b7f060.JPG')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (19, N'HEMANT CHAUHAN', N'MUKESH CHAUHAN', N'RAJESH DEVI', N'HINDU', N'RAJPUT', N'General', N'MURARI NAGAR SIDDHARTH PUBLIC SCHOOL SHIKARPUR ROAD KHURJA', N'MURARI NAGAR SIDDHARTH PUBLIC SCHOOL SHIKARPUR ROAD KHURJA', N'Male', N'Hemantchauhan805@gmail.com', CAST(N'1997-02-10' AS Date), N'9045502473', N'9045502473', N'D.Pharma', N'CBSE', 2011, CAST(60.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2021-07-13T16:57:19.000' AS DateTime), NULL, N'CBSE', 2014, CAST(59.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'caaa397a-a269-4ce2-9d48-16826d869206hemant.jpeg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (20, N'Saurabh Saini', N'Rajesh Saini', N'Anita Saini', N'Hindu', N'Saini', N'OBC', N'Vill-Surajpurteekri   Post-Aurngabad   Dist-Bulandshahr', N'', N'Male', N'kashavsaini2019@gmail.com', CAST(N'2003-09-14' AS Date), N'9027346984', N'8006401455', N'D.Pharma', N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2021-08-09T12:39:58.000' AS DateTime), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'cad0ad5e-af5f-4e3f-b343-74c5a6754f33IMG_20210306_100237_compress95.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (21, N'Nida saifi', N'Mubarak saifi', N'salma saifi', N'muslim', N'carpanter', N'OBC', N'khurja mhunda khera', N'khurja gandhi road', N'Female', N'rihanxaifi989@gmail.com', CAST(N'2001-09-22' AS Date), N'9997861516', N'9193838286', N'D.Pharma', N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2021-08-25T08:44:38.000' AS DateTime), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'cd11b525-e7bf-4014-8761-c0ef78beb095IMG_20210807_094038.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (30, N'test', N'test', N'test', N'test', N'test', N'General', N'Noida', N'Noida', N'Male', N'test@gmail.com', CAST(N'2001-03-11' AS Date), N'1234123412', N'1231231234', N'D.Pharma', N'CBSE', 2018, CAST(90.00 AS Decimal(18, 2)), CAST(93.00 AS Decimal(18, 2)), CAST(N'2022-05-19T05:50:52.000' AS DateTime), NULL, N'CBSE', 2020, CAST(92.00 AS Decimal(18, 2)), CAST(95.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'4a17ad6c-f693-48e5-8dc9-c588cb85037dFB_IMG_1487220783372.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (31, N'Shikha azad', N'Mr.Veer Singh Azad', N'Mrs.sukhviri devi', N'Hindu', N'Jatav', N'SC', N'Rampur colony urf mirzapur', N'', N'Female', N'Shikhaazad@gmail.com', CAST(N'2004-01-23' AS Date), N'8630562238', N'9675558880', N'D.Pharma', N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-07-29T09:55:11.000' AS DateTime), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'a5c0798a-5600-4934-ae66-9ebff75e59501659084321571-1629462016.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (32, N'Prashant', N'Pramod', N'Reeta Devi', N'Hindu', N'Mishra', N'General', N'Pramod  Road NH-91, Village Agwal Near Railway Crossing, khurja Distt. Bulandshahr, (U.P.) , 203131', N'Pramod  Road NH-91, Village Agwal Near Railway Crossing, khurja Distt. Bulandshahr, (U.P.) , 203131', N'Male', N'prashant220@gmail.com', CAST(N'1990-07-01' AS Date), N'8545603210', N'8545603210', N'D.Pharma', N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-11-19T09:19:39.000' AS DateTime), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'626731b0-74e7-4b8f-b52d-64e1d526d34bquality-banner1.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (33, N'Anmol Janmeda', N'Vinod Kumar', N'Reena Devi', N'Hindu', N'Jaat', N'OBC', N'Jewar', N'Jewar', N'Female', N'anmoljanmeda847@gmail.com', CAST(N'2006-09-15' AS Date), N'8533073433', N'7006985258', N'D.Pharma', N'CBSE', 2020, CAST(71.60 AS Decimal(18, 2)), CAST(71.60 AS Decimal(18, 2)), CAST(N'2023-05-01T07:59:43.000' AS DateTime), NULL, N'CBSE', 2022, CAST(73.20 AS Decimal(18, 2)), CAST(73.20 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'5e84c432-bb4a-43ab-adeb-072c5011da54IMG-20230109-WA0000.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (34, N'Shareem khan', N'Abdul Rasheed', N'Muveena khatoon', N'Muslim', N'Qureshi', N'OBC', N'Sarai murtja khan tarinan khurja', N'Sarai murtja khan tarinan khurja', N'Male', N'Shareem khan', CAST(N'2003-08-11' AS Date), N'8191908813', N'8191908813', N'D.Pharma', N'CBSE', 2021, CAST(67.00 AS Decimal(18, 2)), CAST(67.00 AS Decimal(18, 2)), CAST(N'2023-06-16T16:06:49.000' AS DateTime), NULL, N'CBSE', 2023, CAST(68.00 AS Decimal(18, 2)), CAST(68.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'e0fe493e-e93c-43ba-a3af-c906f64bbb24Snapchat-462333901_1.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (35, N'Anubhav Kumar', N'Mr.vinod kumar', N'Seema Devi', N'Hindu', N'Gurjar', N'OBC', N'Village:-kishanpur ;
Post:-shivali ;
Distt:-Bulandshahr', N'Colony:-New Raj nagar 
Bulandshar', N'Male', N'anubhavkapasiyaji@gmail.com', CAST(N'2006-05-20' AS Date), N'7409304978', N'9410233820', N'D.Pharma', N'Icse', 2021, CAST(84.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2023-07-04T14:38:24.000' AS DateTime), NULL, N'Isc', 2023, CAST(73.00 AS Decimal(18, 2)), CAST(65.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'b6c19ad1-6944-4145-ba72-657236d7305916884776323862281950411623786917.jpg')
INSERT [dbo].[Registration] ([RId], [Name], [Fathername], [Mothername], [Religion], [Caste], [Category], [PermanentAddress], [CorrespondingAddress], [Sex], [EmailId], [DOB], [MobileNo], [FatherMobileNo], [Course], [ClassX_Board], [ClassX_PassingYear], [ClassX_Overallpercentage], [ClassX_PCMPCBPercentage], [CreatedOn], [ModifiedOn], [ClassXII_Board], [ClassXII_PassingYear], [ClassXII_Overallpercentage], [ClassXII_PCMPCBPercentage], [Deleted], [DPharma_Board], [DPharma_PassingYear], [DPharma_Overallpercentage], [DPharma_PCMPCBPercentage], [ImageName]) VALUES (36, N'Aashish Chaudhary', N'Raj kumar', N'Umesh', N'Hindu', N'Jaat', N'General', N'New delhi - 110037
Kapashera 
Gali number-3', N'New delhi - 110037
Kapashera 
Gali number-3', N'Male', N'ashishchaudhary2800@gmail.com', CAST(N'2002-11-16' AS Date), N'8882640507', N'8383855210', N'D.Pharma', N'CBSE', 2018, CAST(49.00 AS Decimal(18, 2)), CAST(46.00 AS Decimal(18, 2)), CAST(N'2024-12-25T18:40:57.000' AS DateTime), NULL, N'CBSE', 2020, CAST(51.00 AS Decimal(18, 2)), CAST(42.00 AS Decimal(18, 2)), NULL, N'', 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'4018187b-de65-4c51-ae09-348a0579188e17351520661122778692997612510776.jpg')
SET IDENTITY_INSERT [dbo].[Registration] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([role_id], [name]) VALUES (2, N'Administrator')
INSERT [dbo].[Role] ([role_id], [name]) VALUES (3, N'Registered')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[ScreenMaster] ON 

INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'AppCreation', N'App Management', N'this is decription', NULL, NULL, NULL, NULL, N'islam7730@gmail.com', CAST(N'2016-09-24T08:01:12.790' AS DateTime))
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'AppDetails', N'App Details Management', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (5, N'RoleManagement', N'RoleManagement', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (7, N'RoleScreenMapping', N'Mapping With Role and Screen', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (9, N'DoctorManagement', N'DoctorManagement', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (11, N'PatientManagement', N'PatientManagement', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (13, N'LicenseManagement', N'LicenseManagement', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (15, N'LicenseIssuemgmt', N'License Issue mgmt', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (17, N'Usermanagement', N'Active User', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (18, N'ProcedureDoctor', N'ProcedureDoctor', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (19, N'Speciality', N'Speciality', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (20, N'AppDatatHierarchy', N'Procedure Hierarchy', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (21, N'LicenseCreate', N'License Create', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (22, N'LicenseRequest', N'License Request', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ScreenMaster] ([ScreenId], [ScreenName], [DisplayName], [Description], [ScreenURL], [Deleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (23, N'Pregnancy', N'Pregnancy', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ScreenMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([id], [stdCollId], [fName], [lName], [rollNumber], [gender], [fatherName], [motherName], [mobileNumber], [fatherMobile], [alternateNumber], [dob], [email], [address], [state], [pincode], [city], [admissionMode], [collegeId], [courseId], [admissionDate], [studentImage], [category], [isDiscontinue], [isLateral], [discontinueOn], [discontinueBy], [createdBy], [createdOn], [modifiedBy], [modifiedOn], [status]) VALUES (50, N'DPH/JKIOP/2526/50', N'Kishan', N'Kumar', N'1', N'male', N'Ram Prasad', N'ram kali', N'6387478842', N'9838846711', N'9506656049', CAST(N'2001-08-23T00:00:00.0000000' AS DateTime2), N'kishankumar73001@gmail.com', N'noida electronic city', N'uttar Pradesh', N'229307', N'lucknow', N'direct', 1, 2, CAST(N'2025-04-29T00:00:00.0000000' AS DateTime2), N'https://travelbookplus.com/studentimage/638300458101195775Image_Photo.jpg', N'SC', 0, 0, NULL, NULL, N'Kishan Kumar', CAST(N'2025-04-29T09:22:43.4480000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-16T17:07:36.0533333' AS DateTime2), 1)
INSERT [dbo].[Student] ([id], [stdCollId], [fName], [lName], [rollNumber], [gender], [fatherName], [motherName], [mobileNumber], [fatherMobile], [alternateNumber], [dob], [email], [address], [state], [pincode], [city], [admissionMode], [collegeId], [courseId], [admissionDate], [studentImage], [category], [isDiscontinue], [isLateral], [discontinueOn], [discontinueBy], [createdBy], [createdOn], [modifiedBy], [modifiedOn], [status]) VALUES (55, N'BPH/JKIOPM/2526/55', N'Rahul', N'Viswakarma', N'2', N'male', N'Ram Prasad', N'ram kali', N'6387478842', N'9838846711', N'9506656049', CAST(N'2001-02-03T00:00:00.0000000' AS DateTime2), N'r73001@gmail.com', N'noida electronic city', N'uttar Pradesh', N'229307', N'lucknow', N'entrance', 2, 1, CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), N'https://travelbookplus.com/studentimage/638300458101195775Image_Photo.jpg', N'OBC', 0, 0, NULL, NULL, N'Kishan Kumar', CAST(N'2025-04-30T05:54:44.5840000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-16T16:51:58.8266667' AS DateTime2), 1)
INSERT [dbo].[Student] ([id], [stdCollId], [fName], [lName], [rollNumber], [gender], [fatherName], [motherName], [mobileNumber], [fatherMobile], [alternateNumber], [dob], [email], [address], [state], [pincode], [city], [admissionMode], [collegeId], [courseId], [admissionDate], [studentImage], [category], [isDiscontinue], [isLateral], [discontinueOn], [discontinueBy], [createdBy], [createdOn], [modifiedBy], [modifiedOn], [status]) VALUES (56, N'BPH/JKIOP/2526/56', N'Rahul', N'Kumar', N'3', N'male', N'Ram Prasad', N'ram kali', N'8391800448', N'9838846711', N'9506656049', CAST(N'2001-03-23T00:00:00.0000000' AS DateTime2), N'shivam3@gmail.com', N'Burlington Chauraha , Lucknow', N'uttar Pradesh', N'12', N'lucknow', N'entrance', 1, 1, CAST(N'2025-04-30T00:00:00.0000000' AS DateTime2), N'http://res.cloudinary.com/dxqmmofie/image/upload/v1747312702/student_documents/StudentImage/xvek8fj0xj796qqc2ge9.jpg', N'SC', 0, 1, NULL, NULL, N'Kishan Kumar', CAST(N'2025-04-30T06:33:22.2630000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-15T12:38:05.1866667' AS DateTime2), 1)
INSERT [dbo].[Student] ([id], [stdCollId], [fName], [lName], [rollNumber], [gender], [fatherName], [motherName], [mobileNumber], [fatherMobile], [alternateNumber], [dob], [email], [address], [state], [pincode], [city], [admissionMode], [collegeId], [courseId], [admissionDate], [studentImage], [category], [isDiscontinue], [isLateral], [discontinueOn], [discontinueBy], [createdBy], [createdOn], [modifiedBy], [modifiedOn], [status]) VALUES (62, N'DPH/JKIOP/2526/62', N'Rajan', N'Kumar', N'5', N'female', N'Ram Prasad', N'ram kali', N'6387478842', N'9838846711', N'9506656049', CAST(N'2001-01-23T00:00:00.0000000' AS DateTime2), N'mukedsh@gmail.com', N'noida electronic city', N'uu', N'12', N'lucknow', N'entrance', 1, 2, CAST(N'2025-05-01T00:00:00.0000000' AS DateTime2), NULL, N'SC', 0, 1, CAST(N'2025-05-09T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'Kishan Kumar', CAST(N'2025-05-01T12:18:11.9260000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-13T11:05:30.2400000' AS DateTime2), 1)
INSERT [dbo].[Student] ([id], [stdCollId], [fName], [lName], [rollNumber], [gender], [fatherName], [motherName], [mobileNumber], [fatherMobile], [alternateNumber], [dob], [email], [address], [state], [pincode], [city], [admissionMode], [collegeId], [courseId], [admissionDate], [studentImage], [category], [isDiscontinue], [isLateral], [discontinueOn], [discontinueBy], [createdBy], [createdOn], [modifiedBy], [modifiedOn], [status]) VALUES (63, N'DPH/JKIOP/2526/63', N'Mohammad', N'Sajid', N'6', N'male', N'Ahmad', N'Ahmad', N'9540037148', N'9540037148', N'9540037148', CAST(N'1991-07-10T00:00:00.0000000' AS DateTime2), N'sajidaltair@gmail.com', N'Merrut', N'uttar Pradesh', N'250001', N'merrut', N'direct', 1, 2, CAST(N'2025-05-01T00:00:00.0000000' AS DateTime2), NULL, N'OBC', 0, 1, NULL, NULL, N'Kishan Kumar', CAST(N'2025-05-01T12:38:12.2160000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-16T17:07:42.4100000' AS DateTime2), 0)
INSERT [dbo].[Student] ([id], [stdCollId], [fName], [lName], [rollNumber], [gender], [fatherName], [motherName], [mobileNumber], [fatherMobile], [alternateNumber], [dob], [email], [address], [state], [pincode], [city], [admissionMode], [collegeId], [courseId], [admissionDate], [studentImage], [category], [isDiscontinue], [isLateral], [discontinueOn], [discontinueBy], [createdBy], [createdOn], [modifiedBy], [modifiedOn], [status]) VALUES (65, N'BPH/JKIOPM/2526/65', N'Krishdev ', N'Yadav', N'4', N'male', N' Ram Prasad', N'sd', N'6387478842', N'657', N'435', CAST(N'2001-01-23T00:00:00.0000000' AS DateTime2), N'KD73001@gmail.com', N'noida electronic city', N'up', N'12', N'jaois', N'direct', 2, 1, CAST(N'2025-05-09T00:00:00.0000000' AS DateTime2), NULL, N'Gen', 0, 1, NULL, NULL, N'Kishan Kumar', CAST(N'2025-05-09T12:53:49.2500000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-19T12:09:14.9666667' AS DateTime2), 0)
INSERT [dbo].[Student] ([id], [stdCollId], [fName], [lName], [rollNumber], [gender], [fatherName], [motherName], [mobileNumber], [fatherMobile], [alternateNumber], [dob], [email], [address], [state], [pincode], [city], [admissionMode], [collegeId], [courseId], [admissionDate], [studentImage], [category], [isDiscontinue], [isLateral], [discontinueOn], [discontinueBy], [createdBy], [createdOn], [modifiedBy], [modifiedOn], [status]) VALUES (66, N'BPH/JKIOP/2526/66', N'Shivani ', N'Kumari ', N'7', N'female', N'Om Prakash ', N'OM SHANTI', N'6387478842', N'9838846711', N'9506656049', CAST(N'2005-05-12T00:00:00.0000000' AS DateTime2), N'SHIVANI@gmail.com', N'DEEH ', N'uttar Pradesh', N'229307', N'lucknow', N'direct', 1, 1, CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), NULL, N'SC', 0, 0, NULL, NULL, N'Kishan Kumar', CAST(N'2025-05-19T11:47:56.1600000' AS DateTime2), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentAcademicDetails] ON 

INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (120, 50, N'2025-2026', N'One-Time', 1000, 50000, NULL, NULL, N'2nd', N'Kishan Kumar', CAST(N'2025-04-29T09:22:43.4850000' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (121, 50, N'2026-2027', N'One-Time', 1000, 50000, NULL, NULL, N'3rd', N'Kishan Kumar', CAST(N'2025-04-29T09:26:36.7740000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-04-29T12:13:22.9300000' AS DateTime2))
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (122, 50, N'2027-2028', N'One-Time', 100, 123, NULL, N'5000', N'4th', N'Kishan Kumar', CAST(N'2025-04-29T09:32:45.7580000' AS DateTime2), N'Kausar Raza', CAST(N'2025-05-03T07:26:44.6970000' AS DateTime2))
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (129, 55, N'2025-2026', N'One-Time', 1000, 10000, NULL, NULL, N'1st', N'Kishan Kumar', CAST(N'2025-04-30T05:54:44.6280000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T08:05:42.6966667' AS DateTime2))
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (130, 56, N'2025-2026', N'EMI', 5000, 45000, 2, NULL, N'2nd', N'Kishan Kumar', CAST(N'2025-04-30T06:33:22.3050000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-15T12:38:05.2166667' AS DateTime2))
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (136, 62, N'2025-2026', N'One-Time', 15000, 25000, NULL, NULL, N'2nd', N'Kishan Kumar', CAST(N'2025-05-01T12:18:12.0120000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-13T11:05:30.2600000' AS DateTime2))
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (137, 63, N'2025-2026', N'EMI', 1000, 2000, 2, NULL, N'2nd', N'Kishan Kumar', CAST(N'2025-05-01T12:38:12.2700000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-05T05:37:16.3140000' AS DateTime2))
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (139, 65, N'2025-2026', N'One-Time', 10000, 25000, NULL, NULL, N'2nd', N'Kishan Kumar', CAST(N'2025-05-09T12:53:49.2800000' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (140, 63, N'2026-2027', N'One-Time', 1000, 2000, NULL, NULL, N'3rd', N'Kishan Kumar', CAST(N'2025-05-09T08:03:28.8800000' AS DateTime2), N'Kishan Kumar', NULL)
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (141, 66, N'2024-2025', N'EMI', 2500, 47500, 2, NULL, N'1st', N'Kishan Kumar', CAST(N'2025-05-19T11:47:56.1933333' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (142, 66, N'2025-2026', N'EMI', 0, 45000, 2, NULL, N'2nd', N'Kishan Kumar', CAST(N'2025-05-19T06:24:08.3400000' AS DateTime2), N'Kishan Kumar', NULL)
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (143, 66, N'2026-2027', N'One-Time', 0, 55000, NULL, NULL, N'3rd', N'Kishan Kumar', CAST(N'2025-05-19T06:30:31.6866667' AS DateTime2), N'Kishan Kumar', NULL)
INSERT [dbo].[StudentAcademicDetails] ([id], [studentId], [sessionYear], [paymentMode], [adminAmount], [feesAmount], [numberOfEMI], [ledgerNumber], [courseYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (144, 66, N'2027-2028', N'One-Time', 0, 50000, NULL, NULL, N'4th', N'Kishan Kumar', CAST(N'2025-05-19T06:31:49.8500000' AS DateTime2), N'Kishan Kumar', NULL)
SET IDENTITY_INSERT [dbo].[StudentAcademicDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentPayment] ON 

INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (42, 56, 130, N'cash', N'12', 5000, 5000, CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), N'Kausar Raza', N'adminAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kausar Raza', CAST(N'2025-05-03T05:10:01.7960000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-15T10:52:08.0000000' AS DateTime2))
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (43, 55, 129, N'cash', N'123', 5000, 5000, CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'feesAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-03T07:37:23.9360000' AS DateTime2), N'Kausar Raza', CAST(N'2025-05-03T07:41:12.4540000' AS DateTime2))
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (44, 56, 130, N'cash', N'121', 1000, 5000, CAST(N'2025-05-02T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'feesAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-03T09:25:17.0450000' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (45, 63, 137, N'cash', N'122', 10000, 10000, CAST(N'2025-05-02T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'feesAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-03T09:26:27.1250000' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (47, 56, 130, N'cash', N'1233', 1000, 1000, CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'feesAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-03T09:57:17.2150000' AS DateTime2), N'Kausar Raza', CAST(N'2025-05-03T09:59:42.9170000' AS DateTime2))
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (48, 55, 129, N'cash', N'21', 1000, 1000, CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), N'Kausar Raza', N'adminAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kausar Raza', CAST(N'2025-05-03T09:58:23.1490000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-09T06:01:52.7466667' AS DateTime2))
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (49, 50, 120, N'cash', N'234', 500, 500, CAST(N'2025-05-08T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'feesAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-08T12:15:39.5466667' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (50, 62, 136, N'cash', N'23', 1000, 1000, CAST(N'2025-05-08T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'adminAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-08T12:52:47.8466667' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (51, 56, 130, N'cash', N'1234', 1000, 1000, CAST(N'2025-05-09T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'feesAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-09T08:59:35.5766667' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (52, 50, 121, N'cash', N'12333', 100, 0, CAST(N'2025-05-15T00:00:00.0000000' AS DateTime2), N'Kausar Raza', N'feesAmount', NULL, NULL, N'3rd', N'2026-2027', N'Kishan Kumar', CAST(N'2025-05-15T11:20:17.1400000' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (53, 63, 140, N'cash', N'234325', 100, 0, CAST(N'2025-05-15T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'adminAmount', NULL, NULL, N'3rd', N'2026-2027', N'Kishan Kumar', CAST(N'2025-05-15T11:20:59.9700000' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (54, 63, 140, N'cash', N'123456saf', 100, 0, CAST(N'2025-05-15T00:00:00.0000000' AS DateTime2), N'Kausar Raza', N'feesAmount', NULL, NULL, N'3rd', N'2026-2027', N'Kishan Kumar', CAST(N'2025-05-15T11:22:20.7700000' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (55, 55, 129, N'cash', N'213', 10000, 0, CAST(N'2025-05-17T00:00:00.0000000' AS DateTime2), N'Kausar Raza', N'feesAmount', NULL, NULL, N'1st', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-17T10:31:02.7400000' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (56, 56, 130, N'cash', N'123434', 12000, 0, CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'feesAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-19T06:07:25.1900000' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (57, 56, 130, N'cash', N'12312412', 6000, 0, CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'feesAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-19T06:08:04.8100000' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (58, 66, 141, N'cash', N'123456', 2500, 0, CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), N'Kausar Raza', N'adminAmount', NULL, NULL, N'1st', N'2024-2025', N'Kishan Kumar', CAST(N'2025-05-19T06:19:15.0600000' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (59, 66, 141, N'cash', N'1232', 25000, 0, CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'feesAmount', NULL, NULL, N'1st', N'2024-2025', N'Kishan Kumar', CAST(N'2025-05-19T06:19:50.9566667' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (60, 66, 141, N'cash', N'12343', 22500, 0, CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), N'Kausar Raza', N'feesAmount', NULL, NULL, N'1st', N'2024-2025', N'Kishan Kumar', CAST(N'2025-05-19T06:22:06.1066667' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (61, 66, 142, N'cash', N'23423', 20000, 0, CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'feesAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-19T06:29:09.5566667' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (62, 66, 142, N'check', N'1234124', 25000, 0, CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), N'Kausar Raza', N'feesAmount', NULL, NULL, N'2nd', N'2025-2026', N'Kishan Kumar', CAST(N'2025-05-19T06:29:27.9766667' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (63, 66, 143, N'cash', N'4552', 55000, 0, CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), N'Kausar Raza', N'feesAmount', NULL, NULL, N'3rd', N'2026-2027', N'Kishan Kumar', CAST(N'2025-05-19T06:31:23.3766667' AS DateTime2), NULL, NULL)
INSERT [dbo].[StudentPayment] ([id], [studentId], [studentAcademicId], [paymentMode], [transactionNumber], [amount], [handoverAmount], [receivedDate], [approvedBy], [amountType], [receiptUrl], [receiptPublicId], [courseYear], [sessionYear], [createdBy], [createdOn], [modifiedBy], [modifiedOn]) VALUES (64, 66, 144, N'cash', N'23214', 50000, 0, CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), N'Kishan Kumar', N'feesAmount', NULL, NULL, N'4th', N'2027-2028', N'Kishan Kumar', CAST(N'2025-05-19T06:32:22.4933333' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[StudentPayment] OFF
GO
SET IDENTITY_INSERT [dbo].[SupplierDocuments] ON 

INSERT [dbo].[SupplierDocuments] ([DocumentId], [SupplierId], [DocumentUrl], [PublicId], [CreatedOn]) VALUES (2, 3, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1747399520/Supplier/hunj85xucfixkehdi6kq.jpg', N'Supplier/hunj85xucfixkehdi6kq', CAST(N'2025-05-16T18:15:03.300' AS DateTime))
INSERT [dbo].[SupplierDocuments] ([DocumentId], [SupplierId], [DocumentUrl], [PublicId], [CreatedOn]) VALUES (3, 4, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1747462911/Supplier/vj0tkp6sy6dkvhefssla.jpg', N'Supplier/vj0tkp6sy6dkvhefssla', CAST(N'2025-05-17T11:51:35.063' AS DateTime))
INSERT [dbo].[SupplierDocuments] ([DocumentId], [SupplierId], [DocumentUrl], [PublicId], [CreatedOn]) VALUES (4, 4, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1747462913/Supplier/pjte3ejehtotmowalb5l.pdf', N'Supplier/pjte3ejehtotmowalb5l', CAST(N'2025-05-17T11:51:35.067' AS DateTime))
INSERT [dbo].[SupplierDocuments] ([DocumentId], [SupplierId], [DocumentUrl], [PublicId], [CreatedOn]) VALUES (9, 4, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1747648899/Supplier/fgmasc0eqixk5v2gcv5q.jpg', N'Supplier/fgmasc0eqixk5v2gcv5q', CAST(N'2025-05-19T10:01:18.563' AS DateTime))
INSERT [dbo].[SupplierDocuments] ([DocumentId], [SupplierId], [DocumentUrl], [PublicId], [CreatedOn]) VALUES (13, 5, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1747733800/Supplier/b3htqizbgm8vjcxcmsu4.pdf', N'Supplier/b3htqizbgm8vjcxcmsu4', CAST(N'2025-05-20T15:06:21.803' AS DateTime))
INSERT [dbo].[SupplierDocuments] ([DocumentId], [SupplierId], [DocumentUrl], [PublicId], [CreatedOn]) VALUES (14, 5, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1747733801/Supplier/rzagv1qa2hrnnujixpln.jpg', N'Supplier/rzagv1qa2hrnnujixpln', CAST(N'2025-05-20T15:06:21.810' AS DateTime))
INSERT [dbo].[SupplierDocuments] ([DocumentId], [SupplierId], [DocumentUrl], [PublicId], [CreatedOn]) VALUES (15, 1, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1747735959/zjf483ijwlqtftyvyeze.jpg', N'zjf483ijwlqtftyvyeze', CAST(N'2025-05-20T10:12:20.317' AS DateTime))
INSERT [dbo].[SupplierDocuments] ([DocumentId], [SupplierId], [DocumentUrl], [PublicId], [CreatedOn]) VALUES (17, 2, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1747736021/xpx9011gkvg4o6ow2ay7.jpg', N'xpx9011gkvg4o6ow2ay7', CAST(N'2025-05-20T10:13:21.813' AS DateTime))
INSERT [dbo].[SupplierDocuments] ([DocumentId], [SupplierId], [DocumentUrl], [PublicId], [CreatedOn]) VALUES (18, 2, N'https://res.cloudinary.com/dxqmmofie/image/upload/v1747738955/suppliers/aj3rep2to8lvxzkniddr.jpg', N'suppliers/aj3rep2to8lvxzkniddr', CAST(N'2025-05-20T11:02:16.033' AS DateTime))
SET IDENTITY_INSERT [dbo].[SupplierDocuments] OFF
GO
SET IDENTITY_INSERT [dbo].[SupplierExpenses] ON 

INSERT [dbo].[SupplierExpenses] ([SuppliersExpenseID], [SupplierId], [Reason], [Amount], [Deleted], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn]) VALUES (1, 2, N'New Expense  from new shop', CAST(10000.00 AS Decimal(18, 2)), 0, CAST(N'2025-05-19T09:39:47.4466667' AS DateTime2), N'Kishan Kumar', N'Kishan Kumar', CAST(N'2025-05-20T06:30:54.2500000' AS DateTime2))
INSERT [dbo].[SupplierExpenses] ([SuppliersExpenseID], [SupplierId], [Reason], [Amount], [Deleted], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn]) VALUES (2, 1, N'New Expense ', CAST(10000.00 AS Decimal(18, 2)), 0, CAST(N'2025-05-19T09:55:47.7933333' AS DateTime2), N'Kishan Kumar', N'Kishan Kumar', CAST(N'2025-05-20T06:30:34.9966667' AS DateTime2))
INSERT [dbo].[SupplierExpenses] ([SuppliersExpenseID], [SupplierId], [Reason], [Amount], [Deleted], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn]) VALUES (3, 4, N' New SHOES', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2025-05-19T10:01:18.5633333' AS DateTime2), N'Kishan Kumar', NULL, NULL)
INSERT [dbo].[SupplierExpenses] ([SuppliersExpenseID], [SupplierId], [Reason], [Amount], [Deleted], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn]) VALUES (4, 3, N'Rent .', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2025-05-19T11:24:53.0066667' AS DateTime2), N'Kishan Kumar', N'Kishan Kumar', CAST(N'2025-05-20T07:28:09.6600000' AS DateTime2))
INSERT [dbo].[SupplierExpenses] ([SuppliersExpenseID], [SupplierId], [Reason], [Amount], [Deleted], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn]) VALUES (5, 1, N'new ', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2025-05-20T07:23:02.7200000' AS DateTime2), N'Kishan Kumar', N'Kishan Kumar', CAST(N'2025-05-20T07:28:54.7533333' AS DateTime2))
INSERT [dbo].[SupplierExpenses] ([SuppliersExpenseID], [SupplierId], [Reason], [Amount], [Deleted], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn]) VALUES (6, 1, N' book 10', CAST(1000.00 AS Decimal(18, 2)), 0, CAST(N'2025-05-20T11:27:46.3866667' AS DateTime2), N'Kishan Kumar', NULL, NULL)
INSERT [dbo].[SupplierExpenses] ([SuppliersExpenseID], [SupplierId], [Reason], [Amount], [Deleted], [CreatedOn], [CreatedBy], [ModifiedBy], [ModifiedOn]) VALUES (7, 2, N'Book 10', CAST(10000.00 AS Decimal(18, 2)), 0, CAST(N'2025-05-20T11:28:21.6533333' AS DateTime2), N'Kishan Kumar', NULL, NULL)
SET IDENTITY_INSERT [dbo].[SupplierExpenses] OFF
GO
SET IDENTITY_INSERT [dbo].[SupplierPayment] ON 

INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (1, N'first payment', CAST(1000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', N'https://res.cloudinary.com/dxqmmofie/image/upload/v1747474591/SupplierPayments/il5yydbgcd6vdd2tysea.jpg', CAST(N'2025-05-17T15:06:12.403' AS DateTime), N'Kishan Kumar', NULL, NULL, 1, N'Cheque', N'123', CAST(N'2025-05-17T00:00:00.000' AS DateTime), N'SupplierPayments/il5yydbgcd6vdd2tysea')
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (2, N'fee', CAST(1000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-17T15:24:54.370' AS DateTime), N'Kishan Kumar', NULL, NULL, 1, N'Cash', N'1231', CAST(N'2025-05-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (3, N'e', CAST(1000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-17T15:28:54.603' AS DateTime), N'Kishan Kumar', NULL, NULL, 1, N'Cash', N'1231', CAST(N'2025-05-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (4, N'supply', CAST(1000.00 AS Decimal(18, 2)), 0, N'Kishan Kumar', NULL, CAST(N'2025-05-17T15:38:21.440' AS DateTime), N'Kishan Kumar', NULL, NULL, 1, N'Cash', N'1244', CAST(N'2025-05-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (5, N'34', CAST(500.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-17T15:59:52.647' AS DateTime), N'Kishan Kumar', NULL, NULL, 1, N'Cash', N'234', CAST(N'2025-05-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (6, N'123', CAST(500.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-17T16:34:15.890' AS DateTime), N'Kishan Kumar', NULL, NULL, 1, N'By Cheque', N'1234', CAST(N'2025-05-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (7, N'324', CAST(10000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-17T16:35:04.397' AS DateTime), N'Kishan Kumar', NULL, NULL, 1, N'Cash', N'4234', CAST(N'2025-05-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (8, N'supply', CAST(1000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-17T17:48:07.050' AS DateTime), N'Kishan Kumar', NULL, NULL, 2, N'Cheque', N'12', CAST(N'2025-05-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (9, N'fee', CAST(1000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-19T12:35:03.573' AS DateTime), N'Kishan Kumar', NULL, NULL, 3, N'Cash', N'1234', CAST(N'2025-05-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (10, N'234', CAST(1000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-19T12:58:55.037' AS DateTime), N'Kishan Kumar', NULL, NULL, 2, N'Cash', N'234', CAST(N'2025-05-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (11, N'fees', CAST(1000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-19T14:01:47.513' AS DateTime), N'Kishan Kumar', NULL, NULL, 2, N'Cash', N'1234', CAST(N'2025-05-19T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (12, N'fr', CAST(10000.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-20T11:48:24.213' AS DateTime), N'Kishan Kumar', NULL, NULL, 4, N'Cash', N'133', CAST(N'2025-05-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SupplierPayment] ([SPId], [Comment], [PaidAmount], [IsApproved], [ApproveBy], [PaymentImage], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy], [SupplierId], [PaymentMode], [TransactionId], [PaymentDate], [PaymentPublicId]) VALUES (13, N'fhg', CAST(1900.00 AS Decimal(18, 2)), 1, N'Kishan Kumar', NULL, CAST(N'2025-05-20T12:50:32.793' AS DateTime), N'Kishan Kumar', NULL, NULL, 1, N'Cash', N'12344', CAST(N'2025-05-20T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SupplierPayment] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierId], [Name], [Email], [PhoneNo], [Address], [Deleted], [CreatedOn], [Comment], [BankName], [AccountNo], [IFSCCode], [CreatedBy], [ModifiedBy], [ModifiedOn], [Amount]) VALUES (1, N'Sahil Kumar', N'Sahil73001@gmail.com', N'9506656049', N'Sector 15', 0, CAST(N'2025-05-16T13:07:11.973' AS DateTime), N'1st supplier', N'State bank of India', N'37904092618', N'SBIN0015612', N'Kishan Kumar', N'Kishan Kumar', CAST(N'2025-05-20T10:00:14.707' AS DateTime), CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[Suppliers] ([SupplierId], [Name], [Email], [PhoneNo], [Address], [Deleted], [CreatedOn], [Comment], [BankName], [AccountNo], [IFSCCode], [CreatedBy], [ModifiedBy], [ModifiedOn], [Amount]) VALUES (2, N'Mukesh Kumar', N'MukkuYadav@gmail.com', N'6387478842', N'noida', 0, CAST(N'2025-05-16T14:14:13.783' AS DateTime), N'PNB  
', N'Punjab National Bank', N'5998000100014775', N'PUNB0123456', N'Kishan Kumar', N'Kishan Kumar', CAST(N'2025-05-20T10:01:39.357' AS DateTime), CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[Suppliers] ([SupplierId], [Name], [Email], [PhoneNo], [Address], [Deleted], [CreatedOn], [Comment], [BankName], [AccountNo], [IFSCCode], [CreatedBy], [ModifiedBy], [ModifiedOn], [Amount]) VALUES (3, N'Rajesh kumar', N'raj@gmail.com', N'0638747884', N'city', 0, CAST(N'2025-05-16T18:15:03.287' AS DateTime), N'New Supply', N'Punjab national bank', N'37904092618', N'SBIN0016856', N'Kishan Kumar', N'Kishan Kumar', CAST(N'2025-05-20T07:15:44.427' AS DateTime), CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[Suppliers] ([SupplierId], [Name], [Email], [PhoneNo], [Address], [Deleted], [CreatedOn], [Comment], [BankName], [AccountNo], [IFSCCode], [CreatedBy], [ModifiedBy], [ModifiedOn], [Amount]) VALUES (4, N'Rajan Kumar', N'Rajan73001@gmail.com', N'6387478842', N'Raebareli', 0, CAST(N'2025-05-17T11:51:35.050' AS DateTime), N'Rajan', N'State bank of India', N'12345678950', N'SBIN0015668', N'Kishan Kumar', N'Kishan Kumar', CAST(N'2025-05-20T06:44:32.467' AS DateTime), CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[Suppliers] ([SupplierId], [Name], [Email], [PhoneNo], [Address], [Deleted], [CreatedOn], [Comment], [BankName], [AccountNo], [IFSCCode], [CreatedBy], [ModifiedBy], [ModifiedOn], [Amount]) VALUES (5, N'Rajesh ', N'rah@gmail.com', N'6387478843', N'city', 0, CAST(N'2025-05-20T15:06:21.783' AS DateTime), N'1st supplier', N'Punjab national bank', N'37904092618', N'SBIN0016856', N'Kishan Kumar', N'Kishan Kumar', CAST(N'2025-05-20T10:08:03.930' AS DateTime), CAST(10000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [name], [email], [mobileNo], [password], [roleId], [created_on], [created_by], [modify_on], [modify_by]) VALUES (1, N'Kishan Kumar', N'Kumarkishan73001@gmail.com', N'6387478842', N'$2b$10$r746XMJWmBwzD3kEh7k76ONKK/01/BGam6IL4BGLdSE8jZt3v7416', 2, CAST(N'2025-02-03T10:06:20.7140000' AS DateTime2), N'Administrator', CAST(N'2025-05-15T14:48:10.1966667' AS DateTime2), N'admin')
INSERT [dbo].[User] ([user_id], [name], [email], [mobileNo], [password], [roleId], [created_on], [created_by], [modify_on], [modify_by]) VALUES (67, N'Shivam kumar', N'shivam@gmail.com', N'9839180448', N'$2b$10$mm2T0gOFhY/j78XQi.wQYez.pwj8Y63oredlWsU0xeUF266R4kGS.', 3, CAST(N'2025-03-17T07:10:56.6900000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-15T12:35:21.1233333' AS DateTime2), N'admin')
INSERT [dbo].[User] ([user_id], [name], [email], [mobileNo], [password], [roleId], [created_on], [created_by], [modify_on], [modify_by]) VALUES (73, N'Kausar Raza ', N'faizraza349@gmail.com', N'1234567890', N'$2b$10$pi4vBxYVF7wQ4hywd6nVyeOy5xJ.iu41yXuaXQqW6fqiEcYdpCBAu', 1, CAST(N'2025-05-03T05:08:17.1130000' AS DateTime2), N'Kishan Kumar', CAST(N'2025-05-16T10:47:21.1366667' AS DateTime2), N'admin')
INSERT [dbo].[User] ([user_id], [name], [email], [mobileNo], [password], [roleId], [created_on], [created_by], [modify_on], [modify_by]) VALUES (75, N'Rajan Kumar', N'Rajan1@gmail.com', N'9506656049', N'$2b$10$UEet6w9xM59FezH7OHJKhOeeIiBYRKxCnhhFm3p6GohOOWA0DUgIO', 3, CAST(N'2025-05-14T12:55:52.8166667' AS DateTime2), N'Kausar Raza', CAST(N'2025-05-15T14:26:42.8133333' AS DateTime2), N'admin')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [LatestPost_post_slug_key]    Script Date: 20-05-2025 18:18:05 ******/
ALTER TABLE [dbo].[LatestPost] ADD  CONSTRAINT [LatestPost_post_slug_key] UNIQUE NONCLUSTERED 
(
	[post_slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_LatestPost_post_slug]    Script Date: 20-05-2025 18:18:05 ******/
ALTER TABLE [dbo].[LatestPost] ADD  CONSTRAINT [UK_LatestPost_post_slug] UNIQUE NONCLUSTERED 
(
	[post_slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Page_pageUrl_key]    Script Date: 20-05-2025 18:18:05 ******/
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [Page_pageUrl_key] UNIQUE NONCLUSTERED 
(
	[pageUrl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Page_pageUrl]    Script Date: 20-05-2025 18:18:05 ******/
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [UK_Page_pageUrl] UNIQUE NONCLUSTERED 
(
	[pageUrl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Permission_roleId_pageId_key]    Script Date: 20-05-2025 18:18:05 ******/
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [Permission_roleId_pageId_key] UNIQUE NONCLUSTERED 
(
	[roleId] ASC,
	[pageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_Permission_roleId_pageId]    Script Date: 20-05-2025 18:18:05 ******/
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [UK_Permission_roleId_pageId] UNIQUE NONCLUSTERED 
(
	[roleId] ASC,
	[pageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Role_name_key]    Script Date: 20-05-2025 18:18:05 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [Role_name_key] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Role_name]    Script Date: 20-05-2025 18:18:05 ******/
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [UK_Role_name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_User_email]    Script Date: 20-05-2025 18:18:05 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UK_User_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [User_email_key]    Script Date: 20-05-2025 18:18:05 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [User_email_key] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[_prisma_migrations] ADD  DEFAULT (getdate()) FOR [started_at]
GO
ALTER TABLE [dbo].[_prisma_migrations] ADD  DEFAULT ((0)) FOR [applied_steps_count]
GO
ALTER TABLE [dbo].[Banner] ADD  CONSTRAINT [Banner_created_on_df]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Banner] ADD  CONSTRAINT [Banner_IsVisible_df]  DEFAULT ((1)) FOR [IsVisible]
GO
ALTER TABLE [dbo].[College] ADD  CONSTRAINT [College_status_df]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[College] ADD  CONSTRAINT [College_createdOn_df]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [Course_createdOn_df]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [Course_status_df]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[CourseEnquiry] ADD  CONSTRAINT [CourseEnquiry_isContacted_df]  DEFAULT ((0)) FOR [isContacted]
GO
ALTER TABLE [dbo].[CourseEnquiry] ADD  CONSTRAINT [CourseEnquiry_createdAt_df]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [Documents_uploadDate_df]  DEFAULT (getdate()) FOR [uploadDate]
GO
ALTER TABLE [dbo].[Documents] ADD  CONSTRAINT [Documents_createdOn_df]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[EMIDetails] ADD  CONSTRAINT [EMIDetails_createdOn_df]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[ExpensePayment] ADD  DEFAULT ((0)) FOR [IsApproved]
GO
ALTER TABLE [dbo].[ExpensePayment] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Faculty] ADD  CONSTRAINT [Faculty_created_on_df]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Faculty] ADD  CONSTRAINT [Faculty_IsVisible_df]  DEFAULT ((1)) FOR [IsVisible]
GO
ALTER TABLE [dbo].[Gallery] ADD  CONSTRAINT [Gallery_created_on_df]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Gallery] ADD  CONSTRAINT [Gallery_IsVisible_df]  DEFAULT ((1)) FOR [IsVisible]
GO
ALTER TABLE [dbo].[ImportantLinks] ADD  CONSTRAINT [ImportantLinks_created_on_df]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[ImportantLinks] ADD  CONSTRAINT [ImportantLinks_IsVisible_df]  DEFAULT ((1)) FOR [IsVisible]
GO
ALTER TABLE [dbo].[LatestPost] ADD  CONSTRAINT [LatestPost_created_on_df]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[LatestPost] ADD  CONSTRAINT [LatestPost_isVisible_df]  DEFAULT ((1)) FOR [isVisible]
GO
ALTER TABLE [dbo].[Notification] ADD  CONSTRAINT [Notification_created_on_df]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Page] ADD  CONSTRAINT [Page_created_on_df]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[PaymentHandover] ADD  CONSTRAINT [PaymentHandover_verified_df]  DEFAULT ((0)) FOR [verified]
GO
ALTER TABLE [dbo].[PaymentHandover] ADD  CONSTRAINT [PaymentHandover_createdOn_df]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [Permission_canCreate_df]  DEFAULT ((0)) FOR [canCreate]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [Permission_canRead_df]  DEFAULT ((0)) FOR [canRead]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [Permission_canUpdate_df]  DEFAULT ((0)) FOR [canUpdate]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [Permission_canDelete_df]  DEFAULT ((0)) FOR [canDelete]
GO
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [Permission_created_on_df]  DEFAULT (getdate()) FOR [created_on]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [Student_isDiscontinue_df]  DEFAULT ((0)) FOR [isDiscontinue]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [Student_isLateral_df]  DEFAULT ((0)) FOR [isLateral]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [Student_createdOn_df]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [Student_status_df]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[StudentAcademicDetails] ADD  CONSTRAINT [StudentAcademicDetails_adminAmount_df]  DEFAULT ((0.0)) FOR [adminAmount]
GO
ALTER TABLE [dbo].[StudentAcademicDetails] ADD  CONSTRAINT [StudentAcademicDetails_createdOn_df]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[StudentPayment] ADD  CONSTRAINT [StudentPayment_handoverAmount_df]  DEFAULT ((0)) FOR [handoverAmount]
GO
ALTER TABLE [dbo].[StudentPayment] ADD  CONSTRAINT [StudentPayment_createdOn_df]  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[SupplierDocuments] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SupplierExpenses] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SupplierExpenses] ADD  DEFAULT (sysutcdatetime()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [Course_collegeId_fkey] FOREIGN KEY([collegeId])
REFERENCES [dbo].[College] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [Course_collegeId_fkey]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [Documents_studentId_fkey] FOREIGN KEY([studentId])
REFERENCES [dbo].[Student] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [Documents_studentId_fkey]
GO
ALTER TABLE [dbo].[EMIDetails]  WITH CHECK ADD  CONSTRAINT [EMIDetails_studentAcademicId_fkey] FOREIGN KEY([studentAcademicId])
REFERENCES [dbo].[StudentAcademicDetails] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EMIDetails] CHECK CONSTRAINT [EMIDetails_studentAcademicId_fkey]
GO
ALTER TABLE [dbo].[EMIDetails]  WITH CHECK ADD  CONSTRAINT [EMIDetails_studentId_fkey] FOREIGN KEY([studentId])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[EMIDetails] CHECK CONSTRAINT [EMIDetails_studentId_fkey]
GO
ALTER TABLE [dbo].[ExpensePayment]  WITH CHECK ADD  CONSTRAINT [FK_ExpensePayment_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[ExpensePayment] CHECK CONSTRAINT [FK_ExpensePayment_Suppliers]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [Notification_userId_fkey] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([user_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [Notification_userId_fkey]
GO
ALTER TABLE [dbo].[PaymentHandover]  WITH CHECK ADD  CONSTRAINT [PaymentHandover_paymentId_fkey] FOREIGN KEY([paymentId])
REFERENCES [dbo].[StudentPayment] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PaymentHandover] CHECK CONSTRAINT [PaymentHandover_paymentId_fkey]
GO
ALTER TABLE [dbo].[PaymentHandover]  WITH CHECK ADD  CONSTRAINT [PaymentHandover_studentId_fkey] FOREIGN KEY([studentId])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[PaymentHandover] CHECK CONSTRAINT [PaymentHandover_studentId_fkey]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [Permission_pageId_fkey] FOREIGN KEY([pageId])
REFERENCES [dbo].[Page] ([pageId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [Permission_pageId_fkey]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [Permission_roleId_fkey] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([role_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [Permission_roleId_fkey]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [Student_collegeId_fkey] FOREIGN KEY([collegeId])
REFERENCES [dbo].[College] ([id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [Student_collegeId_fkey]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [Student_courseId_fkey] FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [Student_courseId_fkey]
GO
ALTER TABLE [dbo].[StudentAcademicDetails]  WITH CHECK ADD  CONSTRAINT [StudentAcademicDetails_studentId_fkey] FOREIGN KEY([studentId])
REFERENCES [dbo].[Student] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StudentAcademicDetails] CHECK CONSTRAINT [StudentAcademicDetails_studentId_fkey]
GO
ALTER TABLE [dbo].[StudentPayment]  WITH CHECK ADD  CONSTRAINT [StudentPayment_studentAcademicId_fkey] FOREIGN KEY([studentAcademicId])
REFERENCES [dbo].[StudentAcademicDetails] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[StudentPayment] CHECK CONSTRAINT [StudentPayment_studentAcademicId_fkey]
GO
ALTER TABLE [dbo].[StudentPayment]  WITH CHECK ADD  CONSTRAINT [StudentPayment_studentId_fkey] FOREIGN KEY([studentId])
REFERENCES [dbo].[Student] ([id])
GO
ALTER TABLE [dbo].[StudentPayment] CHECK CONSTRAINT [StudentPayment_studentId_fkey]
GO
ALTER TABLE [dbo].[SupplierDocuments]  WITH CHECK ADD  CONSTRAINT [FK_SupplierDocuments_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplierDocuments] CHECK CONSTRAINT [FK_SupplierDocuments_Suppliers]
GO
ALTER TABLE [dbo].[SupplierExpenses]  WITH CHECK ADD  CONSTRAINT [FK_SuppliersExpense_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[SupplierExpenses] CHECK CONSTRAINT [FK_SuppliersExpense_Suppliers]
GO
ALTER TABLE [dbo].[SupplierPayment]  WITH CHECK ADD  CONSTRAINT [FK_SupplierPayment_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[SupplierPayment] CHECK CONSTRAINT [FK_SupplierPayment_Suppliers]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [User_roleId_fkey] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([role_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [User_roleId_fkey]
GO
/****** Object:  StoredProcedure [dbo].[spsearchdoctorinfo]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spsearchdoctorinfo] --'2016-09-03 16:42:13.010','2016-09-24 11:31:49.980','','','Khurja',''
@Regstartdate nvarchar(100),
@Regenddate nvarchar(100),
@DId nvarchar(50),
@Mobileno nvarchar(50),
@City nvarchar(50),
@Uniqueid nvarchar(50)
as 
begin
	declare @str nvarchar(2000)=''
	set @str='select ROW_NUMBER()over(Order by DoctorId)as sno,*,(select SpecialityName from Speciality where SpecialityId=DoctorInformation.Speciality)Specility from DoctorInformation	where 1=1'
	if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'' and @Mobileno<>'' and @City<>'' and @Uniqueid<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and City like '+''''+'%'+@City+'%'+''''+' and DoctorUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+' and Name ='+''''+@DId+''''+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'' and @Mobileno<>'' and @City<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and City like '+''''+'%'+@City+'%'+''''+' and Name ='+''''+@DId+''''+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'' and @Mobileno<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name ='+''''+@DId+''''+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name ='+''''+@DId+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @Mobileno<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @City<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and City like '+''''+'%'+@City+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @Uniqueid<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) '
	end
	else if(@DId<>'' and @Uniqueid<>'')
	begin
	 set @str=@str+' and Name ='+''''+@DId+''''+' and DoctorUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+''
	end
	else if(@DId<>'' and @City<>'')
	begin
	 set @str=@str+' and Name ='+''''+@DId+''''+' and  City like '+''''+'%'+@City+'%'+''''+''
	end
	else if(@DId<>'' and @Mobileno<>'')
	begin
	 set @str=@str+' and Name ='+''''+@DId+''''+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''
	end
	else if(@DId<>'')
	begin
	 set @str=@str+' and Name ='+''''+@DId+''''+''
	end
	else if(@Mobileno<>'' and @City<>'')
	begin
	 set @str=@str+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+' and  City like '+''''+'%'+@City+'%'+''''+''
	end
	else if(@Mobileno<>'' and @Uniqueid<>'')
	begin
	 set @str=@str+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+' and DoctorUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+''
	end
	else if(@Mobileno<>'')
	begin
	 set @str=@str+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''
	end
	else if(@City<>'' and @Uniqueid<>'')
	begin
	 set @str=@str+' and  City like '+''''+'%'+@City+'%'+''''+' and DoctorUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+''
	end
	else if(@City<>'')
	begin
	 set @str=@str+' and  City like '+''''+'%'+@City+'%'+''''+''
	end
	else if(@Uniqueid<>'')
	begin
	 set @str=@str+' and DoctorUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+''
	end
	execute(@str)
end

GO
/****** Object:  StoredProcedure [dbo].[spsearchdoctorinfoLive]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spsearchdoctorinfoLive]  --spsearchdoctorinfoLive '','','','','',''
@Regstartdate nvarchar(100),
@Regenddate nvarchar(100),
@DId nvarchar(50),
@Mobileno nvarchar(50),
@City nvarchar(50),
@Uniqueid nvarchar(50)
as 
begin
	declare @str nvarchar(2000)=''
	set @str='select ROW_NUMBER()over(Order by DoctorId)as sno,*,(select SpecialityName from Speciality where SpecialityId=DoctorInformation.Speciality)Specility,(select SUM(isnull(LicenseKey,0)) from licenseinformation where DoctorId=DoctorInformation.Doctorid)TotalLicense,(select isnull(SUM(LicenseKey),0) from licenseinformation where LicenseExpiryDate<GETDATE() and DoctorId=DoctorInformation.DoctorId)ExpiredLicense,(select COUNT(*) from LicenseIssueInformation where DoctorId=DoctorInformation.DoctorId and cast(LicenseIssueDate as DATE)<=cast(GETDATE() as DATE) and cast(LicenseExpiryDate as date)>=cast(GETDATE() as DATE))LiveLicense ,'' '' as unused from DoctorInformation	where 1=1'
	if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'' and @Mobileno<>'' and @City<>'' and @Uniqueid<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and City like '+''''+'%'+@City+'%'+''''+' and DoctorUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+' and Name like '+''''+'%'+@DId+'%'+''''+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'' and @Mobileno<>'' and @City<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and City like '+''''+'%'+@City+'%'+''''+' and Name like '+''''+'%'+@DId+'%'+''''+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'' and @Mobileno<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name like '+''''+'%'+@DId+'%'+''''+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name like '+''''+'%'+@DId+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @Mobileno<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @City<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and City like '+''''+'%'+@City+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @Uniqueid<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) '
	end
	else if(@DId<>'')
	begin
	 set @str=@str+' and Name like '+''''+'%'+@DId+'%'+''''+''
	end
	else if(@Mobileno<>'')
	begin
	 set @str=@str+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''
	end
	else if(@City<>'')
	begin
	 set @str=@str+' and  City like '+''''+'%'+@City+'%'+''''+''
	end
	else if(@Uniqueid<>'')
	begin
	 set @str=@str+' and DoctorUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+''
	end
	print @str
	execute(@str)
end

GO
/****** Object:  StoredProcedure [dbo].[spsearchLicenseinfo]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spsearchLicenseinfo] --'2016-09-29','2016-09-29','','',''  
@Regstartdate nvarchar(100),  
@Regenddate nvarchar(100),  
@DId nvarchar(50),  
@Procid nvarchar(50),  
@searchtype nvarchar(50)  
as   
begin  
 declare @str nvarchar(2000)=''  
 set @str='select ROW_NUMBER()over(Order by LicenseId)as sno,*,(select AppName from AppMaster where AppId=LicenseInformation.AppId)Procname,(select Name from DoctorInformation where DoctorId=LicenseInformation.DoctorId)Doctorname,CAST(LicenseIssueDate as 
date)IssueDate,CAST(LicenseExpiryDate as date)ExpiryDate from LicenseInformation where 1=1'  
 if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'0' and @Procid<>'0')  
 begin  
  set @str=@str+' and cast(LicenseIssueDate as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorId = '+''''+@DId+''''+' and AppId = '+''''+@Procid+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'0')  
 begin  
  set @str=@str+' and cast(LicenseIssueDate as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorId = '+''''+@DId+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'' and @Procid<>'0')  
 begin  
  set @str=@str+' and cast(LicenseIssueDate as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and AppId = '+''''+@Procid+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'')  
 begin  
  set @str=@str+' and cast(LicenseIssueDate as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date)'  
 end  
 else if(@DId<>'0' and @Procid<>'0')  
 begin  
  set @str=@str+'  and DoctorId = '+''''+@DId+''''+' and AppId = '+''''+@Procid+''''+''  
 end  
 else if(@Procid<>'0')  
 begin  
  set @str=@str+' and AppId = '+''''+@Procid+''''+''  
 end  
 else if(@DId<>'0')  
 begin  
  set @str=@str+' and DoctorId = '+''''+@DId+''''+''  
 end  
 execute(@str)  
end

GO
/****** Object:  StoredProcedure [dbo].[spsearchLicenseRequestbydoctorinfo]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spsearchLicenseRequestbydoctorinfo] --'2016-09-29','2016-09-29','','',''
@Regstartdate nvarchar(100),
@Regenddate nvarchar(100),
@DId nvarchar(50),
@Procid nvarchar(50),
@Requeststatus nvarchar(50)
as 
begin
	declare @str nvarchar(2000)=''
	set @str='select ROW_NUMBER()over(Order by RequestId)as sno,*,(select Name from DoctorInformation where DoctorId=LicenseRequest.DoctorId)DoctorName,(select AppName from AppMaster where AppId=LicenseRequest.ProcedureId)Procname from LicenseRequest where 1=1'
	if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'0' and @Procid<>'0' and @Requeststatus<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorId = '+''''+@DId+''''+' and ProcedureId = '+''''+@Procid+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'0' and  @Procid<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorId = '+''''+@DId+''''+' and ProcedureId = '+''''+@Procid+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @Procid<>'0' and @Requeststatus<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and ProcedureId = '+''''+@Procid+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'0' and  @Requeststatus<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorId = '+''''+@DId+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorId = '+''''+@DId+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @Procid<>'0' )
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and ProcedureId = '+''''+@Procid+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and  @Requeststatus<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date)'
	end
	else if(@DId<>'0' and @Procid<>'0' and @Requeststatus<>'0')
	begin
	 set @str=@str+'  and DoctorId = '+''''+@DId+''''+' and ProcedureId = '+''''+@Procid+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@DId<>'0' and @Procid<>'0')
	begin
	 set @str=@str+'  and DoctorId = '+''''+@DId+''''+' and ProcedureId = '+''''+@Procid+''''+''
	end
	else if(@DId<>'0' and  @Requeststatus<>'0')
	begin
	 set @str=@str+' and DoctorId = '+''''+@DId+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Procid<>'0' and @Requeststatus<>'0')
	begin
	 set @str=@str+' and ProcedureId = '+''''+@Procid+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Procid<>'0')
	begin
	 set @str=@str+' and ProcedureId = '+''''+@Procid+''''+''
	end
	else if(@DId<>'0')
	begin
	 set @str=@str+' and DoctorId = '+''''+@DId+''''+''
	end
	execute(@str)
end

GO
/****** Object:  StoredProcedure [dbo].[spsearchLicenseRequestinfo]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spsearchLicenseRequestinfo] --'2016-09-29','2016-09-29','','',''
@Regstartdate nvarchar(100),
@Regenddate nvarchar(100),
@DId nvarchar(50),
@Procid nvarchar(50),
@Requeststatus nvarchar(50)
as 
begin
	declare @str nvarchar(2000)=''
	set @str='select ROW_NUMBER()over(Order by RequestId)as sno,*,(select Name from DoctorInformation where DoctorId=LicenseRequest.DoctorId)DoctorName,(select AppName from AppMaster where AppId=LicenseRequest.ProcedureId)Procname from LicenseRequest where 1=1'
	if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'0' and @Procid<>'0' and @Requeststatus<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorId = '+''''+@DId+''''+' and ProcedureId = '+''''+@Procid+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'0' and  @Procid<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorId = '+''''+@DId+''''+' and ProcedureId = '+''''+@Procid+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @Procid<>'0' and @Requeststatus<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and ProcedureId = '+''''+@Procid+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'0' and  @Requeststatus<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorId = '+''''+@DId+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorId = '+''''+@DId+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @Procid<>'0' )
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and ProcedureId = '+''''+@Procid+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and  @Requeststatus<>'0')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'')
	begin
	 set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date)'
	end
	else if(@DId<>'0' and @Procid<>'0' and @Requeststatus<>'0')
	begin
	 set @str=@str+'  and DoctorId = '+''''+@DId+''''+' and ProcedureId = '+''''+@Procid+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@DId<>'0' and @Procid<>'0')
	begin
	 set @str=@str+'  and DoctorId = '+''''+@DId+''''+' and ProcedureId = '+''''+@Procid+''''+''
	end
	else if(@DId<>'0' and  @Requeststatus<>'0')
	begin
	 set @str=@str+' and DoctorId = '+''''+@DId+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Procid<>'0' and @Requeststatus<>'0')
	begin
	 set @str=@str+' and ProcedureId = '+''''+@Procid+''''+' and Requeststatus = '+''''+@Requeststatus+''''+''
	end
	else if(@Procid<>'0')
	begin
	 set @str=@str+' and ProcedureId = '+''''+@Procid+''''+''
	end
	else if(@DId<>'0')
	begin
	 set @str=@str+' and DoctorId = '+''''+@DId+''''+''
	end
	execute(@str)
end

GO
/****** Object:  StoredProcedure [dbo].[spsearchpatientinfo]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spsearchpatientinfo] --'','','','','',''  
@Regstartdate nvarchar(100),  
@Regenddate nvarchar(100),  
@Name nvarchar(50),  
@Mobileno nvarchar(50),  
@City nvarchar(50),  
@Uniqueid nvarchar(50)  
as   
begin  
 declare @str nvarchar(2000)=''  
 set @str='select ROW_NUMBER()over(Order by PatientId)as sno,*,(select DoctorId from DoctorInformation where EmailId=PatientInformation.CreatedBy)DoctorId,(select Name from DoctorInformation where EmailId=PatientInformation.CreatedBy)Doctorname,(select MobileNumber from DoctorInformation where EmailId=PatientInformation.CreatedBy)DoctorMobile,(select Address from DoctorInformation where EmailId=PatientInformation.CreatedBy)DoctorAddress from PatientInformation where 1=1'  
 if(@Regenddate<>'' and @Regstartdate<>'' and @Name<>'' and @Mobileno<>'' and @City<>'' and @Uniqueid<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and City like '+''''+'%'+@City+'%'+''''+' and PatientUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+' and Name ='+''''

+@Name+''''+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'' and @Name<>'' and @Mobileno<>'' and @City<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and City like '+''''+'%'+@City+'%'+''''+' and Name ='+''''+@Name+''''+' and MobileNumber like '+''''+'%'+@Mobileno+

'%'+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'' and @Name<>'' and @Mobileno<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name ='+''''+@Name+''''+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'' and @Name<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name ='+''''+@Name+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'' and @Mobileno<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'' and @City<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and City like '+''''+'%'+@City+'%'+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'' and @Uniqueid<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and PatientUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) '  
 end  
 else if(@Name<>'' and @City<>'')  
 begin  
  set @str=@str+' and Name ='+''''+@Name+''''+' and  City like '+''''+'%'+@City+'%'+''''+''  
 end  
 else if(@Name<>'' and @Mobileno<>'')  
 begin  
  set @str=@str+' and Name ='+''''+@Name+''''+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''  
 end  
 else if(@Name<>'' and @Uniqueid<>'')  
 begin  
  set @str=@str+' and Name ='+''''+@Name+''''+' and PatientUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+''  
 end  
 else if(@Name<>'')  
 begin  
  set @str=@str+' and Name ='+''''+@Name+''''+''  
 end  
 else if(@Mobileno<>'' and @City<>'')  
 begin  
  set @str=@str+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+' and  City like '+''''+'%'+@City+'%'+''''+''  
 end  
 else if(@Mobileno<>'')  
 begin  
  set @str=@str+' and MobileNumber like '+''''+'%'+@Mobileno+'%'+''''+''  
 end  
 else if(@City<>'' and @Uniqueid<>'')  
 begin  
  set @str=@str+' and  City like '+''''+'%'+@City+'%'+''''+' and PatientUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+''  
 end  
 else if(@City<>'')  
 begin  
  set @str=@str+' and  City like '+''''+'%'+@City+'%'+''''+''  
 end  
 else if(@Uniqueid<>'')  
 begin  
  set @str=@str+' and PatientUniqueId like '+''''+'%'+@Uniqueid+'%'+''''+''  
 end  
 execute(@str)  
end

GO
/****** Object:  StoredProcedure [dbo].[spsearchpatientinfoLive]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spsearchpatientinfoLive]--spsearchpatientinfoLive '','','','0',11
@Regstartdate nvarchar(100),
@Regenddate nvarchar(100),
@Name nvarchar(50),
@DId nvarchar(50),
@procedureId nvarchar(50)
as 
begin
	declare @str nvarchar(2000)=''
	set @str='select ROW_NUMBER()over(Order by PI.PatientId)as sno,PI.*,LII.*,(select Name from DoctorInformation where EmailId=PI.CreatedBy)Doctorname,(select AppName from AppMaster where AppId=LII.ProcedureId)Procname from PatientInformation PI join LicenseIssueInformation LII on PI.PatientId=LII.PatientId where cast(LII.LicenseExpiryDate as date)>=cast(GETDATE() as DATE) and 1=1'
	if(@Regenddate<>'' and @Regstartdate<>'' and @Name<>'' and @DId<>'0' and @procedureId<>'0')
	begin
	 set @str=@str+' and cast(PI.CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name like '+''''+'%'+@Name+'%'+''''+' and DoctorId = '+''''+@DId+''''+' and ProcedureId ='+''''+@procedureId+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @Name<>'' and @DId<>'0')
	begin
	 set @str=@str+' and cast(PI.CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name like '+''''+'%'+@Name+'%'+''''+' and DoctorId = '+''''+@DId+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @Name<>'')
	begin
	 set @str=@str+' and cast(PI.CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name like '+''''+'%'+@Name+'%'+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @DId<>'0')
	begin
	 set @str=@str+' and cast(PI.CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and DoctorId = '+''''+@DId+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'' and @procedureId<>'0')
	begin
	 set @str=@str+' and cast(PI.CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and ProcedureId = '+''''+@procedureId+''''+''
	end
	else if(@Regenddate<>'' and @Regstartdate<>'')
	begin
	 set @str=@str+' and cast(PI.CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) '
	end
	else if(@Name<>'' and @DId<>'0' and @procedureId<>'0')
	begin
	 set @str=@str+' and Name ='+''''+@Name+''''+' and  DoctorId = '+''''+@DId+''''+' and  ProcedureId = '+''''+@procedureId+''''+''
	end
	else if(@DId<>'0' and @procedureId<>'0')
	begin
	 set @str=@str+' and  DoctorId = '+''''+@DId+''''+' and  ProcedureId = '+''''+@procedureId+''''+''
	end
	else if(@Name<>'')
	begin
	 set @str=@str+' and Name ='+''''+@Name+''''+''
	end
	else if(@DId<>'0')
	begin
	 set @str=@str+' and  DoctorId = '+''''+@DId+''''+''
	end
	else if(@procedureId<>'0')
	begin
	 set @str=@str+' and  cast(ProcedureId as int) = '+''''+@procedureId+''''+''
	end
	print @str
	execute(@str)
end

GO
/****** Object:  StoredProcedure [dbo].[spsearchUserinfo]    Script Date: 20-05-2025 18:18:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spsearchUserinfo]-- '','','','9891387595',''  
@Regstartdate nvarchar(100),  
@Regenddate nvarchar(100),  
@Name nvarchar(50),  
@Mobilenuber nvarchar(50),  
@userid nvarchar(50)  
as   
begin  
 declare @str nvarchar(2000)=''  
 set @str='select ROW_NUMBER()over(Order by UserId)as sno,*,case when (IsActive=1) then '+'''DeActivate'''+' else '+'''Activate'''+' end Accountstatus,case when (IsActive=1 or IsActive='+'''True'''+') then '+'''Active'''+' else '+'''DeActive'''+' end status,(select RoleName from RoleMaster where RoleId=UserAccount.UserRoleId)UserRole from UserAccount  where 1=1'  
 if(@Regenddate<>'' and @Regstartdate<>'' and @Name<>'' and @Mobilenuber<>'' and @userid<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name = '+''''+@Name+''''+' and MobileNo = '+''''+@Mobilenuber+''''+' and UniqueId='+''''+@userid+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'' and @Name <>'' and @Mobilenuber<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name = '+''''+@Name+''''+' and MobileNo='+''''+@Mobilenuber+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'' and @Name<>'0' and @userid<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name = '+''''+@Name+''''+' and UniqueId = '+''''+@userid+''''+''  
 end  
 else if(@Regenddate<>'' and @Regstartdate<>'' and @Name<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and Name = '+''''+@Name+''''+''  
 end 
  else if(@Regenddate<>'' and @Regstartdate<>'' and @Mobilenuber<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and MobileNo = '+''''+@Mobilenuber+''''+''  
 end   
  else if(@Regenddate<>'' and @Regstartdate<>'' and @userid<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date) and UniqueId = '+''''+@userid+''''+''  
 end  
  else if(@Regenddate<>'' and @Regstartdate<>'')  
 begin  
  set @str=@str+' and cast(CreatedOn as Date) between cast('+''''+@Regstartdate+''''+' as date) and cast('+''''+@Regenddate+''''+' as date)'  
 end  
 else if(@Name<>'' and @Mobilenuber<>'')  
 begin  
  set @str=@str+'  and Name = '+''''+@Name+''''+' and MobileNo = '+''''+@Mobilenuber+''''+''  
 end  
 else if(@Name<>'' and @userid<>'')  
 begin  
  set @str=@str+' and Name = '+''''+@Name+''''+' and UniqueId = '+''''+@userid+''''+''
 end
 else if(@Name<>'')  
 begin  
  set @str=@str+' and Name = '+''''+@Name+''''+''  
 end
 else if(@Mobilenuber<>'' and @userid<>'')  
 begin  
  set @str=@str+' and MobileNo = '+''''+@Mobilenuber+''''+' and UniqueId = '+''''+@userid+''''+''  
 end 
 else if(@Mobilenuber<>'')  
 begin  
  set @str=@str+' and MobileNo = '+''''+@Mobilenuber+''''+''  
 end  
 else if(@userid<>'')  
 begin  
  set @str=@str+' and UniqueId = '+''''+@userid+''''+''  
 end 
 print @str 
 execute(@str)  
end

GO
