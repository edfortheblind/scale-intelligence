/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	57782	| DRK   | 09/08/09	| Created
*/

CREATE PROCEDURE wm_RShipmentDetailVasActivity01
	@internalShipmentLineNum numeric(9)
			
AS	
		SELECT * FROM SHIPMENT_DETAIL_VAS_ACTIVITY
		WHERE INTERNAL_SHIPMENT_LINE_NUM = @internalShipmentLineNum;
	
