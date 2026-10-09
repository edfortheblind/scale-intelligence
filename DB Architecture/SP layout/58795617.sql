/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14673	| KSP	| 11/03/04	| Created
*/

CREATE PROCEDURE wm_RShipmentHeader08
	@internalShipNum numeric(9),
        @warehouse  nvarchar(25)
AS
	SELECT * 
    	FROM shipment_header
    	WHERE internal_shipment_num = @internalShipNum
        AND warehouse = @Warehouse



