-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RLotTemplate02
	@LotTemplate nvarchar(25)
AS
	SELECT LOT_TEMPLATE
	  FROM LOT_TEMPLATE
	 WHERE LOT_TEMPLATE = @LotTemplate
           AND ACTIVE = N'<literal:1>'


