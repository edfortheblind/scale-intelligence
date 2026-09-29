-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RShippingLoad01
	@InternalLoadNum numeric(9)
AS
	SELECT * FROM SHIPPING_LOAD
	 WHERE INTERNAL_LOAD_NUM = @InternalLoadNum
