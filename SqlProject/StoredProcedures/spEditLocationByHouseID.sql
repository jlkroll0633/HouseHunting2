CREATE PROCEDURE [dbo].[spEditLocationByHouseID]
	@HouseID int,
	@Latitude decimal(8, 6),
	@Longitude decimal(9, 6)
AS
Begin
Set nocount on
	update Locations set Latitude = @Latitude, Longitude = @Longitude
	Where HouseID = @HouseID
End