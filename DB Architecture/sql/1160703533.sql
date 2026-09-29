-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


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

	-- [comment omitted]
	-- [comment omitted]

	-- [comment omitted]
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
	
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
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
	   AND (th.ACTIVE = N'<literal:1>' OR th.ACTIVE = N'<literal:2>')
	   AND loc.LOCATION = @stLoc
	   AND loc.WAREHOUSE = @stWhs
	   AND loc.LOCATION_CLASS = N'<literal:3>'
	   
		   -- [comment omitted]
		   -- [comment omitted]
  ORDER BY th.LOCATION_TYPE DESC,
		   th.WORK_ZONE DESC,
		   th.MOVEMENT_CLASS DESC;
		
	-- [comment omitted]
	if (@@ROWCOUNT <= 0)
		return 0;
		
	-- [comment omitted]
	-- [comment omitted]
	if (@dtLastCycleCountDate is not null
		AND @iDaysBetween > 0)
	begin
		set @iDaysElapsed = datediff(s, @dtLastCycleCountDate, CONVERT(date,dbo.GetWarehouseTimezoneValue(@stWhs,null))) / 86400.0;
		if (@iDaysElapsed < @iDaysBetween)
		begin
				-- [comment omitted]
				set @message = dbo.RSCMfn_RtrvMsg(N'<literal:4>');
				set @varData = @stLoc;
				
				exec SH_FillStringWithVarData @message output, @varData, 
								  N'<literal:5>'; -- [comment omitted]
				
				exec @iError = HIST_SaveProcHist 
						   N'<literal:6>',
						   N'<literal:7>' ,
						   null,					-- [comment omitted]
						   null,					-- [comment omitted]
						   null,					-- [comment omitted]
						   null,					-- [comment omitted]
						   @message,
						   N'<literal:8>',	-- [comment omitted]
						   @stUserName,
						   @stWhs,
						   @procHistActive;
						   
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
			
			return 0;
		end;
	end; -- [comment omitted]
	
	-- [comment omitted]
	-- [comment omitted]
	if (@stThresholdQtyUm is not null
		AND @stThresholdQtyUm <> @stQuantityUm)
	begin
		set @dThresholdQty = dbo.ITMfn_CalcQtyForReqUm
								(@stItem, @stComp, @stLot,
								 null,				-- [comment omitted]
								 @stLoc, @stWhs, @stContId,
								 @dThresholdQty,	-- [comment omitted]
								 @stThresholdQtyUm, -- [comment omitted]
								 @stQuantityUm,		-- [comment omitted]
								 N'<literal:9>');				-- [comment omitted]
	end; -- [comment omitted]
	
	-- [comment omitted]
	if (@dNewOnHandQty > @dThresholdQty)
	begin
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
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
			-- [comment omitted]
			DELETE 
			FROM CYCLE_COUNT_REQUEST
			WHERE LOCATION = @stLoc
				AND WAREHOUSE = @stWhs
				AND CONDITION = N'<literal:10>'
				AND ((ITEM IS NULL AND @stItem IS NULL)
					OR (ITEM =@stItem))
				AND ((COMPANY IS NULL AND @stComp IS NULL)
					OR	(COMPANY = @stComp))                      
				AND ((LOT IS NULL AND @stLot IS NULL)
						OR	(LOT = @stLot))
				AND ((LOGISTICS_UNIT IS NULL AND @stContId IS NULL)
					OR	(LOGISTICS_UNIT = @stContId))
				AND (ISNULL(LOC_INV_ATTRIBUTES_ID, 0) =  ISNULL(@locInvAttributesId, 0)); 
			
			-- [comment omitted]
			DELETE 
			FROM WORK_INSTRUCTION
			WHERE CYCLE_COUNT = N'<literal:11>'
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

	-- [comment omitted]
	exec @iError = CCP_CheckToUpdateCCRequest @stItem, @stItemDesc, @stComp, @stLot,
									   @stLoc, @stWhs, @stContId, @locInvAttributesId, @dNewOnHandQty , @stUserName, 
									   @iCCAction output; 
	
	 select @empty_count= ISNULL(count(INTERNAL_COUNT_NUM),0)  
						FROM CYCLE_COUNT_REQUEST
						WHERE LOCATION = @stLoc
						AND WAREHOUSE = @stWhs 
						AND ITEM is null 
						AND CONDITION = N'<literal:12>';
	
	if (@iCCAction = 1 and @empty_count = 0 )
	begin
		-- [comment omitted]
		-- [comment omitted]
		exec @iError = CCP_CreateCCRequest @stItem, @stItemDesc, @stComp, @stLot, 
									@stLoc, @stWhs, @stWorkUnit, @stUserName, 0, NULL, @locInvAttributesId;
	end;

	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- [comment omitted]

