-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RShipmentDetailVasActivity03
	@vasActivityId numeric(9),
    @internalNum numeric(9)
			
AS
	
		SELECT * FROM SHIPMENT_DETAIL_VAS_ACTIVITY
		WHERE VAS_ACTIVITY_ID = @vasActivityId
        AND INTERNAL_SHIPMENT_LINE_NUM = @internalNum;
	
