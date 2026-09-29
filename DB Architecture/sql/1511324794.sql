-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE PROCEDURE wm_RShipmentDetail03
	@InternalShipmentNum numeric(9),
	@InterfaceLinkID numeric(9)
AS
	if(@InterfaceLinkID = 0)
		SELECT * 
		FROM SHIPMENT_DETAIL
		WHERE internal_shipment_num = @InternalShipmentNum
		AND (RELATED_INTERNAL_LINE_NUM IS NULL
		OR RELATED_INTERNAL_LINE_NUM = 0)
	else
		SELECT * 
		FROM UPLOAD_ORDER_DETAIL
		WHERE INTERNAL_SHIPMENT_NUM = @InternalShipmentNum
		and INTERFACE_LINK_ID = @InterfaceLinkID

