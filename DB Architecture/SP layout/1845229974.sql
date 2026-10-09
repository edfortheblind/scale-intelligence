/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	216998		| MHM			| 01/30/20	| Created.	
*/

CREATE PROCEDURE POH_TpmInsightDetailPaneData(@ObjectId numeric(9), @culture nvarchar(10))  
AS 
BEGIN

	-- Detail pane details
	SELECT top 1 N'SCALAR' AS SCALAR,
		PURCHASE_ORDER_ID AS PurchaseOrderId,
		SHIP_FROM AS ShipFrom,
		dbo.RSCMfn_RtrvResource(STATUS,N'Text', null) AS Status,
		WAREHOUSE AS Warehouse,
		@ObjectId AS ObjectId
	FROM PURCHASE_ORDER_HEADER
	WHERE OBJECT_ID = @ObjectId;

	--Receipts
	SELECT top 1 N'SCALAR' AS SCALAR,
		COUNT(distinct RECEIPT_ID) as Receipts	
	FROM
	PURCHASE_ORDER_DETAIL PD LEFT OUTER JOIN RECEIPT_DETAIL RD
	ON
	RD.PURCHASE_ORDER_DETAIL_ID = PD.OBJECT_ID 
	WHERE
	PD.PURCHASE_ORDER_OBJECT_ID = @ObjectId;

	-- Lines count
	SELECT top 1 N'SCALAR' AS SCALAR,
		COUNT(OBJECT_ID) as TotalLines
	FROM PURCHASE_ORDER_DETAIL
	WHERE PURCHASE_ORDER_OBJECT_ID = @ObjectId;

END


