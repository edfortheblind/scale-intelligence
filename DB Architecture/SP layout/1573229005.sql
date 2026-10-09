/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	19576	| SSG	| 08/03/06	| Created.
	19519	| TDL	| 08/14/06	| Added additional return values

	Parameters:
		WAREHOUSE : Warehouse to select records for.
	Returns:
		Count of warehouse alert requests.

*/


CREATE PROCEDURE PM_WarehouseAlert
(
	@WAREHOUSE nvarchar(25) = NULL
)

AS
BEGIN
	SET NOCOUNT ON;

	IF @WAREHOUSE = N''
	SET @WAREHOUSE = NULL;

	SELECT 
		WT.DESCRIPTION AS ALERT_TYPE, WAR.PRIORITY, COUNT(*) AS ALERTCOUNT, MAX(ACTIVITY_DATE_TIME) AS LATESTALERT
	FROM 
		WAREHOUSE_ALERT_REQUEST WAR, WAREHOUSE_ALERT WA, WAREHOUSE_ALERT_TYPE WT
	WHERE 
		WA.INTERNAL_ALERT_NUM = WAR.INTERNAL_ALERT_NUM 
		AND (WA.ACTION = N'History' OR WA.ACTION = N'HistoryEmail') 
		AND WAR.WAREHOUSE = ISNULL(@WAREHOUSE, WAR.WAREHOUSE)
		AND WAR.PROCESSED = N'Y'
		AND WAR.CLOSED_DATE_TIME IS NULL
		AND WAR.ALERT_TYPE = WT.ALERT_TYPE
	GROUP BY WAR.PRIORITY,WT.DESCRIPTION
	ORDER BY WAR.PRIORITY;
END -- PM_WarehouseAlert



