/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	57782	| DRK	| 09/08/09	| Created
*/

CREATE PROCEDURE wm_DShipmentHeaderVasActivity01
    @vasActivitiyId numeric(9),
	@internalShipmentNum numeric(9)
	
AS
	DELETE FROM SHIPMENT_HEADER_VAS_ACTIVITY
	WHERE VAS_ACTIVITY_ID = @vasActivitiyId AND
	INTERNAL_SHIPMENT_NUM = @internalShipmentNum;
