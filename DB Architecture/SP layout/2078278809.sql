/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	14902	| VK	| 08/10/05	| Created
*/

CREATE PROCEDURE wm_RShipmentDetail06
	@InternalShipmentLineNum  numeric(9),
        @company  nvarchar(25)
AS
	SELECT * 
    	FROM shipment_detail
    	WHERE internal_shipment_line_num = @InternalShipmentLineNum  
        AND ISNULL(company,N'*') = ISNULL(@company,N'*') ;



