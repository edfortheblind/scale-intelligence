/*
    Task       | By        | Date                   | Modification Description
    --------------------------------------------------------------------
    228995	   | MJ        | 11/20/18				| Created.
	229000	   | MJ		   | 03/08/19				| Modified for get Putaway.	
	233047     | KSS       | 04/24/19               | Modified code to add Lot ExpirationDate
	233116     | KSS       | 05/02/19               | Changes made for Item Image
	233763     | MMM       | 07/31/19               | Added containerId parameter to fetch work instructions by container id
	239915	   | HN		   | 11/04/19				| Added condition to avoid duplicate data
	249092     | MDL	   | 04/16/20				| Added SRC Identifier.
	249271	   | PMB	   | 04/22/20				| Added parameter @fromLoc and @isSystemDirectedWork to support system directed work.
	251097	   | PMB	   | 05/05/20				| Modified to seggregate systemdirect logic completely in a way user directed should not be affected.
	246176	   | SO		   | 05/07/20				| Modified to fetch internal_count_num for cycle count work	
	248571	   | PMB	   | 05/11/20				| Modified to support from from assignment method.
	248566	   | PMB	   | 05/18/20				| Modified to support from assignment method PRIORITY/LOCATION/FIFO. 
	248574	   | PMB	   | 05/26/20				| Modified to exclude work instructions which are not supported.
	246526	   | PS		   | 07/15/20				| Modified to support system directed inventory transfer work
	254013	   | PS		   | 07/27/20				| Modified to support system directed work order finished item work
	254862	   | PMB	   | 07/27/20				| modified to support work unit selection on locaiton for system directed work.
	256082     | SKT       | 08/20/20				| Modified to support fetching and sequencing of grouped work instructions for Cart Picking
	256293	   | PMB	   | 08/24/20				| Modified to support fetching of assigned work during the system directed work assignment. 	
	256840     | RM        | 08/25/20				| Modified to fetch GroupPosition for Cart Picking.
	259916     | SKT       | 10/16/20				| Modified to fetch GroupNumber for Cart Picking.
	229653	   | VV		   | 10/16/20				| Modified to check for shiiping_load in_confirmation.
	248717	   | RM		   | 10/30/20				| Fetched the values of Condition from Work Instruction and QC_STATUS from Shipping Container to support QC assignment at Start Work.
	266735	   | RSP	   | 05/14/21				| Modified select clause to include Serial Number tracking value since its helpful during work execution.
	266737	   | MMM	   | 05/21/21				| Supported pick drop location and inventory attributes work in system directed mode
	266785	   | PS		   | 05/25/21				| Modified select to handle putloc for Dock work with Pnd.	
	267610	   | RSP	   | 05/28/21				| Modified outer join on Item to include condition when item is null on item table.
	266388	   | MMM	   | 06/03/21				| Modified an work type condition for query performance
	5900	   | SSM	   | 06/03/21				| Added transportContId parameter to fetch work instructions by tote id
	6901	   | PS	       | 11/19/21				| Modified validation clause for system directed work when the putaway options are selected
	7332   	   | SOK	   | 12/06/21				| Add extra check for cart picking, when the next workinstruction is cycle count. 
	8954	   | SO		   | 02/22/22				| Modified to include order by sequence from work_regroup_order on updating the sequence for cart picking work
	9039       | NB        | 02/25/22               | Skip resequencing when item has already being picked from the group
	9685	   | TR        | 21/04/22               | Added LooseChild and ParentContainerId retrieval
	10697	   | VS		   | 06/01/22				| Modified table temp_work_types work type column datatype to nvarchar from varchar to support foreign characters.
	11203	   | SO		   | 06/13/22				| Modified to update sequence when sequence is not already applied and return workinstructions order by sequence when workinitiationmethod is GroupUser
	12885      | NB        | 08/22/2022             | Supported Container creation on the fly for system directed shipment work.
	3357	   | VM 	   | 10/31/23				| Modified to support from assignment method FIFO. 
	63645	   | MM		   | 08/31/26				| Feature-flagged system-directed perf (join gating, LooseChild PK) and TopWSV (SYS_KEY 10): cycle-count lean path plus non-cycle-count full joins; FromLoc tier checks use same eligibility as main query (company/zone, load in confirmation, INR, catch weight) so ineligible work at scanned loc does not hide eligible work at next loc; child FFs gated by SYSDIR_PERF_ALL.
	63645	   | MM		   | 08/31/26				| TopWSV: Priority/Location/FIFO uses priority-aware FromLoc tier (top-priority subset, respecting user-assigned preference); assigned-to-user first within priority.
	*/

CREATE PROCEDURE WRK_GetWorkInstructionsForExecution(
@workUnit nvarchar(50),
@containerId nvarchar(25),
@user nvarchar(30),
@workprofile nvarchar(25),
@workprofileSequence numeric(5),
@warehouse nvarchar(25),
@fromto int,
@fromLoc nvarchar(25),
@isSystemDirectedWork bit = 0,
@isCartPickingWork bit = 0,
@groupNumber int,
@transportContId nvarchar(25),
@isCcWorkUnit bit = 0
) 
AS

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants; 

declare @ifromSQL nvarchar(1000);
declare @warehouseCondition nvarchar(1000);
declare @allzone numeric; --0 means all zones
declare @workUnitWithWorkUnitDelimiter nvarchar(1000);
declare @workUnitWithLicensePlateDelimiter nvarchar(1000);
declare @workTypes nvarchar(2000) 
declare @companyaccess nvarchar(2000);
declare @zoneccess nvarchar(2000);
declare @orderby nvarchar(1000);
declare @workProcess nvarchar(100);
declare @warehouseAuthType nvarchar(100);
declare @sql nvarchar(MAX);
declare @groupOnRF nvarchar(1);
declare @workInitiationMethod nvarchar(25);
declare @toAssignMethod nvarchar(25);

declare @initiationCondition nvarchar(400);
declare @fromAssignMethod nvarchar(50);
declare @initiatedWithLocation bit =0;
declare @ConsolidateAfterPutAway nchar(2),@NestAfterPutAway nchar(2),@ShipContPut nchar(2),@TotePick nchar(2),@ShipContPick nchar(2);
declare @sequenced int = -1;
declare @groupCondition nvarchar(400);
declare @pickedInstructionsCountFromGroup int =0;
declare @wrkGetWiSysDirPerfFF nchar(2);
declare @wrkGetWiSysDirTopWsvFF nchar(2);
declare @assignMultipleWorkUnits nchar(1);
declare @receiptSequenceOrder bit = 0;
declare @topWsvMaxRows int;
declare @fromLocTier int = 0; -- 0=none, 1=exact, 2=in-front, 3=behind (GetFilteredWork proximity)
declare @fromLocFilter nvarchar(1000) = N'';
declare @topWsvPlfMinPriority int = NULL;        -- top priority for Priority/Location/FIFO proximity
declare @topWsvPlfHasUserAssigned bit = 0;       -- 1 if top-priority work is assigned to current user
declare @topWsvPlfPriorityPredicate nvarchar(500) = N'';

IF(@isCartPickingWork = 1 AND @isCcWorkUnit = 0)
	BEGIN
		IF(ISNULL(@groupNumber, N'') = N'' AND (ISNULL(@containerId, N'') != N'' OR ISNULL(@transportContId, N'') != N''))
			SELECT TOP 1 @groupNumber = GROUP_NUM FROM WORK_INSTRUCTION where TRANSPORT_CONT_ID = @containerId OR TRANSPORT_CONT_ID = @transportContId
            SELECT TOP 1 @sequenced = SEQUENCE FROM WORK_INSTRUCTION where ((TRANSPORT_CONT_ID = @containerId OR TRANSPORT_CONT_ID = @transportContId) AND INSTRUCTION_TYPE = N'Detail' AND GROUP_NUM IS NOT NULL);
			
			
			--Skip resequencing if item has already picked from the group
			if(@groupNumber > 0)	
			SELECT @pickedInstructionsCountFromGroup= COUNT(*)   FROM WORK_INSTRUCTION where FROM_QTY =0 and GROUP_NUM=@groupNumber and INSTRUCTION_TYPE = N'Detail'
			--sequenced <= 0 that means work sequence not applied so apply sequence
		IF (@sequenced <= 0 and @pickedInstructionsCountFromGroup = 0)
		BEGIN
		--Append the ORDER BY as defined by WorkRegroupOrder If no WorkRegroupOrder records exist, completely skip the reordering of the work and leave all the sequences
        -- the way they are. 
			DECLARE @sequenceOrderBy nvarchar(25), @tableFieldName nvarchar(50), @sequence numeric(5,0),@orderbystatement nvarchar(max) = N'';
			DECLARE @temp_work_regroup TABLE (ORDER_BY nvarchar(25),TABLE_FIELD_NAME nvarchar(50), SEQUENCE  numeric(5,0));
			INSERT into @temp_work_regroup(order_by,TABLE_FIELD_NAME,SEQUENCE) select  ORDER_BY, TABLE_FIELD_NAME,SEQUENCE  from work_regroup_order order by Sequence;
			While EXISTS(SELECT top 1 1 From @temp_work_regroup)  
				begin  
					SELECT top 1 @sequenceOrderBy = ORDER_BY, @tableFieldName = TABLE_FIELD_NAME,@sequence = SEQUENCE
					FROM @temp_work_regroup

					if(@sequenceOrderBy =N'Ascending')
						SET @orderbystatement = @orderbystatement + N' ' + @tableFieldName + N' ' + N'ASC,'
					else
						SET @orderbystatement = @orderbystatement + N' ' + @tableFieldName + N' ' + N'DESC,'	
					DELETE from  @temp_work_regroup where SEQUENCE=@sequence
				end 
	
				if(@orderbystatement <> N'')
				SET @orderbystatement = left(@orderbystatement, LEN(@orderbystatement)-1)
				else
				SET @orderbystatement = N' INTERNAL_INSTRUCTION_NUM ASC'

			DECLARE @sqlstmt nvarchar(max);
		  SET @sqlstmt = N'UPDATE WORK_INSTRUCTION SET SEQUENCE = SORTEDWORKINSTRUCTIONS.SEQUENCENUM    
		   FROM WORK_INSTRUCTION WI INNER JOIN   
			(SELECT  INTERNAL_INSTRUCTION_NUM, ROW_NUMBER() OVER ( ORDER BY ' +  @orderbystatement + N' ) AS SEQUENCENUM   
			 FROM  WORK_INSTRUCTION  WHERE  GROUP_NUM = @groupNumber  AND  INSTRUCTION_TYPE = N''Detail'') SORTEDWORKINSTRUCTIONS   
		   ON SORTEDWORKINSTRUCTIONS.INTERNAL_INSTRUCTION_NUM = WI.INTERNAL_INSTRUCTION_NUM '
		  execute sp_executesql @sqlstmt,N'@groupNumber int',@groupNumber	
		END
		SET @initiationCondition = N'WI.GROUP_NUM = @groupNumber';
	END
