/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_DShipmentAccessorials01
	@RowsAffected int OUTPUT,
	@InternalNum numeric(9),
	@ShipmentLevel nvarchar(1),
	@AccessorialCode nvarchar(25),
	@AccessorialSubCode nvarchar(25)
AS
	DELETE FROM SHIPMENT_ACCESSORIALS
	 WHERE INTERNAL_NUM = @InternalNum
	 AND SHIPMENT_LEVEL = @ShipmentLevel
	 AND ACCESSORIAL_CODE = @AccessorialCode
	 AND ACCESSORIAL_SUB_CODE = @AccessorialSubCode

SET @RowsAffected = @@ROWCOUNT
