-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_RPurchaseOrderHeader03
	@PurchaseOrderId nvarchar(25),
	@Warehouse nvarchar(25)
AS
	SELECT *
	  FROM PURCHASE_ORDER_HEADER
	 WHERE PURCHASE_ORDER_ID = @PurchaseOrderId
	 AND WAREHOUSE=@Warehouse; 



