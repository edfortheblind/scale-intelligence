-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RShipmentHeaderVasActivity01
	@internalShipmentNum numeric(9)
			
AS	
		SELECT * FROM SHIPMENT_HEADER_VAS_ACTIVITY
		WHERE INTERNAL_SHIPMENT_NUM = @internalShipmentNum;
	
