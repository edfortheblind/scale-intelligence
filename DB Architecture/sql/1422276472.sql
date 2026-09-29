-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







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
	
