
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB			| 08/28/02	| Created.
	9493		| PK			| 01/31/03	| Real Time Replenishment.
	9493		| PK			| 04/23/03	| Fix the ILC UM conversion during INV Adjust
	11388		| RAB			| 05/08/03	| Request Real time Repln regardless of new onHandQty.
	11502		| PK			| 05/20/03	| Set Real Time Rpln if qty is negative.
	11870       | TBS           | 09/16/03  | Added Multi-Byte support.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	19875		| SSG			| 09/18/06	| If Replenishment Request Exists, set the Mark For Work creation flag
	19909		| SSG			| 09/21/06	| Additional parameter in the function "INVfn_DoOpenRplnExist"
	43557		| SMS			| 12/18/09	| Removed RealTimeReplenishment check from Mark For Work Creation update logic
	44369		| SMS			| 12/18/09	| Added logic to mark next request for work creation when max quantity is set to 0
	89448		| MMM			| 09/21/11	| Modified logic of setting MARKED_FOR_WORK_CREATION flag to consider total on hand quantity at the location(excluding LP, LOT and INV ATTR)
	111734		| MMM			| 06/06/13	| Modified to set MARKED_FOR_WORK_CREATION to "Y" when replenishment requests exists for excess demands and location capacity
											  falls below threshold irrespective of REP_EVALUATION flag	
		
	Sets the locationSts on the specified Location depending on the situation.
	
	Parameters
		int		iFromTo		Either 0 or iTO.
		String	stLoc		Location.
		String	stWhs		Warehouse.
		String	stUserName	User Name.
		The new quantity values.

*/
CREATE PROCEDURE INV_UpdateLocation(
	@iFromTo numeric(1,0),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25),
	@stUserName nvarchar(30),
	@dNewAllocQty numeric(19,5),
	@dNewInTransQty numeric(19,5),
	@dNewOnHandQty numeric(19,5),
	@dNewSuspQty numeric(19,5),
	@cFromOnHandEffect nchar(1), -- SYSTEM_CREATED used to set char type
	@stCompany nvarchar(25),
	@stItem nvarchar(50),
	@stQuantityUm nvarchar(25),
	@stLot nvarchar(25),
	@stContId nvarchar(50))
	
