
CREATE PROCEDURE WTH_UpdateDetailsHeader(
	@iDtlInstrNum numeric(9))
AS
	SET NOCOUNT ON;
	
	-- local variables
	declare @iError int;
	declare @iHdrInstrNum numeric(9);

	-- validate parameters.
	if (@iDtlInstrNum is null
		OR @iDtlInstrNum <= 0)
		return -1;
	
	-- retrieve the parent's internal number and pass it to 
	-- WTH_UpdateHeader
	SELECT @iHdrInstrNum = PARENT_INSTR
	  FROM WORK_INSTRUCTION
	 WHERE INTERNAL_INSTRUCTION_NUM = @iDtlInstrNum;
	 
	exec @iError = WTH_UpdateHeader @iHdrInstrNum;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- end WTH_UpdateDetailsHeader
