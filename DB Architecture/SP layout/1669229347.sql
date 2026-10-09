/*
	Task	| By	| Date			| Modification Description
	-------------------------------------------------
	100858	| MMM	| 07/23/2012	| Created.
	101569	| MMM	| 07/27/2012	| Added new parameter - database base name.
*/	

CREATE PROCEDURE PMN_IndexFragmentation(
		@databaseName varchar(50)
	)
AS

SELECT 
	OBJECT_NAME(IPS.object_id) AS OBJECT_NAME, 
	(	SELECT NAME 
		FROM SYS.INDEXES AS IND 
		WHERE IND.object_id = IPS.object_id 
			AND IND.INDEX_ID = IPS.INDEX_ID) AS INDEX_NAME, 
	IPS.AVG_FRAGMENTATION_IN_PERCENT, 
	IPS.PAGE_COUNT 
FROM SYS.DM_DB_INDEX_PHYSICAL_STATS(DB_ID(@databaseName), NULL, NULL, NULL, NULL) AS IPS 
ORDER BY IPS.AVG_FRAGMENTATION_IN_PERCENT DESC;
