/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_DShipmentDetail01
	@RowsAffected int OUTPUT,
	@InternalShipmentLineNum numeric(9)
AS
	DELETE FROM SHIPMENT_DETAIL
	 WHERE INTERNAL_SHIPMENT_LINE_NUM = @InternalShipmentLineNum

SET @RowsAffected = @@ROWCOUNT
