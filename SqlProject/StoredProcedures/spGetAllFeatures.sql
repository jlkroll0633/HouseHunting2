CREATE PROCEDURE [dbo].[spGetAllFeatures]
	
AS
Begin
Set nocount on
	select FeatureID, [Name], [Description] from Features
end
