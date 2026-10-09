/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	16414	| PKN	| 07/25/05	| Created
*/

CREATE PROCEDURE wm_RLotAttribute01
	@LotObjectId numeric(9)	
	
AS
	SELECT * FROM LOT_ATTRIBUTE
        WHERE 
	Lot_id = @LotObjectId  




