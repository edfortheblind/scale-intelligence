-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE WOLP_InsightDetailPaneData(@putawayUnitId nvarchar(25), @culture nvarchar(10))  
AS 
BEGIN

	DECLARE @internalWorkOrderNum as INT
	SELECT @internalWorkOrderNum = INTERNAL_WORK_ORDER_NUM FROM WORK_ORDER_PUTAWAY_UNIT WHERE PUTAWAY_UNIT_ID = @putawayUnitId

	-- [comment omitted]
	SELECT top 1 N'<literal:1>' AS SCALAR,
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


	-- [comment omitted]
	SELECT top 1 N'<literal:2>' AS SCALAR,
		COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OpenWorkCount
	FROM 
	WORK_INSTRUCTION WI
	WHERE
		WI.INTERNAL_NUM_TYPE = N'<literal:3>'AND
		WI.INSTRUCTION_TYPE = N'<literal:4>' AND
		WI.CONDITION <> N'<literal:5>' AND
		WI.INTERNAL_NUM = @internalWorkOrderNum AND
		WI.REFERENCE_ID = @putawayUnitId; 


	-- [comment omitted]
	SELECT top 1 N'<literal:6>' AS SCALAR,
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

