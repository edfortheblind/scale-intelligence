/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RItemTemplate01
	@ItemTemplate nvarchar(25)
AS
	SELECT * FROM ITEM_TEMPLATE
	WHERE ITEM_TEMPLATE = @ItemTemplate

