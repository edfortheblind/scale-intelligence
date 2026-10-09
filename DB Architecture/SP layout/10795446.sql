/*
	Task	| By	| Date		| Modification Description
	----------------------------------------------------------------------------------------------
	16241	| VK	| 07/25/05	| Merged oracle and Sql server versions.
	16241	| VK	| 07/25/05	| Modified to join with order header to retrieve extra columns.
	5114	| SPS	| 06/06/07	| Modified query to retrieve from SHIPMENT_HEADER_VIEW rather than SHIPMENT_HEADER
	136109  |KSS    |02/02/14   | CHnages made for DINT
	191074	| DN	| 01/23/17	| Updated parameter types
*/


CREATE PROCEDURE wm_RShipmentHeader01
	@InternalShipmentNum numeric(9),
	@TrailingSts numeric(3)
AS
	if(@TrailingSts >0)
		begin	
			SELECT *	FROM Upload_order_header WHERE INTERNAL_SHIPMENT_NUM = @InternalShipmentNum and Trailing_Sts =@TrailingSts;
		end
	Else
		begin
			 SELECT * FROM SHIPMENT_HEADER WHERE INTERNAL_SHIPMENT_NUM = @InternalShipmentNum  
		end
		

