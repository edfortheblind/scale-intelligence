/*
// 133442   | JY            | 12/03/13    | Added filter for interface_link_id
*/
CREATE PROCEDURE wm_RUploadOrderDetail02
	@InternalShipmentNum numeric(9),
	@interfaceLinkID numeric(9)
AS
	SELECT * FROM UPLOAD_ORDER_DETAIL
	 WHERE INTERNAL_SHIPMENT_NUM = @InternalShipmentNum AND INTERFACE_LINK_ID = @interfaceLinkID
