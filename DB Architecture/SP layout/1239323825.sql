/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_ROrderHeader01
	@InternalOrderNum numeric(9)
AS
	SELECT * FROM ORDER_HEADER
	 WHERE INTERNAL_ORDER_NUM = @InternalOrderNum
