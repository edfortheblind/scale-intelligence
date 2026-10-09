/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	197242		| MMM			| 02/08/17	| Created.
	198467      | KSS           | 03/02/17  | Added Work Order Putaway as internal num type which fetching data for Open work count
	199305		| RS			| 03/08/16  | Added Condition.
	197253		| DP			| 03/21/17  | Added License Plates indicator tile.
	208750      | RS            | 07/16/17  | Added indicator tile data sources.

*/

CREATE PROCEDURE WOH_InsightDetailPaneData(@internalWorkOrderNum numeric(9) ,@culture nvarchar(10))  
AS 
BEGIN

	-- Detail pane details
	SELECT top 1 N'SCALAR' AS SCALAR,
		INTERNAL_WORK_ORDER_NUM AS InternalWorkOrderNum,
		WORK_ORDER_ID AS WorkOrderId,
		WH.ITEM AS Item,
		WH.CONDITION AS Condition,
		WH.COMPANY AS Company,
		WH.ITEM_DESC AS Description,
		WH.WAREHOUSE AS Warehouse,
		i.WEB_THUMBNAIL_IMG AS WebThumbnailImage
	FROM WORK_ORDER_HEADER WH
	LEFT OUTER JOIN ITEM i 
		on (WH.ITEM = i.ITEM AND (WH.COMPANY = i.COMPANY OR (WH.COMPANY IS NULL AND i.COMPANY IS NULL)))
	WHERE INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum;

	-- Lines count
	SELECT top 1 N'SCALAR' AS SCALAR,
		count(WD.INTERNAL_WRK_ORD_LINE_NUM) as TotalLines
	FROM WORK_ORDER_DETAIL WD
	WHERE WD.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum;

	-- Open work count
	SELECT top 1 N'SCALAR' AS SCALAR,
		COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OpenWorkCount
	FROM 
	WORK_INSTRUCTION WI
	WHERE
		WI.INTERNAL_NUM_TYPE = N'Work Order Putaway'AND
		WI.INSTRUCTION_TYPE = N'Detail' AND
		WI.CONDITION <> N'Closed' AND
		WI.INTERNAL_NUM = @internalWorkOrderNum;

	-- Dependent shipments in pool count		
	SELECT top 1 N'SCALAR' AS SCALAR,
		COUNT(DISTINCT(SD.INTERNAL_SHIPMENT_NUM)) AS DependentShipmentBelow300Count
	FROM
		WORK_ORDER_HEADER WO, SHIPMENT_DETAIL SD
	WHERE
		WO.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		AND SD.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		and SD.STATUS1 < 300;

	-- Dependent shipments at 300 or above	
	SELECT top 1 N'SCALAR' AS SCALAR,
		COUNT(DISTINCT(SD.INTERNAL_SHIPMENT_NUM)) AS DependentShipmentAtOrAbove300Count
	FROM
		WORK_ORDER_HEADER WO, SHIPMENT_DETAIL SD
	WHERE
		WO.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		AND SD.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		and SD.STATUS1 >= 300;
	

	-- Transactions count
	SELECT top 1 N'SCALAR' AS SCALAR,
		COUNT(TH.INTERNAL_ID) AS TotalTransactions
	FROM 
	WORK_ORDER_HEADER WH,
	TRANSACTION_HISTORY TH
	WHERE
		WH.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		AND TH.REFERENCE_ID = WH.WORK_ORDER_ID
		AND TH.WAREHOUSE = WH.WAREHOUSE


	-- License Plates
	SELECT top 1 N'SCALAR' AS SCALAR,
		COUNT(WP.PUTAWAY_UNIT_ID) AS TotalLicensePlates
	FROM 
	WORK_ORDER_HEADER WH,
	WORK_ORDER_PUTAWAY_UNIT WP
	WHERE
		WH.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		AND WH.INTERNAL_WORK_ORDER_NUM = WP.INTERNAL_WORK_ORDER_NUM
		AND WH.WAREHOUSE = WP.WAREHOUSE;

END

