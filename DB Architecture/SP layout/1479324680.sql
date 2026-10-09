
/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	135689		| JY	| 02/17/14	| Added new filter.
	143196		| DN	| 02/28/14	| When InterfaceLinkId is 0, look at shipment_detail table

*/
CREATE PROCEDURE wm_RShipmentDetail01
	@InternalShipmentLineNum numeric(9),
	@InterfaceLinkID numeric(9)
AS
if(@interfaceLinkID = 0)
	SELECT * FROM SHIPMENT_DETAIL
	WHERE INTERNAL_SHIPMENT_LINE_NUM = @InternalShipmentLineNum;
else
	SELECT * FROM UPLOAD_ORDER_DETAIL
	WHERE INTERNAL_SHIPMENT_LINE_NUM = @InternalShipmentLineNum
	AND INTERFACE_LINK_ID =  @InterfaceLinkID;
