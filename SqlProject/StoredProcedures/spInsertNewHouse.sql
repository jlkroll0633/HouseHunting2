CREATE PROCEDURE [dbo].[spInsertNewHouse]
	@HouseID int,
	@FeatureID int
AS
Begin
Set nocount on
	Insert into HouseFeatures (HouseID, FeatureID) 
                        values (@HouseID, @FeatureID)
end