ELSE	
	BEGIN
		IF(@groupNumber > 0 )
		BEGIN	
			set @groupCondition = N'WI.GROUP_NUM = @groupNumber';
		END
		ELSE	
		BEGIN
			set	@groupCondition = N'1=1';
			IF(ISNULL(@workUnit,N'')=N''AND ISNULL(@containerId,N'')=N'' AND ISNULL(@transportContId,N'')=N'')
			BEGIN
				set @initiationCondition =  N'1<>1';
				set @initiatedWithLocation = 1;
			END
			ELSE
				set @initiationCondition = N'WI.TRANSPORT_CONT_ID = @containerId OR WI.WORK_UNIT = @workunit OR WI.TRANSPORT_CONT_ID = @transportContId';
		END
	END

SELECT @allzone = count(*) from (SELECT ZONE from ZONE where ZONE_TYPE=N'Work'
EXCEPT    
SELECT ZONE from WORK_PROFILE_ZONE_AUTH where WORK_PROFILE = @workprofile ) zones 


select @groupOnRF = GROUP_ON_RF, @workInitiationMethod = WORK_INITIATION_METHOD, @toAssignMethod =TO_ASSIGN_METHOD, @assignMultipleWorkUnits = ASSIGN_MULTIPLE_WORK_UNITS from WORK_PROFILE_DETAIL where WORK_PROFILE = @workProfile;
SELECT @workTypes = WORK_TYPES,@ConsolidateAfterPutAway = CONSOLIDATE_AFTER_PUTAWAY,@NestAfterPutAway = NEST_AFTER_PUTAWAY,@ShipContPut = SHIP_CONT_PUT,
@TotePick = TOTE_PICK, @ShipContPick = SHIP_CONT_PICK  from WORK_PROFILE_DETAIL where WORK_PROFILE = @workprofile and WORK_PROFILE_DETAIL.SEQUENCE = @workprofileSequence;
SELECT @workUnitWithWorkUnitDelimiter= SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where RECORD_TYPE=N'Work Setup' and SYS_KEY = N'New Work Delim';
SELECT @workUnitWithLicensePlateDelimiter= SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where RECORD_TYPE = N'Inventory Transfer' and SYS_KEY=N'200';

SELECT @workUnitWithWorkUnitDelimiter =  @workUnit + @workUnitWithWorkUnitDelimiter;
SELECT @workUnitWithLicensePlateDelimiter = @workUnit + @workUnitWithLicensePlateDelimiter;
select @fromAssignMethod = FROM_ASSIGN_METHOD from WORK_PROFILE_DETAIL where WORK_PROFILE = @workprofile and WORK_PROFILE_DETAIL.SEQUENCE = @workprofileSequence;

SELECT @companyaccess= case when 
 (SELECT COMPANY_AUTH from USER_PROFILE where user_name= @user)=N'All' then N' And 1=1 '
  ELSE N' AND (  WI.COMPANY IN  (SELECT COMPANY  FROM COMPANY_ACCESS  WHERE USER_NAME = @user  ) OR  WI.COMPANY IS NULL ) ' END

-- TO DO : check for multiple work instructions available
--declare @workUnitCount decimal
--select @workUnitCount = count(*) from WORK_INSTRUCTION where (WORK_UNIT like  '%@workUnit%' or WORK_UNIT like  '%@workUnitWithWorkUnitDelimiter%' or WORK_UNIT like  '%@workUnitWithLicensePlateDelimiter%') and INSTRUCTION_TYPE = 'Header' 

-- order by 'sequence' when work initiation is GroupUser
SELECT @orderby = CASE WHEN @fromto = 0 then (CASE WHEN (@groupOnRF = N'N' and @workInitiationMethod != N'GroupUser') then N' WI.WORK_UNIT,WI.SEQUENCE ' ELSE N' WI.SEQUENCE '  END)  
					ELSE (CASE WHEN @toAssignMethod = N'Location' then N' putLoc,WI.END_DATE_TIME DESC ' else N' WI.END_DATE_TIME DESC ' END)  END

-- Added check to avoid setting up the order by clause for putaway work as below logic is specific to pick work.
-- No action needed as order by clause is already set for putaway work in the previous line
-- below order by clause should only be updated for pick work
IF(@fromto != 1 AND (@isSystemDirectedWork = 1 OR @initiatedWithLocation = 1))
	Begin
		declare @bug47910FeatureFlag nchar(2);
		SELECT @bug47910FeatureFlag = dbo.fn_GetFeatureEnabled(N'BUG_47910_FIFO_RETRIEVE_BY_INTERNAL_INST_NUM', @user);
		IF (@bug47910FeatureFlag = N'Y')
		BEGIN
			select @orderBy=case
				When @fromAssignMethod = N'Location/Priority/FIFO'
					THEN N'(CASE WHEN USER_ASSIGNED IS NULL THEN 1 ELSE 0 END), WI.From_loc,WI.priority,WI.AGING_DATE_TIME,WI.INTERNAL_INSTRUCTION_NUM'
				when  @fromAssignMethod = N'Priority/Location/FIFO'
					THEN N'WI.priority,WI.From_loc,WI.AGING_DATE_TIME,WI.INTERNAL_INSTRUCTION_NUM'										
				ELSE 
					N'(CASE WHEN USER_ASSIGNED IS NULL THEN 1 ELSE 0 END),WI.AGING_DATE_TIME,WI.INTERNAL_INSTRUCTION_NUM'
			END
		END
		ELSE
		BEGIN
			select @orderBy=case
				When @fromAssignMethod = N'Location/Priority/FIFO'
					THEN  N'(CASE WHEN USER_ASSIGNED IS NULL THEN 1 ELSE 0 END), WI.From_loc,WI.priority,WI.AGING_DATE_TIME'
				when  @fromAssignMethod = N'Priority/Location/FIFO'
					THEN N'WI.priority,WI.From_loc,WI.AGING_DATE_TIME'										
				ELSE 
					N'(CASE WHEN USER_ASSIGNED IS NULL THEN 1 ELSE 0 END),WI.AGING_DATE_TIME'
			END
		END
	END

IF @allzone =0
                BEGIN
                                SET @zoneccess = N' AND 1=1' 
                END;
