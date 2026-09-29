-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


CREATE PROCEDURE WTH_UpdateDetailFull(
	@cPD nchar(1), -- [comment omitted]
	@dQty	numeric(19,5),
	@iDtl numeric(9),
	@iFromTo int,
	@stCurrentLoc nchar(1),
	@stEquip nvarchar(25),
	@stUser nvarchar(30),
	@startDateTime datetime = null)
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	-- [comment omitted]
	
	-- [comment omitted]
    declare @endDateTime datetime = GETUTCDATE();
	declare @iError int;
	declare @iHdr numeric(9);
	declare @iRowCount int;
	declare @stMsg nvarchar(2000);

	-- [comment omitted]
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
		if (@cPD = N'<literal:1>')
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
				CONDITION = CASE WHEN FROM_QTY <= 0 THEN N'<literal:2>' ELSE CONDITION END,
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
			TO_QTY = CASE WHEN (INTERNAL_NUM_TYPE = N'<literal:3>'  AND FROM_LOC IS NULL AND TO_QTY >= @dQty) THEN 0 
				    ELSE TO_QTY 
				END,
			EQUIPMENT_LOC = NULL,
			CONDITION = CASE WHEN (TO_QTY <= 0  OR (INTERNAL_NUM_TYPE = N'<literal:4>'  AND FROM_LOC IS NULL AND TO_QTY >= 
						@dQty))
					 THEN N'<literal:5>' 
				    ELSE CONDITION END,
			COMPLETED_BY_USER = CASE WHEN (
							(TO_QTY <= 0 
							 OR 
							  (INTERNAL_NUM_TYPE = N'<literal:6>'  AND FROM_LOC IS NULL AND TO_QTY >= @dQty)
							)
							AND COMPLETED_BY_USER is NULL) THEN @stUser 
						 ELSE COMPLETED_BY_USER END,
			START_DATE_TIME = CASE WHEN @startDateTime is null THEN START_DATE_TIME ELSE @startDateTime END,
			END_DATE_TIME = @endDateTime,

			TEAM_ASSIGNED = NULL
		WHERE INTERNAL_INSTRUCTION_NUM = @iDtl
		AND (
		     FROM_QTY >= @dQty
		     OR (INTERNAL_NUM_TYPE = N'<literal:7>' 
		    	 AND FROM_LOC IS NULL
		    	 AND TO_QTY >= @dQty)
		    );
		select @iError = @@ERROR, @iRowCount = @@ROWCOUNT;
	end;

	
	if (@iError <> 0) return -1;	
		
	if (@iRowCount <= 0) 
      begin 
		set @stMsg = N'<literal:8>' + dbo.RSCMfn_RtrvMsg(N'<literal:9>'); 
            RAISERROR(@stMsg, 18, 1); 
            return -1; 
     	end;		

	-- [comment omitted]
	-- [comment omitted]
	SELECT @iHdr = PARENT_INSTR
	  FROM WORK_INSTRUCTION
	 WHERE INTERNAL_INSTRUCTION_NUM = @iDtl;
	 
	exec @iError = WTH_UpdateHeader @iHdr, @endDateTime;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

