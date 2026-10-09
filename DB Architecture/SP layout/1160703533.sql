

CREATE PROCEDURE INV_CheckLocThreshold(
	@stItem nvarchar(50),
	@stItemDesc nvarchar(100),
	@stComp nvarchar(25),
	@stLot nvarchar(25),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25),
	@stContId nvarchar(50),
	@locInvAttributesId numeric(9), 
	@stWorkUnit nvarchar(50),
	@dNewOnHandQty numeric(19,5),
	@stQuantityUm nvarchar(25),
	@stUserName nvarchar(30))
AS
	SET NOCOUNT ON;

	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;
	-- #DEFINE WMW.Reporting Manh.WMW.Reporting.General.ReportingConstants RepCon;

	-- local variables
	declare @iCCAction int;
	declare @iDaysElapsed numeric(9);
	declare @dThresholdQty numeric(19,5);
	declare @dtLastCycleCountDate datetime;
	declare @iDaysBetween numeric(9);
	declare @iError int;
	declare @stThresholdQtyUm nvarchar(25);
	declare @empty_count numeric(9);
	declare @message nvarchar(2000);
	declare @varData nvarchar(2000);
	declare @procHistActive nchar(1);
	declare @OnHandQty numeric(19,5);
	declare @dLocTotalOnHandQty numeric(19,5);

	set @OnHandQty = 0;
	
	-- note that the variables will only be filled with
	-- the top row returned.  We will order the select 
	-- so that we retrieve the appropriate row first.
	SELECT @iDaysBetween = th.DAYS_BETWEEN,
		   @dThresholdQty = th.QUANTITY,		  
		   @stThresholdQtyUm = th.QUANTITY_UM,
		   @dtLastCycleCountDate = loc.LAST_CYCLE_COUNT_DATE
	  FROM CYCLE_COUNT_THRESHOLD th, LOCATION loc
	 WHERE (th.LOCATION_TYPE = loc.LOCATION_TYPE 
			OR th.LOCATION_TYPE is null)
	   AND (th.WORK_ZONE = loc.WORK_ZONE
			OR th.WORK_ZONE is null)
	   AND (th.MOVEMENT_CLASS = loc.MOVEMENT_CLS
			OR th.MOVEMENT_CLASS is null)
	   AND (th.ACTIVE = N'Y' OR th.ACTIVE = N'y')
	   AND loc.LOCATION = @stLoc
	   AND loc.WAREHOUSE = @stWhs
	   AND loc.LOCATION_CLASS = N'Inventory'
	   
		   -- order by the following fields to sink null values to
		   -- the bottom.
  ORDER BY th.LOCATION_TYPE DESC,
		   th.WORK_ZONE DESC,
		   th.MOVEMENT_CLASS DESC;
		
	-- if no rows returned, we have no thresholds.
	if (@@ROWCOUNT <= 0)
		return 0;
		
	-- if a lastCycleCountDate was specified, make sure
	-- we have waited long enough to check again.
	if (@dtLastCycleCountDate is not null
		AND @iDaysBetween > 0)
	begin
		set @iDaysElapsed = datediff(s, @dtLastCycleCountDate, CONVERT(date,dbo.GetWarehouseTimezoneValue(@stWhs,null))) / 86400.0;
		if (@iDaysElapsed < @iDaysBetween)
		begin
				-- record process history.
				set @message = dbo.RSCMfn_RtrvMsg(N'MSG_PROCHIST_ACTIVITYDRIVENCC02');
				set @varData = @stLoc;
				
				exec SH_FillStringWithVarData @message output, @varData, 
								  N'|~*'; -- delimiter
				
				exec @iError = HIST_SaveProcHist 
						   N'80',
						   N'120' ,
						   null,					-- identifier1
						   null,					-- identifier2
						   null,					-- identifier3
						   null,					-- identifier4
						   @message,
						   N'INV_CheckLocThreshold',	-- processStamp
						   @stUserName,
						   @stWhs,
						   @procHistActive;
						   
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
			
			return 0;
		end;
	end; -- end if lastCycleCountDate specified.
	
	-- Convert the Threshold quantity to the appropriate
	-- UM if necessary.
	if (@stThresholdQtyUm is not null
		AND @stThresholdQtyUm <> @stQuantityUm)
	begin
		set @dThresholdQty = dbo.ITMfn_CalcQtyForReqUm
								(@stItem, @stComp, @stLot,
								 null,				-- itemClass is unknown.
								 @stLoc, @stWhs, @stContId,
								 @dThresholdQty,	-- original quantity.
								 @stThresholdQtyUm, -- original quantityUm.
								 @stQuantityUm,		-- requested quantityUm.
								 N'N');				-- we do not know the itemClass.
	end; -- end if Ums do not match
	
	-- if a threshold has not been breached
	if (@dNewOnHandQty > @dThresholdQty)
	begin
		--scenario when CC request exists for different Lot/LP of the same item
		--check if the inventory is emptied for item/company/lot/LP and existed CC
		--then we need to removed the CCrequest for item/company/lot/LP and existed
		SELECT @OnHandQty = ISNULL(ON_HAND_QTY,0)
		FROM LOCATION_INVENTORY
		WHERE LOCATION = @stLoc
			AND WAREHOUSE = @stWhs
			AND ITEM = @stItem
			AND ((COMPANY IS NULL AND @stComp IS NULL)
				OR	(COMPANY = @stComp))                      
			AND ((LOT IS NULL AND @stLot IS NULL)
				OR	(LOT = @stLot))
			AND ((LOGISTICS_UNIT IS NULL AND @stContId IS NULL)
					OR	(LOGISTICS_UNIT = @stContId))
			AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0));
					 
		if(@OnHandQty=0)
		begin
			-- delete the cycle count request
			DELETE 
			FROM CYCLE_COUNT_REQUEST
			WHERE LOCATION = @stLoc
				AND WAREHOUSE = @stWhs
				AND CONDITION = N'Open'
				AND ((ITEM IS NULL AND @stItem IS NULL)
					OR (ITEM =@stItem))
				AND ((COMPANY IS NULL AND @stComp IS NULL)
					OR	(COMPANY = @stComp))                      
				AND ((LOT IS NULL AND @stLot IS NULL)
						OR	(LOT = @stLot))
				AND ((LOGISTICS_UNIT IS NULL AND @stContId IS NULL)
					OR	(LOGISTICS_UNIT = @stContId))
				AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0)); 
			
			-- delete the work instruction if the work is created.	
			DELETE 
			FROM WORK_INSTRUCTION
			WHERE CYCLE_COUNT = N'Y'
				AND FROM_LOC = @stLoc
				AND FROM_WHS = @stWhs
				AND ((ITEM IS NULL AND @stItem IS NULL)
					OR (ITEM =@stItem))
				AND ((COMPANY IS NULL AND @stComp IS NULL)
					OR	(COMPANY = @stComp))                      
				AND ((LOT IS NULL AND @stLot IS NULL)
					OR	(LOT = @stLot))
				AND ((LOGISTICS_UNIT IS NULL AND @stContId IS NULL)
					OR	(LOGISTICS_UNIT = @stContId)) 
				AND (ISNULL(FROM_LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0));  
		end;
	
		return 0;
	end;

	if (@dNewOnHandQty = 0)
	begin
		select @dLocTotalOnHandQty = sum(on_hand_qty) from location_inventory 
		where warehouse = @stWhs and location = @stLoc
		if (@dLocTotalOnHandQty > 0)
			return 0;
	end

	-- check to see if the CC request needs to be updated. New request can only be created if @iCCAction =1
	exec @iError = CCP_CheckToUpdateCCRequest @stItem, @stItemDesc, @stComp, @stLot,
									   @stLoc, @stWhs, @stContId, @locInvAttributesId, @dNewOnHandQty , @stUserName, 
									   @iCCAction output; 
	
	 select @empty_count= ISNULL(count(INTERNAL_COUNT_NUM),0)  
						FROM CYCLE_COUNT_REQUEST
						WHERE LOCATION = @stLoc
						AND WAREHOUSE = @stWhs 
						AND ITEM is null 
						AND CONDITION = N'Open';
	
	if (@iCCAction = 1 and @empty_count = 0 )
	begin
		-- if we have reached this point in the procedure, we can
		-- create a CycleCountRequest.
		exec @iError = CCP_CreateCCRequest @stItem, @stItemDesc, @stComp, @stLot, 
									@stLoc, @stWhs, @stWorkUnit, @stUserName, 0, NULL, @locInvAttributesId;
	end;

	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- end INV_CheckLocThreshold

