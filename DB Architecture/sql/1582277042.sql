-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE wm_RPurchaseOrderDetail02
	@PurchaseOrderObjectId numeric(9)
AS
	SELECT 
		OBJECT_ID, LINE_NUMBER,ITEM
	FROM 
		PURCHASE_ORDER_DETAIL
	WHERE 
		PURCHASE_ORDER_OBJECT_ID = @PurchaseOrderObjectId
	ORDER BY 
		LINE_NUMBER,
		ITEM,
		COMPANY