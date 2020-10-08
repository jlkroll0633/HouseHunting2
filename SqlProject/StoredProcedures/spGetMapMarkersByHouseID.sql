CREATE PROCEDURE [dbo].[spGetMapMarkerByHouseID]
	@HouseID int
AS
Begin
Set nocount on
	Select Latitude, Longitude from Locations where [HouseID] = @HouseID
end
