/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	135689		| JY	| 02/17/14	| Added new filter.
	143196		| DN	| 02/28/14	| When InterfaceLinkId is 0, look at shipment_detail table

*/
CREATE PROCEDURE wm_RShipmentDetail02
   @ShipmentId nvarchar(25),
   @Item nvarchar(50),
   @Company nvarchar(25),
   @InterfaceLinkID numeric(9)
AS
	if(@InterfaceLinkID = 0)
		SELECT * 
		FROM SHIPMENT_DETAIL
		WHERE shipment_id = @ShipmentID
		AND item = @Item
		AND ((company = @Company) OR (company IS NULL AND @Company IS NULL));
	else
		SELECT * 
		FROM UPLOAD_ORDER_DETAIL
		WHERE SHIPMENT_ID = @ShipmentID
		AND ITEM = @Item
		AND ((COMPANY = @Company) OR (COMPANY IS NULL AND @Company IS NULL))
		AND INTERFACE_LINK_ID = @InterfaceLinkID
