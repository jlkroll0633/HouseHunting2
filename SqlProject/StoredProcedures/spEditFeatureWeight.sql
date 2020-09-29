CREATE PROCEDURE [dbo].[spEditFeatureWeight]
	
	@Weight int,
	@FeatureID int,
	@HouseID int
AS
Begin
Set Nocount on
	update [HouseFeatures] set Weight = @Weight where FeatureID = @FeatureID and HouseID = @HouseID
end
