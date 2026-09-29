-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





   

CREATE PROCEDURE wm_RItemUnitOfMeasure03
	@Item nvarchar(50),
	@Company nvarchar(25),
	@ItemClass nvarchar(50),
	@QuantityUm nvarchar(25)
AS
	if(@Item IS NOT NULL)
		SELECT * FROM ITEM_UNIT_OF_MEASURE
		WHERE ITEM = @Item
		AND QUANTITY_UM = @QuantityUm
		AND (COMPANY = @Company OR COMPANY IS NULL)
		ORDER BY COMPANY
	else
		SELECT * FROM ITEM_UNIT_OF_MEASURE
		WHERE ITEM_CLASS = @ItemClass
		AND QUANTITY_UM = @QuantityUm

