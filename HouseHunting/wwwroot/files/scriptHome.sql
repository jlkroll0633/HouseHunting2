USE [master]
GO
/****** Object:  Database [Houses]    Script Date: 10/6/2020 10:21:47 AM ******/
CREATE DATABASE [Houses]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Houses', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Houses_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Houses_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Houses_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Houses] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Houses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Houses] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Houses] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Houses] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Houses] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Houses] SET ARITHABORT OFF 
GO
ALTER DATABASE [Houses] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Houses] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Houses] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Houses] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Houses] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Houses] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Houses] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Houses] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Houses] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Houses] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Houses] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Houses] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Houses] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Houses] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Houses] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Houses] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Houses] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Houses] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Houses] SET  MULTI_USER 
GO
ALTER DATABASE [Houses] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Houses] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Houses] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Houses] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Houses] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Houses] SET QUERY_STORE = OFF
GO
USE [Houses]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[FeatureID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Weight] [int] NULL,
	[IsEditable] [bit] NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseFeatures]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseFeatures](
	[HouseID] [int] NOT NULL,
	[FeatureID] [int] NOT NULL,
	[Weight] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FeaturesByHouse]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[FeaturesByHouse]
	AS 
	Select [HF].[HouseID] AS HouseID, [F].FeatureID As FeatureID, [F].[Name], [F].[Description], [F].[Weight] From HouseFeatures HF
    Left Join Features F on HF.FeatureID = F.FeatureID
