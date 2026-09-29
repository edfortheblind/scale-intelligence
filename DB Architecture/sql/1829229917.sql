-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE POH_InsightDetailPaneData(@ObjectId numeric(9), @culture nvarchar(10))  
AS 
BEGIN

	-- [comment omitted]
	SELECT top 1 N'<literal:1>' AS SCALAR,
		PURCHASE_ORDER_ID AS PurchaseOrderId,
		SHIP_FROM AS ShipFrom,
		dbo.RSCMfn_RtrvResource(STATUS,N'<literal:2>', null) AS Status,
		WAREHOUSE AS Warehouse,
		@ObjectId AS ObjectId
	FROM PURCHASE_ORDER_HEADER
	WHERE OBJECT_ID = @ObjectId;

	-- [comment omitted]
	SELECT top 1 N'<literal:3>' AS SCALAR,
		COUNT(distinct RECEIPT_ID) as Receipts	
	FROM
	PURCHASE_ORDER_DETAIL PD LEFT OUTER JOIN RECEIPT_DETAIL RD
	ON
	RD.PURCHASE_ORDER_DETAIL_ID = PD.OBJECT_ID 
	WHERE
	PD.PURCHASE_ORDER_OBJECT_ID = @ObjectId;

	-- [comment omitted]
	SELECT top 1 N'<literal:4>' AS SCALAR,
		COUNT(OBJECT_ID) as TotalLines
	FROM PURCHASE_ORDER_DETAIL
	WHERE PURCHASE_ORDER_OBJECT_ID = @ObjectId;


END

