-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RItemTemplate01
	@ItemTemplate nvarchar(25)
AS
	SELECT * FROM ITEM_TEMPLATE
	WHERE ITEM_TEMPLATE = @ItemTemplate

