-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE wm_RShipmentAllocRequest01
	@intNum numeric(9)
AS
	SELECT * FROM SHIPMENT_ALLOC_REQUEST
	WHERE INTERNAL_SHIP_ALLOC_NUM = @intNum;
