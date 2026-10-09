/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	16414	| PKN	| 07/25/05	| Created
*/

CREATE PROCEDURE wm_RLotTemplate01
	@LotTemplate nvarchar(25)	
	
AS
	SELECT * FROM LOT_TEMPLATE
        WHERE 
	LOT_TEMPLATE = @LotTemplate




