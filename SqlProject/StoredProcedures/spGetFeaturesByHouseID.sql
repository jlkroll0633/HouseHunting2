CREATE PROCEDURE [dbo].[spGetFeaturesByHouseID]
	@HouseID int
	
AS
Begin
Set nocount on 
	select HouseFeatures.HouseID, Features.FeatureID, Name, Description, Weight from HouseFeatures 
                        Left Join Features On HouseFeatures.FeatureID = Features.FeatureID 
						where HouseID = @HouseID
end
