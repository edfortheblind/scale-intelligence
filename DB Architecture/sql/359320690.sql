-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_DShippingLoad01
	@RowsAffected int OUTPUT,
	@InternalLoadNum numeric(9)
AS
	DELETE FROM SHIPPING_LOAD
	 WHERE INTERNAL_LOAD_NUM = @InternalLoadNum

SET @RowsAffected = @@ROWCOUNT
