-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE wm_RShipmentHeader02
   @shipmentId nvarchar(25),
   @TrailingSts numeric(3)
AS
	if(@TrailingSts >0)
		begin	
			SELECT *	FROM Upload_order_header 	 WHERE shipment_id = @shipmentId  and Trailing_Sts =@TrailingSts;
		end
	Else
		begin
			 SELECT * FROM SHIPMENT_HEADER WHERE  shipment_id = @shipmentId   
		end

