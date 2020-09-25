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

INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (1, N'Year Round Spring', N'Year Round Spring', 10, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (2, N'Partial Spring', N'Spring, not year round', 3, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (3, N'Pond', N'Pond on property', 8, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (4, N'Creek', N'Creek on property', 10, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (5, N'Acres_15plus', N'15+ acres', 5, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (6, N'Acres_20plus', N'20+ acres', 8, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (7, N'Acres_30plus', N'30+ acres', 10, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (8, N'Fencing', N'Fenced Area(s)', 6, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (9, N'Well', N'Private well on peoperty', 6, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (10, N'Outbuildings', N'Outbuildings', 4, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (11, N'Price_Under90', N'price under $90k', 10, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (12, N'Price_Under100', N'price under $100k', 7, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (13, N'Price_Under120', N'price under $120k', 4, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (14, N'Price_Under140', N'price under $140k', 2, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (15, N'Not Manufactured', N'Not a manufactured home', 4, 0)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (16, N'Seclusion', N'Secluded from neighbors', 7, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (17, N'House Condition', N'House condition', 0, 1)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight], [IsEditable]) VALUES (18, N'Land Layout', N'how desirable the land is', 0, 1)
SET IDENTITY_INSERT [dbo].[Features] OFF

end
GO

if not exists (Select Top (1) * from HouseDetails)
begin 

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
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (15, N'3476 Highway 115 N, Pocahontas, AR 72455', CAST(84900 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/3476-Highway-115-N-Pocahontas-AR-72455/2077762006_zpid/?utm_medium=referra', N'images/house15.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (16, N'324 Cherryville Rd, Salem, MO 65560', CAST(108000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/324-Cherryville-Rd-Salem-MO-65560/244192752_zpid/?utm_medium=referral', N'images/house16.jpg')
INSERT [dbo].[HouseDetails] ([HouseID], [Address], [Price], [ZillowUrl], [ImageUrl]) VALUES (17, N'214 Parisi Ln, Booneville, AR 72927', CAST(119000 AS Decimal(18, 0)), N'https://www.zillow.com/homedetails/214-Parisi-Ln-Booneville-AR-72927/228750205_zpid/?utm_medium=referral', N'images/house17.jpg')
SET IDENTITY_INSERT [dbo].[HouseDetails] OFF

end
GO

if not exists (Select Top (1) * from HouseFeatures)
begin
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
end
Go