/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14673	| KSP	| 11/03/04	| Created
	70901	| NB	| 07/12/10	| Modified to select from shipment header view 
	136109   |KSS    | 02/20/14  | CHnages made for DINT.

*/

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