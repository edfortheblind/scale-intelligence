/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	57782	| DRK   | 09/08/09	| Created
*/

CREATE PROCEDURE wm_UShipmentDetailVasActivity01
	@objectId numeric(9),
    @instructions nvarchar(2000)
			
AS	
		UPDATE SHIPMENT_DETAIL_VAS_ACTIVITY
        SET INSTRUCTIONS = @instructions
		WHERE OBJECT_ID = @objectId;
	
