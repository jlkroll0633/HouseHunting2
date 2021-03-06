USE [master]
GO
/****** Object:  Database [Houses]    Script Date: 9/24/2020 1:19:01 PM ******/
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
/****** Object:  User [spAccessOnly]    Script Date: 9/24/2020 1:19:01 PM ******/
CREATE USER [spAccessOnly] FOR LOGIN [spAccessOnly] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [dbStoredProcedureAccessOnly]    Script Date: 9/24/2020 1:19:01 PM ******/
CREATE ROLE [dbStoredProcedureAccessOnly]
GO
ALTER ROLE [dbStoredProcedureAccessOnly] ADD MEMBER [spAccessOnly]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 9/24/2020 1:19:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[FeatureID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Weight] [int] NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseFeatures]    Script Date: 9/24/2020 1:19:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseFeatures](
	[HouseID] [int] NOT NULL,
	[FeatureID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FeaturesByHouse]    Script Date: 9/24/2020 1:19:01 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[FeaturesByHouse]
	AS 
	Select [HF].[HouseID] AS HouseID, [F].FeatureID As FeatureID, [F].[Name], [F].[Description], [F].[Weight] From HouseFeatures HF
    Left Join Features F on HF.FeatureID = F.FeatureID
GO
/****** Object:  Table [dbo].[HouseDetails]    Script Date: 9/24/2020 1:19:01 PM ******/
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
 CONSTRAINT [PK_Houses] PRIMARY KEY CLUSTERED 
(
	[HouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 9/24/2020 1:19:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Address] [nvarchar](max) NOT NULL,
	[Latitude] [decimal](8, 6) NULL,
	[Longitude] [decimal](9, 6) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (1, N'Year Round Spring', N'Year Round Spring', 10)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (2, N'Partial Spring', N'Spring, not year round', 3)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (3, N'Pond', N'Pond on property', 8)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (4, N'Creek', N'Creek on property', 10)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (5, N'Acres_15plus', N'15+ acres', 5)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (6, N'Acres_20plus', N'20+ acres', 8)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (7, N'Acres_30plus', N'30+ acres', 10)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (8, N'Fencing', N'Fenced Area(s)', 6)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (9, N'Well', N'Private well on peoperty', 6)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (10, N'Outbuildings', N'Outbuildings', 4)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (11, N'Price_Under90', N'price under $90k', 10)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (12, N'Price_Under100', N'price under $100k', 7)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (13, N'Price_Under120', N'price under $120k', 4)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (14, N'Price_Under140', N'price under $140k', 2)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (15, N'Not Manufactured', N'Not a manufactured home', 4)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (16, N'Seclusion', N'Secluded from neighbors', 7)
SET IDENTITY_INSERT [dbo].[Features] OFF
SET IDENTITY_INSERT [dbo].[HouseDetails] ON 

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (1, N'209 Gutter Rd, Harriet, AR 72639', CAST(88000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/209-Gutter-Rd,-Harriet,-AR-72639_rb/193984030_zpid/', N'images/house1.png')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (2, N'174 Fallen Tree Rd, Marshall, AR 72650', CAST(89900 AS Decimal(18, 0)), N'https://www.zillow.com/myzillow/favorites?mmlb=g,0', N'images/house2.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (3, N'795 Oak Grove Rd, Amity, AR 71921', CAST(119000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/795-Oak-Grove-Rd,-Amity,-AR-71921_rb/232000920_zpid/', N'images/house3.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (4, N'78 Gideons Ln, Gainesville, MO 65655', CAST(139900 AS Decimal(18, 0)), N'https://www.zillow.com/homes/78-Gideons-Ln,-Gainesville,-MO-65655_rb/2088265085_zpid/', N'images/house4.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (5, N'1836 Highway 374 E, Saint Joe, AR 72675', CAST(110000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/1836-Highway-374-E,-Saint-Joe,-AR-72675_rb/121570095_zpid/', N'images/house5.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (7, N'815 Little Creek Ln, Calico Rock, AR 72519', CAST(95000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/815-Little-Creek-Ln-Calico-Rock-AR-72519/244098432_zpid/?utm_medium=referral', N'images/house6.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (8, N'1640 E Highway 374, Saint Joe, AR 72675', CAST(79900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/1640-E-Highway-374-Saint-Joe-AR-72675/117935865_zpid/?utm_medium=referral', N'images/house7.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (9, N'4599 Brewer Rd, Edgemont, AR 72044', CAST(124900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/4599-Brewer-Rd-Edgemont-AR-72044/2078106983_zpid/?utm_medium=referra', N'images/house8.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (10, N'11941 State Highway 21 N, Doniphan, MO 63935', CAST(130000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/11941-State-Highway-21-N-Doniphan-MO-63935/2078606870_zpid/?utm_medium=referral', N'images/house10.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (11, N'1575 County Road 315, Squires, MO 65755', CAST(142500 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/1575-County-Road-315-Squires-MO-65755/2077944840_zpid/?utm_medium=referral', N'images/house11.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (12, N'1086 Blacks Ferry Rd, Pocahontas, AR 72455', CAST(125000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/1086-Blacks-Ferry-Rd-Pocahontas-AR-72455/232066475_zpid/?utm_medium=referral', N'images/house12.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (13, N'36961 State Highway 80, Danville, AR 72833', CAST(125000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/36961-State-Highway-80-Danville-AR-72833/2087883454_zpid/?utm_medium=referral', N'images/house13.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (14, N'6178 Hanover Rd, Mountain View, AR 72560', CAST(124900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/6178-Hanover-Rd-Mountain-View-AR-72560/109125915_zpid/?utm_medium=referral', N'images/house14.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (15, N'3476 Highway 115 N, Pocahontas, AR 72455', CAST(84900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/3476-Highway-115-N-Pocahontas-AR-72455/2077762006_zpid/?utm_medium=referra', N'images/house14.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (16, N'324 Cherryville Rd, Salem, MO 65560', CAST(108000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/324-Cherryville-Rd-Salem-MO-65560/244192752_zpid/?utm_medium=referral', N'images/house14.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (17, N'214 Parisi Ln, Booneville, AR 72927', CAST(119000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/214-Parisi-Ln-Booneville-AR-72927/228750205_zpid/?utm_medium=referral', N'images/house14.jpg')
SET IDENTITY_INSERT [dbo].[HouseDetails] OFF
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (1, 5)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (1, 10)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (7, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (2, 5)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (2, 11)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (2, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (3, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (4, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (4, 10)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (4, 14)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (3, 13)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (5, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (5, 10)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (5, 13)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (7, 2)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (7, 12)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (7, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (8, 11)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (8, 10)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (8, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (9, 14)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (9, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (9, 9)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (10, 14)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (10, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (10, 3)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (10, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (11, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (11, 3)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (11, 1)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (12, 6)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (12, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (12, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (11, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (10, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (13, 14)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (14, 3)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (14, 14)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (14, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (15, 11)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (15, 5)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (15, 9)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (15, 3)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (15, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (16, 13)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (16, 3)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (16, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (15, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (14, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (1, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (2, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (3, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (4, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (5, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (17, 9)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (17, 13)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (17, 7)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (17, 15)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (13, 8)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (1, 11)
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
/****** Object:  StoredProcedure [dbo].[spDeleteFeatureByHouseID]    Script Date: 9/24/2020 1:19:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spDeleteHouse]    Script Date: 9/24/2020 1:19:02 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spDeleteHouse]
	@HouseID int,
	@FeatureID int
AS
Begin
Set nocount on
	delete from HouseFeatures where HouseID=@HouseID and FeatureID = @FeatureID
end
GO
/****** Object:  StoredProcedure [dbo].[spFeaturesByHouse]    Script Date: 9/24/2020 1:19:02 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spFeaturesByHouse]
	@HouseID int
AS
Begin
Set nocount on 

	SELECT H.HouseID, F.FeatureID, F.Name, F.Description, F.Weight 
	FROM HouseFeatures H
	Left Join Features F On H.FeatureID = F.FeatureID
	where H.HouseID = @HouseID
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAllFeatures]    Script Date: 9/24/2020 1:19:02 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spGetAllFeatures]
	
AS
Begin
Set nocount on
	select FeatureID, [Name], [Description] from Features
end
GO
/****** Object:  StoredProcedure [dbo].[spGetAllHouseDetails]    Script Date: 9/24/2020 1:19:02 PM ******/
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
  FROM [Houses].[dbo].[HouseDetails]
End
GO
/****** Object:  StoredProcedure [dbo].[spGetFeaturesByHouseID]    Script Date: 9/24/2020 1:19:02 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spGetFeaturesByHouseID]
	@HouseID int
	
AS
Begin
Set nocount on 
	select HouseFeatures.HouseID, Features.FeatureID, Name, Description, Weight from HouseFeatures 
                        Left Join Features On HouseFeatures.FeatureID = Features.FeatureID 
						where HouseID = @HouseID
end
GO
/****** Object:  StoredProcedure [dbo].[spGetMapMarkerByAddress]    Script Date: 9/24/2020 1:19:02 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spInsertNewHouse]    Script Date: 9/24/2020 1:19:02 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spInsertNewHouse]
	@HouseID int,
	@FeatureID int
AS
Begin
Set nocount on
	Insert into HouseFeatures (HouseID, FeatureID) 
                        values (@HouseID, @FeatureID)
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateHouseDetails]    Script Date: 9/24/2020 1:19:02 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spUpdateHouseDetails]
	@Address nvarchar(50),
	@Price decimal(18, 0),
	@ZillowUrl nvarchar(MAX),
	@ImageUrl nvarchar(MAX),
	@HouseID int
AS
Begin
Set Nocount on
	update HouseDetails set Address = @Address, Price = @Price, ZillowUrl = @ZillowUrl, ImageUrl = @ImageUrl where HouseID = @HouseID
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateHouseFeatures]    Script Date: 9/24/2020 1:19:02 PM ******/
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
