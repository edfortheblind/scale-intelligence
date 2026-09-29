-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_DShipmentHeader01
	@RowsAffected int OUTPUT,
	@InternalShipmentNum numeric(9)
AS
	DELETE FROM SHIPMENT_HEADER
	 WHERE INTERNAL_SHIPMENT_NUM = @InternalShipmentNum

SET @RowsAffected = @@ROWCOUNT
