-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_DPurchaseOrderDetail01
	@RowsAffected int OUTPUT,
	@ObjectId numeric(9)
AS
	DELETE FROM PURCHASE_ORDER_DETAIL
	WHERE OBJECT_ID = @ObjectId;
	
	SET @RowsAffected = @@ROWCOUNT



