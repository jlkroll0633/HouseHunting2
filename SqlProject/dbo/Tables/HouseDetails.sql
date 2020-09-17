CREATE TABLE [dbo].[HouseDetails] (
    [HouseID]   INT            IDENTITY (1, 1) NOT NULL,
    [Address]   NVARCHAR (50)  NOT NULL,
    [Price]     DECIMAL (18)   NOT NULL,
    [ZillowUrl] NVARCHAR (MAX) NULL,
    [ImageUrl]  NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Houses] PRIMARY KEY CLUSTERED ([HouseID] ASC)
);

