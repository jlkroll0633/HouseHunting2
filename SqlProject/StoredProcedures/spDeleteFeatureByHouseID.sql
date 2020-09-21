CREATE PROCEDURE [dbo].[spDeleteFeatureByHouseID]
	@HouseID int,
	@FeatureID int
AS
Begin
Set nocount on
	delete from HouseFeatures where HouseID=@HouseID and FeatureID = @FeatureID
end
