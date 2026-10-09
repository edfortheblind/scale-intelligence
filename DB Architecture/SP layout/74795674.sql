/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14902	| VK	| 08/10/05	| Created
*/

CREATE PROCEDURE wm_RShipmentHeader09
	@internalShipNum numeric(9),
        @company  nvarchar(25)
AS
	SELECT * 
    	FROM shipment_header
    	WHERE internal_shipment_num = @internalShipNum
        AND ISNULL(company,N'*') = ISNULL(@company,N'*') ;



