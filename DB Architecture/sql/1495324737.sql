-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






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
