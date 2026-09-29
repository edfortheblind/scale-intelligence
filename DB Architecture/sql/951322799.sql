-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RItem01
	@InternalItemNum numeric(9)
AS
	SELECT * FROM ITEM
	WHERE INTERNAL_ITEM_NUM = @INternalItemNum

