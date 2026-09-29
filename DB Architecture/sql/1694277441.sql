-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RReceiptDetail05
	@PurchaseOrderId nvarchar(25),
	@LineNumber numeric(19,5)
AS
	IF (@LineNumber > 0)
	BEGIN
		SELECT *
		FROM RECEIPT_DETAIL
		WHERE PURCHASE_ORDER_ID = @PurchaseOrderId
	      	    AND PURCHASE_ORDER_LINE_NUMBER = @LineNumber;
	END
	ELSE
	BEGIN
		SELECT *
		FROM RECEIPT_DETAIL
		WHERE PURCHASE_ORDER_ID = @PurchaseOrderId;
	END;



