-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE wm_RShipmentAllocRequest02
	@intLineNum numeric(9)
AS
	SELECT * FROM SHIPMENT_ALLOC_REQUEST
	WHERE INTERNAL_SHIPMENT_LINE_NUM = @intLineNum;