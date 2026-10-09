/*
	Task	| By	| Date		| Modification Description
	----------------------------------------------------------------------------------------------
	16241	| VK	| 07/25/05	| Merged oracle and Sql server versions.
	16241	| VK	| 07/25/05	| Modified to join with order header to retrieve extra columns.
	136109   |KSS    |  02/20/14 | CHnages made for DINT.
	191074	| DN	| 01/23/17	| Updated parameter types
*/

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

