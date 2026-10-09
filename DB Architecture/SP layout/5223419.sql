/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	43140	| RP	| 07/11/24	| Created.

	Parameters:
		INTERNAL_PUTAWAY_NUM  The internal putaway number.
	Returns:
		Rowset used for WO Putaway label. 

*/

CREATE PROCEDURE LBL_FinishedGoodPutaway(
	@INTERNAL_PUTAWAY_NUM numeric(9))
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT  WOP.ITEM,
			WOP.ITEM_DESC,
			WOP.COMPANY,
			WOP.PUTAWAY_UNIT_ID,
			WOP.QUANTITY,
			WOP.LOCATION
	FROM WORK_ORDER_PUTAWAY_UNIT WOP
	WHERE INTERNAL_PUTAWAY_NUM = @INTERNAL_PUTAWAY_NUM
	
END 
