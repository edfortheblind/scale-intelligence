-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











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
