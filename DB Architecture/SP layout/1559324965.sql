/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RShipmentHeader04
	@ShipmentID nvarchar(25)
AS
	SELECT *
     FROM SHIPMENT_HEADER
	 WHERE SHIPMENT_ID = @ShipmentID

