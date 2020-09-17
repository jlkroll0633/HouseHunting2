CREATE TABLE [dbo].[HouseFeatures] (
    [HouseID]   INT NOT NULL,
    [FeatureID] INT NOT NULL, 
    CONSTRAINT [FK_FeatureID_ToFeatureID] FOREIGN KEY ([FeatureID]) REFERENCES [Features]([FeatureID]), 
    CONSTRAINT [FK_HouseID_ToHouseID] FOREIGN KEY ([HouseID]) REFERENCES [HouseDetails]([HouseID]) 
);

