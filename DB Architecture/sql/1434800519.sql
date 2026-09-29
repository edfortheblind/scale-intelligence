-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



















CREATE PROCEDURE WTH_SplitWork(
	@dQty	numeric(19,5),
	@iDtl numeric(9),
	@confirmMode NUMERIC (1,0))
AS
	SET NOCOUNT ON;
	
	declare @iError int;
	declare @newWorkInstr numeric(9);
	declare @newRequest numeric(9);
	declare @internalNumType nvarchar(25);
	declare @internalNum numeric(9);

	-- [comment omitted]
	if (@iDtl is null OR @iDtl <= 0 OR @dQty is null OR @dQty <= 0)
		return -1;
	
	exec @iError = WTH_SplitWorkWithReturnInstr 
					@dQty, @iDtl, N'<literal:1>', @confirmMode, @newWorkInstr output;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	
	Select @internalNumType= INTERNAL_NUM_TYPE, @internalNum =INTERNAL_NUM 
	FROM WORK_INSTRUCTION WHERE INTERNAL_INSTRUCTION_NUM =@iDtl;
	
	if(@internalNumType = N'<literal:2>' AND @confirmMode <> 1 )
	BEGIN
	
		exec @iError = WRK_SPLITREPLENISHMENTREQUEST @dQty ,@internalNum,@newWorkInstr,@newRequest;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	
	END;

	
-- [comment omitted]

