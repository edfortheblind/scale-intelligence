-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RShipmentDetail05
	@InternalShipmentLineNum numeric(9)
AS
	SELECT * 
	FROM SHIPMENT_DETAIL 
	WHERE RELATED_INTERNAL_LINE_NUM = @InternalShipmentLineNum 
