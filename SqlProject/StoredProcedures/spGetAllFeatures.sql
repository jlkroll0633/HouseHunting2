CREATE PROCEDURE [dbo].[spGetAllFeatures]
	
AS
Begin
Set nocount on
	select FeatureID, [Name], [Description], [IsEditable] from Features
end
