-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE PROCEDURE wm_RShipmentDetail04
	@ShipmentId nvarchar(25),
	@ErpOrderLineNum numeric(19,5),
	@InterfaceLinkID numeric(9),
	@ClosedStatus numeric(3)
AS
	if(@InterfaceLinkID=0)
		SELECT * 
		FROM SHIPMENT_DETAIL
		WHERE SHIPMENT_ID = @ShipmentId
		AND ERP_ORDER_LINE_NUM = @ErpOrderLineNum
		AND INTERNAL_SHIPMENT_NUM NOT IN ( SELECT INTERNAL_SHIPMENT_NUM FROM SHIPMENT_HEADER WHERE 
		SHIPMENT_ID =@ShipmentId AND TRAILING_STS = @ClosedStatus ) ;
	else
		SELECT * 
     FROM Upload_order_detail
    WHERE SHIPMENT_ID = @ShipmentId
	AND ERP_ORDER_LINE_NUM = @ErpOrderLineNum
	AND INTERFACE_LINK_ID = @InterfaceLinkID
		AND INTERNAL_SHIPMENT_NUM NOT IN ( SELECT INTERNAL_SHIPMENT_NUM FROM SHIPMENT_HEADER WHERE 
		SHIPMENT_ID =@ShipmentId AND TRAILING_STS = @ClosedStatus ) ;
