
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	188447		| SO			| 10/18/16	| Created.
*/

CREATE PROCEDURE MetaTrans_BuildWave(@culture nvarchar(10))
AS
SET NOCOUNT ON;
  SELECT
    N'SCALAR' AS N'EntityType',
    N'LaunchMaster' AS N'EntityName',
    N'' AS WAREHOUSE,
    N'' AS Company

	FROM LAUNCH_MASTER