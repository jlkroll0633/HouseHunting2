CREATE PROCEDURE [dbo].[spUpdateHouseFeatures]
	@FeatureID int,
	@HouseID int,
	@PreviousFeatureID int
AS
Begin
Set Nocount on
	update HouseFeatures set FeatureID = @FeatureID where HouseID=@HouseID and FeatureID = @PreviousFeatureID
end
