-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_DOrderDetail01
	@RowsAffected int OUTPUT,
	@InternalOrderDtlNum numeric(9)
AS
	DELETE FROM ORDER_DETAIL
	 WHERE INTERNAL_ORDER_DTL_NUM = @InternalOrderDtlNum

SET @RowsAffected = @@ROWCOUNT
