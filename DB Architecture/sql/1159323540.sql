-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




   



CREATE PROCEDURE wm_RItemUnitOfMeasure06
	@Item nvarchar(50)
AS
	SELECT * FROM ITEM_UNIT_OF_MEASURE
		WHERE ITEM = @Item
		AND COMPANY IS NULL

