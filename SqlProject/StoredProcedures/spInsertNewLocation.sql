CREATE PROCEDURE [dbo].[spInsertNewLocation]
	@HouseID int,
	@Latitude DECIMAL(8, 6),
	@Longitude DECIMAL(9, 6)
AS
Begin
Set nocount on

	Insert into Locations(HouseID, Latitude, Longitude) 
	values (@HouseID, @Latitude, @Longitude)

	
end
