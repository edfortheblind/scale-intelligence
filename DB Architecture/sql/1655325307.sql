-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RShippingContainer05
   @InternalContainerNum nvarchar(25),
	@InterfaceLinkID numeric(9)
AS
	if(@interfaceLinkID =0)
		SELECT * 
		FROM shipping_container
		WHERE parent = @InternalContainerNum;
	else
	SELECT * 
     FROM UPLOAD_ORDER_CONTAINER
	 WHERE INTERFACE_PARENT_LINK_ID = @InternalContainerNum
		AND INTERFACE_LINK_ID = @interfaceLinkID;
