/* 
	Mod Number	| Programmer		| Date   	| Modification Description
	-----------------------------------------------------------------
	9593		| RAB			| 10/12/02	| Created.
	9591		| RLE			| 11/13/02	| Added ContainerId to CycleCountRequest.
	11870       | TBS        	| 09/16/03  | Added Multi-Byte support.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	10586		| TDL			| 08/26/04	| Check for NULL along with 0
	15829		| NNP			| 08/01/05	| Made SQLServer cursor Read_Only
	16780		| SP 			| 09/20/05	| Added record_type to queries
	19165		| VK			| 08/08/06	| Licenseplate changes
    19949       | KBR           | 10/13/06  | Added condition to check item is null. If so write different process hist mssg. 
    973			| KRG			| 04/03/07	| Added support for creating requests on the fly while adding new LPs through Cycle Counting
    19208		| BTA			| 02/13/08	| Fixed isPlanNumberPassed character comparison in the ORACLE region of the script.
	27602		| MD			| 05/04/08	| Fixed Cycle Count Request item getting set to null when activity based cycle count is triggered
	Creates a CycleCountRequest. 
	21158		| AG			| 09/18/08	| Modified to create CC requests even after all the related work instruction are closed.
	47046		| DRK			| 02/27/09	| Honoured Days between CC Setting in CC Threshold
	49284		| BB			| 05/06/09	| Modified to create CC requests based on LOT aswell.
	54229		| KRG			| 06/02/09	| Made LAUNCH_NUM to be picked up from WORK_INSTRUCTION table
	60280		| DSK			| 11/25/09	| Modified to stamp item for Multi-item locations when empty 
	67763		| DN			| 04/08/10	| Modified to update item information when location is permanent and empty
	73564		| RK			| 23/08/10	| Modified the datatype of the variable @iEmpty from int to numeric(19,5)
    76639		| MDL			| 12/06/10	| Added new bit parameter isDayBetweenCCNeedToConsider
	71770		| RJR			| 11/11/10	| Added parameter for inventory attributes. 
	77672		| RJR			| 12/02/10	| Set default value for inventory attributes. 
	82563		| RJR			| 03/24/11	| Fixed empty cycle count request creation to not log inventory attribute Id.
	82938		| AG			| 04/27/11	| Cleared Lot and Inventory Attributes ID when cycle count is created for empty permanent location
	100909		| DN			| 08/27/12	| Modified fix for 82938
	111660      | KSS			| 06/07/13	| Added param for CCP_CreateWorkForLogisticsUnit sp. 
	221276		| SO			| 04/23/18	| Modified to get warehouse date.
	25639		| MK			| 06/22/23	| Modified to create cycle count when inventory at location is 0 and location is permanent location.

	Parameters
		String	stItem			The item being picked.
		String	stItemDesc		stItems description.
		String	stCompany		stItems company.
		String	stLot			The current lot.
		String	stLoc			The location being picked from.
		String	stWhs			stLocs warehouse.
		String	stWorkUnit		The workUnit being processed (if any).
		String	stUserName		The current user.
		String  logisticsUnit	The Logistics Unit for which CC request needs to be created
		int		locInvAttributesId	Inventory attributes Id.
        string  isDayBetweenCCNeedToConsider 0 means no need to consider the days between CC
		
*/

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
	@logisticsUnit nvarchar(50) = N'', 
	@locInvAttributesId numeric(9),
    @isDayBetweenCCNeedToConsider bit =1)
