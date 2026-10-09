/*
	Task	| By	| Date			| Modification Description
	---------------------------------------------------------------
	132541	| SAM	| 12/16/2013	| Created.

	Parameters:
		@internalShipNum			internal shipment number.

	Purpose :
	SHP_UpdateFreightCharges stored procedure can be used to update freight related information for given shipment

*/

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
   AND ( MANIFEST_STATE = N'Closed' OR MANIFEST_STATE = N'Manifested' )
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