-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RItemUnitOfMeasure01
	@InternalItemUm numeric(9)
AS

	SELECT * FROM ITEM_UNIT_OF_MEASURE
	WHERE INTERNAL_ITEM_UM = @InternalItemUm