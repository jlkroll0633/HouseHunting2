CREATE PROCEDURE [dbo].[spInsertNewHouseFeature]
	@HouseID int,
	@FeatureID int,
	@Weight int
AS
Begin
Set nocount on

	Insert into HouseFeatures (HouseID, FeatureID, Weight) 
	values (@HouseID, @FeatureID, @Weight)

	--Declare @storedWeight INT;
	--Select @storedWeight = Weight
	--from Features
	--where FeatureID = @FeatureID

	--Select @storedWeight;

	--if @storedWeight = @Weight
	--Begin
	--Insert into HouseFeatures (HouseID, FeatureID, Weight) 
 --                       values (@HouseID, @FeatureID, NULL)
	--End

	--Else

	--Begin
	--Insert into HouseFeatures (HouseID, FeatureID, Weight) 
 --                       values (@HouseID, @FeatureID, @Weight)
	--End

end
