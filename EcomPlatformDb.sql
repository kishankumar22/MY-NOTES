USE [EcomPlatformDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Company] [nvarchar](max) NOT NULL,
	[AddressLine1] [nvarchar](max) NOT NULL,
	[AddressLine2] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[IsDefault] [bit] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[Gender] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[LastLoginAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[ProfileImageUrl] [nvarchar](max) NULL,
	[RefreshToken] [nvarchar](max) NULL,
	[RefreshTokenExpiryTime] [datetime2](7) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[LogoUrl] [nvarchar](max) NULL,
	[IsPublished] [bit] NOT NULL,
	[ShowOnHomepage] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](255) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[ParentCategoryId] [uniqueidentifier] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryMovements]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryMovements](
	[Id] [uniqueidentifier] NOT NULL,
	[MovementType] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Reason] [nvarchar](500) NULL,
	[Reference] [nvarchar](255) NULL,
	[UnitCost] [decimal](18, 2) NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[ProductVariantId] [uniqueidentifier] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_InventoryMovements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[LogoUrl] [nvarchar](max) NULL,
	[IsPublished] [bit] NOT NULL,
	[ShowOnHomepage] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductSku] [nvarchar](max) NOT NULL,
	[ProductImageUrl] [nvarchar](max) NULL,
	[VariantName] [nvarchar](max) NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[ProductVariantId] [uniqueidentifier] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderNumber] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[SubtotalAmount] [decimal](18, 2) NOT NULL,
	[TaxAmount] [decimal](18, 2) NOT NULL,
	[ShippingAmount] [decimal](18, 2) NOT NULL,
	[DiscountAmount] [decimal](18, 2) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Currency] [nvarchar](3) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[CouponCode] [nvarchar](max) NULL,
	[IsGuestOrder] [bit] NOT NULL,
	[CustomerEmail] [nvarchar](255) NOT NULL,
	[CustomerPhone] [nvarchar](20) NOT NULL,
	[BillingFirstName] [nvarchar](50) NOT NULL,
	[BillingLastName] [nvarchar](50) NOT NULL,
	[BillingCompany] [nvarchar](max) NOT NULL,
	[BillingAddressLine1] [nvarchar](255) NOT NULL,
	[BillingAddressLine2] [nvarchar](max) NOT NULL,
	[BillingCity] [nvarchar](100) NOT NULL,
	[BillingState] [nvarchar](max) NOT NULL,
	[BillingPostalCode] [nvarchar](max) NOT NULL,
	[BillingCountry] [nvarchar](max) NOT NULL,
	[ShippingFirstName] [nvarchar](50) NOT NULL,
	[ShippingLastName] [nvarchar](50) NOT NULL,
	[ShippingCompany] [nvarchar](max) NOT NULL,
	[ShippingAddressLine1] [nvarchar](255) NOT NULL,
	[ShippingAddressLine2] [nvarchar](max) NOT NULL,
	[ShippingCity] [nvarchar](100) NOT NULL,
	[ShippingState] [nvarchar](max) NOT NULL,
	[ShippingPostalCode] [nvarchar](max) NOT NULL,
	[ShippingCountry] [nvarchar](max) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Id] [uniqueidentifier] NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Currency] [nvarchar](3) NOT NULL,
	[Status] [int] NOT NULL,
	[TransactionId] [nvarchar](255) NULL,
	[GatewayTransactionId] [nvarchar](max) NULL,
	[GatewayResponse] [nvarchar](max) NULL,
	[ProcessedAt] [datetime2](7) NULL,
	[FailureReason] [nvarchar](max) NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttributes]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttributes](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[SortOrder] [int] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProductAttributes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [uniqueidentifier] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[AltText] [nvarchar](max) NULL,
	[SortOrder] [int] NOT NULL,
	[IsMain] [bit] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReviews]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReviews](
	[Id] [uniqueidentifier] NOT NULL,
	[Rating] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[IsVerifiedPurchase] [bit] NOT NULL,
	[CustomerName] [nvarchar](max) NOT NULL,
	[CustomerEmail] [nvarchar](max) NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProductReviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ShortDescription] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](255) NOT NULL,
	[Sku] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CompareAtPrice] [decimal](18, 2) NULL,
	[CostPrice] [decimal](18, 2) NULL,
	[Weight] [decimal](10, 3) NOT NULL,
	[WeightUnit] [nvarchar](max) NULL,
	[RequiresShipping] [bit] NOT NULL,
	[IsDigital] [bit] NOT NULL,
	[Status] [int] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[PublishedAt] [datetime2](7) NULL,
	[TrackQuantity] [bit] NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[LowStockThreshold] [int] NULL,
	[AllowBackorder] [bit] NOT NULL,
	[Vendor] [nvarchar](max) NULL,
	[Tags] [nvarchar](max) NULL,
	[MetaTitle] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](max) NULL,
	[ViewCount] [int] NOT NULL,
	[AverageRating] [decimal](3, 2) NOT NULL,
	[ReviewCount] [int] NOT NULL,
	[CategoryId] [uniqueidentifier] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[AdditionalShippingCharge] [decimal](18, 2) NULL,
	[AdminComment] [nvarchar](max) NULL,
	[AllowedQuantities] [nvarchar](max) NULL,
	[AutomaticallyAddProducts] [bit] NOT NULL,
	[AvailableEndDate] [datetime2](7) NULL,
	[AvailableForPreOrder] [bit] NOT NULL,
	[AvailableStartDate] [datetime2](7) NULL,
	[BackorderMode] [nvarchar](max) NULL,
	[BasepriceAmount] [decimal](18, 2) NULL,
	[BasepriceBaseAmount] [decimal](18, 2) NULL,
	[BasepriceBaseUnit] [nvarchar](max) NULL,
	[BasepriceEnabled] [bit] NOT NULL,
	[BasepriceUnit] [nvarchar](max) NULL,
	[CallForPrice] [bit] NOT NULL,
	[CrossSellProductIds] [nvarchar](max) NULL,
	[CustomerEntersPrice] [bit] NOT NULL,
	[CustomerRoles] [nvarchar](max) NULL,
	[DeliveryDateId] [nvarchar](max) NULL,
	[DimensionUnit] [nvarchar](max) NULL,
	[DisableBuyButton] [bit] NOT NULL,
	[DisableWishlistButton] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[DisplayStockAvailability] [bit] NOT NULL,
	[DisplayStockQuantity] [bit] NOT NULL,
	[DownloadActivationType] [nvarchar](max) NULL,
	[DownloadExpirationDays] [int] NULL,
	[DownloadId] [nvarchar](max) NULL,
	[GiftCardType] [nvarchar](max) NULL,
	[Gtin] [nvarchar](max) NULL,
	[HasDiscountsApplied] [bit] NOT NULL,
	[HasSampleDownload] [bit] NOT NULL,
	[HasUserAgreement] [bit] NOT NULL,
	[Height] [decimal](18, 2) NULL,
	[IsDownload] [bit] NOT NULL,
	[IsFreeShipping] [bit] NOT NULL,
	[IsGiftCard] [bit] NOT NULL,
	[IsRecurring] [bit] NOT NULL,
	[IsRental] [bit] NOT NULL,
	[Length] [decimal](18, 2) NULL,
	[LimitedToStores] [bit] NOT NULL,
	[ManageInventoryMethod] [nvarchar](max) NULL,
	[ManufacturerPartNumber] [nvarchar](max) NULL,
	[MarkAsNew] [bit] NOT NULL,
	[MarkAsNewEndDate] [datetime2](7) NULL,
	[MarkAsNewStartDate] [datetime2](7) NULL,
	[MaxNumberOfDownloads] [int] NULL,
	[MaximumCustomerEnteredPrice] [decimal](18, 2) NULL,
	[MinStockQuantity] [int] NULL,
	[MinimumCustomerEnteredPrice] [decimal](18, 2) NULL,
	[NotReturnable] [bit] NOT NULL,
	[NotifyAdminForQuantityBelow] [bit] NOT NULL,
	[NotifyQuantityBelow] [int] NULL,
	[OldPrice] [decimal](18, 2) NULL,
	[OrderMaximumQuantity] [int] NULL,
	[OrderMinimumQuantity] [int] NULL,
	[OverriddenGiftCardAmount] [bit] NOT NULL,
	[PreOrderAvailabilityStartDate] [datetime2](7) NULL,
	[ProductType] [nvarchar](max) NULL,
	[RecurringCycleLength] [int] NULL,
	[RecurringCyclePeriod] [nvarchar](max) NULL,
	[RecurringTotalCycles] [int] NULL,
	[RelatedProductIds] [nvarchar](max) NULL,
	[RentalPriceLength] [int] NULL,
	[RentalPricePeriod] [nvarchar](max) NULL,
	[RequireOtherProducts] [bit] NOT NULL,
	[RequiredProductIds] [nvarchar](max) NULL,
	[SampleDownloadId] [nvarchar](max) NULL,
	[SearchEngineFriendlyPageName] [nvarchar](max) NULL,
	[ShipSeparately] [bit] NOT NULL,
	[ShowOnHomepage] [bit] NOT NULL,
	[SpecificationAttributes] [nvarchar](max) NULL,
	[TaxCategoryId] [nvarchar](max) NULL,
	[TaxExempt] [bit] NOT NULL,
	[TelecommunicationsBroadcastingElectronicServices] [bit] NOT NULL,
	[UnlimitedDownloads] [bit] NOT NULL,
	[UserAgreementText] [nvarchar](max) NULL,
	[VendorId] [nvarchar](max) NULL,
	[VideoUrls] [nvarchar](max) NULL,
	[VisibleIndividually] [bit] NOT NULL,
	[Width] [decimal](18, 2) NULL,
	[BrandId] [uniqueidentifier] NULL,
	[ManufacturerId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariants]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariants](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Sku] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[CompareAtPrice] [decimal](18, 2) NULL,
	[Weight] [decimal](10, 3) NULL,
	[StockQuantity] [int] NOT NULL,
	[Option1] [nvarchar](max) NULL,
	[Option2] [nvarchar](max) NULL,
	[Option3] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[IsDefault] [bit] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProductVariants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentItems]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentItems](
	[Id] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ShipmentId] [uniqueidentifier] NOT NULL,
	[OrderItemId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ShipmentItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 27-10-2025 4.27.07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[Id] [uniqueidentifier] NOT NULL,
	[TrackingNumber] [nvarchar](100) NOT NULL,
	[Carrier] [nvarchar](100) NOT NULL,
	[ShippingMethod] [nvarchar](max) NOT NULL,
	[ShippingCost] [decimal](18, 2) NOT NULL,
	[ShippedAt] [datetime2](7) NULL,
	[DeliveredAt] [datetime2](7) NULL,
	[Notes] [nvarchar](max) NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250929151219_InitialCreate', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251002062758_AddNopCommerceProductFields', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251002102846_AddBrandAndManufacturerTables', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251002113252_RemoveDuplicateAuditFields', N'8.0.8')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'86704e4f-83d4-4f62-7a30-08ddff6ab3f6', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7d9322fb-8b4b-4493-7a31-08ddff6ab3f6', N'Customer', N'CUSTOMER', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1b2ed6df-8f0d-4d1a-9d82-08ddff6ab40e', N'86704e4f-83d4-4f62-7a30-08ddff6ab3f6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b891163a-9cca-4d7b-9d83-08ddff6ab40e', N'86704e4f-83d4-4f62-7a30-08ddff6ab3f6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'46fb0d61-ada4-46c1-9d84-08ddff6ab40e', N'86704e4f-83d4-4f62-7a30-08ddff6ab3f6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a59b2051-b422-4211-9d85-08ddff6ab40e', N'7d9322fb-8b4b-4493-7a31-08ddff6ab3f6')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [DateOfBirth], [Gender], [CreatedAt], [LastLoginAt], [IsActive], [ProfileImageUrl], [RefreshToken], [RefreshTokenExpiryTime], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1b2ed6df-8f0d-4d1a-9d82-08ddff6ab40e', N'Faiz', N'Raza', NULL, NULL, CAST(N'2025-09-29T15:13:10.8343828' AS DateTime2), CAST(N'2025-10-25T10:59:46.0996211' AS DateTime2), 1, NULL, N'KcuzjEse76m3TaXzF+Ai31ddheV6c4pcGx9bJ9/OqGFXUGak6ai9G9+lyUFr81z/j2Iea26xe8diGwIqL175gw==', CAST(N'2025-11-01T10:59:46.0994944' AS DateTime2), N'faizraza349@gmail.com', N'FAIZRAZA349@GMAIL.COM', N'faizraza349@gmail.com', N'FAIZRAZA349@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEAU6COszy9mNKnlHtNpFQ5MY2UYjEIkJDPy0FeJ0dItWgZqUFKzzdTG7WEXRWtsHtg==', N'TJ4GILX4VFGOINOBBKR6BBYH2I3TMI5C', N'074a77d7-5e5d-4524-bd70-59456f14272e', N'8052738480', 1, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [DateOfBirth], [Gender], [CreatedAt], [LastLoginAt], [IsActive], [ProfileImageUrl], [RefreshToken], [RefreshTokenExpiryTime], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b891163a-9cca-4d7b-9d83-08ddff6ab40e', N'Kausar', N'Raza', NULL, NULL, CAST(N'2025-09-29T15:13:11.0332324' AS DateTime2), NULL, 1, NULL, NULL, NULL, N'kausar@ecommerce.com', N'KAUSAR@ECOMMERCE.COM', N'kausar@ecommerce.com', N'KAUSAR@ECOMMERCE.COM', 1, N'AQAAAAIAAYagAAAAEDdbUXaYwYbPvcaKjH3nm+VQFZu5w+bJ3dWc+5KAStkf60zqqi8KrxFF1dZiv3nX3w==', N'QAPX34LMVZQIJH7ABTB6EDNCXMWUQSHR', N'b11a78b5-8331-43b0-8364-79317a14453a', N'8052738480', 1, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [DateOfBirth], [Gender], [CreatedAt], [LastLoginAt], [IsActive], [ProfileImageUrl], [RefreshToken], [RefreshTokenExpiryTime], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'46fb0d61-ada4-46c1-9d84-08ddff6ab40e', N'Admin', N'User', NULL, NULL, CAST(N'2025-09-29T15:13:11.0844479' AS DateTime2), NULL, 1, NULL, NULL, NULL, N'admin@ecommerce.com', N'ADMIN@ECOMMERCE.COM', N'admin@ecommerce.com', N'ADMIN@ECOMMERCE.COM', 1, N'AQAAAAIAAYagAAAAEOPfT0ORzUXanOnroyQ6J2XSb2D5fg7bnKD7j7kcE2zefSaWQwz0Y/UtoWgS0PDtUw==', N'I2EYYX5PXAR4YK344U5LKVUVRVDFZVPI', N'67cac120-f03a-41ba-9f09-ba2d84fb5e35', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [DateOfBirth], [Gender], [CreatedAt], [LastLoginAt], [IsActive], [ProfileImageUrl], [RefreshToken], [RefreshTokenExpiryTime], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a59b2051-b422-4211-9d85-08ddff6ab40e', N'John', N'Doe', NULL, NULL, CAST(N'2025-09-29T15:13:11.1350120' AS DateTime2), NULL, 1, NULL, NULL, NULL, N'customer@example.com', N'CUSTOMER@EXAMPLE.COM', N'customer@example.com', N'CUSTOMER@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAEBeXL7Eiu0HNeukDxzY2z8s8J5Ox2VkzuWD+KWx9K2Vg/oh5Kimf07ardsZyY2/wcw==', N'OYHACLVGB2JPWJZ4P5QYNO5MBAD5MLBE', N'3f148f09-9f26-4b8d-b3a2-7b4abc52b334', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Brands] ([Id], [Name], [Description], [Slug], [LogoUrl], [IsPublished], [ShowOnHomepage], [DisplayOrder], [MetaTitle], [MetaDescription], [MetaKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'd2160f50-f3fb-4192-aba0-479da64ac1d1', N'TechBrand', N'Leading technology brand', N'techbrand', N'/images/brands/946c0cd5-4c69-48df-92db-086470737b8b.png', 1, 1, 1, N'', N'', N'', CAST(N'2025-10-02T11:10:41.8695910' AS DateTime2), CAST(N'2025-10-02T18:04:21.7408888' AS DateTime2), NULL, N'faizraza349@gmail.com', 0)
INSERT [dbo].[Brands] ([Id], [Name], [Description], [Slug], [LogoUrl], [IsPublished], [ShowOnHomepage], [DisplayOrder], [MetaTitle], [MetaDescription], [MetaKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'608b7935-6f85-4538-b834-d1977ebaa2af', N'FashionBrand', N'Premium fashion brand', N'fashionbrand', N'/images/brands/34adeea9-159f-44e7-af54-9cac63ccb0a0.png', 1, 1, 2, N'', N'', N'', CAST(N'2025-10-02T11:10:41.8696518' AS DateTime2), CAST(N'2025-10-03T15:23:02.6423491' AS DateTime2), NULL, N'faizraza349@gmail.com', 0)
GO
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Slug], [ImageUrl], [IsActive], [SortOrder], [MetaTitle], [MetaDescription], [MetaKeywords], [ParentCategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'65ab6c1f-cb58-4cd0-ad1c-47a157631bb5', N'Electronics', N'Electronic devices and accessories', N'electronics', N'/images/categories/374c8f4c-a5c7-4548-bc98-d51b4078e977.png', 1, 1, N'', N'', N'', N'ab87dff2-4ccb-4aaa-8a94-8f3e343e9b67', CAST(N'2025-09-29T15:17:08.3889696' AS DateTime2), CAST(N'2025-10-02T18:04:11.8634266' AS DateTime2), NULL, N'faizraza349@gmail.com', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Slug], [ImageUrl], [IsActive], [SortOrder], [MetaTitle], [MetaDescription], [MetaKeywords], [ParentCategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'ab87dff2-4ccb-4aaa-8a94-8f3e343e9b67', N'Clothing', N'Fashion and apparel.', N'clothing', N'/images/categories/6783a1ca-66c5-4e66-b179-0bbedb3328a7.png', 1, 2, N'', N'', N'', NULL, CAST(N'2025-09-29T15:17:08.3890564' AS DateTime2), CAST(N'2025-10-02T17:01:44.7388711' AS DateTime2), NULL, N'faizraza349@gmail.com', 0)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [Slug], [ImageUrl], [IsActive], [SortOrder], [MetaTitle], [MetaDescription], [MetaKeywords], [ParentCategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'08bf03ed-4517-47a8-89db-f1b7483abadc', N'Books', N'Books and literature.', N'books', N'/images/categories/e3dd5ed7-66f4-41b0-b934-94d015e6536e.png', 1, 3, N'', N'', N'', NULL, CAST(N'2025-09-29T15:17:08.3890567' AS DateTime2), CAST(N'2025-10-02T17:02:03.2364230' AS DateTime2), NULL, N'faizraza349@gmail.com', 0)
GO
INSERT [dbo].[Manufacturers] ([Id], [Name], [Description], [Slug], [LogoUrl], [IsPublished], [ShowOnHomepage], [DisplayOrder], [MetaTitle], [MetaDescription], [MetaKeywords], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (N'937b24b7-3dcc-4ebf-876c-b7cee7d024a5', N'Dell', N'Dell Technologies Inc. is an American multinational technology company that has been headquartered in Round Rock, Texas since 1994.', N'dell', N'/images/manufacturers/8c3184ee-e959-463e-842d-6cd812725837.png', 1, 1, 1, N'Dell', N'Dell Technologies Inc. is an American multinational technology company that has been headquartered in Round Rock, Texas since 1994', N'Dell', CAST(N'2025-10-03T16:13:20.3274972' AS DateTime2), CAST(N'2025-10-03T16:14:03.3454564' AS DateTime2), N'faizraza349@gmail.com', N'faizraza349@gmail.com', 0)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [ShortDescription], [Slug], [Sku], [Price], [CompareAtPrice], [CostPrice], [Weight], [WeightUnit], [RequiresShipping], [IsDigital], [Status], [IsPublished], [PublishedAt], [TrackQuantity], [StockQuantity], [LowStockThreshold], [AllowBackorder], [Vendor], [Tags], [MetaTitle], [MetaDescription], [MetaKeywords], [ViewCount], [AverageRating], [ReviewCount], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [AdditionalShippingCharge], [AdminComment], [AllowedQuantities], [AutomaticallyAddProducts], [AvailableEndDate], [AvailableForPreOrder], [AvailableStartDate], [BackorderMode], [BasepriceAmount], [BasepriceBaseAmount], [BasepriceBaseUnit], [BasepriceEnabled], [BasepriceUnit], [CallForPrice], [CrossSellProductIds], [CustomerEntersPrice], [CustomerRoles], [DeliveryDateId], [DimensionUnit], [DisableBuyButton], [DisableWishlistButton], [DisplayOrder], [DisplayStockAvailability], [DisplayStockQuantity], [DownloadActivationType], [DownloadExpirationDays], [DownloadId], [GiftCardType], [Gtin], [HasDiscountsApplied], [HasSampleDownload], [HasUserAgreement], [Height], [IsDownload], [IsFreeShipping], [IsGiftCard], [IsRecurring], [IsRental], [Length], [LimitedToStores], [ManageInventoryMethod], [ManufacturerPartNumber], [MarkAsNew], [MarkAsNewEndDate], [MarkAsNewStartDate], [MaxNumberOfDownloads], [MaximumCustomerEnteredPrice], [MinStockQuantity], [MinimumCustomerEnteredPrice], [NotReturnable], [NotifyAdminForQuantityBelow], [NotifyQuantityBelow], [OldPrice], [OrderMaximumQuantity], [OrderMinimumQuantity], [OverriddenGiftCardAmount], [PreOrderAvailabilityStartDate], [ProductType], [RecurringCycleLength], [RecurringCyclePeriod], [RecurringTotalCycles], [RelatedProductIds], [RentalPriceLength], [RentalPricePeriod], [RequireOtherProducts], [RequiredProductIds], [SampleDownloadId], [SearchEngineFriendlyPageName], [ShipSeparately], [ShowOnHomepage], [SpecificationAttributes], [TaxCategoryId], [TaxExempt], [TelecommunicationsBroadcastingElectronicServices], [UnlimitedDownloads], [UserAgreementText], [VendorId], [VideoUrls], [VisibleIndividually], [Width], [BrandId], [ManufacturerId]) VALUES (N'66b87bfe-a788-419f-8537-0fa49f960d40', N'Allen Solly Sport Men Polo Collar T-shirt', N'BEST OFFERS
Best Price: Rs. 1204

    Applicable on: Orders above Rs. 499 (only on first purchase)
    Coupon code: MYNTRASAVE
    Coupon Discount: 15% off (Your total saving: Rs. 1295)

View Eligible Products
10% Instant Discount on Canara Bank Credit Card
Min Spend ₹3,500, Max Discount ₹1,000
Terms & Condition
10% Instant Discount on Federal Bank Credit Card & Debit Card
Min Spend ₹3,000, Max Discount ₹1,000
Terms & Condition
7.5% Assured Cashback on Flipkart Axis Bank Credit Card.
Maximum cashback: INR 4,000 per quarter ; Cashback is not applicable on transactions less than INR 100
Terms & Condition
7.5% Assured Cashback on Flipkart SBI Credit Card.
Maximum cashback: INR 4,000 per quarter ; Cashback is not applicable on transactions less than INR 100
Terms & Condition
EMI option available
EMI starting from Rs.62/month
View Plan', N'BEST OFFERS
Best Price: Rs. 1204

    Applicable on: Orders above Rs. 499 (only on first purchase)
    Coupon code: MYNTRASAVE
    Coupon Discount: 15% off (Your total saving: Rs. 1295)', N'allen-solly-sport-men-polo-collar-t-shirt', N'MYNTRASAVE', CAST(100.00 AS Decimal(18, 2)), NULL, NULL, CAST(1.500 AS Decimal(10, 3)), N'kg', 1, 0, 2, 1, NULL, 1, 100, NULL, 0, NULL, N'MYNTRASAVE', N'Allen Solly Sport Men Polo Collar T-shirt', N'Allen Solly Sport
Men Polo Collar T-shirt', N'Allen, Solly, Sport, Men, Polo, Collar', 0, CAST(0.00 AS Decimal(3, 2)), 0, NULL, CAST(N'2025-10-25T07:16:33.7597534' AS DateTime2), CAST(N'2025-10-25T08:40:10.4813201' AS DateTime2), N'System', N'System', 0, NULL, N'Note', NULL, 0, NULL, 0, NULL, N'no-backorders', NULL, NULL, NULL, 0, NULL, 0, N'2', 0, N'all', NULL, N'cm', 0, 0, 1, 1, 0, NULL, NULL, NULL, NULL, N'MYNTRASAVE', 0, 0, 0, CAST(5.00 AS Decimal(18, 2)), 0, 0, 0, 0, 0, CAST(20.00 AS Decimal(18, 2)), 0, N'track', N'MYNTRASAVE', 0, NULL, NULL, 10, NULL, 0, NULL, 0, 1, 1, NULL, 10000, 1, 0, NULL, N'simple', NULL, NULL, NULL, N'1', NULL, NULL, 0, NULL, NULL, NULL, 0, 1, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, 1, CAST(10.00 AS Decimal(18, 2)), NULL, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ShortDescription], [Slug], [Sku], [Price], [CompareAtPrice], [CostPrice], [Weight], [WeightUnit], [RequiresShipping], [IsDigital], [Status], [IsPublished], [PublishedAt], [TrackQuantity], [StockQuantity], [LowStockThreshold], [AllowBackorder], [Vendor], [Tags], [MetaTitle], [MetaDescription], [MetaKeywords], [ViewCount], [AverageRating], [ReviewCount], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [AdditionalShippingCharge], [AdminComment], [AllowedQuantities], [AutomaticallyAddProducts], [AvailableEndDate], [AvailableForPreOrder], [AvailableStartDate], [BackorderMode], [BasepriceAmount], [BasepriceBaseAmount], [BasepriceBaseUnit], [BasepriceEnabled], [BasepriceUnit], [CallForPrice], [CrossSellProductIds], [CustomerEntersPrice], [CustomerRoles], [DeliveryDateId], [DimensionUnit], [DisableBuyButton], [DisableWishlistButton], [DisplayOrder], [DisplayStockAvailability], [DisplayStockQuantity], [DownloadActivationType], [DownloadExpirationDays], [DownloadId], [GiftCardType], [Gtin], [HasDiscountsApplied], [HasSampleDownload], [HasUserAgreement], [Height], [IsDownload], [IsFreeShipping], [IsGiftCard], [IsRecurring], [IsRental], [Length], [LimitedToStores], [ManageInventoryMethod], [ManufacturerPartNumber], [MarkAsNew], [MarkAsNewEndDate], [MarkAsNewStartDate], [MaxNumberOfDownloads], [MaximumCustomerEnteredPrice], [MinStockQuantity], [MinimumCustomerEnteredPrice], [NotReturnable], [NotifyAdminForQuantityBelow], [NotifyQuantityBelow], [OldPrice], [OrderMaximumQuantity], [OrderMinimumQuantity], [OverriddenGiftCardAmount], [PreOrderAvailabilityStartDate], [ProductType], [RecurringCycleLength], [RecurringCyclePeriod], [RecurringTotalCycles], [RelatedProductIds], [RentalPriceLength], [RentalPricePeriod], [RequireOtherProducts], [RequiredProductIds], [SampleDownloadId], [SearchEngineFriendlyPageName], [ShipSeparately], [ShowOnHomepage], [SpecificationAttributes], [TaxCategoryId], [TaxExempt], [TelecommunicationsBroadcastingElectronicServices], [UnlimitedDownloads], [UserAgreementText], [VendorId], [VideoUrls], [VisibleIndividually], [Width], [BrandId], [ManufacturerId]) VALUES (N'f5841b8d-c49a-4026-8b11-27bb6e13d820', N'Houszy Adjustable Dumbbell Set 20kg – Home Gym Edition', N'A versatile 20kg adjustable dumbbell set designed for home and gym workouts. Includes chrome handles, spinlock collars, and weight plates for easy customisation of resistance during exercises.', N'20kg adjustable dumbbell set for home workouts and strength training.', N'houszy-adjustable-dumbbell-set-20kg-home-gym-edition', N'KEMKET-DB20KG', CAST(49.99 AS Decimal(18, 2)), CAST(59.99 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), CAST(20.000 AS Decimal(10, 3)), N'kg', 1, 0, 1, 1, CAST(N'2025-10-25T10:40:28.8311794' AS DateTime2), 1, 120, 10, 1, N'Kemket', N'fitness, dumbbell, adjustable, gym, home workouts', N'Houszy Adjustable Dumbbell Set 20kg – Home Gym Edition | Houszy Fitness', N'Buy the Houszy Adjustable Dumbbell Set 20kg – Home Gym Edition for effective home workouts. Includes chrome handles, spinlock collars, and weight plates. Fast UK delivery from Houszy.', N'adjustable dumbbell set, home gym, fitness equipment, Houszy UK', 0, CAST(0.00 AS Decimal(3, 2)), 0, N'65ab6c1f-cb58-4cd0-ad1c-47a157631bb5', CAST(N'2025-10-25T10:40:29.4364228' AS DateTime2), NULL, N'faizraza349@gmail.com', NULL, 0, CAST(2.99 AS Decimal(18, 2)), N'New dumbbell set for Houszy fitness category.', N'1,2,3,4,5', 0, CAST(N'2026-10-25T08:45:29.7590000' AS DateTime2), 0, CAST(N'2025-10-25T08:45:29.7590000' AS DateTime2), N'NoBackorders', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'', 0, N'', 0, N'66B87BFE-A788-419F-8537-0FA49F960D40', 0, N'All', N'DEL-001', N'cm', 0, 0, 1, 1, 1, N'', 0, N'', N'', N'1234567890123', 0, 0, 0, CAST(20.00 AS Decimal(18, 2)), 0, 0, 0, 0, 0, CAST(40.00 AS Decimal(18, 2)), 0, N'TrackInventory', N'KMK-DB20', 1, CAST(N'2025-12-25T08:45:29.7590000' AS DateTime2), CAST(N'2025-10-25T08:45:29.7590000' AS DateTime2), 0, CAST(0.00 AS Decimal(18, 2)), 5, CAST(0.00 AS Decimal(18, 2)), 0, 1, 10, CAST(59.99 AS Decimal(18, 2)), 5, 1, 0, CAST(N'2025-10-25T08:45:29.7590000' AS DateTime2), N'Physical', 0, N'', 0, N'66B87BFE-A788-419F-8537-0FA49F960D40', 0, N'', 0, N'', N'', N'houszy-adjustable-dumbbell-set-20kg-home-gym-edition', 0, 1, N'Material: Iron, Handle Type: Chrome, Plates: 4x2.5kg + 4x1.25kg', N'FITNESS-GOODS', 0, 0, 0, N'', N'VENDOR-001', N'https://www.youtube.com/watch?v=dumbbell-demo', 1, CAST(20.00 AS Decimal(18, 2)), N'd2160f50-f3fb-4192-aba0-479da64ac1d1', N'937b24b7-3dcc-4ebf-876c-b7cee7d024a5')
INSERT [dbo].[Products] ([Id], [Name], [Description], [ShortDescription], [Slug], [Sku], [Price], [CompareAtPrice], [CostPrice], [Weight], [WeightUnit], [RequiresShipping], [IsDigital], [Status], [IsPublished], [PublishedAt], [TrackQuantity], [StockQuantity], [LowStockThreshold], [AllowBackorder], [Vendor], [Tags], [MetaTitle], [MetaDescription], [MetaKeywords], [ViewCount], [AverageRating], [ReviewCount], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [AdditionalShippingCharge], [AdminComment], [AllowedQuantities], [AutomaticallyAddProducts], [AvailableEndDate], [AvailableForPreOrder], [AvailableStartDate], [BackorderMode], [BasepriceAmount], [BasepriceBaseAmount], [BasepriceBaseUnit], [BasepriceEnabled], [BasepriceUnit], [CallForPrice], [CrossSellProductIds], [CustomerEntersPrice], [CustomerRoles], [DeliveryDateId], [DimensionUnit], [DisableBuyButton], [DisableWishlistButton], [DisplayOrder], [DisplayStockAvailability], [DisplayStockQuantity], [DownloadActivationType], [DownloadExpirationDays], [DownloadId], [GiftCardType], [Gtin], [HasDiscountsApplied], [HasSampleDownload], [HasUserAgreement], [Height], [IsDownload], [IsFreeShipping], [IsGiftCard], [IsRecurring], [IsRental], [Length], [LimitedToStores], [ManageInventoryMethod], [ManufacturerPartNumber], [MarkAsNew], [MarkAsNewEndDate], [MarkAsNewStartDate], [MaxNumberOfDownloads], [MaximumCustomerEnteredPrice], [MinStockQuantity], [MinimumCustomerEnteredPrice], [NotReturnable], [NotifyAdminForQuantityBelow], [NotifyQuantityBelow], [OldPrice], [OrderMaximumQuantity], [OrderMinimumQuantity], [OverriddenGiftCardAmount], [PreOrderAvailabilityStartDate], [ProductType], [RecurringCycleLength], [RecurringCyclePeriod], [RecurringTotalCycles], [RelatedProductIds], [RentalPriceLength], [RentalPricePeriod], [RequireOtherProducts], [RequiredProductIds], [SampleDownloadId], [SearchEngineFriendlyPageName], [ShipSeparately], [ShowOnHomepage], [SpecificationAttributes], [TaxCategoryId], [TaxExempt], [TelecommunicationsBroadcastingElectronicServices], [UnlimitedDownloads], [UserAgreementText], [VendorId], [VideoUrls], [VisibleIndividually], [Width], [BrandId], [ManufacturerId]) VALUES (N'44ae3831-ea14-4a27-b503-7defde145076', N'Designer T-Shirt', N'Premium cotton t-shirt with modern design', N'Comfortable designer t-shirt', N'designer-t-shirt', N'TSHIRT-001', CAST(49.99 AS Decimal(18, 2)), NULL, NULL, CAST(0.200 AS Decimal(10, 3)), N'kg', 1, 0, 2, 1, NULL, 1, 100, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, CAST(0.00 AS Decimal(3, 2)), 0, N'ab87dff2-4ccb-4aaa-8a94-8f3e343e9b67', CAST(N'2025-09-29T15:17:08.5056512' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ShortDescription], [Slug], [Sku], [Price], [CompareAtPrice], [CostPrice], [Weight], [WeightUnit], [RequiresShipping], [IsDigital], [Status], [IsPublished], [PublishedAt], [TrackQuantity], [StockQuantity], [LowStockThreshold], [AllowBackorder], [Vendor], [Tags], [MetaTitle], [MetaDescription], [MetaKeywords], [ViewCount], [AverageRating], [ReviewCount], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [AdditionalShippingCharge], [AdminComment], [AllowedQuantities], [AutomaticallyAddProducts], [AvailableEndDate], [AvailableForPreOrder], [AvailableStartDate], [BackorderMode], [BasepriceAmount], [BasepriceBaseAmount], [BasepriceBaseUnit], [BasepriceEnabled], [BasepriceUnit], [CallForPrice], [CrossSellProductIds], [CustomerEntersPrice], [CustomerRoles], [DeliveryDateId], [DimensionUnit], [DisableBuyButton], [DisableWishlistButton], [DisplayOrder], [DisplayStockAvailability], [DisplayStockQuantity], [DownloadActivationType], [DownloadExpirationDays], [DownloadId], [GiftCardType], [Gtin], [HasDiscountsApplied], [HasSampleDownload], [HasUserAgreement], [Height], [IsDownload], [IsFreeShipping], [IsGiftCard], [IsRecurring], [IsRental], [Length], [LimitedToStores], [ManageInventoryMethod], [ManufacturerPartNumber], [MarkAsNew], [MarkAsNewEndDate], [MarkAsNewStartDate], [MaxNumberOfDownloads], [MaximumCustomerEnteredPrice], [MinStockQuantity], [MinimumCustomerEnteredPrice], [NotReturnable], [NotifyAdminForQuantityBelow], [NotifyQuantityBelow], [OldPrice], [OrderMaximumQuantity], [OrderMinimumQuantity], [OverriddenGiftCardAmount], [PreOrderAvailabilityStartDate], [ProductType], [RecurringCycleLength], [RecurringCyclePeriod], [RecurringTotalCycles], [RelatedProductIds], [RentalPriceLength], [RentalPricePeriod], [RequireOtherProducts], [RequiredProductIds], [SampleDownloadId], [SearchEngineFriendlyPageName], [ShipSeparately], [ShowOnHomepage], [SpecificationAttributes], [TaxCategoryId], [TaxExempt], [TelecommunicationsBroadcastingElectronicServices], [UnlimitedDownloads], [UserAgreementText], [VendorId], [VideoUrls], [VisibleIndividually], [Width], [BrandId], [ManufacturerId]) VALUES (N'ef4f8dd7-620e-4b32-9376-b0ea5c3e58cb', N'Smartphone X1', N'Latest smartphone with advanced features', N'Premium smartphone', N'smartphone-x1', N'PHONE-X1-001', CAST(999.99 AS Decimal(18, 2)), CAST(1199.99 AS Decimal(18, 2)), NULL, CAST(0.180 AS Decimal(10, 3)), N'kg', 1, 0, 2, 1, NULL, 1, 50, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, CAST(0.00 AS Decimal(3, 2)), 0, N'65ab6c1f-cb58-4cd0-ad1c-47a157631bb5', CAST(N'2025-09-29T15:17:08.5054669' AS DateTime2), NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [ShortDescription], [Slug], [Sku], [Price], [CompareAtPrice], [CostPrice], [Weight], [WeightUnit], [RequiresShipping], [IsDigital], [Status], [IsPublished], [PublishedAt], [TrackQuantity], [StockQuantity], [LowStockThreshold], [AllowBackorder], [Vendor], [Tags], [MetaTitle], [MetaDescription], [MetaKeywords], [ViewCount], [AverageRating], [ReviewCount], [CategoryId], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted], [AdditionalShippingCharge], [AdminComment], [AllowedQuantities], [AutomaticallyAddProducts], [AvailableEndDate], [AvailableForPreOrder], [AvailableStartDate], [BackorderMode], [BasepriceAmount], [BasepriceBaseAmount], [BasepriceBaseUnit], [BasepriceEnabled], [BasepriceUnit], [CallForPrice], [CrossSellProductIds], [CustomerEntersPrice], [CustomerRoles], [DeliveryDateId], [DimensionUnit], [DisableBuyButton], [DisableWishlistButton], [DisplayOrder], [DisplayStockAvailability], [DisplayStockQuantity], [DownloadActivationType], [DownloadExpirationDays], [DownloadId], [GiftCardType], [Gtin], [HasDiscountsApplied], [HasSampleDownload], [HasUserAgreement], [Height], [IsDownload], [IsFreeShipping], [IsGiftCard], [IsRecurring], [IsRental], [Length], [LimitedToStores], [ManageInventoryMethod], [ManufacturerPartNumber], [MarkAsNew], [MarkAsNewEndDate], [MarkAsNewStartDate], [MaxNumberOfDownloads], [MaximumCustomerEnteredPrice], [MinStockQuantity], [MinimumCustomerEnteredPrice], [NotReturnable], [NotifyAdminForQuantityBelow], [NotifyQuantityBelow], [OldPrice], [OrderMaximumQuantity], [OrderMinimumQuantity], [OverriddenGiftCardAmount], [PreOrderAvailabilityStartDate], [ProductType], [RecurringCycleLength], [RecurringCyclePeriod], [RecurringTotalCycles], [RelatedProductIds], [RentalPriceLength], [RentalPricePeriod], [RequireOtherProducts], [RequiredProductIds], [SampleDownloadId], [SearchEngineFriendlyPageName], [ShipSeparately], [ShowOnHomepage], [SpecificationAttributes], [TaxCategoryId], [TaxExempt], [TelecommunicationsBroadcastingElectronicServices], [UnlimitedDownloads], [UserAgreementText], [VendorId], [VideoUrls], [VisibleIndividually], [Width], [BrandId], [ManufacturerId]) VALUES (N'8814dfdb-3309-4539-b6ed-ebc162ea092b', N'Kemket Adjustable Dumbbell Set 20kg', N'A versatile 20kg adjustable dumbbell set designed for home and gym workouts. Includes chrome handles, spinlock collars, and weight plates for easy customisation of resistance during exercises.', N'20kg adjustable dumbbell set for home workouts and strength training.', N'kemket-adjustable-dumbbell-set-20kg', N'KEMKET-DB20KG', CAST(49.99 AS Decimal(18, 2)), CAST(59.99 AS Decimal(18, 2)), NULL, CAST(20.000 AS Decimal(10, 3)), N'kg', 1, 0, 1, 0, NULL, 1, 120, NULL, 0, N'Kemket', N'fitness, dumbbell, adjustable, gym', N'Kemket 20kg Adjustable Dumbbell Set | Houszy Fitness', N'Buy the Kemket 20kg adjustable dumbbell set for effective home workouts. Includes chrome handles, spinlock collars, and weight plates. Fast UK delivery from Houszy.', N'adjustable dumbbell set, home gym, fitness equipment, Houszy UK', 0, CAST(0.00 AS Decimal(3, 2)), 0, N'65ab6c1f-cb58-4cd0-ad1c-47a157631bb5', CAST(N'2025-10-25T10:24:26.9908182' AS DateTime2), NULL, N'faizraza349@gmail.com', NULL, 0, NULL, NULL, NULL, 0, NULL, 0, NULL, N'no-backorders', NULL, NULL, NULL, 0, NULL, 0, NULL, 0, N'all', NULL, N'cm', 0, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, N'track', NULL, 0, NULL, NULL, 10, NULL, 0, NULL, 0, 1, 1, NULL, 10000, 1, 0, NULL, N'simple', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, 1, NULL, N'd2160f50-f3fb-4192-aba0-479da64ac1d1', N'937b24b7-3dcc-4ebf-876c-b7cee7d024a5')
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'USD') FOR [Currency]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (N'USD') FOR [Currency]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [AutomaticallyAddProducts]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [AvailableForPreOrder]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [BasepriceEnabled]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [CallForPrice]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [CustomerEntersPrice]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [DisableBuyButton]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [DisableWishlistButton]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [DisplayStockAvailability]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [DisplayStockQuantity]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [HasDiscountsApplied]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [HasSampleDownload]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [HasUserAgreement]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDownload]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsFreeShipping]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsGiftCard]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsRecurring]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsRental]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [LimitedToStores]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [MarkAsNew]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [NotReturnable]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [NotifyAdminForQuantityBelow]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [OverriddenGiftCardAmount]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [RequireOtherProducts]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [ShipSeparately]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [ShowOnHomepage]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [TaxExempt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [TelecommunicationsBroadcastingElectronicServices]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [UnlimitedDownloads]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [VisibleIndividually]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories_ParentCategoryId] FOREIGN KEY([ParentCategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories_ParentCategoryId]
GO
ALTER TABLE [dbo].[InventoryMovements]  WITH CHECK ADD  CONSTRAINT [FK_InventoryMovements_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InventoryMovements] CHECK CONSTRAINT [FK_InventoryMovements_Products_ProductId]
GO
ALTER TABLE [dbo].[InventoryMovements]  WITH CHECK ADD  CONSTRAINT [FK_InventoryMovements_ProductVariants_ProductVariantId] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariants] ([Id])
GO
ALTER TABLE [dbo].[InventoryMovements] CHECK CONSTRAINT [FK_InventoryMovements_ProductVariants_ProductVariantId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_ProductVariants_ProductVariantId] FOREIGN KEY([ProductVariantId])
REFERENCES [dbo].[ProductVariants] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_ProductVariants_ProductVariantId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Orders_OrderId]
GO
ALTER TABLE [dbo].[ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributes_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductAttributes] CHECK CONSTRAINT [FK_ProductAttributes_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductReviews]  WITH CHECK ADD  CONSTRAINT [FK_ProductReviews_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReviews] CHECK CONSTRAINT [FK_ProductReviews_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Manufacturers_ManufacturerId] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturers] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Manufacturers_ManufacturerId]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariants_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [FK_ProductVariants_Products_ProductId]
GO
ALTER TABLE [dbo].[ShipmentItems]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentItems_OrderItems_OrderItemId] FOREIGN KEY([OrderItemId])
REFERENCES [dbo].[OrderItems] ([Id])
GO
ALTER TABLE [dbo].[ShipmentItems] CHECK CONSTRAINT [FK_ShipmentItems_OrderItems_OrderItemId]
GO
ALTER TABLE [dbo].[ShipmentItems]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentItems_Shipments_ShipmentId] FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[Shipments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShipmentItems] CHECK CONSTRAINT [FK_ShipmentItems_Shipments_ShipmentId]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Orders_OrderId]
GO
