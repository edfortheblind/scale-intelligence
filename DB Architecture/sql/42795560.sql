-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE wm_RShipmentHeader07
	@shipmentId nvarchar(25),
        @warehouse  nvarchar(25),
		@TrailingSts numeric(3)
AS	
	if(@TrailingSts>0)
		begin
			SELECT * FROM Upload_order_Header  WHERE SHIPMENT_ID = @ShipmentID AND WAREHOUSE = @warehouse and Trailing_Sts = @TrailingSts;
		end
	else
		begin
			SELECT * FROM SHIPMENT_HEADER  WHERE SHIPMENT_ID = @ShipmentID AND WAREHOUSE = @warehouse ;
		end	