-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















































CREATE PROCEDURE CCP_CreateCCRequest(
	@stItem nvarchar(50),
	@stItemDesc nvarchar(100),
	@stCompany nvarchar(25),
	@stLot nvarchar(25),
	@stLoc nvarchar(25),
	@stWhs nvarchar(25),
	@stWorkUnit nvarchar(50),
	@stUserName nvarchar(30),
	@cycleCountPlanNum numeric(9) = 0,
	@logisticsUnit nvarchar(50) = N'<literal:1>', 
	@locInvAttributesId numeric(9),
    @isDayBetweenCCNeedToConsider bit =1)
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]

	-- [comment omitted]
	declare @cCreateWork nvarchar(200);
	declare @cProcHistActive nchar(1);
	declare @quantityAtLocation numeric(19,5); 
	declare @suspenseQtyAtLocation numeric(19,5);;
	declare @iError int;
	declare @iLaunchNum numeric(9);
	declare @iGroupNum numeric(9);
	declare @iGroupSize numeric(9);
	declare @iTotalReq int;
	declare @stVarData nvarchar(2000);
	declare @parentLogisticsUnit nvarchar(50);
	declare @invAttribId numeric(9);
	declare @stMessage nvarchar(2000);
	declare @isPlanNumberPassed bit;
	declare @cycleCountInternalNum numeric(9);

	declare @daysElapsed numeric(9);
	declare @thresholdQty numeric(19,5);
	declare @lastCycleCountDate datetime;
	declare @daysBetween numeric(9);
	declare @thresholdQtyUm nvarchar(25);
	declare @multiItemLocation nchar(1);
	declare @isPermanentLocation int;

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	SELECT @daysBetween = th.DAYS_BETWEEN,
		   @thresholdQty = th.QUANTITY,		  
		   @thresholdQtyUm = th.QUANTITY_UM,
		   @lastCycleCountDate = loc.LAST_CYCLE_COUNT_DATE,
		   @multiItemLocation = loc.MULTI_ITEM		   
	  FROM CYCLE_COUNT_THRESHOLD th, LOCATION loc
	 WHERE (th.LOCATION_TYPE = loc.LOCATION_TYPE 
			OR th.LOCATION_TYPE is null)
	   AND (th.WORK_ZONE = loc.WORK_ZONE
			OR th.WORK_ZONE is null)
	   AND (th.MOVEMENT_CLASS = loc.MOVEMENT_CLS
			OR th.MOVEMENT_CLASS is null)
	   AND (th.ACTIVE = N'<literal:2>' OR th.ACTIVE = N'<literal:3>')
	   AND loc.LOCATION = @stLoc
	   AND loc.WAREHOUSE = @stWhs
	   AND loc.LOCATION_CLASS = N'<literal:4>'
	   
		   -- [comment omitted]
		   -- [comment omitted]
  ORDER BY th.LOCATION_TYPE DESC,
		   th.WORK_ZONE DESC,
		   th.MOVEMENT_CLASS DESC;
		
	-- [comment omitted]
	-- [comment omitted]
	if (@@ROWCOUNT > 0)
	begin	
		-- [comment omitted]
		-- [comment omitted]
		if (@lastCycleCountDate is not null
			AND @daysBetween > 0 AND @isDayBetweenCCNeedToConsider > 0)
		begin
			set @daysElapsed = datediff(s, @lastCycleCountDate, CONVERT(date,dbo.GetWarehouseTimezoneValue(@stWhs,null))) / 86400.0;
			if (@daysElapsed < @daysBetween)
			begin
				-- [comment omitted]
				set @stMessage = dbo.RSCMfn_RtrvMsg(N'<literal:5>');
				set @stVarData = @stLoc;
				
				exec SH_FillStringWithVarData @stMessage output, @stVarData, 
								  N'<literal:6>'; -- [comment omitted]
				
				exec @iError = HIST_SaveProcHist 
						   N'<literal:7>',
						   N'<literal:8>' ,
						   null,					-- [comment omitted]
						   null,					-- [comment omitted]
						   null,					-- [comment omitted]
						   null,					-- [comment omitted]
						   @stMessage,
						   N'<literal:9>',	-- [comment omitted]
						   @stUserName,
						   @stWhs,
						   @cProcHistActive;
						   
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
				return 0;
			end;
		end; -- [comment omitted]
	end;

	if @cycleCountPlanNum <> 0
		set @isPlanNumberPassed = 1
	else
		set @isPlanNumberPassed = 0

	if(@isPlanNumberPassed <> 0)
	begin
		-- [comment omitted]
		SELECT 
			@iLaunchNum = Launch_num 
		FROM 
			WORK_INSTRUCTION WITH(NOLOCK)
		WHERE
			INSTRUCTION_TYPE = N'<literal:10>'
			AND WORK_UNIT = @stWorkUnit;
			
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		if(@iLaunchNum is null)
			SELECT TOP 1
				@iLaunchNum = Launch_num 
			FROM 
				IA_WORK_INSTRUCTION WITH(NOLOCK)
			WHERE
				WORK_UNIT = @stWorkUnit;

		-- [comment omitted]
		-- [comment omitted]
		set @cCreateWork = N'<literal:11>';
	end
	else
		-- [comment omitted]
		exec @iError = NNR_RtrvNextLaunchNum @stWhs, @iLaunchNum output;
	
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

	-- [comment omitted]
	if @cCreateWork is null
		SELECT 
			@cCreateWork = SYSTEM_VALUE
		FROM 
			SYSTEM_CONFIG_DETAIL
		WHERE 
			RECORD_TYPE = N'<literal:12>'
			AND SYS_KEY = N'<literal:13>';

	-- [comment omitted]
	if @isPlanNumberPassed = 0
		SELECT 
			@cycleCountPlanNum = INTERNAL_PLAN_NUM,
			@iGroupSize = GROUP_SIZE
		FROM 
			CYCLE_COUNT_PLAN
		WHERE 
			MASTER_NAME is null
			AND COMPLETED_DATE is null
			AND WAREHOUSE = @stWhs
		GROUP BY 
			INTERNAL_PLAN_NUM,
			GROUP_SIZE;
	else
		SELECT 
			@iGroupSize = GROUP_SIZE
		FROM 
			CYCLE_COUNT_PLAN
		WHERE 
			INTERNAL_PLAN_NUM = @cycleCountPlanNum;

	-- [comment omitted]
	if (@cycleCountPlanNum > 0)
	begin
		-- [comment omitted]
		SELECT @iGroupNum = MAX(GROUP_NUMBER)
		  FROM CYCLE_COUNT_REQUEST
		 WHERE INTERNAL_PLAN_NUM = @cycleCountPlanNum;
	end; -- [comment omitted]
	else
	begin
		-- [comment omitted]
		-- [comment omitted]
		SELECT @iGroupSize = SYSTEM_VALUE
		  FROM SYSTEM_CONFIG_DETAIL
		 WHERE RECORD_TYPE = N'<literal:14>'
		   AND SYS_KEY = N'<literal:15>';
		 
		exec @iError = CCP_InsertCCPlan @iGroupSize, @stWhs, @stUserName,@cycleCountPlanNum output;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		
		set @iGroupNum = 1;
	end; -- [comment omitted]

	set @suspenseQtyAtLocation = 0;
	if(@multiItemLocation = N'<literal:16>')
		begin
			set @quantityAtLocation = 1;
		end;
	else
		begin
			set @quantityAtLocation = 0;
			-- [comment omitted]
				-- [comment omitted]
				-- [comment omitted]
			-- [comment omitted]
				-- [comment omitted]
				-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
			SELECT 
				@quantityAtLocation = SUM(ISNULL(ON_HAND_QTY,0))
				  ,@suspenseQtyAtLocation = SUM(ISNULL(SUSPENSE_QTY, 0))
			 FROM LOCATION_INVENTORY
				WHERE LOCATION = @stLoc 
				AND WAREHOUSE = @stWhs
				AND ITEM = @stItem
				AND ((COMPANY = @stCompany) or (COMPANY is null and @stCompany is null))
		end;	

	set @isPermanentLocation = 0;
	
	SELECT 
		@isPermanentLocation = CASE WHEN PERMANENT = N'<literal:17>' THEN 1 ELSE 0 END
	FROM LOCATION_INVENTORY
		WHERE LOCATION = @stLoc 
		AND WAREHOUSE = @stWhs
		AND ITEM = @stItem
		AND ((COMPANY = @stCompany) or (COMPANY is null and @stCompany is null))

	-- [comment omitted]
	-- [comment omitted]
	if (@quantityAtLocation = 0 AND @isPlanNumberPassed = 0 AND @isPermanentLocation = 0)
			-- [comment omitted]
				begin
					set @stItem = null;
					set @stItemDesc = null;
					set @stCompany = null;
					set @stLot = null;
					set @locInvAttributesId = 0;
			set @parentLogisticsUnit = null;
			set @logisticsUnit = null;
		end;

	-- [comment omitted]
	IF (@isPlanNumberPassed = 0)
		-- [comment omitted]
		DECLARE cntCurs CURSOR READ_ONLY FOR 
   			SELECT DISTINCT LOT,LOGISTICS_UNIT, PARENT_LOGISTICS_UNIT, LOC_INV_ATTRIBUTES_ID FROM LOCATION_INVENTORY
			WHERE ITEM = @stItem
    		AND ((COMPANY = @stCompany) or (COMPANY is null and @stCompany is null))
			AND LOCATION = @stLoc
			AND WAREHOUSE = @stWhs;
	ELSE IF(@isPlanNumberPassed = 1)
		DECLARE cntCurs CURSOR READ_ONLY FOR 
   			SELECT @stLot, @logisticsUnit, NULL, @locInvAttributesId

   	OPEN cntCurs;
   	FETCH NEXT FROM cntCurs INTO @stLot, @logisticsUnit, @parentLogisticsUnit, @invAttribId;

	-- [comment omitted]
	if (@isPermanentLocation = 1 AND @quantityAtLocation = 0  AND @suspenseQtyAtLocation = 0)
	-- [comment omitted]
		begin
			set @stLot = null;
			set @locInvAttributesId = 0;
			set @parentLogisticsUnit = null;
			set @logisticsUnit = null;
		end;

	set @iTotalReq = 0;
   	if (@@FETCH_STATUS <> 0)
   	begin
      	exec @iError = CCP_InsertCCRequest @stItem,@stItemDesc,@stCompany,@stLot,@stLoc,
						@stWhs,@stWorkUnit,@stUserName,@logisticsUnit, @parentLogisticsUnit,@locInvAttributesId,
						@iGroupNum,@iGroupSize,@cycleCountPlanNum,@iLaunchNum,@cCreateWork,@iTotalReq output;  
	
		if (@@ERROR <> 0 OR @iError <> 0) 
		begin 
			CLOSE cntCurs; 
			DEALLOCATE cntCurs; 
			return -1;
		end;
	end;
	else
	begin
   		while (@@FETCH_STATUS = 0)
   		begin
		  
		  if (@isPermanentLocation = 1 AND @quantityAtLocation = 0 AND @suspenseQtyAtLocation = 0)
			-- [comment omitted]
			begin
				set @stLot = null;
				set @locInvAttributesId = 0;
				set @parentLogisticsUnit = null;
				set @logisticsUnit = null;
			end;

		  	exec @iError = CCP_InsertCCRequest @stItem,@stItemDesc,@stCompany,@stLot,@stLoc,
							@stWhs,@stWorkUnit,@stUserName,@logisticsUnit, @parentLogisticsUnit,@invAttribId,
							@iGroupNum,@iGroupSize,@cycleCountPlanNum,@iLaunchNum,@cCreateWork,@iTotalReq output;
							
			set @cycleCountInternalNum = @@IDENTITY	  

			if (@@ERROR <> 0 OR @iError <> 0) 
			begin 
				CLOSE cntCurs; 
				DEALLOCATE cntCurs; 
				return -1;
			end; 

			FETCH NEXT FROM cntCurs INTO @stLot,@logisticsUnit, @parentLogisticsUnit, @invAttribId;
   		end;
	end;		

   	CLOSE cntCurs;
   	DEALLOCATE cntCurs;

	if (@iTotalReq <= 0)
		return 0;
		
	-- [comment omitted]
	exec @iError = CCB_UpdateCCPlan @cycleCountPlanNum, @stUserName;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	
	-- [comment omitted]
	if (@cCreateWork = N'<literal:18>' OR @cCreateWork = N'<literal:19>')
	begin
		if @isPlanNumberPassed = 0
			exec @iError = CCP_CreateWorkFromRequest @iLaunchNum, @stWorkUnit, @stUserName;
		else
			exec @iError = CCP_CreateWorkForLogisticsUnit @cycleCountInternalNum, @iLaunchNum, @stWorkUnit, @stUserName, @stLoc, @stWhs;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	end;
		
	If( @stItem IS NULL OR LTRIM(RTRIM(@stItem)) = N'<literal:20>')
		begin
			set @stMessage = dbo.RSCMfn_RtrvMsg(N'<literal:21>');
			set @stVarData = @stLoc;
		end
	Else
		begin 
			-- [comment omitted]
			set @stMessage = dbo.RSCMfn_RtrvMsg(N'<literal:22>');
			set @stVarData = @stLoc + N'<literal:23>' + @stItem;
		end

	exec SH_FillStringWithVarData @stMessage output, @stVarData, 
								  N'<literal:24>'; -- [comment omitted]
	exec @iError = HIST_SaveProcHist 
						   N'<literal:25>',
						  N'<literal:26>' ,
						   null,					-- [comment omitted]
						   null,					-- [comment omitted]
						   null,					-- [comment omitted]
						   null,					-- [comment omitted]
						   @stMessage,
						   N'<literal:27>',	-- [comment omitted]
						   @stUserName,
						   @stWhs,
						   @cProcHistActive;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- [comment omitted]

