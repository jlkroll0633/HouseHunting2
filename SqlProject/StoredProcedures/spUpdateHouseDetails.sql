CREATE PROCEDURE [dbo].[spUpdateHouseDetails]
	@Address nvarchar(50),
	@Price decimal(18, 0),
	@ZillowUrl nvarchar(MAX),
	@ImageUrl nvarchar(MAX),
	@HouseID int,
	@IsActive bit
AS
Begin
Set Nocount on
	update HouseDetails set Address = @Address, Price = @Price, ZillowUrl = @ZillowUrl, ImageUrl = @ImageUrl, IsActive = @IsActive where HouseID = @HouseID
end
