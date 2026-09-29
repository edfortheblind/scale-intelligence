-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RLotAttribute01
	@LotObjectId numeric(9)	
	
AS
	SELECT * FROM LOT_ATTRIBUTE
        WHERE 
	Lot_id = @LotObjectId  




