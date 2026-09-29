-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




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