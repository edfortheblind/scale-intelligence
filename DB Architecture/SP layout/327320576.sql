/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_DShipmentHeader01
	@RowsAffected int OUTPUT,
	@InternalShipmentNum numeric(9)
AS
	DELETE FROM SHIPMENT_HEADER
	 WHERE INTERNAL_SHIPMENT_NUM = @InternalShipmentNum

SET @RowsAffected = @@ROWCOUNT
