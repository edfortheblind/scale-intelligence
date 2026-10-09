/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	15114		| BTD			    | 1/16/06	| Modified numeric field sizes
	136109      |KSS                |02/20/14   | Changes made for DINT
	135689		| JY	            | 02/17/14	| Added new filter.
	161579      | KSS               | 05/25/15  | Changes made to exclude the closed shipment from the select query
	163737      | AA                | 07/16/15  | updated the select query to use not in cluase instead of !=.
*/

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
