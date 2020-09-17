CREATE VIEW [dbo].[FeaturesByHouse]
	AS 
	Select [HF].[HouseID] AS HouseID, [F].FeatureID As FeatureID, [F].[Name], [F].[Description], [F].[Weight] From HouseFeatures HF
    Left Join Features F on HF.FeatureID = F.FeatureID
	
	
