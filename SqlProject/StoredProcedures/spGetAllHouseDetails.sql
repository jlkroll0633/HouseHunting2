CREATE PROCEDURE [dbo].[spGetAllHouseDetails]
	
AS
Begin
Set nocount on 
 Select [HouseID]
      ,[Address]
      ,[Price]
      ,[ZillowUrl]
      ,[ImageUrl]
      ,[IsActive]
      ,[Notes]
  FROM [Houses].[dbo].[HouseDetails]
End
