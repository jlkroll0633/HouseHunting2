USE [master]
GO
/****** Object:  Database [Moving]    Script Date: 9/15/2020 2:58:26 PM ******/
CREATE DATABASE [Moving]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Moving', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Moving.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Moving_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Moving_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Moving] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Moving].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Moving] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Moving] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Moving] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Moving] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Moving] SET ARITHABORT OFF 
GO
ALTER DATABASE [Moving] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Moving] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Moving] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Moving] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Moving] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Moving] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Moving] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Moving] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Moving] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Moving] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Moving] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Moving] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Moving] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Moving] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Moving] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Moving] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Moving] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Moving] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Moving] SET  MULTI_USER 
GO
ALTER DATABASE [Moving] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Moving] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Moving] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Moving] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Moving] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Moving] SET QUERY_STORE = OFF
GO
USE [Moving]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 9/15/2020 2:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Weight] [int] NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseDetails]    Script Date: 9/15/2020 2:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[ZillowUrl] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Houses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseFeatures]    Script Date: 9/15/2020 2:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseFeatures](
	[HouseID] [int] NOT NULL,
	[FeatureID] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (1, N'Year Round Spring', N'Year Round Spring', 10)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (2, N'Partial Spring', N'Spring, not year round', 3)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (3, N'Pond', N'', 8)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (4, N'Creek', N'', 10)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (5, N'Acres_15plus', N'', 5)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (6, N'Acres_20plus', N'', 8)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (7, N'Acres_30plus', N'', 10)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (8, N'Fencing', N'', 6)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (9, N'Well', N'', 6)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (10, N'Outbuildings', N'', 4)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (11, N'Price_Under90', N'price under $90k', 10)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (12, N'Price_Under100', N'price under $100k', 7)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (13, N'Price_Under120', N'price under $100k', 4)
INSERT [dbo].[Features] ([ID], [Name], [Description], [Weight]) VALUES (14, N'Price_Under140', N'price under $140k', 2)
SET IDENTITY_INSERT [dbo].[Features] OFF
SET IDENTITY_INSERT [dbo].[HouseDetails] ON 

INSERT [dbo].[HouseDetails] ([ID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (1, N'209 Gutter Rd, Harriet, AR 72639', CAST(88000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/209-Gutter-Rd,-Harriet,-AR-72639_rb/193984030_zpid/', N'images/house1.png')
INSERT [dbo].[HouseDetails] ([ID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (2, N'174 Fallen Tree Rd, Marshall, AR 72650', CAST(89900 AS Decimal(18, 0)), N'https://www.zillow.com/myzillow/favorites?mmlb=g,0', N'images/house2.png')
SET IDENTITY_INSERT [dbo].[HouseDetails] OFF
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (1, 11)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (1, 5)
USE [master]
GO
ALTER DATABASE [Moving] SET  READ_WRITE 
GO
