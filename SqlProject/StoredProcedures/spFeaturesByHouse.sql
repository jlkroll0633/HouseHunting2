CREATE PROCEDURE [dbo].[spFeaturesByHouse]
	@HouseID int = 1
AS
Begin
Set nocount on 

	SELECT H.HouseID, F.FeatureID, F.Name, F.Description, F.Weight 
	FROM HouseFeatures H
	Left Join Features F On H.FeatureID = F.FeatureID
	where H.HouseID = @HouseID
End
