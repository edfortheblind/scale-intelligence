-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





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
