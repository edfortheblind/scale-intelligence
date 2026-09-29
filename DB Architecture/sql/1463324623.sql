-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RShipmentAccessorials01
	@InternalNum numeric(9)
	,@ShipmentLevel nchar(1)
	,@AccessorialCode nvarchar(25)
	,@AccessorialSubCode nvarchar(25)
AS
	SELECT * FROM SHIPMENT_ACCESSORIALS
	 WHERE INTERNAL_NUM = @InternalNum
	 AND SHIPMENT_LEVEL = @ShipmentLevel
	 AND ACCESSORIAL_CODE = @AccessorialCode
	 AND ACCESSORIAL_SUB_CODE = @AccessorialSubCode
