-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


CREATE PROCEDURE SDB_MoveQtyToSts(
	@iIntShipLineNum numeric(9),
	@dMoveQty numeric(19,5),
	@iFromSts numeric(3),
	@iToSts	numeric(3))
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	declare @iStatus1 numeric(3);
	declare @iStatus2 numeric(3);
	declare @iStatus3 numeric(3);
	declare @iStatus4 numeric(3);
	declare @iStatus5 numeric(3);
	declare @iStatus6 numeric(3);
	declare @iStatus7 numeric(3);
	declare @iStatus8 numeric(3);
	declare @iStatus9 numeric(3);
	declare @iStatus10 numeric(3);
	declare @dQtyAtSts1 numeric(19,5);
	declare @dQtyAtSts2 numeric(19,5);
	declare @dQtyAtSts3 numeric(19,5);
	declare @dQtyAtSts4 numeric(19,5);
	declare @dQtyAtSts5 numeric(19,5);
	declare @dQtyAtSts6 numeric(19,5);
	declare @dQtyAtSts7 numeric(19,5);
	declare @dQtyAtSts8 numeric(19,5);
	declare @dQtyAtSts9 numeric(19,5);
	declare @dQtyAtSts10 numeric(19,5);

	-- [comment omitted]
	declare @dFromStsQty numeric(19,5);
	declare @dToStsQty numeric(19,5);
	declare @i int;
	declare @iError int;
	declare @iFromStsPos int;
	declare @iIntShipNum numeric(9);
	declare @iLeadingStsPos int;
	declare @iNewLeadingSts numeric(3);
	declare @iNewTrailingSts numeric(3);
	declare @iOldLeadingSts numeric(3);
	declare @iOldTrailingSts numeric(3);
	declare @iToStsPos int;
	declare @stErrorMsg nvarchar(2000);

	-- [comment omitted]
	SELECT @iStatus1 = STATUS1,
		   @iStatus2 = STATUS2,
		   @iStatus3 = STATUS3,
		   @iStatus4 = STATUS4,
		   @iStatus5 = STATUS5,
		   @iStatus6 = STATUS6,
		   @iStatus7 = STATUS7,
		   @iStatus8 = STATUS8,
		   @iStatus9 = STATUS9,
		   @iStatus10 = STATUS10,
		   @dQtyAtSts1 = QUANTITY_AT_STS1,
		   @dQtyAtSts2 = QUANTITY_AT_STS2,
		   @dQtyAtSts3 = QUANTITY_AT_STS3,
		   @dQtyAtSts4 = QUANTITY_AT_STS4,
		   @dQtyAtSts5 = QUANTITY_AT_STS5,
		   @dQtyAtSts6 = QUANTITY_AT_STS6,
		   @dQtyAtSts7 = QUANTITY_AT_STS7,
		   @dQtyAtSts8 = QUANTITY_AT_STS8,
		   @dQtyAtSts9 = QUANTITY_AT_STS9,
		   @dQtyAtSts10 = QUANTITY_AT_STS10,
		   @iIntShipNum = INTERNAL_SHIPMENT_NUM
	  FROM SHIPMENT_DETAIL WITH (UPDLOCK)
	 WHERE INTERNAL_SHIPMENT_LINE_NUM = @iIntShipLineNum;

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	set @iOldTrailingSts = @iStatus1;
	set @iOldLeadingSts = dbo.SDBfn_GetLeadingStsInRange(@iStatus1, @iStatus2, @iStatus3, @iStatus4, @iStatus5, @iStatus6, @iStatus7, @iStatus8, @iStatus9, @iStatus10);
	
	-- [comment omitted]
	set @iFromStsPos = dbo.SDBfn_GetPosOfSts(@iFromSts, 
										 	 @iStatus1, @iStatus2, @iStatus3, @iStatus4, @iStatus5, @iStatus6, @iStatus7, @iStatus8, @iStatus9, @iStatus10);
	set @dFromStsQty = dbo.SDBfn_GetQtyAtSts(@iFromSts, 
										 	 @iStatus1, @iStatus2, @iStatus3, @iStatus4, @iStatus5, @iStatus6, @iStatus7, @iStatus8, @iStatus9, @iStatus10,
										 	 @dQtyAtSts1, @dQtyAtSts2, @dQtyAtSts3, @dQtyAtSts4, @dQtyAtSts5, @dQtyAtSts6, @dQtyAtSts7, @dQtyAtSts8, @dQtyAtSts9, @dQtyAtSts10);
	set @dFromStsQty = @dFromStsQty - @dMoveQty;

	-- [comment omitted]
	if (@iFromStsPos <= 0)
	begin
		set @stErrorMsg = 
			N'<literal:1>' + dbo.RSCMfn_RtrvMsg(N'<literal:2>'); 				
		RAISERROR(@stErrorMsg , 18, 1);
		return -1;
	end; -- [comment omitted]
	
	-- [comment omitted]
	-- [comment omitted]
	if (@dFromStsQty < 0.0)
	begin
		set @stErrorMsg = 
			N'<literal:3>' + dbo.RSCMfn_RtrvMsg(N'<literal:4>'); 				
		RAISERROR(@stErrorMsg , 18, 1);
		return -1;
	end; -- [comment omitted]
	
	-- [comment omitted]
	-- [comment omitted]
	if (@dFromStsQty > 0.0)
	begin
		if (@iFromStsPos = 1)
			set @dQtyAtSts1 = @dFromStsQty;
		else if (@iFromStsPos = 2)
			set @dQtyAtSts2 = @dFromStsQty;
		else if (@iFromStsPos = 3)
			set @dQtyAtSts3 = @dFromStsQty;
		else if (@iFromStsPos = 4)
			set @dQtyAtSts4 = @dFromStsQty;
		else if (@iFromStsPos = 5)
			set @dQtyAtSts5 = @dFromStsQty;
		else if (@iFromStsPos = 6)
			set @dQtyAtSts6 = @dFromStsQty;
		else if (@iFromStsPos = 7)
			set @dQtyAtSts7 = @dFromStsQty;
		else if (@iFromStsPos = 8)
			set @dQtyAtSts8 = @dFromStsQty;
		else if (@iFromStsPos = 9)
			set @dQtyAtSts9 = @dFromStsQty;
		else if (@iFromStsPos = 10)
			set @dQtyAtSts10 = @dFromStsQty;
	end;
	
	-- [comment omitted]
	else
	begin
		set @i = @iFromStsPos;
		set @iLeadingStsPos = dbo.SDBfn_GetLeadingStsPos(@iStatus1, @iStatus2, @iStatus3, @iStatus4, @iStatus5, @iStatus6, @iStatus7, @iStatus8, @iStatus9, @iStatus10);
		
		-- [comment omitted]
		-- [comment omitted]
		while (@i <= @iLeadingStsPos)
		begin
			if (@i = 1)
			begin
				set @iStatus1 = @iStatus2;
				set @dQtyAtSts1 = @dQtyAtSts2;
			end;
			if (@i = 2)
			begin
				set @iStatus2 = @iStatus3;
				set @dQtyAtSts2 = @dQtyAtSts3;
			end;
			if (@i = 3)
			begin
				set @iStatus3 = @iStatus4;
				set @dQtyAtSts3 = @dQtyAtSts4;
			end;
			if (@i = 4)
			begin
				set @iStatus4 = @iStatus5;
				set @dQtyAtSts4 = @dQtyAtSts5;
			end;
			if (@i = 5)
			begin
				set @iStatus5 = @iStatus6;
				set @dQtyAtSts5 = @dQtyAtSts6;
			end;
			if (@i = 6)
			begin
				set @iStatus6 = @iStatus7;
				set @dQtyAtSts6 = @dQtyAtSts7;
			end;
			if (@i = 7)
			begin
				set @iStatus7 = @iStatus8;
				set @dQtyAtSts7 = @dQtyAtSts8;
			end;
			if (@i = 8)
			begin
				set @iStatus8 = @iStatus9;
				set @dQtyAtSts8 = @dQtyAtSts9;
			end;
			if (@i = 9)
			begin
				set @iStatus9 = @iStatus10;
				set @dQtyAtSts9 = @dQtyAtSts10;
			end;
			else if (@i = 10)
			begin
				set @iStatus10 = 0;	
				set @dQtyAtSts10 = 0.0;
			end;
			
			set @i = (@i + 1);
		end; -- [comment omitted]
		
		set @iLeadingStsPos = @iLeadingStsPos - 1;
	end; -- [comment omitted]

	-- [comment omitted]
	set @iToStsPos = dbo.SDBfn_GetPosOfSts(@iToSts, 
									   	   @iStatus1, @iStatus2, @iStatus3, @iStatus4, @iStatus5, @iStatus6, @iStatus7, @iStatus8, @iStatus9, @iStatus10);
	set @dToStsQty = dbo.SDBfn_GetQtyAtSts(@iToSts, 
									   	   @iStatus1, @iStatus2, @iStatus3, @iStatus4, @iStatus5, @iStatus6, @iStatus7, @iStatus8, @iStatus9, @iStatus10,
									   	   @dQtyAtSts1, @dQtyAtSts2, @dQtyAtSts3, @dQtyAtSts4, @dQtyAtSts5, @dQtyAtSts6, @dQtyAtSts7, @dQtyAtSts8, @dQtyAtSts9, @dQtyAtSts10);
	set @dToStsQty = @dToStsQty + @dMoveQty;

	-- [comment omitted]
	if (@iToStsPos > 0)
	begin
		-- [comment omitted]
		if (@iToStsPos = 1)
			set @dQtyAtSts1 = @dToStsQty;
		else if (@iToStsPos = 2)
			set @dQtyAtSts2 = @dToStsQty;
		else if (@iToStsPos = 3)
			set @dQtyAtSts3 = @dToStsQty;
		else if (@iToStsPos = 4)
			set @dQtyAtSts4 = @dToStsQty;
		else if (@iToStsPos = 5)
			set @dQtyAtSts5 = @dToStsQty;
		else if (@iToStsPos = 6)
			set @dQtyAtSts6 = @dToStsQty;
		else if (@iToStsPos = 7)
			set @dQtyAtSts7 = @dToStsQty;
		else if (@iToStsPos = 8)
			set @dQtyAtSts8 = @dToStsQty;
		else if (@iToStsPos = 9)
			set @dQtyAtSts9 = @dToStsQty;
		else if (@iToStsPos = 10)
			set @dQtyAtSts10 = @dToStsQty;
	end;
	
	-- [comment omitted]
	-- [comment omitted]
	else
	begin
		-- [comment omitted]
		if (@iToSts < @iStatus1 or @iStatus1 = 0)
			set @iToStsPos = 1;
		else if (@iToSts < @iStatus2 or @iStatus2 = 0)
			set @iToStsPos = 2;
		else if (@iToSts < @iStatus3 or @iStatus3 = 0)
			set @iToStsPos = 3;
		else if (@iToSts < @iStatus4 or @iStatus4 = 0)
			set @iToStsPos = 4;
		else if (@iToSts < @iStatus5 or @iStatus5 = 0)
			set @iToStsPos = 5;
		else if (@iToSts < @iStatus6 or @iStatus6 = 0)
			set @iToStsPos = 6;
		else if (@iToSts < @iStatus7 or @iStatus7 = 0)
			set @iToStsPos = 7;
		else if (@iToSts < @iStatus8 or @iStatus8 = 0)
			set @iToStsPos = 8;
		else if (@iToSts < @iStatus9 or @iStatus9 = 0)
			set @iToStsPos = 9;
		else
			set @iToStsPos = 10;
			
		-- [comment omitted]
		-- [comment omitted]
		if (@iLeadingStsPos > 0)
			set @i = @iLeadingStsPos + 1
		else
		begin
			set @i = dbo.SDBfn_GetLeadingStsPos(@iStatus1, @iStatus2, @iStatus3, @iStatus4, @iStatus5, @iStatus6, @iStatus7, @iStatus8, @iStatus9, @iStatus10);
			set @i = @i + 1;
		end;

		while (@i > @iToStsPos)
		begin
			if (@i = 2)
			begin
				set @iStatus2 = @iStatus1;
				set @dQtyAtSts2 = @dQtyAtSts1;
			end;
			else if (@i = 3)
			begin
				set @iStatus3 = @iStatus2;
				set @dQtyAtSts3 = @dQtyAtSts2;
			end;
			else if (@i = 4)
			begin
				set @iStatus4 = @iStatus3;
				set @dQtyAtSts4 = @dQtyAtSts3;
			end;
			else if (@i = 5)
			begin
				set @iStatus5 = @iStatus4;
				set @dQtyAtSts5 = @dQtyAtSts4;
			end;	
			else if (@i = 6)
			begin
				set @iStatus6 = @iStatus5;
				set @dQtyAtSts6 = @dQtyAtSts5;
			end;
			else if (@i = 7)
			begin
				set @iStatus7 = @iStatus6;
				set @dQtyAtSts7 = @dQtyAtSts6;
			end;
			else if (@i = 8)
			begin
				set @iStatus8 = @iStatus7;
				set @dQtyAtSts8 = @dQtyAtSts7;
			end;
			else if (@i = 9)
			begin
				set @iStatus9 = @iStatus8;
				set @dQtyAtSts9 = @dQtyAtSts8;
			end;
			else if (@i = 10)
			begin
				set @iStatus10 = @iStatus9;
				set @dQtyAtSts10 = @dQtyAtSts9;
			end;
			
			set @i = (@i - 1);
		end; -- [comment omitted]
		
		-- [comment omitted]
		if (@iToStsPos = 1)
		begin
			set @iStatus1 = @iToSts;
			set @dQtyAtSts1 = @dToStsQty;
		end;
		else if (@iToStsPos = 2)
		begin
			set @iStatus2 = @iToSts;
			set @dQtyAtSts2 = @dToStsQty;
		end;
		else if (@iToStsPos = 3)
		begin
			set @iStatus3 = @iToSts;
			set @dQtyAtSts3 = @dToStsQty;
		end;
		else if (@iToStsPos = 4)
		begin
			set @iStatus4 = @iToSts;
			set @dQtyAtSts4 = @dToStsQty;
		end;				
		else if (@iToStsPos = 5)
		begin
			set @iStatus5 = @iToSts;
			set @dQtyAtSts5 = @dToStsQty;
		end;			
		else if (@iToStsPos = 6)
		begin
			set @iStatus6 = @iToSts;
			set @dQtyAtSts6 = @dToStsQty;
		end;				
		else if (@iToStsPos = 7)
		begin
			set @iStatus7 = @iToSts;
			set @dQtyAtSts7 = @dToStsQty;
		end;				
		else if (@iToStsPos = 8)
		begin
			set @iStatus8 = @iToSts;
			set @dQtyAtSts8 = @dToStsQty;
		end;				
		else if (@iToStsPos = 9)
		begin
			set @iStatus9 = @iToSts;
			set @dQtyAtSts9 = @dToStsQty;
		end;				
		else
		begin
			set @iStatus10 = @iToSts;
			set @dQtyAtSts10 = @dToStsQty;
		end;
	end; -- [comment omitted]
	
	-- [comment omitted]
	UPDATE SHIPMENT_DETAIL 
	   SET STATUS1 = @iStatus1,
		   STATUS2 = @iStatus2,
		   STATUS3 = @iStatus3,
		   STATUS4 = @iStatus4,
		   STATUS5 = @iStatus5,
		   STATUS6 = @iStatus6,
		   STATUS7 = @iStatus7,
		   STATUS8 = @iStatus8,
		   STATUS9 = @iStatus9,
		   STATUS10 = @iStatus10,
		   QUANTITY_AT_STS1 = @dQtyAtSts1,
		   QUANTITY_AT_STS2 = @dQtyAtSts2,
		   QUANTITY_AT_STS3 = @dQtyAtSts3,
		   QUANTITY_AT_STS4 = @dQtyAtSts4,
		   QUANTITY_AT_STS5 = @dQtyAtSts5,
		   QUANTITY_AT_STS6 = @dQtyAtSts6,
		   QUANTITY_AT_STS7 = @dQtyAtSts7,
		   QUANTITY_AT_STS8 = @dQtyAtSts8,
		   QUANTITY_AT_STS9 = @dQtyAtSts9,
		   QUANTITY_AT_STS10 = @dQtyAtSts10,
		   PROCESS_STAMP = N'<literal:5>',
		   DATE_TIME_STAMP = GETUTCDATE()
	 WHERE INTERNAL_SHIPMENT_LINE_NUM = @iIntShipLineNum;
	if (@@ERROR <> 0) return -1; 
	
 	-- [comment omitted]
 	-- [comment omitted]
 	set @iNewTrailingSts = @iStatus1;
 	set @iNewLeadingSts = dbo.SDBfn_GetLeadingStsInRange(@iStatus1, @iStatus2, @iStatus3, @iStatus4, @iStatus5, @iStatus6, @iStatus7, @iStatus8, @iStatus9, @iStatus10);
	if (@iOldTrailingSts <> @iNewTrailingSts
		or @iOldLeadingSts <> @iNewLeadingSts)
	begin
		exec @iError = STH_UpdateHeader @iIntShipNum;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	end -- [comment omitted]
-- [comment omitted]