ELSE
	BEGIN
		if(@fromto = 0 or @fromto = 2)
		BEGIN
			SET @zoneccess =  N'AND (  (CASE  WHEN WI.INVENTORY_AT_PD = '''+ N'O' +N''' THEN OUTPD.WORK_ZONE WHEN WI.INVENTORY_AT_PD = '''+ N'I' +N'''  THEN INPD.WORK_ZONE ELSE WI.FROM_WORK_ZONE END) 
			IN ( SELECT   ZONE  FROM      WORK_PROFILE_ZONE_AUTH  WHERE     WORK_PROFILE = @workProfile ) OR  
			(CASE  WHEN WI.INVENTORY_AT_PD =  '''+ N'O' +N'''  THEN OUTPD.WORK_ZONE WHEN WI.INVENTORY_AT_PD =  '''+ N'I' +N'''  THEN INPD.WORK_ZONE ELSE WI.FROM_WORK_ZONE END) is null ) 
			AND ( (CASE  WHEN WI.INVENTORY_AT_PD IS NULL AND WI.OUTGOING_PD_LOC IS NOT NULL THEN OUTPD.WORK_ZONE WHEN (WI.INVENTORY_AT_PD IS NULL OR  WI.INVENTORY_AT_PD =  '''+ N'O' +N'''  ) 
			AND WI.INCOMING_PD_LOC IS NOT NULL THEN INPD.WORK_ZONE ELSE WI.TO_WORK_ZONE END) IN 
			( SELECT      ZONE  FROM      WORK_PROFILE_ZONE_AUTH  WHERE     WORK_PROFILE =  @workProfile ) OR  
			(CASE  WHEN WI.INVENTORY_AT_PD IS NULL AND WI.OUTGOING_PD_LOC IS NOT NULL THEN OUTPD.WORK_ZONE WHEN 
			(WI.INVENTORY_AT_PD IS NULL OR  WI.INVENTORY_AT_PD =  '''+ N'O' +N'''  ) AND WI.INCOMING_PD_LOC IS NOT NULL THEN INPD.WORK_ZONE ELSE WI.TO_WORK_ZONE END) is null OR ( WI.FROM_WHS <> WI.TO_WHS ))'
	  END
	  ELSE
	  BEGIN
			SET @zoneccess =  N'AND ( (CASE  WHEN WI.INVENTORY_AT_PD IS NULL AND WI.OUTGOING_PD_LOC IS NOT NULL THEN OUTPD.WORK_ZONE WHEN (WI.INVENTORY_AT_PD IS NULL OR  WI.INVENTORY_AT_PD =  '''+ N'O' +N'''  ) 
			AND WI.INCOMING_PD_LOC IS NOT NULL THEN INPD.WORK_ZONE ELSE WI.TO_WORK_ZONE END) IN 
			( SELECT      ZONE  FROM      WORK_PROFILE_ZONE_AUTH  WHERE     WORK_PROFILE =  @workProfile ) OR  
			(CASE  WHEN WI.INVENTORY_AT_PD IS NULL AND WI.OUTGOING_PD_LOC IS NOT NULL THEN OUTPD.WORK_ZONE WHEN 
			(WI.INVENTORY_AT_PD IS NULL OR  WI.INVENTORY_AT_PD =  '''+ N'O' +N'''  ) AND WI.INCOMING_PD_LOC IS NOT NULL THEN INPD.WORK_ZONE ELSE WI.TO_WORK_ZONE END) is null OR ( WI.FROM_WHS <> WI.TO_WHS ))'
	  END
	END

-- Top-level master: FEATURE_63645_SYSDIR_PERF_ALL must be Y for any 63645 child FF to apply.
SET @wrkGetWiSysDirPerfFF = N'N';
SET @wrkGetWiSysDirTopWsvFF = N'N';
IF (dbo.fn_GetFeatureEnabled(N'FEATURE_63645_SYSDIR_PERF_ALL', @user) = N'Y')
	BEGIN
		SELECT @wrkGetWiSysDirPerfFF = dbo.fn_GetFeatureEnabled(N'FEATURE_63645_WRK_GETWI_SYSDIR_PERF', @user);
		SELECT @wrkGetWiSysDirTopWsvFF = dbo.fn_GetFeatureEnabled(N'FEATURE_63645_WRK_GETWI_SYSDIR_TOPWSV', @user);
	END

-- TopWSV + Priority/Location/FIFO: assigned-to-user first within priority (matches GetFilteredWork).
IF (@wrkGetWiSysDirPerfFF = N'Y' AND @wrkGetWiSysDirTopWsvFF = N'Y'
	AND @isSystemDirectedWork = 1 AND @fromAssignMethod = N'Priority/Location/FIFO' AND @fromto != 1)
BEGIN
	IF (CHARINDEX(N'WI.INTERNAL_INSTRUCTION_NUM', @orderby) > 0)
		SET @orderby = N'WI.priority,(CASE WHEN WI.USER_ASSIGNED = @user THEN 0 ELSE 1 END),WI.From_loc,WI.AGING_DATE_TIME,WI.INTERNAL_INSTRUCTION_NUM';
	ELSE
		SET @orderby = N'WI.priority,(CASE WHEN WI.USER_ASSIGNED = @user THEN 0 ELSE 1 END),WI.From_loc,WI.AGING_DATE_TIME';
END

-- Receipt multi-WU sequence path (mirrors IsSystemInitMethodAssignedMutipleWorkUnits profile flags; InternalNumType/AllowWorkSelect checked in SQL)
IF (@isSystemDirectedWork = 1 AND @fromto <> 1 AND ISNULL(@groupNumber, 0) > 0 AND @groupOnRF = N'Y' AND ISNULL(@assignMultipleWorkUnits, N'N') = N'Y')
	SET @receiptSequenceOrder = 1;
SELECT @topWsvMaxRows = TRY_CAST(SYSTEM_VALUE AS int) FROM SYSTEM_CONFIG_DETAIL WHERE RECORD_TYPE = N'Work Setup' AND SYS_KEY = N'10';
IF (@topWsvMaxRows IS NULL OR @topWsvMaxRows <= 0)
	SET @topWsvMaxRows = 2000;

-- workProcess / FROM|TO filters (needed before TopWSV location checks and main query)
IF (@wrkGetWiSysDirPerfFF = N'Y' AND @isSystemDirectedWork = 1 AND ISNULL(@workUnit,N'')=N'' AND ISNULL(@containerId,N'')=N'' AND ISNULL(@transportContId,N'')=N'')
BEGIN
	SET @workProcess = NULL;
END
ELSE
BEGIN
	SELECT top 1 @workProcess = INTERNAL_NUM_TYPE FROM WORK_INSTRUCTION WHERE (TRANSPORT_CONT_ID = @containerId OR WORK_UNIT = @workunit OR TRANSPORT_CONT_ID = @transportContId) AND INSTRUCTION_TYPE = N'Header';
END
SELECT @warehouseAuthType =  WAREHOUSE_AUTH from USER_PROFILE where USER_NAME = @user;

if(@fromto = 0 or @fromto = 2)
begin
                set @ifromSQL =N'( WI.FROM_QTY > 0 OR WI.CYCLE_COUNT = ''Y'' ) '
                if(@workProcess = N'Inventory Transfer')
                begin
                                set @warehouseCondition = N' AND (WI.FROM_WHS = @warehouse' + N' OR WI.TO_WHS = @warehouse)' ; 
                end
                else
                begin
                                set @warehouseCondition = N' AND WI.FROM_WHS = @warehouse'
                end
end;
else if(@fromto = 1)
begin
                set @ifromSQL =N'( WI.TO_QTY > 0 OR WI.CYCLE_COUNT = ''Y'' ) '
                if(@workProcess = N'Inventory Transfer' and @warehouseAuthType = N'List')
                begin
                                set @warehouseCondition = N' AND WI.TO_WHS IN(SELECT WAREHOUSE FROM WAREHOUSE_ACCESS WHERE USER_NAME = @user)' 
                end
				else if(@workProcess = N'Inventory Transfer'  and @warehouseAuthType = N'All')
				begin
				set @warehouseCondition = N'' ;
				end
                else
                begin
                                set @warehouseCondition = N' AND WI.TO_WHS = @warehouse'
                end
end;

if(@fromto = 2)
begin	
if(@warehouseCondition != N'')
	set @warehouseCondition = @warehouseCondition + N'OR WI.TO_WHS = @warehouse'
end;

-- Shared TopWSV validation fragments (location checks + cycle-count / other main paths)
DECLARE @ContainerCreationOnFly nchar(2);
SELECT @ContainerCreationOnFly = dbo.fn_GetFeatureEnabled(N'FEATURE_11741_CONTAINERCREATIONDURINGPICK', @user);
DECLARE @validationClause nvarchar(MAX) = N' AND INR.REQUEST_KEY_NUM IS NULL ';
IF(ISNULL(@ShipContPick,N'N')=N'Y' AND @ContainerCreationOnFly = N'N')
	SET @validationClause = @validationClause + N' AND NOT (ISNULL(WI.CONTAINER_ID,'''')='''' AND WI.INTERNAL_NUM_TYPE = ''Shipment'' )';
DECLARE @leanValidationClause nvarchar(max) = N'';
IF(ISNULL(@ShipContPick,N'N')=N'Y' AND @ContainerCreationOnFly = N'N')
	SET @leanValidationClause = N' AND NOT (ISNULL(WI.CONTAINER_ID,'''')='''' AND WI.INTERNAL_NUM_TYPE = ''Shipment'' )';
DECLARE @ccKeyZone nvarchar(max);
IF (@allzone = 0)
	SET @ccKeyZone = N' AND 1=1 ';
ELSE
	SET @ccKeyZone = N' AND (WI.FROM_WORK_ZONE IN (SELECT ZONE FROM WORK_PROFILE_ZONE_AUTH WHERE WORK_PROFILE = @workProfile) OR WI.FROM_WORK_ZONE IS NULL)
			AND (WI.TO_WORK_ZONE IN (SELECT ZONE FROM WORK_PROFILE_ZONE_AUTH WHERE WORK_PROFILE = @workProfile) OR WI.TO_WORK_ZONE IS NULL OR WI.FROM_WHS <> WI.TO_WHS) ';

-- TopWSV FromLoc bands (exact → front → behind); skip for FIFO.
-- For Priority/Location/FIFO we pin to the top priority first so higher-priority work elsewhere
-- is not hidden by the location band (matches GetFilteredWork).
IF (@wrkGetWiSysDirTopWsvFF = N'Y' AND @isSystemDirectedWork = 1 AND ISNULL(@fromLoc, N'') <> N''
	AND ISNULL(@fromAssignMethod, N'') <> N'FIFO' AND @fromto <> 1)
BEGIN
	DECLARE @topWsvProbeFound bit;
	DECLARE @topWsvProbeSql nvarchar(max);
	DECLARE @topWsvProbeBody nvarchar(max) = N'
		FROM WORK_INSTRUCTION WI
		LEFT OUTER JOIN ITEM I ON WI.ITEM = I.ITEM AND (WI.COMPANY = I.COMPANY OR I.COMPANY IS NULL)
		LEFT OUTER JOIN LOCATION OUTPD ON WI.FROM_WHS = OUTPD.WAREHOUSE AND WI.OUTGOING_PD_LOC = OUTPD.LOCATION
		LEFT OUTER JOIN LOCATION INPD ON WI.TO_WHS = INPD.WAREHOUSE AND WI.INCOMING_PD_LOC = INPD.LOCATION
		LEFT OUTER JOIN IMMEDIATE_NEEDS_REQUEST IR ON WI.INTERNAL_NUM = IR.INTERNAL_FULFILLMENT_NUM
		LEFT OUTER JOIN SHIPMENT_HEADER SH ON SH.INTERNAL_SHIPMENT_NUM = (CASE WHEN WI.INTERNAL_NUM_TYPE = N''Receipt'' THEN IR.INTERNAL_NUM ELSE WI.INTERNAL_NUM END)
		LEFT OUTER JOIN SHIPPING_LOAD SL ON SH.SHIPPING_LOAD_NUM = SL.INTERNAL_LOAD_NUM
		LEFT OUTER JOIN IMMEDIATE_NEEDS_REQUEST INR ON INR.INTERNAL_FULFILLMENT_NUM = WI.INTERNAL_NUM AND INR.REQUEST_KEY_NUM = 10001
		WHERE (' + @groupCondition + N') AND ' + @ifromSQL + N'
		  AND WI.INSTRUCTION_TYPE = N''Detail'' AND WI.HOLD_CODE IS NULL AND WI.CONDITION <> N''Closed''
		  AND (I.CATCH_WEIGHT_REQD = N''N'' OR I.CATCH_WEIGHT_REQD IS NULL)
		  ' + @warehouseCondition + N'
		  AND WI.WORK_TYPE IN (SELECT value FROM STRING_SPLIT(@workTypes, N'',''))
		  ' + @companyaccess + N'
		  AND (WI.USER_ASSIGNED IS NULL OR WI.USER_ASSIGNED = @user)
		  AND (
			(WI.INTERNAL_NUM_TYPE = N''Cycle Count''' + @ccKeyZone + @leanValidationClause + N')
			OR
			(WI.INTERNAL_NUM_TYPE IN (N''Receipt'',N''Replenishment'',N''Shipment'',N''Inventory Transfer'',N''Work Order Putaway'',N''Work Order'',N''Dock Management'')
			 ' + @zoneccess + @validationClause + N'
			 AND (SL.IN_CONFIRMATION <> N''P'' OR SL.IN_CONFIRMATION IS NULL))
		  )';

	-- For Priority/Location/FIFO, locate the top priority first and whether it is assigned to the current user.
	-- GetFilteredWork filters to the top priority, then to user-assigned rows, then applies location proximity.
	-- Pinning the location band to that subset keeps the query selective without returning lower-priority nearby work.
	IF (@fromAssignMethod = N'Priority/Location/FIFO')
	BEGIN
		DECLARE @topWsvPlfMinPrioritySql nvarchar(max) = N'SELECT @minPriority = MIN(WI.PRIORITY) ' + @topWsvProbeBody;
		EXEC sp_executesql @topWsvPlfMinPrioritySql,
			N'@fromLoc nvarchar(25), @warehouse nvarchar(200), @user nvarchar(200), @workProfile nvarchar(25), @groupNumber int, @workTypes nvarchar(2000), @minPriority int OUTPUT',
			@fromLoc, @warehouse, @user, @workProfile, @groupNumber, @workTypes, @minPriority = @topWsvPlfMinPriority OUTPUT;

		IF (@topWsvPlfMinPriority IS NOT NULL)
		BEGIN
			DECLARE @topWsvPlfUserAssignedFound bit = 0;
			DECLARE @topWsvPlfUserAssignedSql nvarchar(max) = N'IF EXISTS (SELECT TOP (1) 1 ' + @topWsvProbeBody
				+ N' AND WI.PRIORITY = @minPriority AND WI.USER_ASSIGNED = @user) SET @found = 1';
			EXEC sp_executesql @topWsvPlfUserAssignedSql,
				N'@fromLoc nvarchar(25), @warehouse nvarchar(200), @user nvarchar(200), @workProfile nvarchar(25), @groupNumber int, @workTypes nvarchar(2000), @minPriority int, @found bit OUTPUT',
				@fromLoc, @warehouse, @user, @workProfile, @groupNumber, @workTypes, @topWsvPlfMinPriority, @found = @topWsvPlfUserAssignedFound OUTPUT;

			IF (@topWsvPlfUserAssignedFound = 1)
				SET @topWsvPlfPriorityPredicate = N' AND WI.PRIORITY = ' + CAST(@topWsvPlfMinPriority AS nvarchar(20)) + N' AND WI.USER_ASSIGNED = @user';
			ELSE
				SET @topWsvPlfPriorityPredicate = N' AND WI.PRIORITY = ' + CAST(@topWsvPlfMinPriority AS nvarchar(20)) + N' AND WI.USER_ASSIGNED IS NULL';
		END
	END

	SET @topWsvProbeFound = 0;
	SET @topWsvProbeSql = N'IF EXISTS (SELECT TOP (1) 1 ' + @topWsvProbeBody + N' AND WI.FROM_LOC = @fromLoc' + @topWsvPlfPriorityPredicate + N') SET @found = 1';
	EXEC sp_executesql @topWsvProbeSql,
		N'@fromLoc nvarchar(25), @warehouse nvarchar(200), @user nvarchar(200), @workProfile nvarchar(25), @groupNumber int, @workTypes nvarchar(2000), @found bit OUTPUT',
		@fromLoc, @warehouse, @user, @workProfile, @groupNumber, @workTypes, @found = @topWsvProbeFound OUTPUT;
	IF (@topWsvProbeFound = 1)
	BEGIN
		SET @fromLocTier = 1;
		SET @fromLocFilter = N' AND WI.FROM_LOC = @fromLoc';
	END
	ELSE
	BEGIN
		SET @topWsvProbeFound = 0;
		SET @topWsvProbeSql = N'IF EXISTS (SELECT TOP (1) 1 ' + @topWsvProbeBody + N' AND WI.FROM_LOC > @fromLoc' + @topWsvPlfPriorityPredicate + N') SET @found = 1';
		EXEC sp_executesql @topWsvProbeSql,
			N'@fromLoc nvarchar(25), @warehouse nvarchar(200), @user nvarchar(200), @workProfile nvarchar(25), @groupNumber int, @workTypes nvarchar(2000), @found bit OUTPUT',
			@fromLoc, @warehouse, @user, @workProfile, @groupNumber, @workTypes, @found = @topWsvProbeFound OUTPUT;
		IF (@topWsvProbeFound = 1)
		BEGIN
			SET @fromLocTier = 2;
			SET @fromLocFilter = N' AND WI.FROM_LOC > @fromLoc' + @topWsvPlfPriorityPredicate;
		END
		ELSE
		BEGIN
			SET @topWsvProbeFound = 0;
			SET @topWsvProbeSql = N'IF EXISTS (SELECT TOP (1) 1 ' + @topWsvProbeBody + N' AND WI.FROM_LOC < @fromLoc' + @topWsvPlfPriorityPredicate + N') SET @found = 1';
			EXEC sp_executesql @topWsvProbeSql,
				N'@fromLoc nvarchar(25), @warehouse nvarchar(200), @user nvarchar(200), @workProfile nvarchar(25), @groupNumber int, @workTypes nvarchar(2000), @found bit OUTPUT',
				@fromLoc, @warehouse, @user, @workProfile, @groupNumber, @workTypes, @found = @topWsvProbeFound OUTPUT;
			IF (@topWsvProbeFound = 1)
			BEGIN
				SET @fromLocTier = 3;
				SET @fromLocFilter = N' AND WI.FROM_LOC < @fromLoc' + @topWsvPlfPriorityPredicate;
			END
		END
	END
