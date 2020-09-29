CREATE PROCEDURE [dbo].[spGetFeaturesByHouseID]
	@HouseID int
	
AS
Begin
Set nocount on 
  select HF.HouseID AS HouseID, FEA.FeatureID AS FeatureID, FEA.Name, FEA.Description, FEA.IsEditable,
  Case When HF.Weight is null Then FEA.Weight Else HF.Weight End As Weight from HouseFeatures AS HF
                        Left Join Features AS FEA On HF.FeatureID = FEA.FeatureID 
						where HouseID = @HouseID
end
