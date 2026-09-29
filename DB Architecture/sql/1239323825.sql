-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_ROrderHeader01
	@InternalOrderNum numeric(9)
AS
	SELECT * FROM ORDER_HEADER
	 WHERE INTERNAL_ORDER_NUM = @InternalOrderNum
