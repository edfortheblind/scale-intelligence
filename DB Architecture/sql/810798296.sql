-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE PROCEDURE WOH_InsightDetailPaneData(@internalWorkOrderNum numeric(9) ,@culture nvarchar(10))  
AS 
BEGIN

	-- [comment omitted]
	SELECT top 1 N'<literal:1>' AS SCALAR,
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

	-- [comment omitted]
	SELECT top 1 N'<literal:2>' AS SCALAR,
		count(WD.INTERNAL_WRK_ORD_LINE_NUM) as TotalLines
	FROM WORK_ORDER_DETAIL WD
	WHERE WD.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum;

	-- [comment omitted]
	SELECT top 1 N'<literal:3>' AS SCALAR,
		COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OpenWorkCount
	FROM 
	WORK_INSTRUCTION WI
	WHERE
		WI.INTERNAL_NUM_TYPE = N'<literal:4>'AND
		WI.INSTRUCTION_TYPE = N'<literal:5>' AND
		WI.CONDITION <> N'<literal:6>' AND
		WI.INTERNAL_NUM = @internalWorkOrderNum;

	-- [comment omitted]
	SELECT top 1 N'<literal:7>' AS SCALAR,
		COUNT(DISTINCT(SD.INTERNAL_SHIPMENT_NUM)) AS DependentShipmentBelow300Count
	FROM
		WORK_ORDER_HEADER WO, SHIPMENT_DETAIL SD
	WHERE
		WO.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		AND SD.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		and SD.STATUS1 < 300;

	-- [comment omitted]
	SELECT top 1 N'<literal:8>' AS SCALAR,
		COUNT(DISTINCT(SD.INTERNAL_SHIPMENT_NUM)) AS DependentShipmentAtOrAbove300Count
	FROM
		WORK_ORDER_HEADER WO, SHIPMENT_DETAIL SD
	WHERE
		WO.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		AND SD.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		and SD.STATUS1 >= 300;
	

	-- [comment omitted]
	SELECT top 1 N'<literal:9>' AS SCALAR,
		COUNT(TH.INTERNAL_ID) AS TotalTransactions
	FROM 
	WORK_ORDER_HEADER WH,
	TRANSACTION_HISTORY TH
	WHERE
		WH.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		AND TH.REFERENCE_ID = WH.WORK_ORDER_ID
		AND TH.WAREHOUSE = WH.WAREHOUSE


	-- [comment omitted]
	SELECT top 1 N'<literal:10>' AS SCALAR,
		COUNT(WP.PUTAWAY_UNIT_ID) AS TotalLicensePlates
	FROM 
	WORK_ORDER_HEADER WH,
	WORK_ORDER_PUTAWAY_UNIT WP
	WHERE
		WH.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum
		AND WH.INTERNAL_WORK_ORDER_NUM = WP.INTERNAL_WORK_ORDER_NUM
		AND WH.WAREHOUSE = WP.WAREHOUSE;

END

