/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	57782	| DRK   | 09/08/09	| Created
*/

CREATE PROCEDURE wm_RShipmentDetailVasActivity02
	@objectId numeric(9)
			
AS
	
		SELECT * FROM SHIPMENT_DETAIL_VAS_ACTIVITY
		WHERE OBJECT_ID = @objectId;
	
