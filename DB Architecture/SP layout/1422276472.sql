/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	67988	| DSK   | 04/15/10	| Created
	135689	| JY	| 02/17/14	| Modified the table of upload and added new filter.
	143196	| DN	| 02/28/14	| When InterfaceLinkId is 0, look at location inventory attributes table
*/

CREATE PROCEDURE wm_RLocationInventoryAttributes01
	@internalContainerNum numeric(9),
	@interfaceLinkID numeric(9)
			
AS	
	if(@interfaceLinkID = 0)
		SELECT * FROM LOCATION_INVENTORY_ATTRIBUTES
		WHERE INTERNAL_SHIPPING_CONTAINER_NUM = @internalContainerNum;
	else
		SELECT * FROM UPLOAD_LOCATION_INVENTORY_ATTRIBUTES
		WHERE INTERNAL_SHIPPING_CONTAINER_NUM = @internalContainerNum
		AND INTERFACE_LINK_ID = @interfaceLinkID;
	
