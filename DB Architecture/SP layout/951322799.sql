/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RItem01
	@InternalItemNum numeric(9)
AS
	SELECT * FROM ITEM
	WHERE INTERNAL_ITEM_NUM = @INternalItemNum

