-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RShipmentHeaderVasActivity02
	@objectId numeric(9)
			
AS
	
		SELECT * FROM SHIPMENT_HEADER_VAS_ACTIVITY
		WHERE OBJECT_ID = @objectId;
	
