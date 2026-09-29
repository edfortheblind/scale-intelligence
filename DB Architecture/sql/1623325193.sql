-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RShippingContainer03
	@ParentContainerId nvarchar(25),
	@ErpOrderLineNum numeric(19,5),
	@InterfaceLinkID numeric(9)
AS
	if(@InterfaceLinkID=0)
		SELECT * 
		FROM SHIPPING_CONTAINER
		WHERE PARENT_CONTAINER_ID = @ParentContainerId
		AND INTERNAL_SHIPMENT_LINE_NUM IN 
		(SELECT INTERNAL_SHIPMENT_LINE_NUM FROM SHIPMENT_DETAIL
		WHERE ERP_ORDER_LINE_NUM = @ErpOrderLineNum)
	else
		SELECT * 
		FROM UPLOAD_ORDER_CONTAINER
		WHERE INTERFACE_PARENT_LINK_ID = @ParentContainerId
		AND INTERFACE_LINK_ID = @InterfaceLinkID
		AND INTERNAL_SHIPMENT_LINE_NUM IN 
		(SELECT INTERNAL_SHIPMENT_LINE_NUM FROM SHIPMENT_DETAIL
		WHERE ERP_ORDER_LINE_NUM = @ErpOrderLineNum)

