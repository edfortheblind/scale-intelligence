/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	185148		| DN			| 10/17/16	| Created.
*/

CREATE PROCEDURE MetadataTransActiveWavesForWarehouse(@warehouse nvarchar(25))
AS
SELECT
LAUNCH_STATISTICS.INTERNAL_LAUNCH_NUM AS WAVENUM,
LAUNCH_STATISTICS.LAUNCH_NAME AS WAVENAME,
LAUNCH_STATISTICS.LAUNCH_FLOW AS WAVEFLOW
FROM LAUNCH_STATISTICS WHERE WAREHOUSE = @warehouse
AND (LAST_LAUNCH_STEP IS NULL OR LAST_LAUNCH_STEP = N'')
ORDER BY LAUNCH_STATISTICS.INTERNAL_LAUNCH_NUM DESC;




