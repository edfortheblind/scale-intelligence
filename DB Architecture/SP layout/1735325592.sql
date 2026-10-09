CREATE PROCEDURE wm_RUploadOrderDetail01
	@InternalShipmentLineNum numeric(9)
AS
	SELECT * FROM UPLOAD_ORDER_DETAIL
	 WHERE INTERNAL_SHIPMENT_LINE_NUM = @InternalShipmentLineNum
