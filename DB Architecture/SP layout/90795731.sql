/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	57782	| DRK   | 09/08/09	| Created
*/

CREATE PROCEDURE wm_RShipmentHeaderVasActivity01
	@internalShipmentNum numeric(9)
			
AS	
		SELECT * FROM SHIPMENT_HEADER_VAS_ACTIVITY
		WHERE INTERNAL_SHIPMENT_NUM = @internalShipmentNum;
	