END
set @sql = N'DECLARE @temp_work_types TABLE (work_type nvarchar(100))  
			insert into @temp_work_types
			select value from STRING_SPLIT(@workTypes, '','')' ;

DECLARE @immNeedsPutawayGroupFFEnabled as nchar(2)
SELECT @immNeedsPutawayGroupFFEnabled = dbo.fn_GetFeatureEnabled(N'FEATURE_13605_WM_IMM_NEEDS_PUTAWAYGROUP', @user);
DECLARE @selectRowNumber as nvarchar(max);
DECLARE @selectColumns as nvarchar(max);
IF(@immNeedsPutawayGroupFFEnabled = N'Y')
	BEGIN
	 SELECT @selectRowNumber = N' DISTINCT DENSE_RANK() OVER(ORDER BY (SELECT 1) ) AS rowNumber'
	 SELECT @selectColumns = N' ,(CASE WHEN USER_ASSIGNED IS NULL THEN 1 ELSE 0 END), WI.FROM_LOC, WI.PRIORITY, WI.AGING_DATE_TIME '
	END
ELSE
	BEGIN
	 SELECT @selectRowNumber = N' ROW_NUMBER() OVER(ORDER BY (SELECT 1) ) AS rowNumber'
	 SELECT @selectColumns = N' '
	END

