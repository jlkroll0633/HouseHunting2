CREATE PROCEDURE [dbo].[spGetAllActiveHouseDetails]
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
  Where [IsActive] = 1
End
