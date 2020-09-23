CREATE PROCEDURE [dbo].[spGetMapMarkerByAddress]
	@Address varchar(MAX)
AS
Begin
Set nocount on
	Select Latitude, Longitude from Locations where [Address] = @Address
end
