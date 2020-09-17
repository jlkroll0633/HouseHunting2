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
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (13, N'Price_Under120', N'price under $100k', 4)
INSERT [dbo].[Features] ([FeatureID], [Name], [Description], [Weight]) VALUES (14, N'Price_Under140', N'price under $140k', 2)
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
SET IDENTITY_INSERT [dbo].[HouseDetails] OFF

end
GO

if not exists (Select Top (1) * from HouseFeatures)
begin
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (1, 11)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (1, 5)
INSERT [dbo].[HouseFeatures] ([HouseID], [FeatureID]) VALUES (1, 10)
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
end