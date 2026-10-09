/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	254048      | RM			| 27/07/20	| Created.
	255839      | RM			| 05/08/20	| Modified SP from "Create" statement to "Alter".
*/
CREATE PROCEDURE SRC_CartPickingWorkConfiguratorModel(
	@workProfileName nvarchar(25))
AS
	SET NOCOUNT ON;
BEGIN
	declare @displaySpot nvarchar(10);
	select @displaySpot = SPOT_ASSIGNMENT_METHOD from WORK_PROFILE_DETAIL where WORK_PROFILE = @workProfileName;
	select Top(1)
	case when @displaySpot = N'User' then N'true' else N'false' end
END;

