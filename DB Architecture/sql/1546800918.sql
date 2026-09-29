-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */























CREATE PROCEDURE WTH_UpdateDetailShort(
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
			TO_QTY = TO_QTY + @dQty,
			CONDITION = CASE WHEN TO_QTY + @dQty <= 0 THEN N'<literal:1>' ELSE CONDITION END,
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
		WHERE INTERNAL_INSTRUCTION_NUM = @iDtl
		AND FROM_QTY >= @dQty;
		select @iError = @@ERROR, @iRowCount = @@ROWCOUNT;
	end;

	else
	begin
		UPDATE WORK_INSTRUCTION 
		SET	FROM_QTY = 0,
			CONDITION = CASE WHEN TO_QTY <= 0 THEN N'<literal:2>' ELSE CONDITION END,
			COMPLETED_BY_USER = CASE WHEN TO_QTY <= 0 THEN @stUser ELSE COMPLETED_BY_USER END,
			QUANTITY = QUANTITY - (FROM_QTY - @dQty),
			TOTAL_WEIGHT = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (TOTAL_WEIGHT / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			TOTAL_VOLUME = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (TOTAL_VOLUME / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			TOTAL_VALUE = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (TOTAL_VALUE / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			CONVERTED_QTY = CASE WHEN (QUANTITY - (FROM_QTY - @dQty)) <= 0 THEN 0 
					ELSE (CONVERTED_QTY / QUANTITY) * (QUANTITY - (FROM_QTY - @dQty)) END,
			EQUIPMENT_LOC = NULL,
			START_DATE_TIME = CASE WHEN @startDateTime is null THEN START_DATE_TIME ELSE @startDateTime END,
			END_DATE_TIME = @endDateTime,
			TEAM_ASSIGNED = NULL
		WHERE INTERNAL_INSTRUCTION_NUM = @iDtl
		AND FROM_QTY >= @dQty;
		select @iError = @@ERROR, @iRowCount = @@ROWCOUNT;
	end;
	
	if (@iError <> 0) return -1;	
		
	if (@iRowCount <= 0) 
      begin 
		set @stMsg = N'<literal:3>' + dbo.RSCMfn_RtrvMsg(N'<literal:4>'); 
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
-- [comment omitted]


