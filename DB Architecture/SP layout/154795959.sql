/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	135689	| JY	| 02/17/14	| Created.
*/
CREATE PROCEDURE wm_RShippingContainer07
   @ContainerId nvarchar(25),
	@InterfaceLinkID numeric(9)
AS
	IF(@InterfaceLinkID =0)
		SELECT * 
		FROM SHIPPING_CONTAINER
		WHERE CONTAINER_ID = @ContainerId		
	else
		SELECT * 
		FROM UPLOAD_ORDER_CONTAINER
		WHERE CONTAINER_ID = @ContainerId
		AND INTERFACE_LINK_ID = @InterfaceLinkID