-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RShipmentHeader08
	@internalShipNum numeric(9),
        @warehouse  nvarchar(25)
AS
	SELECT * 
    	FROM shipment_header
    	WHERE internal_shipment_num = @internalShipNum
        AND warehouse = @Warehouse



