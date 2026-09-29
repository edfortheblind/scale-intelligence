-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */












CREATE PROCEDURE SHP_UpdateFreightCharges(
@internalShipNum numeric(9)
)
AS
BEGIN

DECLARE @totalFreightCharge numeric(28,5);
DECLARE @baseFreightCharge numeric(19,5);
DECLARE @freightDiscount numeric(19,5);
DECLARE @accessorialCharge numeric(19,5);

SELECT
   @totalFreightCharge = SUM(TOTAL_FREIGHT_CHARGE) ,
   @baseFreightCharge = SUM(BASE_FREIGHT_CHARGE) ,
   @freightDiscount = SUM(FREIGHT_DISCOUNT),
   @accessorialCharge = SUM(ACCESSORIAL_CHARGE)
FROM
   SHIPPING_CONTAINER
WHERE
   INTERNAL_SHIPMENT_NUM= @internalShipNum
   AND ( MANIFEST_STATE = N'<literal:1>' OR MANIFEST_STATE = N'<literal:2>' )
   AND ( PARENT_CONTAINER_ID IS NULL OR PARENT_CONTAINER_ID = CONTAINER_ID );

UPDATE
   SHIPMENT_HEADER
SET
	TOTAL_FREIGHT_CHARGE = @totalFreightCharge,
	BASE_FREIGHT_CHARGE = @baseFreightCharge,
	FREIGHT_DISCOUNT = @freightDiscount,
	ACCESSORIAL_CHARGE = @accessorialCharge
WHERE
   INTERNAL_SHIPMENT_NUM = @internalShipNum;

END