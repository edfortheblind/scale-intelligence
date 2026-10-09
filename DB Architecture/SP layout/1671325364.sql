/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RShippingLoad01
	@InternalLoadNum numeric(9)
AS
	SELECT * FROM SHIPPING_LOAD
	 WHERE INTERNAL_LOAD_NUM = @InternalLoadNum
