

CREATE PROCEDURE WTH_UpdateDetailFull(
	@cPD nchar(1), -- SYSTEM_CREATED used to set char type
	@dQty	numeric(19,5),
	@iDtl numeric(9),
	@iFromTo int,
	@stCurrentLoc nchar(1),
	@stEquip nvarchar(25),
	@stUser nvarchar(30),
	@startDateTime datetime = null)
AS
	SET NOCOUNT ON;

	-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;
	-- #DEFINE WMW.Inventory Manh.WMW.Inventory.General.InventoryConstants InventoryConst;
	
	-- local variables
    declare @endDateTime datetime = GETUTCDATE();
	declare @iError int;
	declare @iHdr numeric(9);
	declare @iRowCount int;
	declare @stMsg nvarchar(2000);

	-- validate parameters.
	if (@iDtl is null OR @iDtl <= 0)
		return -1;
	
	if (@iFromTo = 0)
	begin
		UPDATE WORK_INSTRUCTION 
		SET	FROM_QTY = 0,
			TO_QTY = TO_QTY + FROM_QTY,
			EQUIPMENT_LOC = @stEquip,
			END_DATE_TIME = @endDateTime,
			COMPLETED_BY_USER = CASE WHEN COMPLETED_BY_USER is NULL THEN @stUser ELSE COMPLETED_BY_USER END,
			TEAM_ASSIGNED = NULL
		WHERE INTERNAL_INSTRUCTION_NUM = @iDtl
		AND FROM_QTY >= @dQty;
		select @iError = @@ERROR, @iRowCount = @@ROWCOUNT;
	end;

	else if (@iFromTo = 1)
	begin
		if (@cPD = N'Y')
		begin
			UPDATE WORK_INSTRUCTION 
			SET	EQUIPMENT_LOC = NULL,
				TO_QTY = 0,
				FROM_QTY = FROM_QTY + TO_QTY,
				INVENTORY_AT_PD = @stCurrentLoc,
				END_DATE_TIME = @endDateTime,
				COMPLETED_BY_USER = CASE WHEN COMPLETED_BY_USER is NULL THEN @stUser ELSE COMPLETED_BY_USER END,
				TEAM_ASSIGNED = NULL
			WHERE INTERNAL_INSTRUCTION_NUM = @iDtl
			AND TO_QTY >= @dQty;	
			select @iError = @@ERROR, @iRowCount = @@ROWCOUNT;
		end;

		else
		begin
			UPDATE WORK_INSTRUCTION 
			SET	EQUIPMENT_LOC = NULL,
				TO_QTY = 0,
				CONDITION = CASE WHEN FROM_QTY <= 0 THEN N'Closed' ELSE CONDITION END,
				COMPLETED_BY_USER = CASE WHEN (FROM_QTY <= 0 AND COMPLETED_BY_USER is NULL)  THEN @stUser ELSE COMPLETED_BY_USER END,
				END_DATE_TIME = @endDateTime,
				TEAM_ASSIGNED = NULL
			WHERE INTERNAL_INSTRUCTION_NUM = @iDtl
			AND TO_QTY >= @dQty;
			select @iError = @@ERROR, @iRowCount = @@ROWCOUNT;

		end;
	end;

	else
	begin
		UPDATE WORK_INSTRUCTION 
		SET	FROM_QTY = 0,
			TO_QTY = CASE WHEN (INTERNAL_NUM_TYPE = N'Inventory Adjustment'  AND FROM_LOC IS NULL AND TO_QTY >= @dQty) THEN 0 
				    ELSE TO_QTY 
				END,
			EQUIPMENT_LOC = NULL,
			CONDITION = CASE WHEN (TO_QTY <= 0  OR (INTERNAL_NUM_TYPE = N'Inventory Adjustment'  AND FROM_LOC IS NULL AND TO_QTY >= 
						@dQty))
					 THEN N'Closed' 
				    ELSE CONDITION END,
			COMPLETED_BY_USER = CASE WHEN (
							(TO_QTY <= 0 
							 OR 
							  (INTERNAL_NUM_TYPE = N'Inventory Adjustment'  AND FROM_LOC IS NULL AND TO_QTY >= @dQty)
							)
							AND COMPLETED_BY_USER is NULL) THEN @stUser 
						 ELSE COMPLETED_BY_USER END,
			START_DATE_TIME = CASE WHEN @startDateTime is null THEN START_DATE_TIME ELSE @startDateTime END,
			END_DATE_TIME = @endDateTime,

			TEAM_ASSIGNED = NULL
		WHERE INTERNAL_INSTRUCTION_NUM = @iDtl
		AND (
		     FROM_QTY >= @dQty
		     OR (INTERNAL_NUM_TYPE = N'Inventory Adjustment' 
		    	 AND FROM_LOC IS NULL
		    	 AND TO_QTY >= @dQty)
		    );
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
	 
	exec @iError = WTH_UpdateHeader @iHdr, @endDateTime;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

