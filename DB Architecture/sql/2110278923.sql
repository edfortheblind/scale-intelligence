-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RShipmentDetailVasActivity01
	@internalShipmentLineNum numeric(9)
			
AS	
		SELECT * FROM SHIPMENT_DETAIL_VAS_ACTIVITY
		WHERE INTERNAL_SHIPMENT_LINE_NUM = @internalShipmentLineNum;
	
