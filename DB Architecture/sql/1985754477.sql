-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE SRC_CartPickingWorkConfiguratorModel(
	@workProfileName nvarchar(25))
AS
	SET NOCOUNT ON;
BEGIN
	declare @displaySpot nvarchar(10);
	select @displaySpot = SPOT_ASSIGNMENT_METHOD from WORK_PROFILE_DETAIL where WORK_PROFILE = @workProfileName;
	select Top(1)
	case when @displaySpot = N'<literal:1>' then N'<literal:2>' else N'<literal:3>' end
END;

