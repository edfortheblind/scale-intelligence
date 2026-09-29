-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_DShipmentDetail01
	@RowsAffected int OUTPUT,
	@InternalShipmentLineNum numeric(9)
AS
	DELETE FROM SHIPMENT_DETAIL
	 WHERE INTERNAL_SHIPMENT_LINE_NUM = @InternalShipmentLineNum

SET @RowsAffected = @@ROWCOUNT
