-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RPurchaseOrderDetail03
	@PurchaseOrderId nvarchar(25),
	@LineNumber numeric(19,5)
AS
	SELECT *
	  FROM PURCHASE_ORDER_DETAIL
	 WHERE PURCHASE_ORDER_ID = @PurchaseOrderId
	       AND LINE_NUMBER = @LineNumber;


