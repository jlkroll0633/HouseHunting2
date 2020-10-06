/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

if not exists (Select Top (1) * from Features)
begin

SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (1, N'Water', N'water on property', 0, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (2, N'Acerage', N'Acerage', 0, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (3, N'Price', N'Selling price', 0, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (4, N'House Condition', N'Condition of house', 0, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (5, N'Seclusion', N'Seclusion from people', 0, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (6, N'Land Layout', N'Layout of land', 0, 1)

SET IDENTITY_INSERT [dbo].[Features] OFF

end
GO

if not exists (Select Top (1) * from HouseDetails)
begin 

SET IDENTITY_INSERT [dbo].[HouseDetails] ON 
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (1, N'209 Gutter Rd, Harriet, AR 72639', CAST(79000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/209-Gutter-Rd,-Harriet,-AR-72639_rb/193984030_zpid/', N'images/house1.png', 1, N'11 or 16 acres?')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (2, N'174 Fallen Tree Rd, Marshall, AR 72650', CAST(89900 AS Decimal(18, 0)), N'https://www.zillow.com/myzillow/favorites?mmlb=g,0', N'images/house2.jpg', 0, NULL)

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (3, N'795 Oak Grove Rd, Amity, AR 71921', CAST(119000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/795-Oak-Grove-Rd,-Amity,-AR-71921_rb/232000920_zpid/', N'images/house3.jpg', 0, NULL)

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (4, N'78 Gideons Ln, Gainesville, MO 65655', CAST(139900 AS Decimal(18, 0)), N'https://www.zillow.com/homes/78-Gideons-Ln,-Gainesville,-MO-65655_rb/2088265085_zpid/', N'images/house4.jpg', 1, N'20 acres, large outbuildings, partially cleared')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (5, N'1836 Highway 374 E, Saint Joe, AR 72675', CAST(110000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/1836-Highway-374-E,-Saint-Joe,-AR-72675_rb/121570095_zpid/', N'images/house5.jpg', 0, N'30 acres, lots small buildings like chick coop, mostly wooded, marked trails?')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (7, N'815 Little Creek Ln, Calico Rock, AR 72519', CAST(95000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/815-Little-Creek-Ln-Calico-Rock-AR-72519/244098432_zpid/?utm_medium=referral', N'images/house6.jpg', 1, N'25 acres, foreclosed, prision, creek/pond on property (?)')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (8, N'1640 E Highway 374, Saint Joe, AR 72675', CAST(79900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/1640-E-Highway-374-Saint-Joe-AR-72675/117935865_zpid/?utm_medium=referral', N'images/house7.jpg', 0, NULL)

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (9, N'4599 Brewer Rd, Edgemont, AR 72044', CAST(124900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/4599-Brewer-Rd-Edgemont-AR-72044/2078106983_zpid/?utm_medium=referra', N'images/house8.jpg', 1, N'40 acres, mobile home, wood stove, SOLAR, well, some fencing, hard to tell location')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (10, N'11941 State Highway 21 N, Doniphan, MO 63935', CAST(130000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/11941-State-Highway-21-N-Doniphan-MO-63935/2078606870_zpid/?utm_medium=referral', N'images/house10.jpg', 1, N'30 acres, 2 ponds, fencing, outbuildings, 2 homes (1 unfinished), close neighbors')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (11, N'1575 County Road 315, Squires, MO 65755', CAST(142500 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/1575-County-Road-315-Squires-MO-65755/2077944840_zpid/?utm_medium=referral', N'images/house11.jpg', 1, N'23 acres, 2 ponds, spring')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (12, N'1086 Blacks Ferry Rd, Pocahontas, AR 72455', CAST(125000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/1086-Blacks-Ferry-Rd-Pocahontas-AR-72455/232066475_zpid/?utm_medium=referral', N'images/house12.jpg', 1, N'22 acres, fencing, a lot of pasture')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (13, N'36961 State Highway 80, Danville, AR 72833', CAST(125000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/36961-State-Highway-80-Danville-AR-72833/2087883454_zpid/?utm_medium=referral', N'images/house13.jpg', 1, N'10 acres, some fencing, some outbuildings, not sure where it is exactly')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (14, N'6178 Hanover Rd, Mountain View, AR 72560', CAST(124900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/6178-Hanover-Rd-Mountain-View-AR-72560/109125915_zpid/?utm_medium=referral', N'images/house14.jpg', 0, NULL)

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (15, N'3476 Highway 115 N, Pocahontas, AR 72455', CAST(84900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/3476-Highway-115-N-Pocahontas-AR-72455/2077762006_zpid/?utm_medium=referra', N'images/house15.jpg', 1, N'14 acres, well, stocked pond (HUGE), 3 timber acres, mostly fenced, outbuildings, access road?')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (16, N'324 Cherryville Rd, Salem, MO 65560', CAST(108000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/324-Cherryville-Rd-Salem-MO-65560/244192752_zpid/?utm_medium=referral', N'images/house16.jpg', 0, NULL)

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (17, N'214 Parisi Ln, Booneville, AR 72927', CAST(119000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/214-Parisi-Ln-Booneville-AR-72927/228750205_zpid/?utm_medium=referral', N'images/house17.jpg', 1, N'33 acres, 2 buildings (1 unfinished) both solar powered, septic and well, mostly wooded')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (18, N'447 Highway 368, Prescott, AR 71857', CAST(70000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/447-Highway-368,-Prescott,-AR-71857_rb/239553121_zpid/', N'images/house18.jpg', 1, N'40 acres, house looks like it need work')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (19, N'20 Skinner Rd, Judsonia, AR 72081', CAST(124500 AS Decimal(18, 0)), N'https://www.zillow.com/homes/20-Skinner-Rd,-Judsonia,-AR-72081_rb/90845310_zpid/', N'images/house19.jpg', 1, N'22 acres, fenced, 2 stocked ponds, lg creek, shop, house needs some work')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (20, N'0 State Hwy Dd, Ava, MO 65608', CAST(62500 AS Decimal(18, 0)), N'https://www.zillow.com/homes/0-State-Hwy-Dd,-Ava,-MO-65608_rb/2082444211_zpid/', N'images/house20.jpg', 1, N'25 acres, needs tons of work, looks very wooded')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (21, N'303 County Road 15, Mountain Home, AR 72653', CAST(115000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/303-County-Road-15,-Mountain-Home,-AR-72653_rb/76087353_zpid/', N'images/house21.jpg', 1, N'40 acres, mobile home, storm shelter, garage')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (22, N'0 Dodd Mountain Rd, Shirley, AR 72153', CAST(135000 AS Decimal(18, 0)), N'https://www.zillow.com/homes/0-Dodd-Mountain-Rd,-Shirley,-AR-72153_rb/2126240938_zpid/', N'images/house22.jpg', 1, N'20 acres, needs everything, creek, no minerals')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (23, N'54 County Road 4061, Lafe, AR 72436', CAST(124900 AS Decimal(18, 0)), N'https://www.zillow.com/homes/54-County-Road-4061,-Lafe,-AR-72436_rb/108999750_zpid/', N'images/house23.jpg', 1, N'40 acres, spring fed pond, shop, fully fenced, garage')

INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl], [IsActive], [Notes]) VALUES (24, N'1680 Marion County #2061, Yellville, AR 72687', CAST(119900 AS Decimal(18, 0)), N'https://www.zillow.com/homes/1680-Marion-County-.num.2061,-Yellville,-AR-72687_rb/2077600851_zpid/', N'images/house24.jpg', 1, N'20 acres, some fencing, can''t locate it')
SET IDENTITY_INSERT [dbo].[HouseDetails] OFF

end
GO

if not exists (Select Top (1) * from HouseFeatures)
begin
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 1, 0)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 2, 3)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 3, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 4, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 5, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (1, 6, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 1, 0)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 2, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 3, 1)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 4, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 5, 7)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (4, 6, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 1, 8)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 2, 7)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 3, 8)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 5, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 6, 7)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (7, 4, 9)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 1, 4)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 2, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 3, 4)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 4, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 5, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (9, 6, 7)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 1, 9)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 2, 8)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 3, 2)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 5, 2)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 6, 7)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (10, 4, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 1, 9)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 2, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 3, 0)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 4, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 5, 1)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (11, 6, 3)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 1, 1)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 2, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 3, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 4, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 5, 4)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (12, 6, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (13, 1, 0)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (13, 2, 0)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (13, 3, 4)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (13, 4, 7)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (13, 5, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (13, 6, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 1, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 2, 4)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 3, 9)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 4, 8)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 5, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (15, 6, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 1, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 2, 8)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 3, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 4, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 5, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (17, 6, 8)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 1, 1)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 2, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 3, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 4, 2)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 5, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (18, 6, 7)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 1, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 2, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 3, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 4, 4)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 5, 9)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (19, 6, 7)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (20, 1, 0)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (20, 2, 7)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (20, 3, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (20, 4, 1)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (20, 5, 7)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (20, 6, 7)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (21, 1, 1)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (21, 2, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (21, 3, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (21, 4, 4)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (21, 5, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (21, 6, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (22, 1, 8)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (22, 2, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (22, 3, 3)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (22, 4, 1)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (22, 5, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (22, 6, 8)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (5, 1, 1)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (23, 1, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (23, 2, 10)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (23, 3, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (23, 4, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (23, 5, 9)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (23, 6, 9)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 1, 1)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 2, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 3, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 4, 6)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 5, 5)

INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID], [Weight]) VALUES (24, 6, 5)

end
Go

if not exists (Select Top (1) * from Locations)
begin
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
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'447 Highway 368, Prescott, AR 71857', CAST(33.753473 AS Decimal(8, 6)), CAST(-93.108778 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'20 Skinner Rd, Judsonia, AR 72081', CAST(35.534302 AS Decimal(8, 6)), CAST(-91.649323 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'0 State Hwy Dd, Ava, MO 65608', CAST(36.858548 AS Decimal(8, 6)), CAST(-92.842531 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'303 County Road 15, Mountain Home, AR 72653', CAST(36.428468 AS Decimal(8, 6)), CAST(-92.465052 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'0 Dodd Mountain Rd, Shirley, AR 72153', CAST(35.656427 AS Decimal(8, 6)), CAST(-92.383587 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'54 County Road 4061, Lafe, AR 72436', CAST(36.279544 AS Decimal(8, 6)), CAST(-90.437365 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([Address], [Latitude], [Longitude]) VALUES (N'1680 Marion County #2061, Yellville, AR 72687', CAST(36.440776 AS Decimal(8, 6)), CAST(-92.816345 AS Decimal(9, 6)))

end
Go