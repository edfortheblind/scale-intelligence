/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RItemUnitOfMeasure01
	@InternalItemUm numeric(9)
AS

	SELECT * FROM ITEM_UNIT_OF_MEASURE
	WHERE INTERNAL_ITEM_UM = @InternalItemUm