CREATE PROCEDURE [dbo].[spGetAllHouseFeatures]
	
AS
Begin
Set nocount on
    select HouseFeatures.HouseID, HouseFeatures.FeatureID, Features.Description, Features.IsEditable,
  Case when HouseFeatures.Weight is null then Features.Weight else HouseFeatures.Weight end As Weight
  from HouseFeatures
  Inner join Features on HouseFeatures.FeatureID = Features.FeatureID
end
