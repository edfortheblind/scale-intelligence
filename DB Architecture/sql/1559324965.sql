-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RShipmentHeader04
	@ShipmentID nvarchar(25)
AS
	SELECT *
     FROM SHIPMENT_HEADER
	 WHERE SHIPMENT_ID = @ShipmentID

