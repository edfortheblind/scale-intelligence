-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE WOD_LineInsightDetailPaneData(@internalWorkOrderLineNum numeric(9) , @internalWorkOrderNum numeric(9),
@culture nvarchar(10))  
AS 
BEGIN

	-- [comment omitted]
	SELECT top 1 N'<literal:1>' AS SCALAR,
	WD.BUILD_SEQUENCE AS BuildSequence,
		WD.INTERNAL_WORK_ORDER_NUM AS InternalWorkOrderNum,
		WD.INTERNAL_WRK_ORD_LINE_NUM AS InternalWorkOrderLineNum,
		WD.WAREHOUSE AS Warehouse,
		WD.ITEM AS ComponentItem,
		WD.COMPANY AS Company,
		WD.ITEM_DESC AS Description,
		i.WEB_THUMBNAIL_IMG AS WebThumbnailImage
	FROM WORK_ORDER_DETAIL WD
	LEFT OUTER JOIN ITEM i 
		on (WD.ITEM = i.ITEM AND (WD.COMPANY = i.COMPANY OR (WD.COMPANY IS NULL AND i.COMPANY IS NULL)))
	WHERE INTERNAL_WRK_ORD_LINE_NUM = @internalWorkOrderLineNum;	
	

	-- [comment omitted]
	SELECT top 1 N'<literal:2>' AS SCALAR,
		WH.WORK_ORDER_ID AS WorkOrderId
	FROM WORK_ORDER_HEADER WH
	WHERE WH.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum;

	-- [comment omitted]
	SELECT top 1 N'<literal:3>' AS SCALAR,
		COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OpenWorkCount
	FROM 
	WORK_INSTRUCTION WI
	WHERE
		WI.INTERNAL_NUM_TYPE = N'<literal:4>'AND
		WI.INSTRUCTION_TYPE = N'<literal:5>' AND
		WI.CONDITION <> N'<literal:6>' AND
		WI.INTERNAL_LINE_NUM = @internalWorkOrderLineNum;

	-- [comment omitted]
	SELECT top 1 N'<literal:7>' AS SCALAR, 
		COUNT(TH.INTERNAL_ID) AS TotalTransactions
	FROM 
	WORK_ORDER_HEADER WH JOIN WORK_ORDER_DETAIL WD ON WH.INTERNAL_WORK_ORDER_NUM = WD.INTERNAL_WORK_ORDER_NUM 
	JOIN TRANSACTION_HISTORY TH ON WH.WORK_ORDER_ID = TH.REFERENCE_ID AND
	WD.INTERNAL_WORK_ORDER_NUM = @internalWorkOrderNum AND
	WD.INTERNAL_WRK_ORD_LINE_NUM = @internalWorkOrderLineNum AND 
	TH.ITEM = WD.ITEM AND 
	TH.WAREHOUSE = WD.WAREHOUSE;

END

