-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_UShipmentDetailVasActivity01
	@objectId numeric(9),
    @instructions nvarchar(2000)
			
AS	
		UPDATE SHIPMENT_DETAIL_VAS_ACTIVITY
        SET INSTRUCTIONS = @instructions
		WHERE OBJECT_ID = @objectId;
	
