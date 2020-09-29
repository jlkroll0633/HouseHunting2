CREATE TABLE [dbo].[HouseFeatures] (
    [HouseID]   INT NOT NULL,
    [FeatureID] INT NOT NULL, 
    [Weight] INT NULL, 
    CONSTRAINT [FK_FeatureID_ToFeatureID] FOREIGN KEY ([FeatureID]) REFERENCES [dbo].[Features]([FeatureID]), 
    CONSTRAINT [FK_HouseID_ToHouseID] FOREIGN KEY ([HouseID]) REFERENCES [dbo].[HouseDetails]([HouseID]) 
);

