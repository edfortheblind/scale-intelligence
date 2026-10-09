
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	8354		| TDL		| 09/03/03	| Created.
	14473		| TDL		| 04/13/04	| Fixed Apostrophes
	17602		| SMF		| 10/17/05	| Do not set user assigned to null
	20063		| PP		| 11/15/06	| Removed the update against the WorkOrderDetail. 
	10527		| AK		| 09/19/07	| Captured milliseconds on the End date time for work instructions 
	16901		| DRK		| 02/21/08	| Added code to deal an Overpick Pick & Put case
	Updates work instruction detail when executing an over pick.
	
	Parameters
		char	@cPD			If this is a P&D location
		double	@dQty			qty to confirm.
		int	@iDtl			The WorkInstruction details internalInstructionNum.
		int	@iFromTo		flag indicating pick or putaway
		String	@stCurrentLoc		current location (could be a P&D location)
		String	@stEquip		equipment location
		String	@stUser			user doing the pick
		
*/
CREATE PROCEDURE WTH_UpdateDetailOverPick(
	@cPD nchar(1),
	@dQty	numeric(19,5),
	@iDtl numeric(9),
	@iFromTo int,
	@stCurrentLoc nchar(1),
	@stEquip nvarchar(25),
	@stUser nvarchar(30))
AS
	SET NOCOUNT ON;

	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;
	-- #DEFINE WMW.Inventory Manh.WMW.Inventory.General.InventoryConstants InventoryConst;

	-- local variables
	declare @iError int;
	declare @FromQty numeric(19,5);
	declare @iHdr numeric(9);
	declare @iIntLineNum numeric(9);
	declare @iRowCount int;
	declare @stMsg nvarchar(2000);

	-- validate parameters.
	if (@iDtl is null OR @iDtl <= 0)
		return -1;
	
	if (@iFromTo = 0)
	begin
	
		SELECT @FromQty = FROM_QTY,
			@iIntLineNum = INTERNAL_LINE_NUM
			FROM WORK_INSTRUCTION
			WHERE INTERNAL_INSTRUCTION_NUM = @iDtl;
	
		UPDATE WORK_INSTRUCTION 
		SET	FROM_QTY = 0,
			TO_QTY = TO_QTY + @dQty,
			CONDITION = CASE WHEN TO_QTY + @dQty <= 0 THEN N'Closed' ELSE CONDITION END,
			COMPLETED_BY_USER = CASE WHEN TO_QTY + @dQty <= 0 THEN @stUser ELSE COMPLETED_BY_USER END,
			QUANTITY = QUANTITY - (FROM_QTY - @dQty),
			TOTAL_WEIGHT = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (TOTAL_WEIGHT / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			TOTAL_VOLUME = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (TOTAL_VOLUME / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			TOTAL_VALUE = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (TOTAL_VALUE / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			CONVERTED_QTY = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (CONVERTED_QTY / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			EQUIPMENT_LOC = @stEquip,
			END_DATE_TIME = GETUTCDATE(),
			TEAM_ASSIGNED = NULL
		WHERE INTERNAL_INSTRUCTION_NUM = @iDtl;
		select @iError = @@ERROR, @iRowCount = @@ROWCOUNT;
	end;
	
	else
	begin
		UPDATE WORK_INSTRUCTION 
		SET	FROM_QTY = 0,
			TO_QTY = 0,			
			EQUIPMENT_LOC = NULL,
			CONDITION = CASE WHEN FROM_QTY - @dQty <= 0 THEN N'Closed' ELSE CONDITION END,
			COMPLETED_BY_USER = CASE WHEN FROM_QTY - @dQty <= 0 THEN @stUser ELSE COMPLETED_BY_USER END,
			TOTAL_WEIGHT = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (TOTAL_WEIGHT / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			TOTAL_VOLUME = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (TOTAL_VOLUME / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			TOTAL_VALUE = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (TOTAL_VALUE / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			CONVERTED_QTY = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (CONVERTED_QTY / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			END_DATE_TIME = CASE WHEN END_DATE_TIME is NULL THEN GETUTCDATE() ELSE END_DATE_TIME END,
			TEAM_ASSIGNED = NULL
		WHERE INTERNAL_INSTRUCTION_NUM = @iDtl;
		select @iError = @@ERROR, @iRowCount = @@ROWCOUNT;
	end;
		if (@iError <> 0) return -1;	
		
		if (@iRowCount <= 0) 
 	     	begin 
			set @stMsg = N'MSG_WORK10: ' + dbo.RSCMfn_RtrvMsg(N'MSG_WORK10'); 
            		RAISERROR(@stMsg, 18, 1); 
            		return -1; 
     		end;	

	
	-- retrieve the parents internal number and pass it to 
	-- WTH_UpdateHeader
	SELECT @iHdr = PARENT_INSTR
	  FROM WORK_INSTRUCTION
	 WHERE INTERNAL_INSTRUCTION_NUM = @iDtl;
	 
	exec @iError = WTH_UpdateHeader @iHdr;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- end WTH_UpdateDetailOverPick




