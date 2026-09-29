-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */



























CREATE PROCEDURE INV_UpdateLocation(
	@iFromTo numeric(1,0),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25),
	@stUserName nvarchar(30),
	@dNewAllocQty numeric(19,5),
	@dNewInTransQty numeric(19,5),
	@dNewOnHandQty numeric(19,5),
	@dNewSuspQty numeric(19,5),
	@cFromOnHandEffect nchar(1), -- [comment omitted]
	@stCompany nvarchar(25),
	@stItem nvarchar(50),
	@stQuantityUm nvarchar(25),
	@stLot nvarchar(25),
	@stContId nvarchar(50))
	
AS
	SET NOCOUNT ON;
		
	-- [comment omitted]

	-- [comment omitted]
	declare @cNewRplnEval nchar(1);
	declare @cOldRplnEval nchar(1);
	declare @cRealTimeRpln nchar(1);

	declare @dMaxQty numeric(19,5);
	declare @iError int;
	declare @iMinReplnPct numeric(3);
	declare @iRowCount int;
	declare @stItemClass nvarchar(50);
	declare @stLocType nvarchar(25);	
	declare @stNewLocSts nvarchar(50);
	declare @stOldLocSts nvarchar(50);
	declare @stILCQuantityUm nvarchar(25);
	declare @onHandQuantity numeric(19,5);
	declare @repReqExistsForExcessDemand nchar(1);
	
	set @onHandQuantity = @dNewOnHandQty;
	
	-- [comment omitted]
	SELECT @stOldLocSts = LOCATION_STS,
			@cOldRplnEval = RPLN_EVALUATION,
			@cRealTimeRpln = REAL_TIME_RPLN,
			@stLocType = LOCATION_TYPE
	  FROM LOCATION
	 WHERE LOCATION = @stLoc
	   AND WAREHOUSE = @stWhs;
	   
	SET @iRowCount = @@ROWCOUNT;
	
	set @stNewLocSts = @stOldLocSts;
	set @cNewRplnEval = @cOldRplnEval;

	-- [comment omitted]
	-- [comment omitted]
	if (@stOldLocSts <> N'<literal:1>'
		AND @dNewAllocQty = 0.0
		AND @dNewInTransQty = 0.0
		AND @dNewOnHandQty = 0.0
		AND @dNewSuspQty = 0.0)
	begin
		set @stNewLocSts = 
				CASE WHEN not exists (SELECT N'<literal:2>' 
										FROM LOCATION_INVENTORY
									   WHERE LOCATION = @stLoc
										 AND WAREHOUSE = @stWhs
										 AND (ALLOCATED_QTY > 0.0
											  OR IN_TRANSIT_QTY > 0.0
											  OR ON_HAND_QTY > 0.0
											  OR SUSPENSE_QTY > 0.0))
					 THEN N'<literal:3>'
					 ELSE @stOldLocSts
					 END;
	end; -- [comment omitted]

	-- [comment omitted]
	else if (@stOldLocSts = N'<literal:4>'
			 AND @iFromTo = 0)
	begin
		set @stNewLocSts = N'<literal:5>';
	end; -- [comment omitted]
	
	-- [comment omitted]
	else if (@stOldLocSts = N'<literal:6>'
			 AND @iFromTo = 1)
	begin
		set @stNewLocSts = N'<literal:7>';
	end; -- [comment omitted]
	
	-- [comment omitted]
	if (@cFromOnHandEffect = N'<literal:8>')
	begin
		if (@iRowCount > 0)
		begin
			
			set @repReqExistsForExcessDemand = N'<literal:9>';		
			If @cOldRplnEval = N'<literal:10>' and exists(SELECT TOP 1 INTERNAL_RPLN_REQ_NUM
							FROM REPLENISHMENT_REQUEST
							WHERE
							MARKED_FOR_WORK_CREATION = N'<literal:11>'
							AND WORK_CREATED = N'<literal:12>'
							AND ITEM = @stItem
							AND (COMPANY = @stCompany or (COMPANY is NULL and @stCompany is null))
							AND TO_LOC = @stLoc
							AND TO_WHS = @stWhs)
			begin
				set @repReqExistsForExcessDemand = N'<literal:13>';
			end;
			
			-- [comment omitted]
			-- [comment omitted]
			if (@repReqExistsForExcessDemand = N'<literal:14>' or @cOldRplnEval = N'<literal:15>' or @cOldRplnEval IS NULL)				
			begin	
				SET @cNewRplnEval = @cOldRplnEval;
				-- [comment omitted]
				SELECT @stItemClass = ITEM_CLASS
					FROM ITEM
					WHERE ITEM = @stItem
					AND (COMPANY IS NULL OR ISNULL(COMPANY,N'<literal:16>') = ISNULL(@stCompany,N'<literal:17>'));
								
				-- [comment omitted]
				-- [comment omitted]
				exec @iError = INV_RtrvRplnLocCapacity
						@stWhs, @stLoc, @stLocType, @stItem, 
						@stCompany, @stItemClass, @dMaxQty output, 
						@iMinReplnPct output, @stILCQuantityUm output;
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

				-- [comment omitted]
				if (@stILCQuantityUm is not null
					AND @stILCQuantityUm <> @stQuantityUm)
				begin
					set @dMaxQty = dbo.ITMfn_CalcQtyForReqUm
											(@stItem, @stCompany, @stLot,
											 @stItemClass,				-- [comment omitted]
											 @stLoc, @stWhs, @stContId,
											 @dMaxQty,	-- [comment omitted]
											 @stILCQuantityUm, -- [comment omitted]
											 @stQuantityUm,		-- [comment omitted]
											 N'<literal:18>');				-- [comment omitted]
				end; -- [comment omitted]
	
				-- [comment omitted]
				SELECT @onHandQuantity = ISNULL(sum(ON_HAND_QTY), 0)
				FROM LOCATION_INVENTORY LI
				WHERE LI.LOCATION = @stLoc
				AND LI.WAREHOUSE = @stWhs
				AND LI.ITEM = @stItem
				AND ((LI.COMPANY IS NULL AND @stCompany IS NULL) OR LI.COMPANY = @stCompany)
			
				-- [comment omitted]
				if ((@dMaxQty is null and @iMinReplnPct is null) 
					OR (@onHandQuantity < 0))
				begin
					SET @cNewRplnEval = N'<literal:19>'
				end; -- [comment omitted]

			
				-- [comment omitted]
				if ((@dMaxQty > 0.0) and (@iMinReplnPct >= 0))
				begin
					-- [comment omitted]
					-- [comment omitted]
					-- [comment omitted]
					-- [comment omitted]
					-- [comment omitted]
					-- [comment omitted]
					if (((@dMaxQty * @iMinReplnPct) / 100) >= @onHandQuantity)
						BEGIN
							IF (dbo.INVfn_DoOpenRplnExist(@stItem, @stCompany, @stLoc, @stWhs, N'<literal:20>') = 0)	
							BEGIN
					
							UPDATE REPLENISHMENT_REQUEST
							SET MARKED_FOR_WORK_CREATION = N'<literal:21>',
							PROCESS_STAMP = N'<literal:22>',
							USER_STAMP = N'<literal:23>',
							DATE_TIME_STAMP = GETUTCDATE()				
							WHERE
							INTERNAL_RPLN_REQ_NUM = (SELECT TOP 1 INTERNAL_RPLN_REQ_NUM
							FROM REPLENISHMENT_REQUEST
							WHERE
							MARKED_FOR_WORK_CREATION = N'<literal:24>'
							AND WORK_CREATED = N'<literal:25>'
							AND ITEM = @stItem
							AND ISNULL(COMPANY,N'<literal:26>') = ISNULL(@stCompany,N'<literal:27>')
							AND TO_LOC = @stLoc
							AND TO_WHS = @stWhs
							ORDER BY PRIORITY, ALLOCATED_QTY DESC)
				
							IF(@@ROWCOUNT <= 0)
								SET @cNewRplnEval = N'<literal:28>'	
				
							END			
						END						
				end						
				-- [comment omitted]
				-- [comment omitted]
				else if((@dMaxQty = 0.0) and (@iMinReplnPct > 0))
				begin
					IF (dbo.INVfn_DoOpenRplnExist(@stItem, @stCompany, @stLoc, @stWhs, N'<literal:29>') = 0)	
					begin
											
						UPDATE REPLENISHMENT_REQUEST
						SET MARKED_FOR_WORK_CREATION = N'<literal:30>',
						PROCESS_STAMP = N'<literal:31>',
						USER_STAMP = N'<literal:32>',
						DATE_TIME_STAMP = GETUTCDATE()				
						WHERE
						INTERNAL_RPLN_REQ_NUM = (SELECT TOP 1 INTERNAL_RPLN_REQ_NUM
						FROM REPLENISHMENT_REQUEST
						WHERE
						MARKED_FOR_WORK_CREATION = N'<literal:33>'
						AND WORK_CREATED = N'<literal:34>'
						AND ITEM = @stItem
						AND ISNULL(COMPANY,N'<literal:35>') = ISNULL(@stCompany,N'<literal:36>')
						AND TO_LOC = @stLoc
						AND TO_WHS = @stWhs
						ORDER BY PRIORITY, ALLOCATED_QTY DESC)
			
						IF(@@ROWCOUNT <= 0)
							SET @cNewRplnEval = N'<literal:37>'						
					end
				end -- [comment omitted]
			end -- [comment omitted]
		end -- [comment omitted]
	end; -- [comment omitted]
	
	-- [comment omitted]
	if (@stNewLocSts <> @stOldLocSts
		OR (isnull(@cOldRplnEval,N'<literal:38>') <> isnull(@cNewRplnEval,N'<literal:39>')))
	begin
		UPDATE LOCATION
		   SET LOCATION_STS = @stNewLocSts,
			   PROCESS_STAMP = N'<literal:40>',
			   USER_STAMP = @stUserName,
			   DATE_TIME_STAMP = GETUTCDATE(),
			   RPLN_EVALUATION = @cNewRplnEval
		 WHERE LOCATION = @stLoc
		   AND WAREHOUSE = @stWhs;
		if (@@ERROR <> 0) return -1;
	end; -- [comment omitted]
-- [comment omitted]