GO
/****** Object:  Table [dbo].[HouseDetails]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseDetails](
	[HouseID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[ZillowUrl] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Houses] PRIMARY KEY CLUSTERED 
(
	[HouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Address] [nvarchar](max) NULL,
	[Latitude] [decimal](8, 6) NULL,
	[Longitude] [decimal](9, 6) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (1, N'Year Round Spring', N'Year Round Spring', 10, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (2, N'Partial Spring', N'Spring, not year round', 3, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (3, N'Pond', N'Pond on property', 8, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (4, N'Creek', N'Creek on property', 10, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (5, N'Acres_15plus', N'15+ acres', 5, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (6, N'Acres_20plus', N'20+ acres', 8, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (7, N'Acres_30plus', N'30+ acres', 10, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (8, N'Fencing', N'Fenced Area(s)', 6, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (9, N'Well', N'Private well on peoperty', 6, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (10, N'Outbuildings', N'Outbuildings', 2, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (11, N'Price_Under90', N'price under $90k', 10, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (12, N'Price_Under100', N'price under $100k', 7, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (13, N'Price_Under120', N'price under $120k', 4, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (14, N'Price_Under140', N'price under $140k', 2, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (15, N'Not Manufactured', N'Not a manufactured home', 4, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (16, N'Seclusion', N'Secluded from neighbors', 7, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (17, N'House Condition', N'House condition', 0, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (18, N'Land Layout', N'how desirable the land is', 0, 1)
SET IDENTITY_INSERT [dbo].[Features] OFF
GO
SET IDENTITY_INSERT [dbo].[HouseDetails] ON 

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (1, N'209 Gutter Rd, Harriet, AR 72639', CAST(88000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/209-Gutter-Rd,-Harriet,-AR-72639_rb/193984030_zpid/', N'images/house1.png', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (2, N'174 Fallen Tree Rd, Marshall, AR 72650', CAST(89900 AS Decimal(18, 0)), N'https://www.zillow.com/myzillow/favorites?mmlb=g,0', N'images/house2.jpg', 0)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (3, N'795 Oak Grove Rd, Amity, AR 71921', CAST(119000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/795-Oak-Grove-Rd,-Amity,-AR-71921_rb/232000920_zpid/', N'images/house3.jpg', 0)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (4, N'78 Gideons Ln, Gainesville, MO 65655', CAST(139900 AS Decimal(18, 0)), N'https://www.zillow.com/homes/78-Gideons-Ln,-Gainesville,-MO-65655_rb/2088265085_zpid/', N'images/house4.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (5, N'1836 Highway 374 E, Saint Joe, AR 72675', CAST(110000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/1836-Highway-374-E,-Saint-Joe,-AR-72675_rb/121570095_zpid/', N'images/house5.jpg', 0)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (7, N'815 Little Creek Ln, Calico Rock, AR 72519', CAST(95000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/815-Little-Creek-Ln-Calico-Rock-AR-72519/244098432_zpid/?utm_medium=referral', N'images/house6.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (8, N'1640 E Highway 374, Saint Joe, AR 72675', CAST(79900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/1640-E-Highway-374-Saint-Joe-AR-72675/117935865_zpid/?utm_medium=referral', N'images/house7.jpg', 0)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (9, N'4599 Brewer Rd, Edgemont, AR 72044', CAST(124900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/4599-Brewer-Rd-Edgemont-AR-72044/2078106983_zpid/?utm_medium=referra', N'images/house8.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (10, N'11941 State Highway 21 N, Doniphan, MO 63935', CAST(130000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/11941-State-Highway-21-N-Doniphan-MO-63935/2078606870_zpid/?utm_medium=referral', N'images/house10.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (11, N'1575 County Road 315, Squires, MO 65755', CAST(142500 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/1575-County-Road-315-Squires-MO-65755/2077944840_zpid/?utm_medium=referral', N'images/house11.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (12, N'1086 Blacks Ferry Rd, Pocahontas, AR 72455', CAST(125000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/1086-Blacks-Ferry-Rd-Pocahontas-AR-72455/232066475_zpid/?utm_medium=referral', N'images/house12.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (13, N'36961 State Highway 80, Danville, AR 72833', CAST(125000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/36961-State-Highway-80-Danville-AR-72833/2087883454_zpid/?utm_medium=referral', N'images/house13.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (14, N'6178 Hanover Rd, Mountain View, AR 72560', CAST(124900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/6178-Hanover-Rd-Mountain-View-AR-72560/109125915_zpid/?utm_medium=referral', N'images/house14.jpg', 0)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (15, N'3476 Highway 115 N, Pocahontas, AR 72455', CAST(84900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/3476-Highway-115-N-Pocahontas-AR-72455/2077762006_zpid/?utm_medium=referra', N'images/house15.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (16, N'324 Cherryville Rd, Salem, MO 65560', CAST(108000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/324-Cherryville-Rd-Salem-MO-65560/244192752_zpid/?utm_medium=referral', N'images/house16.jpg', 0)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (17, N'214 Parisi Ln, Booneville, AR 72927', CAST(119000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/214-Parisi-Ln-Booneville-AR-72927/228750205_zpid/?utm_medium=referral', N'images/house17.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (18, N'447 Highway 368, Prescott, AR 71857', CAST(70000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/447-Highway-368,-Prescott,-AR-71857_rb/239553121_zpid/', N'images/house18.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (19, N'20 Skinner Rd, Judsonia, AR 72081', CAST(124500 AS Decimal(18, 0)), N'https://www.zillow.com/homes/20-Skinner-Rd,-Judsonia,-AR-72081_rb/90845310_zpid/', N'images/house19.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (20, N'0 State Hwy Dd, Ava, MO 65608', CAST(62500 AS Decimal(18, 0)), N'https://www.zillow.com/homes/0-State-Hwy-Dd,-Ava,-MO-65608_rb/2082444211_zpid/', N'images/house20.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (21, N'303 County Road 15, Mountain Home, AR 72653', CAST(115000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/303-County-Road-15,-Mountain-Home,-AR-72653_rb/76087353_zpid/', N'images/house21.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (22, N'0 Dodd Mountain Rd, Shirley, AR 72153', CAST(135000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/0-Dodd-Mountain-Rd,-Shirley,-AR-72153_rb/2126240938_zpid/', N'images/house22.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (23, N'54 County Road 4061, Lafe, AR 72436', CAST(124900 AS Decimal(18, 0)), N'https://www.zillow.com/homes/54-County-Road-4061,-Lafe,-AR-72436_rb/108999750_zpid/', N'images/house23.jpg', 1)
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive]) VALUES (24, N'1680 Marion County #2061, Yellville, AR 72687', CAST(119900 AS Decimal(18, 0)), N'https://www.zillow.com/homes/1680-Marion-County-.num.2061,-Yellville,-AR-72687_rb/2077600851_zpid/', N'images/house24.jpg', 1)
SET IDENTITY_INSERT [dbo].[HouseDetails] OFF
GO
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 5, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 10, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 6, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (2, 5, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (2, 11, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (2, 8, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (3, 6, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 6, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 10, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 14, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (3, 13, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (5, 7, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (5, 10, 5)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (5, 13, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 2, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 12, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (8, 11, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (8, 10, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (8, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 14, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 7, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 9, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 14, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 7, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 3, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 8, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 6, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 3, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 1, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 6, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 8, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (13, 14, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (14, 3, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (14, 14, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (14, 8, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 11, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 5, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 9, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 3, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 8, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (16, 13, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (16, 3, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (16, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (14, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (2, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (3, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (5, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 9, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 13, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 7, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (13, 8, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 16, 1)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 18, 4)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 17, 9)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 16, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 17, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 18, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 16, 1)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 17, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 18, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 17, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 16, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 18, 5)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 17, 3)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 18, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 16, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 17, 10)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 16, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 18, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 10, 3)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 3, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 17, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 18, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 16, 9)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 16, 3)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 17, 5)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 18, 4)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 16, 5)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 17, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 18, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (16, 17, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (16, 16, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (16, 18, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (13, 17, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (13, 16, 2)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 11, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 7, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 11, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 17, 3)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 16, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 18, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 15, NULL)
GO
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 8, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 6, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 17, 5)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 3, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 4, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 10, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 16, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (20, 11, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (20, 6, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (20, 17, 2)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (20, 16, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (20, 15, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (21, 7, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (21, 13, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (21, 10, 4)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (21, 17, 5)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (21, 16, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (22, 4, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (22, 14, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (22, 17, 1)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (22, 16, 10)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (22, 18, 9)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (23, 7, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (23, 14, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (23, 3, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (23, 18, 10)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (23, 16, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 6, NULL)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 8, 3)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 17, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 10, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 18, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 16, 7)
GO
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'209 Gutter Rd, Harriet, AR 72639', CAST(36.041380 AS Decimal(8, 6)), CAST(-92.494070 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'174 Fallen Tree Rd, Marshall, AR 72650', CAST(35.985530 AS Decimal(8, 6)), CAST(-92.659560 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'795 Oak Grove Rd, Amity, AR 71921', CAST(34.247680 AS Decimal(8, 6)), CAST(-93.303010 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'78 Gideons Ln, Gainesville, MO 65655', CAST(36.500200 AS Decimal(8, 6)), CAST(-92.340530 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'1836 Highway 374 E, Saint Joe, AR 72675', CAST(36.047600 AS Decimal(8, 6)), CAST(-92.782460 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'815 Little Creek Ln, Calico Rock, AR 72519', CAST(36.130710 AS Decimal(8, 6)), CAST(-92.092050 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'1640 E Highway 374, Saint Joe, AR 72675', CAST(36.000990 AS Decimal(8, 6)), CAST(-92.757490 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'4599 Brewer Rd, Edgemont, AR 72044', CAST(35.629740 AS Decimal(8, 6)), CAST(-92.198310 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'538 Pleasant Run Rd, Mammoth Spring, AR 72554', CAST(36.474600 AS Decimal(8, 6)), CAST(-91.405090 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'11941 State Highway 21 N, Doniphan, MO 63935', CAST(36.529990 AS Decimal(8, 6)), CAST(-90.740430 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'1575 County Road 315, Squires, MO 65755', CAST(36.817344 AS Decimal(8, 6)), CAST(-92.585746 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'1086 Blacks Ferry Rd, Pocahontas, AR 72455', CAST(36.304176 AS Decimal(8, 6)), CAST(-91.052600 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'36961 State Highway 80, Danville, AR 72833', CAST(34.963189 AS Decimal(8, 6)), CAST(-93.706020 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'6178 Hanover Rd, Mountain View, AR 72560', CAST(35.773736 AS Decimal(8, 6)), CAST(-92.127767 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'3476 Highway 115 N, Pocahontas, AR 72455', CAST(36.297406 AS Decimal(8, 6)), CAST(-90.970228 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'324 Cherryville Rd, Salem, MO 65560', CAST(37.853330 AS Decimal(8, 6)), CAST(-91.329189 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'3314 Old 12 Cross Rds, Chester, AR 72934', CAST(35.708194 AS Decimal(8, 6)), CAST(-92.247027 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'214 Parisi Ln, Booneville, AR 72927', CAST(35.058182 AS Decimal(8, 6)), CAST(-93.884800 AS Decimal(9, 6)))
GO
ALTER TABLE [dbo].[HouseFeatures]  WITH CHECK ADD  CONSTRAINT [FK_FeatureID_ToFeatureID] FOREIGN KEY([FeatureID])
REFERENCES [dbo].[Features] ([FeatureID])
GO
ALTER TABLE [dbo].[HouseFeatures] CHECK CONSTRAINT [FK_FeatureID_ToFeatureID]
GO
ALTER TABLE [dbo].[HouseFeatures]  WITH CHECK ADD  CONSTRAINT [FK_HouseID_ToHouseID] FOREIGN KEY([HouseID])
REFERENCES [dbo].[HouseDetails] ([HouseID])
GO
ALTER TABLE [dbo].[HouseFeatures] CHECK CONSTRAINT [FK_HouseID_ToHouseID]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteFeatureByHouseID]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spDeleteFeatureByHouseID]
	@HouseID int,
	@FeatureID int
AS
Begin
Set nocount on
	delete from HouseFeatures where HouseID=@HouseID and FeatureID = @FeatureID
end
GO
/****** Object:  StoredProcedure [dbo].[spEditFeatureWeight]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spEditFeatureWeight]
	
	@Weight int,
	@FeatureID int,
	@HouseID int
AS
Begin
Set Nocount on
	update [HouseFeatures] set Weight = @Weight where FeatureID = @FeatureID and HouseID = @HouseID
end
GO
/****** Object:  StoredProcedure [dbo].[spGetAllActiveHouseDetails]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spGetAllActiveHouseDetails]
	AS
Begin
Set nocount on 
 Select [HouseID]
      ,[Address]
      ,[Price]
      ,[ZillowUrl]
      ,[ImageUrl]
      ,[IsActive]
  FROM [Houses].[dbo].[HouseDetails]
  Where [IsActive] = 1
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAllFeatures]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spGetAllFeatures]
	
AS
Begin
Set nocount on
	select FeatureID, [Name], [Description], [IsEditable] from Features
end
GO
/****** Object:  StoredProcedure [dbo].[spGetAllHouseDetails]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spGetAllHouseDetails]
	
AS
Begin
Set nocount on 
 Select [HouseID]
      ,[Address]
      ,[Price]
      ,[ZillowUrl]
      ,[ImageUrl]
      ,[IsActive]
  FROM [Houses].[dbo].[HouseDetails]
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAllHouseFeatures]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spGetAllHouseFeatures]
	
AS
Begin
Set nocount on
    select HouseFeatures.HouseID, HouseFeatures.FeatureID, Features.Description, Features.IsEditable,
  Case when HouseFeatures.Weight is null then Features.Weight else HouseFeatures.Weight end As Weight
  from HouseFeatures
  Inner join Features on HouseFeatures.FeatureID = Features.FeatureID
end
GO
/****** Object:  StoredProcedure [dbo].[spGetFeatureByFeatureID]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spGetFeatureByFeatureID]
		@FeatureID int
AS
Begin
Set nocount on
	Select FeatureID, Name, Description, Weight, IsEditable
	from Features
	Where FeatureID = @FeatureID
End
GO
/****** Object:  StoredProcedure [dbo].[spGetFeaturesByHouseID]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spGetFeaturesByHouseID]
	@HouseID int
	
AS
Begin
Set nocount on 
  select HF.HouseID AS HouseID, FEA.FeatureID AS FeatureID, FEA.Name, FEA.Description, FEA.IsEditable,
  Case When HF.Weight is null Then FEA.Weight Else HF.Weight End As Weight from HouseFeatures AS HF
                        Left Join Features AS FEA On HF.FeatureID = FEA.FeatureID 
						where HouseID = @HouseID
end
GO
/****** Object:  StoredProcedure [dbo].[spGetFeatureWeight]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spGetFeatureWeight]
	@FeatureID int
AS
Begin
Set nocount on
	Select Weight
	from Features
	Where FeatureID = @FeatureID
End
GO
/****** Object:  StoredProcedure [dbo].[spGetMapMarkerByAddress]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spGetMapMarkerByAddress]
	@Address varchar(MAX)
AS
Begin
Set nocount on
	Select Latitude, Longitude from Locations where [Address] = @Address
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertNewHouseFeature]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spInsertNewHouseFeature]
	@HouseID int,
	@FeatureID int,
	@Weight int
AS
Begin
Set nocount on

	Insert into HouseFeatures (HouseID, FeatureID, Weight) 
	values (@HouseID, @FeatureID, @Weight)

	--Declare @storedWeight INT;
	--Select @storedWeight = Weight
	--from Features
	--where FeatureID = @FeatureID

	--Select @storedWeight;

	--if @storedWeight = @Weight
	--Begin
	--Insert into HouseFeatures (HouseID, FeatureID, Weight) 
 --                       values (@HouseID, @FeatureID, NULL)
	--End

	--Else

	--Begin
	--Insert into HouseFeatures (HouseID, FeatureID, Weight) 
 --                       values (@HouseID, @FeatureID, @Weight)
	--End

end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateHouseDetails]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spUpdateHouseDetails]
	@Address nvarchar(50),
	@Price decimal(18, 0),
	@ZillowUrl nvarchar(MAX),
	@ImageUrl nvarchar(MAX),
	@HouseID int,
	@IsActive bit
AS
Begin
Set Nocount on
	update HouseDetails set Address = @Address, Price = @Price, ZillowUrl = @ZillowUrl, ImageUrl = @ImageUrl, IsActive = @IsActive where HouseID = @HouseID
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateHouseFeatures]    Script Date: 10/6/2020 10:21:47 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spUpdateHouseFeatures]
	@FeatureID int,
	@HouseID int,
	@PreviousFeatureID int
AS
Begin
Set Nocount on
	update HouseFeatures set FeatureID = @FeatureID where HouseID=@HouseID and FeatureID = @PreviousFeatureID
end
GO
USE [master]
GO
ALTER DATABASE [Houses] SET  READ_WRITE 
GO
