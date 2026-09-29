-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */


CREATE PROCEDURE wm_RUploadOrderDetail02
	@InternalShipmentNum numeric(9),
	@interfaceLinkID numeric(9)
AS
	SELECT * FROM UPLOAD_ORDER_DETAIL
	 WHERE INTERNAL_SHIPMENT_NUM = @InternalShipmentNum AND INTERFACE_LINK_ID = @interfaceLinkID
