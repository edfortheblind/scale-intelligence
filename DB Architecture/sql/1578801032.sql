-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */


































		
CREATE PROCEDURE WTH_UpdateStatus(
	@iIntInstrNum numeric(9),
	@dConfQty numeric(19,5),
	@stInstrType nvarchar(25),
	@iMode numeric(1), 
	@iConfType numeric(1))
AS
	SET NOCOUNT ON

	-- [comment omitted]
	
	-- [comment omitted]
	declare @dFromQty numeric(19,5);
	declare @dOnHandQty numeric(19,5);
	declare @dToQty numeric(19,5);
	declare @iClosedSts numeric(3);
	declare @iStatusAfterInPutaway numeric(3);
	declare @iError int;
	declare @workInstructionCount int;
	declare @iFromSts numeric(3);
	declare @iInPacking numeric(3);
	declare @iInPutawaySts numeric(3);
	declare @iIntContNum numeric(9);
	declare @iIntLineNum numeric(9);
	declare @iIntNum numeric(9);
	declare @iOneAftPickPendSts numeric(3);
	declare @iPackPendSts numeric(3);
	declare @iPickingPendingSts numeric(3);
	declare @iStatus1 numeric(3);
	declare @iToSts numeric(3);
	declare @iTwoAftPickPendSts numeric(3);
	declare @stStatusFlowName nvarchar(25);
	declare @containerStatusFlow nvarchar(25);
	
	-- [comment omitted]
	-- [comment omitted]
	if (@stInstrType = N'<literal:1>'
		AND @dConfQty > 0.0)
	begin
		SELECT @dFromQty = WI.FROM_QTY,
			   @iIntLineNum = WI.INTERNAL_LINE_NUM,
			   @iIntContNum = WI.INTERNAL_CONTAINER_NUM,
			   @stStatusFlowName = SD.STATUS_FLOW_NAME,	   
			   @iStatus1 = SD.STATUS1
		  FROM WORK_INSTRUCTION WI LEFT OUTER JOIN SHIPMENT_DETAIL SD
			ON WI.INTERNAL_LINE_NUM = SD.INTERNAL_SHIPMENT_LINE_NUM
		 WHERE WI.INTERNAL_INSTRUCTION_NUM = @iIntInstrNum;

		-- [comment omitted]
		-- [comment omitted]
		set @iPackPendSts =  dbo.STSfn_RtrvSts(N'<literal:2>', N'<literal:3>')

		if (@iStatus1 >= @iPackPendSts)
			return 0;

		-- [comment omitted]
		set @iPickingPendingSts = dbo.STSfn_RtrvSts
					(N'<literal:4>', N'<literal:5>');
		
		-- [comment omitted]
		-- [comment omitted]
		IF (@iIntContNum >0) -- [comment omitted]
		BEGIN
			-- [comment omitted]
			SELECT @containerStatusFlow = STATUS_FLOW_NAME
			FROM SHIPPING_CONTAINER SC
			WHERE SC.INTERNAL_CONTAINER_NUM = @iIntContNum;

			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
			IF (@containerStatusFlow IS NULL)
			BEGIN
				SELECT  @containerStatusFlow = (SELECT TOP 1 SD.STATUS_FLOW_NAME
				FROM SHIPMENT_DETAIL SD
					WHERE SD.INTERNAL_SHIPMENT_LINE_NUM IN (
						SELECT SC.INTERNAL_SHIPMENT_LINE_NUM
						FROM WORK_INSTRUCTION WI 
							LEFT OUTER JOIN SHIPPING_CONTAINER SC
								ON(WI.INTERNAL_CONTAINER_NUM = SC.INTERNAL_CONTAINER_NUM
									AND WI.INTERNAL_INSTRUCTION_NUM  = @iIntInstrNum)));
			END

		IF (@containerStatusFlow IS NOT NULL)
			SELECT @stStatusFlowName = @containerStatusFlow;
					
		END

		-- [comment omitted]
		set @iOneAftPickPendSts = dbo.STSfn_RtrvAdjacentSts(N'<literal:6>', 
											  @stStatusFlowName,
											  @iPickingPendingSts, 
											  1);
		-- [comment omitted]
		-- [comment omitted]
		if (@iMode <> 0)
		begin
			set @iInPacking = dbo.STSfn_RtrvAdjacentSts(N'<literal:7>', 
												  @stStatusFlowName, 
												  @iPackPendSts, 
												  1);
			
			set @iTwoAftPickPendSts = dbo.STSfn_RtrvAdjacentSts(N'<literal:8>', 
												  @stStatusFlowName, 
												  @iOneAftPickPendSts, 
												  1);
		end; -- [comment omitted]
		
		-- [comment omitted]
		if (@iMode = 0)
		begin
			set @iFromSts = @iPickingPendingSts;
			set @iToSts = @iOneAftPickPendSts;
		end; -- [comment omitted]
		else if (@iMode = 1)
		begin
			set @iFromSts = @iOneAftPickPendSts;

			if(@iIntContNum > 0)
			begin
				set @iToSts = @iInPacking;
			end;
			else
			begin
				set @iToSts = @iTwoAftPickPendSts; 
			end;
		end; -- [comment omitted]
		else
		begin
			set @iFromSts = @iPickingPendingSts;

			if(@iIntContNum > 0)
			begin
				set @iToSts = @iInPacking;
			end;
			else
			begin
				set @iToSts = @iTwoAftPickPendSts; 
			end;
		end; -- [comment omitted]

		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		if (@stStatusFlowName is not null)
		begin
			set @iOneAftPickPendSts = null;
		end; -- [comment omitted]

		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		if (@iConfType <> 2
			and @iIntContNum > 0
			and ((@iMode = 1 and @dFromQty = 0) or (@iMode <> 1)))
		begin
			
			exec @iError = SCB_SetStatus @iIntContNum, @iToSts;

			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		end -- [comment omitted]

		-- [comment omitted]
		exec @iError = SDB_MoveQtyToSts @iIntLineNum, 
										@dConfQty, 
										@iFromSts, 
										@iToSts;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		
	end; -- [comment omitted]
	
	-- [comment omitted]
	else if (@stInstrType = N'<literal:9>')
	begin
		SELECT @iIntContNum = WI.INTERNAL_NUM,
			   @dFromQty = WI.FROM_QTY,
			   @dToQty = WI.TO_QTY,
			   @stStatusFlowName = RD.STATUS_FLOW_NAME
			FROM WORK_INSTRUCTION WI LEFT OUTER JOIN RECEIPT_DETAIL RD
			ON WI.INTERNAL_LINE_NUM = RD.INTERNAL_RECEIPT_LINE_NUM
			WHERE WI.INTERNAL_INSTRUCTION_NUM = @iIntInstrNum;
		
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		set @workInstructionCount =  (SELECT COUNT(*) FROM WORK_INSTRUCTION WI
									WHERE
									WI.INTERNAL_INSTRUCTION_NUM <> @iIntInstrNum
									AND
									WI.INTERNAL_NUM = @iIntContNum
									AND
									WI.INSTRUCTION_TYPE = N'<literal:10>'
									AND
									WI.INTERNAL_NUM_TYPE = N'<literal:11>'
									AND
									WI.CONDITION <> N'<literal:12>');

		-- [comment omitted]
		-- [comment omitted]
		if (@iMode = 0
		    and (@iConfType <> 1 or @dConfQty > 0.0))
		begin
			set @iInPutawaySts = dbo.STSfn_RtrvSts(N'<literal:13>', 
												   N'<literal:14>');
			exec @iError = RCB_SetStatus @iIntContNum, @iInPutawaySts;
			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		end; -- [comment omitted]
		
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		else if (((@iMode = 2 and @dFromQty = @dConfQty and @dToQty = 0.0)
				 or (@iConfType = 1 and @dToQty = 0.0)
				 or (@iMode = 1 and @dFromQty = 0.0)) and @workInstructionCount = 0)
		begin
				set @iStatusAfterInPutaway = dbo.STSfn_RtrvAdjacentSts(N'<literal:15>',
																	@stStatusFlowName,
																	301,
																	1);
				exec @iError = RCB_SetStatus @iIntContNum, @iStatusAfterInPutaway;

			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		end; -- [comment omitted]
	end; -- [comment omitted]
	
	-- [comment omitted]
	else if (@stInstrType = N'<literal:16>')
	begin
		-- [comment omitted]
		if (@iMode = 1
			or @iMode = 2)
		begin
			-- [comment omitted]
			if (@iMode = 1)
			begin
				SELECT @iIntLineNum = INTERNAL_LINE_NUM,
					   @iIntNum = INTERNAL_NUM,
					   @dOnHandQty = CONVERTED_QTY / QUANTITY * (QUANTITY - FROM_QTY)
				  FROM WORK_INSTRUCTION
				 WHERE INTERNAL_INSTRUCTION_NUM = @iIntInstrNum;
			end; -- [comment omitted]
			
			-- [comment omitted]
			-- [comment omitted]
			else -- [comment omitted]
			begin
				SELECT @iIntLineNum = INTERNAL_LINE_NUM,
					   @iIntNum = INTERNAL_NUM,
					   @dOnHandQty = CONVERTED_QTY / QUANTITY * 
									 (QUANTITY - (FROM_QTY - @dConfQty))
				  FROM WORK_INSTRUCTION
				 WHERE INTERNAL_INSTRUCTION_NUM = @iIntInstrNum;
			end; -- [comment omitted]
					
			-- [comment omitted]
			-- [comment omitted]
			UPDATE WORK_ORDER_DETAIL
			   SET ON_HAND_QTY = (CASE
				   WHEN @dOnHandQty > TOTAL_CONVERTED_QTY_NEEDED
				   THEN TOTAL_CONVERTED_QTY_NEEDED
				   ELSE ON_HAND_QTY + @dConfQty END),
				   PROCESS_STAMP = N'<literal:17>',
				   DATE_TIME_STAMP = GETUTCDATE()
			 WHERE INTERNAL_WRK_ORD_LINE_NUM = @iIntLineNum;
			if (@@ERROR <> 0) return -1;
			 
		    -- [comment omitted]
		    exec WOHB_UpdateQtyAvailToBuild @iIntNum;
			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		end;	-- [comment omitted]
	end; -- [comment omitted]
	
	-- [comment omitted]
	ELSE IF (@stInstrType = N'<literal:18>')
	BEGIN
		exec @iError = WTH_UpdateStatusDockMgmt @iIntInstrNum, @dConfQty, @iMode;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	END;
-- [comment omitted]



