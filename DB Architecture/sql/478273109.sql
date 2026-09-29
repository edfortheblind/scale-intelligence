-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_DPurchaseOrderHeader01
	@RowsAffected int OUTPUT,
	@ObjectId numeric(9)
AS
	DELETE FROM PURCHASE_ORDER_DETAIL
	WHERE PURCHASE_ORDER_OBJECT_ID = @ObjectId;
	
	SET @RowsAffected = @@ROWCOUNT

	DELETE FROM PURCHASE_ORDER_HEADER
	WHERE OBJECT_ID = @ObjectId;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
	


