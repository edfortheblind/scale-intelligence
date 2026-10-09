/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	135689	| JY	| 02/17/14	| Modified the table of upload and added new filter.
	143196	| DN	| 02/28/14	| When InterfaceLinkId is 0, look at shipment_detail table
*/
CREATE PROCEDURE wm_RShippingContainer01
	@InternalContainerNum numeric(9),
	@InterfaceLinkID numeric(9)
AS

	if(@interfaceLinkID=0)
		SELECT * FROM SHIPPING_CONTAINER
		WHERE INTERNAL_CONTAINER_NUM = @InternalContainerNum;
	else
	SELECT * FROM UPLOAD_ORDER_CONTAINER
	 WHERE INTERNAL_CONTAINER_NUM = @InternalContainerNum
	 AND INTERFACE_LINK_ID = @InterfaceLinkID;
