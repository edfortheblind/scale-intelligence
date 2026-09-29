-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE PROCEDURE WTH_UpdateDetailsHeader(
	@iDtlInstrNum numeric(9))
AS
	SET NOCOUNT ON;
	
	-- [comment omitted]
	declare @iError int;
	declare @iHdrInstrNum numeric(9);

	-- [comment omitted]
	if (@iDtlInstrNum is null
		OR @iDtlInstrNum <= 0)
		return -1;
	
	-- [comment omitted]
	-- [comment omitted]
	SELECT @iHdrInstrNum = PARENT_INSTR
	  FROM WORK_INSTRUCTION
	 WHERE INTERNAL_INSTRUCTION_NUM = @iDtlInstrNum;
	 
	exec @iError = WTH_UpdateHeader @iHdrInstrNum;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- [comment omitted]
