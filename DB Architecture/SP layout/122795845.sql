/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	57782	| DRK   | 09/08/09	| Created
*/

CREATE PROCEDURE wm_RShipmentHeaderVasActivity03
	@vasActivityId numeric(9),
    @internalNum numeric(9)
			
AS
	
		SELECT * FROM SHIPMENT_HEADER_VAS_ACTIVITY
		WHERE VAS_ACTIVITY_ID = @vasActivityId
        AND INTERNAL_SHIPMENT_NUM = @internalNum;
	
