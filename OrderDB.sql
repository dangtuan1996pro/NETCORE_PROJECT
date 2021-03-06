USE [master]
GO
/****** Object:  Database [Order]    Script Date: 6/24/2019 10:50:02 AM ******/
CREATE DATABASE [Order]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Order', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Order.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Order_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Order_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Order] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Order].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Order] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Order] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Order] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Order] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Order] SET ARITHABORT OFF 
GO
ALTER DATABASE [Order] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Order] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Order] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Order] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Order] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Order] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Order] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Order] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Order] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Order] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Order] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Order] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Order] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Order] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Order] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Order] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Order] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Order] SET RECOVERY FULL 
GO
ALTER DATABASE [Order] SET  MULTI_USER 
GO
ALTER DATABASE [Order] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Order] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Order] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Order] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Order] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Order', N'ON'
GO
ALTER DATABASE [Order] SET QUERY_STORE = OFF
GO
USE [Order]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Displayname] [nvarchar](500) NULL,
	[Password] [varchar](50) NULL,
	[Role] [int] NULL,
	[Status] [int] NULL,
	[UserName] [nvarchar](500) NULL,
	[UserTypeId] [bigint] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](500) NULL,
	[Country] [nvarchar](500) NULL,
	[District] [nvarchar](500) NULL,
	[Street] [nvarchar](500) NULL,
	[StreetNumber] [nvarchar](500) NULL,
	[Lat] [varchar](20) NULL,
	[Lng] [varchar](20) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Note] [nvarchar](500) NULL,
	[CartCode] [int] NULL,
	[Status] [int] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Email] [varchar](500) NULL,
	[CustomerGroupId] [bigint] NULL,
	[AddressId] [bigint] NULL,
	[Created_at] [date] NULL,
	[Updated_at] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerGroup]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerGroup](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_CustomerGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DeliveryTime] [date] NULL,
	[Note] [nvarchar](500) NULL,
	[TotalPrice] [int] NULL,
	[WeightTotal] [decimal](18, 0) NULL,
	[Served] [bit] NULL,
	[ServedTime] [int] NULL,
	[StartTime] [date] NULL,
	[EndTime] [date] NULL,
	[Status] [int] NULL,
	[Code] [varchar](500) NULL,
	[CustomerId] [bigint] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceItem]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[TotalPrice] [int] NULL,
	[Weight] [decimal](18, 0) NULL,
	[Deliveried] [bit] NULL,
	[DeliveriedQuantity] [int] NULL,
	[InvoiceId] [bigint] NULL,
	[QuotationItemId] [bigint] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_InvoiceItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preservation]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preservation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Preservation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[IsFavorite] [bit] NULL,
	[Note] [nvarchar](500) NULL,
	[Code] [varchar](500) NULL,
	[PreserventionId] [bigint] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductRequest]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRequest](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ProductName] [nvarchar](500) NULL,
	[Quantity] [int] NULL,
	[Status] [int] NULL,
	[UserId] [bigint] NULL,
	[Response] [nvarchar](500) NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_ProductRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductUnit]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductUnit](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IsCommonUnit] [bit] NULL,
	[WeightPerUnit] [decimal](12, 2) NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_ProductUnit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotation]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [int] NULL,
	[CustomerId] [bigint] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuotationItem]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuotationItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Price] [int] NULL,
	[QuotationId] [bigint] NULL,
	[ProductUnitId] [bigint] NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_QuotationItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 6/24/2019 10:50:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[CreatedAt] [date] NULL,
	[UpdatedAt] [date] NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Displayname], [Password], [Role], [Status], [UserName], [UserTypeId], [UpdatedAt]) VALUES (1, N'TuanDV', N'123', 0, 1, N'TuanDV', 1, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Preservation] ON 

INSERT [dbo].[Preservation] ([Id], [Description], [CreatedAt], [UpdatedAt]) VALUES (1, N'Bảo quản dưới 0 độ C', CAST(N'2019-06-24' AS Date), CAST(N'2019-06-24' AS Date))
INSERT [dbo].[Preservation] ([Id], [Description], [CreatedAt], [UpdatedAt]) VALUES (2, N'Bảo quản từ 0-5 độ C', CAST(N'2019-06-24' AS Date), CAST(N'2019-06-24' AS Date))
INSERT [dbo].[Preservation] ([Id], [Description], [CreatedAt], [UpdatedAt]) VALUES (3, N'Bảo quản dưới 5-10 độ C', CAST(N'2019-06-24' AS Date), CAST(N'2019-06-24' AS Date))
INSERT [dbo].[Preservation] ([Id], [Description], [CreatedAt], [UpdatedAt]) VALUES (4, N'Bảo quản từ 10-30 độ C', CAST(N'2019-06-24' AS Date), CAST(N'2019-06-24' AS Date))
INSERT [dbo].[Preservation] ([Id], [Description], [CreatedAt], [UpdatedAt]) VALUES (5, N'Bảo quản trên 30 độ C', CAST(N'2019-06-24' AS Date), CAST(N'2019-06-24' AS Date))
SET IDENTITY_INSERT [dbo].[Preservation] OFF
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (1, N'cân', CAST(N'2019-06-24' AS Date), NULL)
INSERT [dbo].[Unit] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (2, N'hộp', CAST(N'2019-06-24' AS Date), NULL)
INSERT [dbo].[Unit] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (3, N'khay', CAST(N'2019-06-24' AS Date), NULL)
INSERT [dbo].[Unit] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (4, N'thùng', CAST(N'2019-06-24' AS Date), NULL)
INSERT [dbo].[Unit] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (5, N'chậu', CAST(N'2019-06-24' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Unit] OFF
USE [master]
GO
ALTER DATABASE [Order] SET  READ_WRITE 
GO