if(@isSystemDirectedWork =0)
Begin
set @sql = @sql + N'SELECT' + @selectRowNumber + N',WI.INTERNAL_INSTRUCTION_NUM as InternalInstructionNum,
			WI.WORK_UNIT as WorkUnit,WI.ITEM as Item,WI.COMPANY as Company,WI.ITEM_DESC as ItemDesc,WI.FROM_LOC as FromLoc,WI.OUTGOING_PD_LOC as OutgoingPDLoc,WI.INCOMING_PD_LOC as IncomingPDLoc,
            WI.TO_LOC as ToLoc,WI.FROM_QTY as FromQty,WI.TO_QTY as ToQty,WI.QUANTITY_UM as QuantityUM,WI.INVENTORY_AT_PD as InventoryAtPD,WI.FROM_CHECK_DIG as FromCheckDig,
			FROMLOC.TRACK_CONTAINERS FromTrackContainers,FROMLOC.VERIFICATION_METH FromVerificationMeth,
			FROMLOC.WORK_ZONE as FromLocationWorkZone,OUTPD.CHECK_DIG OutCheckDig,OUTPD.TRACK_CONTAINERS OutTrackContainers,OUTPD.VERIFICATION_METH OutVerificationMeth,OUTPD.WORK_ZONE OutWorkZone,
			INPD.CHECK_DIG InCheckDig,INPD.TRACK_CONTAINERS InTrackContainers,INPD.VERIFICATION_METH InVerificationMeth,INPD.WORK_ZONE InWorkZone,WI.TO_CHECK_DIG as ToCheckDig,TOLOC.TRACK_CONTAINERS as TrackContainers,
			TOLOC.VERIFICATION_METH as ToVerificationMeth,TOLOC.WORK_ZONE as ToLocationWorkZone,TOLOC.LOCATION_CLASS ToLocLocationClass,WI.LOT as Lot,WI.INVENTORY_TRACKING as InventoryTracking,
			WI.MESSAGE_ID as MessageId,WI.WORK_TYPE as WorkType,WI.INTERNAL_NUM_TYPE as InternalNumType,
            WI.CONTAINER_ID as ContainerID,WI.TRANSPORT_CONT_ID as TransportContId,WI.CYCLE_COUNT as CycleCount,WI.INTERNAL_CONTAINER_NUM InternalConainerNum,
			WI.CONVERTED_QTY_UM as ConvertedQtyUM,WI.REFERENCE_ID as ReferenceId,WI.REFERENCE_TYPE as ReferenceType,
            WI.WORK_GROUP as WorkGroup,WI.EQUIPMENT_LOC as EquipmentLoc,WI.FROM_WHS as FromWhs,WI.TO_WHS as ToWhs,WI.INTERNAL_LINE_NUM as InternalLineNum,
			WI.INTERNAL_NUM as InternalNum,WI.CONVERTED_QTY as ConvertedQty,WI.QUANTITY as Quantity,
            WI.TOTAL_VOLUME as TotalVolume,WI.VOLUME_UM as VolumnUM,WI.TOTAL_WEIGHT as TotalWeight,WI.WEIGHT_UM as WeightUM,WI.START_DATE_TIME as StartDateTime,
			WI.PARENT_INSTR as ParentInstr,WI.ACCOUNT as Account,
            CASE WHEN WI.INVENTORY_AT_PD = ''O'' THEN WI.OUTGOING_PD_LOC  WHEN WI.INVENTORY_AT_PD = ''I'' THEN WI.INCOMING_PD_LOC  ELSE WI.FROM_LOC END PickLoc,
            CASE  WHEN (WI.INVENTORY_AT_PD is null) and WI.OUTGOING_PD_LOC is not null THEN WI.OUTGOING_PD_LOC  WHEN (WI.INVENTORY_AT_PD is null or WI.INVENTORY_AT_PD = ''O'') AND WI.INCOMING_PD_LOC IS NOT NULL THEN WI.INCOMING_PD_LOC  ELSE WI.TO_LOC  END PutLoc,
            CASE WHEN WI.INVENTORY_AT_PD = ''O'' THEN WI.FROM_WHS  WHEN WI.INVENTORY_AT_PD = ''I'' THEN WI.TO_WHS  ELSE WI.FROM_WHS END PickWhs,
            CASE  WHEN (WI.INVENTORY_AT_PD is null) and WI.OUTGOING_PD_LOC is not null THEN WI.FROM_WHS ELSE WI.TO_WHS  END PutWhs,
			WI.LOGISTICS_UNIT as LogisticsUnit,WI.PARENT_LOGISTICS_UNIT as ParentLogisticsUnit,WI.PARENT_CONTAINER_NUM as ParentContainerNum,WI.TREE_UNIT as TreeUnit,
			WI.TREE_UNIT_ID as TreeUnitId,WI.LAUNCH_NUM as LaunchNum,WI.TOTAL_VALUE as TotalValue,
            WI.FROM_LOC_INV_ATTRIBUTES_ID as FromLocInvAttributesId,WI.TO_LOC_INV_ATTRIBUTES_ID as ToLocInvAttributesId,WI.INTERNAL_REQ_NUM as InternalReqNum,
			WI.Sequence ,WI.end_Date_time as EndDateTime, SC.CONTAINER_TYPE as ContainerType, L.EXPIRATION_DATE as ExpirationDate , '''' as LotExpirationDate, I.WEB_THUMBNAIL_IMG as ItemImageUrl, 
			WI.SRC_IDENTIFIER as SRCIdentifier,
			WI.INTERNAL_COUNT_NUM as InternalCountNum,
			FROMLOC.ALLOW_WORK_SELECT_ON_SYS_DIR as AllowWorkSlelectOnSysDirWork,
			CAST(SC.Group_POSITION AS Varchar) as Spot,
			WI.GROUP_NUM as GroupNumber,
			WI.CONDITION as Condition,
			SC.QC_STATUS as QCStatus,
			I.SERIAL_NUM_TRACKING as SerialNumberTracking,
			I.CATCH_WEIGHT_REQD as CatchWeightTracked,
			WI.PARENT_CONTAINER_ID as ParentContainerId,
			(Select case when  child.CONTAINER_TYPE=''-'' then ''Y'' else ''N'' end as LooseChild 
			from SHIPPING_CONTAINER child 
			left outer join SHIPPING_CONTAINER parent on child.parent=parent.INTERNAL_CONTAINER_NUM where child.INTERNAL_CONTAINER_NUM=WI.INTERNAL_CONTAINER_NUM) as LooseChild '
			+ @selectColumns
			+ N'FROM WORK_INSTRUCTION WI LEFT OUTER JOIN LOCATION FROMLOC ON WI.FROM_WHS = FROMLOC.WAREHOUSE
			AND WI.FROM_LOC = FROMLOC.LOCATION LEFT OUTER JOIN LOCATION OUTPD ON WI.FROM_WHS = OUTPD.WAREHOUSE
			AND WI.OUTGOING_PD_LOC = OUTPD.LOCATION
		LEFT OUTER JOIN LOCATION INPD ON WI.TO_WHS = INPD.WAREHOUSE AND WI.INCOMING_PD_LOC = INPD.LOCATION
		LEFT OUTER JOIN LOCATION TOLOC ON WI.TO_WHS = TOLOC.WAREHOUSE AND WI.TO_LOC = TOLOC.LOCATION
		LEFT OUTER JOIN IMMEDIATE_NEEDS_REQUEST IR ON WI.INTERNAL_NUM = IR.INTERNAL_FULFILLMENT_NUM
		LEFT OUTER JOIN SHIPMENT_HEADER SH ON SH.INTERNAL_SHIPMENT_NUM = (CASE WHEN WI.INTERNAL_NUM_TYPE = ''Receipt'' THEN IR.INTERNAL_NUM ELSE WI.INTERNAL_NUM END)
		LEFT OUTER JOIN SHIPPING_LOAD SL ON SH.SHIPPING_LOAD_NUM = SL.INTERNAL_LOAD_NUM
		LEFT OUTER JOIN SHIPPING_CONTAINER SC ON WI.CONTAINER_ID =  SC.CONTAINER_ID
		LEFT OUTER JOIN LOT L ON WI.ITEM = L.ITEM AND WI.LOT =L.LOT AND ( WI.COMPANY = L.COMPANY OR (WI.COMPANY IS NULL AND L.COMPANY IS NULL))  AND WI.FROM_WHS = L.WAREHOUSE
		LEFT OUTER JOIN ITEM I ON WI.ITEM = I.ITEM AND ( WI.COMPANY = I.COMPANY OR I.COMPANY IS NULL)
		WHERE ( '+@initiationCondition+N' )
		AND '
		+ @ifromSQL
		+N' AND WI.INSTRUCTION_TYPE = ''Detail'' AND WI.HOLD_CODE IS NULL AND WI.CONDITION <> ''Closed'' '
		--MDL todo need different SQL for Inventory transfer
		+ @warehouseCondition + N' ' + 
		+ @zoneccess + N' ' + 
		+ N' AND WI.WORK_TYPE IN (select work_type from @temp_work_types)'
		+ @companyaccess + N' ' +
		+ N' AND (SL.IN_CONFIRMATION <> ''P''  OR SL.IN_CONFIRMATION IS NULL)'
		+ N' ORDER BY '
		+ @orderby
END
Else
Begin
-- TODO: PMB it will be improvised in later implementation of System directed work
	-- @validationClause, @leanValidationClause, @ccKeyZone, @ContainerCreationOnFly built above for TopWSV location checks
	IF(@wrkGetWiSysDirPerfFF = N'Y')
	BEGIN
	-- Shared fragments when system-directed perf FF is on (flag-off block below stays as-is).
	declare @perfSelectCore nvarchar(max) = N'WI.INTERNAL_INSTRUCTION_NUM as InternalInstructionNum,
			WI.WORK_UNIT as WorkUnit,WI.ITEM as Item,WI.COMPANY as Company,WI.ITEM_DESC as ItemDesc,
			(CASE WHEN WI.INVENTORY_AT_PD = ''O'' THEN WI.OUTGOING_PD_LOC  WHEN WI.INVENTORY_AT_PD = ''I'' THEN WI.INCOMING_PD_LOC  ELSE WI.FROM_LOC END) as FromLoc,
			WI.OUTGOING_PD_LOC as OutgoingPDLoc,WI.INCOMING_PD_LOC as IncomingPDLoc,
            WI.TO_LOC as ToLoc,WI.FROM_QTY as FromQty,WI.TO_QTY as ToQty,WI.QUANTITY_UM as QuantityUM,WI.INVENTORY_AT_PD as InventoryAtPD,WI.FROM_CHECK_DIG as FromCheckDig,
			FROMLOC.TRACK_CONTAINERS FromTrackContainers,FROMLOC.VERIFICATION_METH FromVerificationMeth,
			FROMLOC.WORK_ZONE as FromLocationWorkZone,
			OUTPD.CHECK_DIG OutCheckDig, OUTPD.TRACK_CONTAINERS OutTrackContainers, OUTPD.VERIFICATION_METH OutVerificationMeth, OUTPD.WORK_ZONE OutWorkZone,
			INPD.CHECK_DIG InCheckDig, INPD.TRACK_CONTAINERS InTrackContainers, INPD.VERIFICATION_METH InVerificationMeth, INPD.WORK_ZONE InWorkZone,
			WI.TO_CHECK_DIG as ToCheckDig,TOLOC.TRACK_CONTAINERS as TrackContainers,
			TOLOC.VERIFICATION_METH as ToVerificationMeth,TOLOC.WORK_ZONE as ToLocationWorkZone,TOLOC.LOCATION_CLASS ToLocLocationClass,WI.LOT as Lot,WI.INVENTORY_TRACKING as InventoryTracking,
			WI.MESSAGE_ID as MessageId,WI.WORK_TYPE as WorkType,WI.INTERNAL_NUM_TYPE as InternalNumType,
            WI.CONTAINER_ID as ContainerID,WI.TRANSPORT_CONT_ID as TransportContId,WI.CYCLE_COUNT as CycleCount,WI.INTERNAL_CONTAINER_NUM InternalConainerNum,
			WI.CONVERTED_QTY_UM as ConvertedQtyUM,WI.REFERENCE_ID as ReferenceId,WI.REFERENCE_TYPE as ReferenceType,
            WI.WORK_GROUP as WorkGroup,WI.EQUIPMENT_LOC as EquipmentLoc,WI.FROM_WHS as FromWhs,WI.TO_WHS as ToWhs,WI.INTERNAL_LINE_NUM as InternalLineNum,
			WI.INTERNAL_NUM as InternalNum,WI.CONVERTED_QTY as ConvertedQty,WI.QUANTITY as Quantity,
            WI.TOTAL_VOLUME as TotalVolume,WI.VOLUME_UM as VolumnUM,WI.TOTAL_WEIGHT as TotalWeight,WI.WEIGHT_UM as WeightUM,WI.START_DATE_TIME as StartDateTime,
			WI.PARENT_INSTR as ParentInstr,WI.ACCOUNT as Account,
            CASE WHEN WI.INVENTORY_AT_PD = ''O'' THEN WI.OUTGOING_PD_LOC  WHEN WI.INVENTORY_AT_PD = ''I'' THEN WI.INCOMING_PD_LOC  ELSE WI.FROM_LOC END PickLoc,
            CASE  WHEN (WI.INVENTORY_AT_PD is null) and WI.OUTGOING_PD_LOC is not null THEN WI.OUTGOING_PD_LOC  WHEN (WI.INVENTORY_AT_PD is null or WI.INVENTORY_AT_PD = ''O'') AND WI.INCOMING_PD_LOC IS NOT NULL THEN WI.INCOMING_PD_LOC  ELSE WI.TO_LOC  END PutLoc,
            CASE WHEN WI.INVENTORY_AT_PD = ''O'' THEN WI.FROM_WHS  WHEN WI.INVENTORY_AT_PD = ''I'' THEN WI.TO_WHS  ELSE WI.FROM_WHS END PickWhs,
            CASE  WHEN (WI.INVENTORY_AT_PD is null) and WI.OUTGOING_PD_LOC is not null THEN WI.FROM_WHS ELSE WI.TO_WHS  END PutWhs,
			WI.LOGISTICS_UNIT as LogisticsUnit,WI.PARENT_LOGISTICS_UNIT as ParentLogisticsUnit,WI.PARENT_CONTAINER_NUM as ParentContainerNum,WI.TREE_UNIT as TreeUnit,
			WI.TREE_UNIT_ID as TreeUnitId,WI.LAUNCH_NUM as LaunchNum,WI.TOTAL_VALUE as TotalValue,
            WI.FROM_LOC_INV_ATTRIBUTES_ID as FromLocInvAttributesId,WI.TO_LOC_INV_ATTRIBUTES_ID as ToLocInvAttributesId,WI.INTERNAL_REQ_NUM as InternalReqNum,
			WI.Sequence ,WI.end_Date_time as EndDateTime, ';
	declare @perfSelectScCc nvarchar(max) = N'CAST(NULL AS nvarchar(25)) as ContainerType, L.EXPIRATION_DATE as ExpirationDate , '''' as LotExpirationDate, I.WEB_THUMBNAIL_IMG as ItemImageUrl, 
			WI.SRC_IDENTIFIER as SRCIdentifier, WI.INTERNAL_COUNT_NUM as InternalCountNum,
			WI.USER_ASSIGNED,WI.CONDITION as Condition,CAST(WI.PRIORITY AS Varchar) as PRIORITY, WI.AGING_DATE_TIME as AgingDateTime,
			FROMLOC.ALLOW_WORK_SELECT_ON_SYS_DIR as AllowWorkSlelectOnSysDirWork,
			CAST(NULL AS Varchar) as Spot, WI.GROUP_NUM as GroupNumber, CAST(NULL AS nvarchar(25)) as QCStatus,
			I.SERIAL_NUM_TRACKING as SerialNumberTracking, I.CATCH_WEIGHT_REQD as CatchWeightTracked,
			WI.PARENT_CONTAINER_ID as ParentContainerId, ''N'' as LooseChild ';
	declare @perfSelectScNonCc nvarchar(max) = N'SC.CONTAINER_TYPE as ContainerType, L.EXPIRATION_DATE as ExpirationDate , '''' as LotExpirationDate, I.WEB_THUMBNAIL_IMG as ItemImageUrl, 
			WI.SRC_IDENTIFIER as SRCIdentifier, WI.INTERNAL_COUNT_NUM as InternalCountNum,
			WI.USER_ASSIGNED,WI.CONDITION as Condition,CAST(WI.PRIORITY AS Varchar) as PRIORITY, WI.AGING_DATE_TIME as AgingDateTime,
			FROMLOC.ALLOW_WORK_SELECT_ON_SYS_DIR as AllowWorkSlelectOnSysDirWork,
			CAST(SC.Group_POSITION AS Varchar) as Spot, WI.GROUP_NUM as GroupNumber, SC.QC_STATUS as QCStatus,
			I.SERIAL_NUM_TRACKING as SerialNumberTracking, I.CATCH_WEIGHT_REQD as CatchWeightTracked,
			WI.PARENT_CONTAINER_ID as ParentContainerId,
			CASE WHEN childSC.CONTAINER_TYPE = ''-'' THEN ''Y'' ELSE ''N'' END as LooseChild ';
	declare @perfSelectScGated nvarchar(max) = N'CASE WHEN WI.INTERNAL_NUM_TYPE = ''Cycle Count'' THEN NULL ELSE SC.CONTAINER_TYPE END as ContainerType, L.EXPIRATION_DATE as ExpirationDate , '''' as LotExpirationDate, I.WEB_THUMBNAIL_IMG as ItemImageUrl, 
			WI.SRC_IDENTIFIER as SRCIdentifier, WI.INTERNAL_COUNT_NUM as InternalCountNum,
			WI.USER_ASSIGNED,WI.CONDITION as Condition,CAST(WI.PRIORITY AS Varchar) as PRIORITY, WI.AGING_DATE_TIME as AgingDateTime,
			FROMLOC.ALLOW_WORK_SELECT_ON_SYS_DIR as AllowWorkSlelectOnSysDirWork,
			CAST(CASE WHEN WI.INTERNAL_NUM_TYPE = ''Cycle Count'' THEN NULL ELSE SC.Group_POSITION END AS Varchar) as Spot,
			WI.GROUP_NUM as GroupNumber,
			CASE WHEN WI.INTERNAL_NUM_TYPE = ''Cycle Count'' THEN NULL ELSE SC.QC_STATUS END as QCStatus,
			I.SERIAL_NUM_TRACKING as SerialNumberTracking, I.CATCH_WEIGHT_REQD as CatchWeightTracked,
			WI.PARENT_CONTAINER_ID as ParentContainerId,
			CASE WHEN WI.INTERNAL_NUM_TYPE = ''Cycle Count'' THEN ''N'' WHEN childSC.CONTAINER_TYPE = ''-'' THEN ''Y'' ELSE ''N'' END as LooseChild ';
	declare @perfJoinsLoc nvarchar(max) = N'LEFT OUTER JOIN LOCATION FROMLOC ON WI.FROM_WHS = FROMLOC.WAREHOUSE AND WI.FROM_LOC = FROMLOC.LOCATION
		LEFT OUTER JOIN LOCATION OUTPD ON WI.FROM_WHS = OUTPD.WAREHOUSE AND WI.OUTGOING_PD_LOC = OUTPD.LOCATION
		LEFT OUTER JOIN LOCATION INPD ON WI.TO_WHS = INPD.WAREHOUSE AND WI.INCOMING_PD_LOC = INPD.LOCATION
		LEFT OUTER JOIN LOCATION TOLOC ON WI.TO_WHS = TOLOC.WAREHOUSE AND WI.TO_LOC = TOLOC.LOCATION ';
	declare @perfJoinsLotItem nvarchar(max) = N'LEFT OUTER JOIN LOT L ON WI.ITEM = L.ITEM AND WI.LOT =L.LOT AND ( WI.COMPANY = L.COMPANY OR (WI.COMPANY IS NULL AND L.COMPANY IS NULL))  AND WI.FROM_WHS = L.WAREHOUSE
		LEFT OUTER JOIN ITEM I ON WI.ITEM = I.ITEM AND ( WI.COMPANY = I.COMPANY OR I.COMPANY IS NULL) ';
	declare @perfJoinsShipGated nvarchar(max) = N'LEFT OUTER JOIN IMMEDIATE_NEEDS_REQUEST IR ON WI.INTERNAL_NUM = IR.INTERNAL_FULFILLMENT_NUM AND WI.INTERNAL_NUM_TYPE <> ''Cycle Count''
		LEFT OUTER JOIN SHIPMENT_HEADER SH ON SH.INTERNAL_SHIPMENT_NUM = (CASE WHEN WI.INTERNAL_NUM_TYPE = ''Receipt'' THEN IR.INTERNAL_NUM ELSE WI.INTERNAL_NUM END) AND WI.INTERNAL_NUM_TYPE <> ''Cycle Count''
		LEFT OUTER JOIN SHIPPING_LOAD SL ON SH.SHIPPING_LOAD_NUM = SL.INTERNAL_LOAD_NUM AND WI.INTERNAL_NUM_TYPE <> ''Cycle Count''
		LEFT OUTER JOIN SHIPPING_CONTAINER SC ON WI.CONTAINER_ID = SC.CONTAINER_ID AND WI.INTERNAL_NUM_TYPE <> ''Cycle Count''
		LEFT OUTER JOIN IMMEDIATE_NEEDS_REQUEST INR ON INR.INTERNAL_FULFILLMENT_NUM = WI.INTERNAL_NUM AND INR.REQUEST_KEY_NUM = 10001 AND WI.INTERNAL_NUM_TYPE <> ''Cycle Count''
		LEFT OUTER JOIN SHIPPING_CONTAINER childSC ON childSC.INTERNAL_CONTAINER_NUM = WI.INTERNAL_CONTAINER_NUM AND WI.INTERNAL_NUM_TYPE <> ''Cycle Count'' AND WI.INTERNAL_CONTAINER_NUM <> 0 ';
	declare @perfJoinsShipFull nvarchar(max) = N'LEFT OUTER JOIN IMMEDIATE_NEEDS_REQUEST IR ON WI.INTERNAL_NUM = IR.INTERNAL_FULFILLMENT_NUM
		LEFT OUTER JOIN SHIPMENT_HEADER SH ON SH.INTERNAL_SHIPMENT_NUM = (CASE WHEN WI.INTERNAL_NUM_TYPE = ''Receipt'' THEN IR.INTERNAL_NUM ELSE WI.INTERNAL_NUM END)
		LEFT OUTER JOIN SHIPPING_LOAD SL ON SH.SHIPPING_LOAD_NUM = SL.INTERNAL_LOAD_NUM
		LEFT OUTER JOIN SHIPPING_CONTAINER SC ON WI.CONTAINER_ID = SC.CONTAINER_ID
		LEFT OUTER JOIN IMMEDIATE_NEEDS_REQUEST INR ON INR.INTERNAL_FULFILLMENT_NUM = WI.INTERNAL_NUM AND INR.REQUEST_KEY_NUM = 10001
		LEFT OUTER JOIN SHIPPING_CONTAINER childSC ON childSC.INTERNAL_CONTAINER_NUM = WI.INTERNAL_CONTAINER_NUM AND WI.INTERNAL_CONTAINER_NUM <> 0 ';
	declare @perfWherePrefix nvarchar(max) = N' WHERE ( '+@groupCondition+N' ) AND ' + @ifromSQL
		+ N' AND WI.INSTRUCTION_TYPE = ''Detail'' AND WI.HOLD_CODE IS NULL AND WI.CONDITION <> ''Closed'' ';
	declare @perfWhereSuffix nvarchar(max) = N' AND (I.CATCH_WEIGHT_REQD = ''N'' OR I.CATCH_WEIGHT_REQD IS NULL) '
		+ @warehouseCondition + N' ';
	declare @perfWhereWorkUser nvarchar(max) = N' AND WI.WORK_TYPE IN (select work_type from @temp_work_types)'
		+ @companyaccess + N' AND (WI.USER_ASSIGNED IS NULL OR WI.USER_ASSIGNED = @user)';
	declare @perfInternalNumTypesAll nvarchar(max) = N' AND WI.INTERNAL_NUM_TYPE IN (''Cycle Count'',''Receipt'',''Replenishment'',''Shipment'',''Inventory Transfer'',''Work Order Putaway'',''Work Order'',''Dock Management'')';
	declare @perfInternalNumTypesNonCc nvarchar(max) = N' AND WI.INTERNAL_NUM_TYPE IN (''Receipt'',''Replenishment'',''Shipment'',''Inventory Transfer'',''Work Order Putaway'',''Work Order'',''Dock Management'')';
	declare @perfSlConfirm nvarchar(max) = N' AND (SL.IN_CONFIRMATION <> ''P''  OR SL.IN_CONFIRMATION IS NULL)';

	IF (@wrkGetWiSysDirTopWsvFF = N'Y')
	BEGIN
		-- TopWSV: combine cycle-count lean path with non-cycle-count full joins; outer TOP / ORDER BY.
		declare @putLocExpr nvarchar(max) = N'(CASE WHEN (WI.INVENTORY_AT_PD is null) and WI.OUTGOING_PD_LOC is not null THEN WI.OUTGOING_PD_LOC WHEN (WI.INVENTORY_AT_PD is null or WI.INVENTORY_AT_PD = ''O'') AND WI.INCOMING_PD_LOC IS NOT NULL THEN WI.INCOMING_PD_LOC ELSE WI.TO_LOC END)';
		declare @ccKeyOrderBy nvarchar(max) =
			CASE
				WHEN @fromLocTier = 3 AND @fromAssignMethod = N'Priority/Location/FIFO'
					THEN REPLACE(@orderby, N'WI.From_loc,', N'WI.From_loc DESC,')
				WHEN @fromLocTier = 3 THEN N'WI.FROM_LOC DESC, ' + @orderby
				ELSE @orderby
			END;
		SET @ccKeyOrderBy = REPLACE(@ccKeyOrderBy, N'putLoc', @putLocExpr);
		SET @ccKeyOrderBy = REPLACE(@ccKeyOrderBy, N'PutLoc', @putLocExpr);
		declare @unionOrderBy nvarchar(max) = @orderby;
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'(CASE WHEN WI.USER_ASSIGNED = @user THEN 0 ELSE 1 END)', N'(CASE WHEN USER_ASSIGNED = @user THEN 0 ELSE 1 END)');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'WI.INTERNAL_INSTRUCTION_NUM', N'InternalInstructionNum');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'WI.AGING_DATE_TIME', N'AgingDateTime');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'WI.END_DATE_TIME', N'EndDateTime');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'WI.WORK_UNIT', N'WorkUnit');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'WI.SEQUENCE', N'Sequence');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'WI.From_loc', N'FromLoc');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'WI.FROM_LOC', N'FromLoc');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'WI.priority', N'PRIORITY');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'WI.PRIORITY', N'PRIORITY');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'putLoc', N'PutLoc');
		declare @topN nvarchar(20) = CAST(@topWsvMaxRows AS nvarchar(20));

		set @sql = @sql + N'SELECT TOP (' + @topN + N') ROW_NUMBER() OVER(ORDER BY (SELECT 1)) AS rowNumber, U.* FROM ('
		-- Cycle count: TOP keys on WI, then lean joins
		+ N'SELECT ' + @perfSelectCore + @perfSelectScCc
		+ N'FROM (
			SELECT TOP (' + @topN + N') WI.INTERNAL_INSTRUCTION_NUM
			FROM WORK_INSTRUCTION WI
			LEFT OUTER JOIN ITEM I ON WI.ITEM = I.ITEM AND ( WI.COMPANY = I.COMPANY OR I.COMPANY IS NULL)'
		+ @perfWherePrefix
		+ N' AND WI.INTERNAL_NUM_TYPE = ''Cycle Count'' '
		+ @perfWhereSuffix + @ccKeyZone
		+ N' AND WI.WORK_TYPE IN (select work_type from @temp_work_types)' + @leanValidationClause
		+ @companyaccess + N' AND (WI.USER_ASSIGNED IS NULL OR WI.USER_ASSIGNED = @user)'
		+ @fromLocFilter
		+ N' ORDER BY ' + @ccKeyOrderBy
		+ N') K
		INNER JOIN WORK_INSTRUCTION WI ON WI.INTERNAL_INSTRUCTION_NUM = K.INTERNAL_INSTRUCTION_NUM '
		+ @perfJoinsLoc + @perfJoinsLotItem
		+ N' UNION ALL '
		-- Non-cycle-count: full shipment joins
		+ N'SELECT ' + @perfSelectCore + @perfSelectScNonCc
		+ N'FROM WORK_INSTRUCTION WI '
		+ @perfJoinsLoc + @perfJoinsShipFull + @perfJoinsLotItem
		+ @perfWherePrefix + @perfInternalNumTypesNonCc + @perfWhereSuffix
		+ @zoneccess + @perfWhereWorkUser + @validationClause + @perfSlConfirm + @fromLocFilter
		+ N') U ORDER BY '
		+ CASE
				WHEN @fromLocTier = 3 AND @fromAssignMethod = N'Priority/Location/FIFO'
					THEN REPLACE(@unionOrderBy, N'FromLoc,', N'FromLoc DESC,') + N' '
				WHEN @fromLocTier = 3 THEN N'FromLoc DESC, ' + @unionOrderBy
				ELSE @unionOrderBy
			END
	END
	ELSE
	BEGIN
	-- System-directed perf without TopWSV: gated shipment joins + LooseChild PK join
	set @sql = @sql + N'SELECT' + @selectRowNumber + N',' + @perfSelectCore + @perfSelectScGated
		+ @selectColumns
		+ N'FROM WORK_INSTRUCTION WI '
		+ @perfJoinsLoc + @perfJoinsShipGated + @perfJoinsLotItem
		+ @perfWherePrefix + @perfInternalNumTypesAll + @perfWhereSuffix
		+ @zoneccess + @perfWhereWorkUser + @validationClause + @perfSlConfirm
		+ N' ORDER BY ' + @orderby
	END
	END
	ELSE
	BEGIN
	-- System-directed perf FF off: original system-directed SELECT (kept separate)
	set @sql = @sql + N'SELECT' + @selectRowNumber + N',WI.INTERNAL_INSTRUCTION_NUM as InternalInstructionNum,
			WI.WORK_UNIT as WorkUnit,WI.ITEM as Item,WI.COMPANY as Company,WI.ITEM_DESC as ItemDesc,
			(CASE WHEN WI.INVENTORY_AT_PD = ''O'' THEN WI.OUTGOING_PD_LOC  WHEN WI.INVENTORY_AT_PD = ''I'' THEN WI.INCOMING_PD_LOC  ELSE WI.FROM_LOC END) as FromLoc,
			WI.OUTGOING_PD_LOC as OutgoingPDLoc,WI.INCOMING_PD_LOC as IncomingPDLoc,
            WI.TO_LOC as ToLoc,WI.FROM_QTY as FromQty,WI.TO_QTY as ToQty,WI.QUANTITY_UM as QuantityUM,WI.INVENTORY_AT_PD as InventoryAtPD,WI.FROM_CHECK_DIG as FromCheckDig,
			FROMLOC.TRACK_CONTAINERS FromTrackContainers,FROMLOC.VERIFICATION_METH FromVerificationMeth,
			FROMLOC.WORK_ZONE as FromLocationWorkZone,
			OUTPD.CHECK_DIG OutCheckDig,
			OUTPD.TRACK_CONTAINERS OutTrackContainers,
			OUTPD.VERIFICATION_METH OutVerificationMeth,
			OUTPD.WORK_ZONE OutWorkZone,
			INPD.CHECK_DIG InCheckDig,
			INPD.TRACK_CONTAINERS InTrackContainers,
			INPD.VERIFICATION_METH InVerificationMeth,
			INPD.WORK_ZONE InWorkZone,
			WI.TO_CHECK_DIG as ToCheckDig,TOLOC.TRACK_CONTAINERS as TrackContainers,
			TOLOC.VERIFICATION_METH as ToVerificationMeth,TOLOC.WORK_ZONE as ToLocationWorkZone,TOLOC.LOCATION_CLASS ToLocLocationClass,WI.LOT as Lot,WI.INVENTORY_TRACKING as InventoryTracking,
			WI.MESSAGE_ID as MessageId,WI.WORK_TYPE as WorkType,WI.INTERNAL_NUM_TYPE as InternalNumType,
            WI.CONTAINER_ID as ContainerID,WI.TRANSPORT_CONT_ID as TransportContId,WI.CYCLE_COUNT as CycleCount,WI.INTERNAL_CONTAINER_NUM InternalConainerNum,
			WI.CONVERTED_QTY_UM as ConvertedQtyUM,WI.REFERENCE_ID as ReferenceId,WI.REFERENCE_TYPE as ReferenceType,
            WI.WORK_GROUP as WorkGroup,WI.EQUIPMENT_LOC as EquipmentLoc,WI.FROM_WHS as FromWhs,WI.TO_WHS as ToWhs,WI.INTERNAL_LINE_NUM as InternalLineNum,
			WI.INTERNAL_NUM as InternalNum,WI.CONVERTED_QTY as ConvertedQty,WI.QUANTITY as Quantity,
            WI.TOTAL_VOLUME as TotalVolume,WI.VOLUME_UM as VolumnUM,WI.TOTAL_WEIGHT as TotalWeight,WI.WEIGHT_UM as WeightUM,WI.START_DATE_TIME as StartDateTime,
			WI.PARENT_INSTR as ParentInstr,WI.ACCOUNT as Account,
            CASE WHEN WI.INVENTORY_AT_PD = ''O'' THEN WI.OUTGOING_PD_LOC  WHEN WI.INVENTORY_AT_PD = ''I'' THEN WI.INCOMING_PD_LOC  ELSE WI.FROM_LOC END PickLoc,
            CASE  WHEN (WI.INVENTORY_AT_PD is null) and WI.OUTGOING_PD_LOC is not null THEN WI.OUTGOING_PD_LOC  WHEN (WI.INVENTORY_AT_PD is null or WI.INVENTORY_AT_PD = ''O'') AND WI.INCOMING_PD_LOC IS NOT NULL THEN WI.INCOMING_PD_LOC  ELSE WI.TO_LOC  END PutLoc,
            CASE WHEN WI.INVENTORY_AT_PD = ''O'' THEN WI.FROM_WHS  WHEN WI.INVENTORY_AT_PD = ''I'' THEN WI.TO_WHS  ELSE WI.FROM_WHS END PickWhs,
            CASE  WHEN (WI.INVENTORY_AT_PD is null) and WI.OUTGOING_PD_LOC is not null THEN WI.FROM_WHS ELSE WI.TO_WHS  END PutWhs,
			WI.LOGISTICS_UNIT as LogisticsUnit,WI.PARENT_LOGISTICS_UNIT as ParentLogisticsUnit,WI.PARENT_CONTAINER_NUM as ParentContainerNum,WI.TREE_UNIT as TreeUnit,
			WI.TREE_UNIT_ID as TreeUnitId,WI.LAUNCH_NUM as LaunchNum,WI.TOTAL_VALUE as TotalValue,
            WI.FROM_LOC_INV_ATTRIBUTES_ID as FromLocInvAttributesId,WI.TO_LOC_INV_ATTRIBUTES_ID as ToLocInvAttributesId,WI.INTERNAL_REQ_NUM as InternalReqNum,
			WI.Sequence ,WI.end_Date_time as EndDateTime, SC.CONTAINER_TYPE as ContainerType, L.EXPIRATION_DATE as ExpirationDate , '''' as LotExpirationDate, I.WEB_THUMBNAIL_IMG as ItemImageUrl, 
			WI.SRC_IDENTIFIER as SRCIdentifier,
			WI.INTERNAL_COUNT_NUM as InternalCountNum,
			WI.USER_ASSIGNED,WI.CONDITION as Condition,CAST(WI.PRIORITY AS Varchar) as PRIORITY,
			WI.AGING_DATE_TIME as AgingDateTime,
			FROMLOC.ALLOW_WORK_SELECT_ON_SYS_DIR as AllowWorkSlelectOnSysDirWork,
			CAST(SC.Group_POSITION AS Varchar) as Spot,
			WI.GROUP_NUM as GroupNumber,
			SC.QC_STATUS as QCStatus,
			I.SERIAL_NUM_TRACKING as SerialNumberTracking,
			I.CATCH_WEIGHT_REQD as CatchWeightTracked,
			WI.PARENT_CONTAINER_ID as ParentContainerId,
			(Select case when  child.CONTAINER_TYPE=''-'' then ''Y'' else ''N'' end as LooseChild 
			from SHIPPING_CONTAINER child 
			left outer join SHIPPING_CONTAINER parent on child.parent=parent.INTERNAL_CONTAINER_NUM where child.INTERNAL_CONTAINER_NUM=WI.INTERNAL_CONTAINER_NUM) as LooseChild '
			+ @selectColumns
			+ N'FROM WORK_INSTRUCTION WI LEFT OUTER JOIN LOCATION FROMLOC ON WI.FROM_WHS = FROMLOC.WAREHOUSE
			AND WI.FROM_LOC = FROMLOC.LOCATION
		LEFT OUTER JOIN LOCATION OUTPD ON WI.FROM_WHS = OUTPD.WAREHOUSE AND WI.OUTGOING_PD_LOC = OUTPD.LOCATION
		LEFT OUTER JOIN LOCATION INPD ON WI.TO_WHS = INPD.WAREHOUSE AND WI.INCOMING_PD_LOC = INPD.LOCATION
		LEFT OUTER JOIN LOCATION TOLOC ON WI.TO_WHS = TOLOC.WAREHOUSE AND WI.TO_LOC = TOLOC.LOCATION
		LEFT OUTER JOIN IMMEDIATE_NEEDS_REQUEST IR ON WI.INTERNAL_NUM = IR.INTERNAL_FULFILLMENT_NUM
		LEFT OUTER JOIN SHIPMENT_HEADER SH ON SH.INTERNAL_SHIPMENT_NUM = (CASE WHEN WI.INTERNAL_NUM_TYPE = ''Receipt'' THEN IR.INTERNAL_NUM ELSE WI.INTERNAL_NUM END)
		LEFT OUTER JOIN SHIPPING_LOAD SL ON SH.SHIPPING_LOAD_NUM = SL.INTERNAL_LOAD_NUM
		LEFT OUTER JOIN SHIPPING_CONTAINER SC ON WI.CONTAINER_ID =  SC.CONTAINER_ID
		LEFT OUTER JOIN LOT L ON WI.ITEM = L.ITEM AND WI.LOT =L.LOT AND ( WI.COMPANY = L.COMPANY OR (WI.COMPANY IS NULL AND L.COMPANY IS NULL))  AND WI.FROM_WHS = L.WAREHOUSE
		LEFT OUTER JOIN IMMEDIATE_NEEDS_REQUEST INR ON INR.INTERNAL_FULFILLMENT_NUM = WI.INTERNAL_NUM AND INR.REQUEST_KEY_NUM = 10001

		LEFT OUTER JOIN ITEM I ON WI.ITEM = I.ITEM AND ( WI.COMPANY = I.COMPANY OR I.COMPANY IS NULL)
		 WHERE ( '+@groupCondition+N' )  
			AND '
		+ @ifromSQL
		+N' AND WI.INSTRUCTION_TYPE = ''Detail'' AND WI.HOLD_CODE IS NULL AND WI.CONDITION <> ''Closed'' '
		+N' AND WI.INTERNAL_NUM_TYPE IN (''Cycle Count'',''Receipt'',''Replenishment'',''Shipment'',''Inventory Transfer'',''Work Order Putaway'',''Work Order'',''Dock Management'')'
		+N' AND (I.CATCH_WEIGHT_REQD = ''N'' OR I.CATCH_WEIGHT_REQD IS NULL) '
		--Added just to fetch system directed work for inventory transfer,work order.
		--MDL todo need different SQL for Inventory transfer
		+@warehouseCondition + N' ' + 
		+ @zoneccess + N' ' + 
		+ N' AND WI.WORK_TYPE IN (select work_type from @temp_work_types)'+@validationClause+
		+ @companyaccess + N' ' +
		+ N' AND (SL.IN_CONFIRMATION <> ''P''  OR SL.IN_CONFIRMATION IS NULL)'
		+ N' AND (WI.USER_ASSIGNED IS NULL OR WI.USER_ASSIGNED = @user)'
		+ N' ORDER BY '
		+ @orderby
	END
End

  execute sp_executesql @sql,N'@workUnit nvarchar(100),@workTypes nvarchar(2000),@user nvarchar(200), @warehouse nvarchar(200),@workProfile nvarchar(25), @containerId nvarchar(25),@fromLoc nvarchar(25),@groupNumber int,@transportContId nvarchar(50)'
							,@workUnit,@workTypes,@user, @warehouse,@workProfile,@containerId,@fromLoc,@groupNumber,@transportContId;
