/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	   197253   | DP			| 03/20/17	| Created.
	   197256   | MMM			| 04/06/17	| Added InternalPutawayNum
	   207780	| TDA			| 07/03/17	| Added  Description and thumbnail image

*/

CREATE PROCEDURE WOLP_InsightDetailPaneData(@putawayUnitId nvarchar(25), @culture nvarchar(10))  
AS 
BEGIN

	DECLARE @internalWorkOrderNum as INT
	SELECT @internalWorkOrderNum = INTERNAL_WORK_ORDER_NUM FROM WORK_ORDER_PUTAWAY_UNIT WHERE PUTAWAY_UNIT_ID = @putawayUnitId

	-- Detail pane details
	SELECT top 1 N'SCALAR' AS SCALAR,
		WP.INTERNAL_WORK_ORDER_NUM AS InternalWorkOrderNum,
		WP.INTERNAL_PUTAWAY_NUM AS InternalPutawayNum,
		WP.PUTAWAY_UNIT_ID AS LicensePlate,
		WP.ITEM AS Item,
		WP.COMPANY AS Company,
		WP.WAREHOUSE AS Warehouse,
		i.WEB_THUMBNAIL_IMG AS WebThumbnailImage
	FROM WORK_ORDER_PUTAWAY_UNIT WP
	LEFT OUTER JOIN ITEM i 
		on (WP.ITEM = i.ITEM AND (WP.COMPANY = i.COMPANY OR (WP.COMPANY IS NULL AND i.COMPANY IS NULL)))
	WHERE WP.PUTAWAY_UNIT_ID = @putawayUnitId;


	-- Open work count
	SELECT top 1 N'SCALAR' AS SCALAR,
		COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OpenWorkCount
	FROM 
	WORK_INSTRUCTION WI
	WHERE
		WI.INTERNAL_NUM_TYPE = N'Work Order Putaway'AND
		WI.INSTRUCTION_TYPE = N'Detail' AND
		WI.CONDITION <> N'Closed' AND
		WI.INTERNAL_NUM = @internalWorkOrderNum AND
		WI.REFERENCE_ID = @putawayUnitId; 


	-- Transactions count
	SELECT top 1 N'SCALAR' AS SCALAR,
		COUNT(TH.INTERNAL_ID) AS TotalTransactions
	FROM 
	WORK_ORDER_PUTAWAY_UNIT WP,
	TRANSACTION_HISTORY TH
	WHERE
		WP.PUTAWAY_UNIT_ID = @putawayUnitId
		AND TH.REFERENCE_ID = WP.PUTAWAY_UNIT_ID
		AND TH.WAREHOUSE = WP.WAREHOUSE
		AND TH.ITEM = WP.ITEM;

END

