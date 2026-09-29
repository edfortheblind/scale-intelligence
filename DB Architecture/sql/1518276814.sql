-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RLotAttributeTemplate01
	@LotTemplate nvarchar(25)	
	
AS
	SELECT * FROM LOT_TEMPLATE
        WHERE 
	LOT_TEMPLATE = @LotTemplate




