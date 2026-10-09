/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RShipmentDetail05
	@InternalShipmentLineNum numeric(9)
AS
	SELECT * 
	FROM SHIPMENT_DETAIL 
	WHERE RELATED_INTERNAL_LINE_NUM = @InternalShipmentLineNum 
