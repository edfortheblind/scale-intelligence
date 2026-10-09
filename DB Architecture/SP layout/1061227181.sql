/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	49522		| AD			| 05/05/25	| Created.
*/

CREATE PROCEDURE MetaTrans_IndirectLaborWorkbenchLog(
	@culture nvarchar(10))

AS
BEGIN
	   SET NOCOUNT ON;

	   SELECT 
	   N'SCALAR' AS N'EntityType',
	   N'IndirectLaborWorkbench' AS N'EntityName',
	   NULL AS N'warehouse',
	   NULL AS N'company',
	   N'' as N'supervisor',
	   N'' as N'activityType',
	   N'' as N'startDateTime',
	   N'' as N'endDateTime'

END

