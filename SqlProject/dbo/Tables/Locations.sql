CREATE TABLE [dbo].[Locations]
(
    [Latitude] DECIMAL(8, 6) NULL, 
    [Longitude] DECIMAL(9, 6) NULL, 
    [HouseID] INT NOT NULL, 
    CONSTRAINT [PK_Locations] PRIMARY KEY ([HouseID]) 
  
    
)
