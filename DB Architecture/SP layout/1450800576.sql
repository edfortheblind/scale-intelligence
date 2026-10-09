/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	20780		| MDL			| 05/09/08	| Created.

*/


CREATE PROCEDURE WTH_SplitWorkInPutaway(
	@dQty	numeric(19,5),
	@iDtl numeric(9))
AS
	SET NOCOUNT ON;
	
	declare @iError int;
	declare @newWorkInstr numeric(9);

	-- validate parameters.
	if (@iDtl is null OR @iDtl <= 0 OR @dQty is null OR @dQty <= 0)
		return -1;
	
	exec @iError = WTH_SplitWorkInPutawayRetInstr 
					@dQty, @iDtl, N'System', @newWorkInstr output;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

	
-- end WTH_SplitWorkInPutaway