AS
	SET NOCOUNT ON;
		
	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;

	-- local variables
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
	
	-- select the old status and RplnEval off of the Location.
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

	-- if emptying the last LocationInventory, determine if
	-- the Location will become totally empty.
	if (@stOldLocSts <> N'Frozen'
		AND @dNewAllocQty = 0.0
		AND @dNewInTransQty = 0.0
		AND @dNewOnHandQty = 0.0
		AND @dNewSuspQty = 0.0)
	begin
		set @stNewLocSts = 
				CASE WHEN not exists (SELECT N'A' 
										FROM LOCATION_INVENTORY
									   WHERE LOCATION = @stLoc
										 AND WAREHOUSE = @stWhs
										 AND (ALLOCATED_QTY > 0.0
											  OR IN_TRANSIT_QTY > 0.0
											  OR ON_HAND_QTY > 0.0
											  OR SUSPENSE_QTY > 0.0))
					 THEN N'Empty'
					 ELSE @stOldLocSts
					 END;
	end; -- end if emptying a non-Frozen LocationInventory.	

	-- set storage locations that you are adjusting from to picking.
	else if (@stOldLocSts = N'Storage'
			 AND @iFromTo = 0)
	begin
		set @stNewLocSts = N'Picking';
	end; -- end if picking from a storage location.
	
	-- set empty locations that you are adjusting to to storage.
	else if (@stOldLocSts = N'Empty'
			 AND @iFromTo = 1)
	begin
		set @stNewLocSts = N'Storage';
	end; -- end if puting into an empty location.
	
	-- if decrementing the onHandQty, check for Real Time Replen Evaluation 
	if (@cFromOnHandEffect = N'-')
	begin
		if (@iRowCount > 0)
		begin
			
			set @repReqExistsForExcessDemand = N'N';		
			If @cOldRplnEval = N'Y' and exists(SELECT TOP 1 INTERNAL_RPLN_REQ_NUM
							FROM REPLENISHMENT_REQUEST
							WHERE
							MARKED_FOR_WORK_CREATION = N'N'
							AND WORK_CREATED = N'N'
							AND ITEM = @stItem
							AND (COMPANY = @stCompany or (COMPANY is NULL and @stCompany is null))
							AND TO_LOC = @stLoc
							AND TO_WHS = @stWhs)
			begin
				set @repReqExistsForExcessDemand = N'Y';
			end;
			
			-- if @cOldRplnEval = "N" (I am not yet in replenishment-evaluation mode) 
			-- find Item values to forward to Location Capacity
			if (@repReqExistsForExcessDemand = N'Y' or @cOldRplnEval = N'N' or @cOldRplnEval IS NULL)				
			begin	
				SET @cNewRplnEval = @cOldRplnEval;
				--Grab the Item Class 
				SELECT @stItemClass = ITEM_CLASS
					FROM ITEM
					WHERE ITEM = @stItem
					AND (COMPANY IS NULL OR ISNULL(COMPANY,N'*') = ISNULL(@stCompany,N'*'));
								
				-- Find the matching Location Capacity record and evaluate
				-- if Location needs to be replenished
				exec @iError = INV_RtrvRplnLocCapacity
						@stWhs, @stLoc, @stLocType, @stItem, 
						@stCompany, @stItemClass, @dMaxQty output, 
						@iMinReplnPct output, @stILCQuantityUm output;
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

				-- Convert to BaseUM if @stILCQuantityUm <> @stQuantityUm			
				if (@stILCQuantityUm is not null
					AND @stILCQuantityUm <> @stQuantityUm)
				begin
					set @dMaxQty = dbo.ITMfn_CalcQtyForReqUm
											(@stItem, @stCompany, @stLot,
											 @stItemClass,				-- itemClass is unknown.
											 @stLoc, @stWhs, @stContId,
											 @dMaxQty,	-- original quantity.
											 @stILCQuantityUm, -- original quantityUm.
											 @stQuantityUm,		-- requested quantityUm.
											 N'Y');				-- we do not know the itemClass.
				end; -- end if Ums do not match
	
				-- Get the total on hand quantity of the item after pick or putaway.
				SELECT @onHandQuantity = ISNULL(sum(ON_HAND_QTY), 0)
				FROM LOCATION_INVENTORY LI
				WHERE LI.LOCATION = @stLoc
				AND LI.WAREHOUSE = @stWhs
				AND LI.ITEM = @stItem
				AND ((LI.COMPANY IS NULL AND @stCompany IS NULL) OR LI.COMPANY = @stCompany)
			
				-- If Loc record does NOT exist, or the On Hand Qty is negative, replenish anyway.
				if ((@dMaxQty is null and @iMinReplnPct is null) 
					OR (@onHandQuantity < 0))
				begin
					SET @cNewRplnEval = N'Y'
				end; -- end if Loc does not exist or Qty is negative

			
				--If ItemLocCapacity record exists, determine if qty at loc needs replenishment				
				if ((@dMaxQty > 0.0) and (@iMinReplnPct >= 0))
				begin
					-- If its below threshold call INVfn_DoOpenReplenishmentsExist 
					-- to check for open request
					-- If no open request found attempt to mark an existing replenishment request 
					-- for work creation that does not have work created
					-- If a replenishment request was not marked in the step above 
					-- we should then set the newRplnEval value = Y
					if (((@dMaxQty * @iMinReplnPct) / 100) >= @onHandQuantity)
						BEGIN
							IF (dbo.INVfn_DoOpenRplnExist(@stItem, @stCompany, @stLoc, @stWhs, N'Y') = 0)	
							BEGIN
					
							UPDATE REPLENISHMENT_REQUEST
							SET MARKED_FOR_WORK_CREATION = N'Y',
							PROCESS_STAMP = N'Real Time Replenishment',
							USER_STAMP = N'SYSTEM',
							DATE_TIME_STAMP = GETUTCDATE()				
							WHERE
							INTERNAL_RPLN_REQ_NUM = (SELECT TOP 1 INTERNAL_RPLN_REQ_NUM
							FROM REPLENISHMENT_REQUEST
							WHERE
							MARKED_FOR_WORK_CREATION = N'N'
							AND WORK_CREATED = N'N'
							AND ITEM = @stItem
							AND ISNULL(COMPANY,N'!') = ISNULL(@stCompany,N'!')
							AND TO_LOC = @stLoc
							AND TO_WHS = @stWhs
							ORDER BY PRIORITY, ALLOCATED_QTY DESC)
				
							IF(@@ROWCOUNT <= 0)
								SET @cNewRplnEval = N'Y'	
				
							END			
						END						
				end						
				--If item location capacity exists and max quantity set to 0, it should still mark pending requests 
				--for work creation				
				else if((@dMaxQty = 0.0) and (@iMinReplnPct > 0))
				begin
					IF (dbo.INVfn_DoOpenRplnExist(@stItem, @stCompany, @stLoc, @stWhs, N'Y') = 0)	
					begin
											
						UPDATE REPLENISHMENT_REQUEST
						SET MARKED_FOR_WORK_CREATION = N'Y',
						PROCESS_STAMP = N'Real Time Replenishment',
						USER_STAMP = N'SYSTEM',
						DATE_TIME_STAMP = GETUTCDATE()				
						WHERE
						INTERNAL_RPLN_REQ_NUM = (SELECT TOP 1 INTERNAL_RPLN_REQ_NUM
						FROM REPLENISHMENT_REQUEST
						WHERE
						MARKED_FOR_WORK_CREATION = N'N'
						AND WORK_CREATED = N'N'
						AND ITEM = @stItem
						AND ISNULL(COMPANY,N'!') = ISNULL(@stCompany,N'!')
						AND TO_LOC = @stLoc
						AND TO_WHS = @stWhs
						ORDER BY PRIORITY, ALLOCATED_QTY DESC)
			
						IF(@@ROWCOUNT <= 0)
							SET @cNewRplnEval = N'Y'						
					end
				end -- end if ItemLocCapacity record exists							
			end -- end if @cOldRplnEval = N and @cRealTimeRpln = Y			
		end -- end Evaluate Real Time Replen				
	end; -- end if decrementing onHandQty.
	
	-- if a new status OR a new RplnEval value was found, update the Location record.
	if (@stNewLocSts <> @stOldLocSts
		OR (isnull(@cOldRplnEval,N'N') <> isnull(@cNewRplnEval,N'N')))
	begin
		UPDATE LOCATION
		   SET LOCATION_STS = @stNewLocSts,
			   PROCESS_STAMP = N'INV_UpdateEmptyPermLocs',
			   USER_STAMP = @stUserName,
			   DATE_TIME_STAMP = GETUTCDATE(),
			   RPLN_EVALUATION = @cNewRplnEval
		 WHERE LOCATION = @stLoc
		   AND WAREHOUSE = @stWhs;
		if (@@ERROR <> 0) return -1;
	end; -- end if changing locationSts
-- end INV_UpdateLocation
