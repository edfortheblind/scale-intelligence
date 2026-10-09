/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	14660	| LJM			| 06/01/04	| created
	191074	| DN			| 01/23/17	| Updated parameter types
*/

CREATE PROCEDURE wm_RLaunchStatistics01
	@IntWaveNum numeric(9)
AS
	SELECT *
	FROM LAUNCH_STATISTICS
	WHERE INTERNAL_LAUNCH_NUM = @IntWaveNum;