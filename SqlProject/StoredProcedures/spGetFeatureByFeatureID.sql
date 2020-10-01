CREATE PROCEDURE [dbo].[spGetFeatureByFeatureID]
		@FeatureID int
AS
Begin
Set nocount on
	Select FeatureID, Name, Description, Weight, IsEditable
	from Features
	Where FeatureID = @FeatureID
End
