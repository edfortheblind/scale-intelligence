-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RShipmentHeader09
	@internalShipNum numeric(9),
        @company  nvarchar(25)
AS
	SELECT * 
    	FROM shipment_header
    	WHERE internal_shipment_num = @internalShipNum
        AND ISNULL(company,N'<literal:1>') = ISNULL(@company,N'<literal:2>') ;



