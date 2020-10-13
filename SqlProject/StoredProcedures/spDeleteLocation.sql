CREATE PROCEDURE [dbo].[spDeleteLocation]
	@HouseID int
	
AS
Begin
Set nocount on
	delete from Locations where HouseID=@HouseID
end
