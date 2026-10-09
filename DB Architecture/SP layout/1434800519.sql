/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	10985		| RLE			| 04/23/03	| Created.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	8610		| JAG			| 08/04/07	| Modified to use WTH_SplitWorkWithReturnInstr
	24028		| PP			| 05/15/08	| Passed an extra parameter "confirmMode".
	Updates work instruction detail when executing a full work instruction,
	pick or putaway.
	85092		| MDL			| 22/06/11	| Split the Replenishment request as we are splitting the work inst , 
	we need to keep request and work instruction in synch otherwise this system result into bad inventory.
	 
	
	Parameters
		double	@dQty			qty to confirm.
		int		@iDtl			The WorkInstruction details internalInstructionNum.		
		int     @confirmMode    The confirmation Mode: Pick-0, Putaway-1, AutoPutaway-2. 
*/


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

	-- validate parameters.
	if (@iDtl is null OR @iDtl <= 0 OR @dQty is null OR @dQty <= 0)
		return -1;
	
	exec @iError = WTH_SplitWorkWithReturnInstr 
					@dQty, @iDtl, N'System', @confirmMode, @newWorkInstr output;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	
	Select @internalNumType= INTERNAL_NUM_TYPE, @internalNum =INTERNAL_NUM 
	FROM WORK_INSTRUCTION WHERE INTERNAL_INSTRUCTION_NUM =@iDtl;
	
	if(@internalNumType = N'Replenishment' AND @confirmMode <> 1 )
	BEGIN
	
		exec @iError = WRK_SPLITREPLENISHMENTREQUEST @dQty ,@internalNum,@newWorkInstr,@newRequest;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	
	END;

	
-- end WTH_SplitWork

