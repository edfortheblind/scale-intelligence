-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE wm_RShipmentHeader10
	@ShipmentID nvarchar(25),
	@warehouse  nvarchar(25),
	@company  nvarchar(25),
	@trailingSts numeric(3)
AS
	if( @trailingSts >0)
		Begin
			SELECT *
			FROM Upload_Order_Header	 WHERE SHIPMENT_ID = @ShipmentID AND
				WAREHOUSE = @warehouse
				And 
				Trailing_Sts =@trailingSts
				  AND
				((COMPANY is null and @company is null) or COMPANY = @company);
		End
	Else
		Begin
			SELECT *
			FROM Shipment_Header	 WHERE SHIPMENT_ID = @ShipmentID AND
				WAREHOUSE = @warehouse
				  AND
				((COMPANY is null and @company is null) or COMPANY = @company);
		End
