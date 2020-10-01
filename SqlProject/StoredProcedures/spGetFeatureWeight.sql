CREATE PROCEDURE [dbo].[spGetFeatureWeight]
	@FeatureID int
AS
Begin
Set nocount on
	Select Weight
	from Features
	Where FeatureID = @FeatureID
End
