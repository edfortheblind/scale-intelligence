-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RShipmentHeader03
	@ShipmentID nvarchar(25)
AS
  DECLARE @returnVal int
  SET @returnVal = 0  -- [comment omitted]

	SELECT @returnVal = 1 
     FROM SHIPMENT_HEADER
	 WHERE SHIPMENT_ID = @ShipmentID

   RETURN @returnVal
