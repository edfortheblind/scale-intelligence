-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */






CREATE PROCEDURE wm_RShipmentDetail01
	@InternalShipmentLineNum numeric(9),
	@InterfaceLinkID numeric(9)
AS
if(@interfaceLinkID = 0)
	SELECT * FROM SHIPMENT_DETAIL
	WHERE INTERNAL_SHIPMENT_LINE_NUM = @InternalShipmentLineNum;
else
	SELECT * FROM UPLOAD_ORDER_DETAIL
	WHERE INTERNAL_SHIPMENT_LINE_NUM = @InternalShipmentLineNum
	AND INTERFACE_LINK_ID =  @InterfaceLinkID;
