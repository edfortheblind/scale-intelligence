/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	135689	| JY	| 02/17/14	| Modified the table of upload and added new filter.
	143196	| DN	| 02/28/14	| When InterfaceLinkId is 0, look at shipment_detail table
*/
CREATE PROCEDURE wm_RShippingContainer04
   @InternalShipmentNum numeric(9),
	@InterfaceLinkID numeric(9)
AS
	if(@InterfaceLinkID=0)
		SELECT * 
		FROM SHIPPING_CONTAINER
		WHERE internal_shipment_num = @InternalShipmentNum
		AND PARENT IS NULL;
	else
		SELECT * 
		FROM UPLOAD_ORDER_CONTAINER
		WHERE INTERNAL_SHIPMENT_NUM = @InternalShipmentNum
		AND INTERFACE_LINK_ID = @InterfaceLinkID
		AND INTERFACE_PARENT_LINK_ID IS NULL;