AS
	SET NOCOUNT ON;

	-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;
	-- #DEFINE WMW.Reporting Manh.WMW.Reporting.General.ReportingConstants RepCon;
	-- #DEFINE WMW.Jsharp.Inventory com.pronto.general.CCConstants CCCons;

	-- local variables
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

	-- note that the variables will only be filled with
	-- the top row returned.  We will order the select 
	-- so that we retrieve the appropriate row first.
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
	-- else check for days between CC value
	if (@@ROWCOUNT > 0)
	begin	
		-- if a lastCycleCountDate was specified, make sure
		-- we have waited long enough to check again.
		if (@lastCycleCountDate is not null
			AND @daysBetween > 0 AND @isDayBetweenCCNeedToConsider > 0)
		begin
			set @daysElapsed = datediff(s, @lastCycleCountDate, CONVERT(date,dbo.GetWarehouseTimezoneValue(@stWhs,null))) / 86400.0;
			if (@daysElapsed < @daysBetween)
			begin
				-- record process history.
				set @stMessage = dbo.RSCMfn_RtrvMsg(N'MSG_PROCHIST_ACTIVITYDRIVENCC02');
				set @stVarData = @stLoc;
				
				exec SH_FillStringWithVarData @stMessage output, @stVarData, 
								  N'|~*'; -- delimiter
				
				exec @iError = HIST_SaveProcHist 
						   N'80',
						   N'120' ,
						   null,					-- identifier1
						   null,					-- identifier2
						   null,					-- identifier3
						   null,					-- identifier4
						   @stMessage,
						   N'CCP_CreateCCRequest',	-- processStamp
						   @stUserName,
						   @stWhs,
						   @cProcHistActive;
						   
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
				return 0;
			end;
		end; -- end if lastCycleCountDate specified.
	end;

	if @cycleCountPlanNum <> 0
		set @isPlanNumberPassed = 1
	else
		set @isPlanNumberPassed = 0

	if(@isPlanNumberPassed <> 0)
	begin
		--Retrieve the existing Launch Number
		SELECT 
			@iLaunchNum = Launch_num 
		FROM 
			WORK_INSTRUCTION WITH(NOLOCK)
		WHERE
			INSTRUCTION_TYPE = N'Header'
			AND WORK_UNIT = @stWorkUnit;
			
		--if @iLaunchNum is null, it means we are adding
		--inventory to a closed cycle count location.
		--so records will be moved to IA_WORK_INSTRUCTION
		--and only detail rows are present there. 
		--so get the top 1 from them
		if(@iLaunchNum is null)
			SELECT TOP 1
				@iLaunchNum = Launch_num 
			FROM 
				IA_WORK_INSTRUCTION WITH(NOLOCK)
			WHERE
				WORK_UNIT = @stWorkUnit;

		--CreateWork is defaulted to 'Y' as this flow will occur
		--only while performing Cycle Count Work
		set @cCreateWork = N'Y';
	end
	else
		-- retrieve the launchNum to use on the new request.
		exec @iError = NNR_RtrvNextLaunchNum @stWhs, @iLaunchNum output;
	
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

	-- retrieve createWork for CycleCounting flag from SystemConfigDetail.
	if @cCreateWork is null
		SELECT 
			@cCreateWork = SYSTEM_VALUE
		FROM 
			SYSTEM_CONFIG_DETAIL
		WHERE 
			RECORD_TYPE = N'Cycle Count'
			AND SYS_KEY = N'90';

	-- get information off of the the current activity driven plan.
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

	-- if an activity driven plan exists ... 
	if (@cycleCountPlanNum > 0)
	begin
		-- determine the current groupNum.
		SELECT @iGroupNum = MAX(GROUP_NUMBER)
		  FROM CYCLE_COUNT_REQUEST
		 WHERE INTERNAL_PLAN_NUM = @cycleCountPlanNum;
	end; -- end if plan exists.
	else
	begin
		-- if the plan doesnt yet exist, get the system configured
		-- groupSize, insert the plan, and start with the first group.
		SELECT @iGroupSize = SYSTEM_VALUE
		  FROM SYSTEM_CONFIG_DETAIL
		 WHERE RECORD_TYPE = N'Cycle Count'
		   AND SYS_KEY = N'100';
		 
		exec @iError = CCP_InsertCCPlan @iGroupSize, @stWhs, @stUserName,@cycleCountPlanNum output;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		
		set @iGroupNum = 1;
	end; -- end if plan didnt exist.

	set @suspenseQtyAtLocation = 0;
	if(@multiItemLocation = N'Y')
		begin
			set @quantityAtLocation = 1;
		end;
	else
		begin
			set @quantityAtLocation = 0;
			--1. when there is 0 quantity for the location/warehouse/item/company
				--1a. and the location is permanent - blank out all details other than item, item desc and company
				--1b. and the location is not permanent - blank out all details
			--2. when there is some quantity for the location/warehouse/item/company
				--2a. and the location is permanent - include all the item related details
				--2b. and the location is non-permanent - include all item related details
			--for non activity driven - creating cycle count request depends on inputs.
			--for activity driven - we create cycle count requests for all item lot and lp combinations
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
		@isPermanentLocation = CASE WHEN PERMANENT = N'Y' THEN 1 ELSE 0 END
	FROM LOCATION_INVENTORY
		WHERE LOCATION = @stLoc 
		AND WAREHOUSE = @stWhs
		AND ITEM = @stItem
		AND ((COMPANY = @stCompany) or (COMPANY is null and @stCompany is null))

	--if quantity at location = 0 and not called from master plan and is not a permanent location
	--then we can blank out all the item details
	if (@quantityAtLocation = 0 AND @isPlanNumberPassed = 0 AND @isPermanentLocation = 0)
			--if it is not a permanent location and it is empty, clear the following values.
				begin
					set @stItem = null;
					set @stItemDesc = null;
					set @stCompany = null;
					set @stLot = null;
					set @locInvAttributesId = 0;
			set @parentLogisticsUnit = null;
			set @logisticsUnit = null;
		end;

	--if this is an activity driven cycle count then create cycle count requests for all lot/lp combinations
	IF (@isPlanNumberPassed = 0)
		-- Create cycle count for each container.
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

	--for permanent location when qty at location = 0  create a cycle count request with item/company/desc only
	if (@isPermanentLocation = 1 AND @quantityAtLocation = 0  AND @suspenseQtyAtLocation = 0)
	--in case of permanent locations which are empty, we still have to have item details in CC
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
			--in case of permanent locations which are empty, we still have to have item details in CC
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
		
	-- update the CycleCountPlan
	exec @iError = CCB_UpdateCCPlan @cycleCountPlanNum, @stUserName;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	
	-- insert the work if necessary.
	if (@cCreateWork = N'Y' OR @cCreateWork = N'y')
	begin
		if @isPlanNumberPassed = 0
			exec @iError = CCP_CreateWorkFromRequest @iLaunchNum, @stWorkUnit, @stUserName;
		else
			exec @iError = CCP_CreateWorkForLogisticsUnit @cycleCountInternalNum, @iLaunchNum, @stWorkUnit, @stUserName, @stLoc, @stWhs;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	end;
		
	If( @stItem IS NULL OR LTRIM(RTRIM(@stItem)) = N'')
		begin
			set @stMessage = dbo.RSCMfn_RtrvMsg(N'MSG_CC50');
			set @stVarData = @stLoc;
		end
	Else
		begin 
			-- record process history.
			set @stMessage = dbo.RSCMfn_RtrvMsg(N'MSG_CC02');
			set @stVarData = @stLoc + N'|~*' + @stItem;
		end

	exec SH_FillStringWithVarData @stMessage output, @stVarData, 
								  N'|~*'; -- delimiter
	exec @iError = HIST_SaveProcHist 
						   N'80',
						  N'120' ,
						   null,					-- identifier1
						   null,					-- identifier2
						   null,					-- identifier3
						   null,					-- identifier4
						   @stMessage,
						   N'CCP_CreateCCRequest',	-- processStamp
						   @stUserName,
						   @stWhs,
						   @cProcHistActive;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- end CCP_CreateCCRequest

