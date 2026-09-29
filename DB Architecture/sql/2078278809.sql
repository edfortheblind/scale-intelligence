-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RShipmentDetail06
	@InternalShipmentLineNum  numeric(9),
        @company  nvarchar(25)
AS
	SELECT * 
    	FROM shipment_detail
    	WHERE internal_shipment_line_num = @InternalShipmentLineNum  
        AND ISNULL(company,N'<literal:1>') = ISNULL(@company,N'<literal:2>') ;



