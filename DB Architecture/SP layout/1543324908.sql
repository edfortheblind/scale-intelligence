/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RShipmentHeader03
	@ShipmentID nvarchar(25)
AS
  DECLARE @returnVal int
  SET @returnVal = 0  -- Return 0 if the Shipment ID doesn't exist

	SELECT @returnVal = 1 
     FROM SHIPMENT_HEADER
	 WHERE SHIPMENT_ID = @ShipmentID

   RETURN @returnVal
