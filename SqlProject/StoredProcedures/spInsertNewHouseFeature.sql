CREATE PROCEDURE [dbo].[spInsertNewHouseFeature]
	@HouseID int,
	@FeatureID int,
	@Weight int
AS
Begin
Set nocount on
	Insert into HouseFeatures (HouseID, FeatureID, Weight) 
                        values (@HouseID, @FeatureID, @Weight)
end
