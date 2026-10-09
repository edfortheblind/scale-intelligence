
CREATE PROCEDURE CCP_CreateWorkFromRequest(
	@iLaunchNum numeric(9),
	@stRelatedWorkUnit nvarchar(50),
	@stUserName nvarchar(30))
AS
	SET NOCOUNT ON;

	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;
	-- #DEFINE WMW.Jsharp.Inventory com.pronto.general.CCConstants CCCons;

	-- local variables.
	declare @iHdrNum numeric(9);
	declare @stMsg nvarchar(2000);
	declare @stWorkType nvarchar(25);
	declare @stWorkTeam nvarchar(50);
	declare @stWorkUnit nvarchar(50);
	declare @stWorkUnitField nvarchar(200);
	declare @stWorkGroup nvarchar(25);
	declare @iDefaultPriority numeric(3);
	DECLARE @srcIdentifier nvarchar(50);

	SELECT @stWorkType = WORK_TYPE,
		@stWorkTeam = WORK_TEAM
		FROM CYCLE_COUNT_PREFERENCES
		WHERE PREFERENCE_NAME = 
			(SELECT ISNULL(CYCLE_COUNT_PREFERENCE,N'*Default')
			FROM USER_PROFILE WHERE USER_NAME = @stUserName);

	SELECT 
		@srcIdentifier = SYSTEM_VALUE
	FROM 
		SYSTEM_CONFIG_DETAIL
	WHERE 
		RECORD_TYPE = N'Cycle Count'
		AND SYS_KEY = N'110';

	if (@@ROWCOUNT <= 0 OR @stWorkType is null)
   		begin
			set @stMsg = N'MSG_CC43: ' + dbo.RSCMfn_RtrvMsg(N'MSG_CC43');
			RAISERROR(@stMsg, 18, 1);
			return -1;
		end;

	SELECT  @stWorkGroup = WORK_GROUP,
		@iDefaultPriority = DEFAULT_PRIORITY
		FROM WORK_TYPE
		WHERE WORK_TYPE=@stWorkType;

	-- insert the WorkInstruction detail.
	INSERT INTO WORK_INSTRUCTION
		   (ITEM,
		    ITEM_DESC,
		    COMPANY,
		    LOT,
		    FROM_LOC,
		    FROM_WHS,
		    CONDITION,
		    RELATED_WORK_UNIT,
		    INTERNAL_NUM,
		    INTERNAL_REQ_NUM,
		    CYCLE_COUNT,
		    INTERNAL_COUNT_NUM,
		    LAUNCH_NUM,
		    WORK_TYPE,
		    TEAM_ASSIGNED,
		    INSTRUCTION_TYPE,
		    FROM_CHECK_DIG,
		    AGING_DATE_TIME,
		    INVENTORY_TRACKING,
		    DATE_TIME_STAMP,
		    FROM_WORK_ZONE,
		    SEQUENCE,
			SRC_IDENTIFIER,
		    PRIORITY,
		    WORK_GROUP,
		    INTERNAL_NUM_TYPE,
		    USER_DEF1,
		    USER_DEF2,
		    USER_DEF3,
		    USER_DEF4,
		    USER_DEF5,
		    USER_DEF6,
		    USER_DEF7,
		    USER_DEF8,
		    REFERENCE_ID,
		    CYCLE_COUNT_GROUP_NUM,
		    LOGISTICS_UNIT,
		    PARENT_LOGISTICS_UNIT, 
			FROM_LOC_INV_ATTRIBUTES_ID)
	(SELECT CC.ITEM,
			CC.ITEM_DESC,
			CC.COMPANY,
			CC.LOT,
			CC.LOCATION,
			CC.WAREHOUSE,
			N'Open', -- condition
			@stRelatedWorkUnit,
			CC.INTERNAL_COUNT_NUM,
			CC.INTERNAL_COUNT_NUM,
			N'Y', -- cycleCount
			CC.INTERNAL_COUNT_NUM,
			CC.LAUNCH_NUMBER,
			@stWorkType,
			@stWorkTeam,
			N'Detail', -- instructionType
			LOC.CHECK_DIG, -- fromCheckDig
			dbo.DHfn_RoundToSec(GETUTCDATE()), -- agingDateTime
			N'Y', -- inventoryTracking
			dbo.DHfn_RoundToSec(GETUTCDATE()), -- dateTimeStamp
			LOC.WORK_ZONE, -- fromWorkZone
			0, -- sequence
			@srcIdentifier,
			@iDefaultPriority,
			@stWorkGroup, 
			N'Cycle Count', -- internalNumType
			CC.USER_DEF1,
			CC.USER_DEF2,
			CC.USER_DEF3,
			CC.USER_DEF4,
			CC.USER_DEF5,
			CC.USER_DEF6,
			CC.USER_DEF7,
			CC.USER_DEF8,
			CC.INTERNAL_PLAN_NUM,
			CC.GROUP_NUMBER,
			CC.LOGISTICS_UNIT,
		    CC.PARENT_LOGISTICS_UNIT, 
			CC.LOC_INV_ATTRIBUTES_ID 
	   FROM CYCLE_COUNT_REQUEST CC,
			LOCATION LOC
	  WHERE CC.LAUNCH_NUMBER = @iLaunchNum
	    AND CC.LOCATION = LOC.LOCATION
	    AND CC.WAREHOUSE = LOC.WAREHOUSE);
	if (@@ERROR <> 0 OR @@ROWCOUNT <= 0) return -1;

	-- insert the WorkInstruction header.
	INSERT INTO WORK_INSTRUCTION
		   (ITEM,
		    ITEM_DESC,
		    COMPANY,
		    LOT,
		    FROM_LOC,
		    FROM_WHS,
		    CONDITION,
		    RELATED_WORK_UNIT,
		    INTERNAL_NUM,
		    INTERNAL_REQ_NUM,
		    CYCLE_COUNT,
		    LAUNCH_NUM,
		    WORK_TYPE,
		    TEAM_ASSIGNED,
		    USER_ASSIGNED,
		    INSTRUCTION_TYPE,
		    FROM_CHECK_DIG,
		    AGING_DATE_TIME,
		    INVENTORY_TRACKING,
		    DATE_TIME_STAMP,
		    FROM_WORK_ZONE,
		    SEQUENCE,
			SRC_IDENTIFIER,
		    PRIORITY,
		    WORK_GROUP,
		    NUMBER_OF_CHILDREN,
		    INTERNAL_NUM_TYPE,
		    USER_DEF1,
		    USER_DEF2,
		    USER_DEF3,
		    USER_DEF4,
		    USER_DEF5,
		    USER_DEF6,
		    USER_DEF7,
		    USER_DEF8,
		    REFERENCE_ID,
		    CYCLE_COUNT_GROUP_NUM,
		    LOGISTICS_UNIT,
		    PARENT_LOGISTICS_UNIT)
	
	-- the CASEs and isNulls are used because SQL Server cannot accept null 
	-- in an aggregate function.  If the details have the same value, propagate
	-- that value to the header.  If any of the details values are different, 
	-- set the headers value to null.
		    
	(SELECT CASE WHEN MIN(isNull(ITEM,N'0')) = MAX(isNull(ITEM,N'1')) 
				 THEN CASE WHEN MIN(isNull(ITEM,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(ITEM,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(ITEM_DESC,N'0')) = MAX(isNull(ITEM_DESC,N'1'))
				 THEN CASE WHEN MIN(isNull(ITEM_DESC,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(ITEM_DESC,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(COMPANY,N'0')) = MAX(isNull(COMPANY,N'1'))
				 THEN CASE WHEN MIN(isNull(COMPANY,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(COMPANY,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(LOT,N'0')) = MAX(isNull(LOT,N'1'))
				 THEN CASE WHEN MIN(isNull(LOT,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(LOT,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(FROM_LOC,N'0')) = MAX(isNull(FROM_LOC,N'1'))
				 THEN CASE WHEN MIN(isNull(FROM_LOC,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(FROM_LOC,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(FROM_WHS,N'0')) = MAX(isNull(FROM_WHS,N'1'))
				 THEN CASE WHEN MIN(isNull(FROM_WHS,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(FROM_WHS,N'a')) END
				 ELSE NULL END,
			N'Open',
			CASE WHEN MIN(isNull(RELATED_WORK_UNIT,N'0')) = MAX(isNull(RELATED_WORK_UNIT,N'1'))
				 THEN CASE WHEN MIN(isNull(RELATED_WORK_UNIT,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(RELATED_WORK_UNIT,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(INTERNAL_NUM,0)) = MAX(isNull(INTERNAL_NUM,1))
				 THEN CASE WHEN MIN(isNull(INTERNAL_NUM,-1)) = -1
						   THEN null
						   ELSE MIN(isNull(INTERNAL_NUM,-1)) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(INTERNAL_REQ_NUM,0)) = MAX(isNull(INTERNAL_REQ_NUM,1))
				 THEN CASE WHEN MIN(isNull(INTERNAL_REQ_NUM,-1)) = -1
						   THEN null
						   ELSE MIN(isNull(INTERNAL_REQ_NUM,-1)) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(CYCLE_COUNT,N'0')) = MAX(isNull(CYCLE_COUNT,N'1'))
				 THEN CASE WHEN MIN(isNull(CYCLE_COUNT,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(CYCLE_COUNT,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(LAUNCH_NUM,0)) = MAX(isNull(LAUNCH_NUM,1))
				 THEN CASE WHEN MIN(isNull(LAUNCH_NUM,-1)) = -1
						   THEN null
						   ELSE MIN(isNull(LAUNCH_NUM,-1)) END
				 ELSE NULL END,
			MAX(WORK_TYPE),
			CASE WHEN MIN(isNull(TEAM_ASSIGNED,N'0')) = MAX(isNull(TEAM_ASSIGNED,N'1'))
				 THEN CASE WHEN MIN(isNull(TEAM_ASSIGNED,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(TEAM_ASSIGNED,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_ASSIGNED,N'0')) = MAX(isNull(USER_ASSIGNED,N'1'))
				 THEN CASE WHEN MIN(isNull(USER_ASSIGNED,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(USER_ASSIGNED,N'a')) END
				 ELSE NULL END,
			N'Header', -- instructionType
			CASE WHEN MIN(isNull(FROM_CHECK_DIG,N'0')) = MAX(isNull(FROM_CHECK_DIG,N'1'))
				 THEN CASE WHEN MIN(isNull(FROM_CHECK_DIG,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(FROM_CHECK_DIG,N'a')) END
				 ELSE NULL END,
			MIN(AGING_DATE_TIME),
			MAX(INVENTORY_TRACKING),
			dbo.DHfn_RoundToSec(GETUTCDATE()), -- dateTimeStamp
			CASE WHEN MIN(isNull(FROM_WORK_ZONE,N'0')) = MAX(isNull(FROM_WORK_ZONE,N'1'))
				 THEN CASE WHEN MIN(isNull(FROM_WORK_ZONE,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(FROM_WORK_ZONE,N'a')) END
				 ELSE NULL END,
			0, -- sequence
			@srcIdentifier,
			CASE WHEN MIN(isNull(PRIORITY,0)) = MAX(isNull(PRIORITY,1))
				 THEN CASE WHEN MIN(isNull(PRIORITY,-1)) = -1
						   THEN null
						   ELSE MIN(isNull(PRIORITY,-1)) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(WORK_GROUP,N'0')) = MAX(isNull(WORK_GROUP,N'1'))
				 THEN CASE WHEN MIN(isNull(WORK_GROUP,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(WORK_GROUP,N'a')) END
				 ELSE NULL END,
			COUNT(*), -- numberOfChildren
			N'Cycle Count', -- internalNumType
			CASE WHEN MIN(isNull(USER_DEF1,N'0')) = MAX(isNull(USER_DEF1,N'1'))
				 THEN CASE WHEN MIN(isNull(USER_DEF1,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(USER_DEF1,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF2,N'0')) = MAX(isNull(USER_DEF2,N'1'))
				 THEN CASE WHEN MIN(isNull(USER_DEF2,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(USER_DEF2,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF3,N'0')) = MAX(isNull(USER_DEF3,N'1'))
				 THEN CASE WHEN MIN(isNull(USER_DEF3,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(USER_DEF3,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF4,N'0')) = MAX(isNull(USER_DEF4,N'1'))
				 THEN CASE WHEN MIN(isNull(USER_DEF4,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(USER_DEF4,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF5,N'0')) = MAX(isNull(USER_DEF5,N'1'))
				 THEN CASE WHEN MIN(isNull(USER_DEF5,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(USER_DEF5,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF6,N'0')) = MAX(isNull(USER_DEF6,N'1'))
				 THEN CASE WHEN MIN(isNull(USER_DEF6,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(USER_DEF6,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF7,0)) = MAX(isNull(USER_DEF7,1))
				 THEN CASE WHEN MIN(isNull(USER_DEF7,-1)) = -1
						   THEN null
						   ELSE MIN(isNull(USER_DEF7,-1)) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF8,0)) = MAX(isNull(USER_DEF8,1))
				 THEN CASE WHEN MIN(isNull(USER_DEF8,-1)) = -1
						   THEN null
						   ELSE MIN(isNull(USER_DEF8,-1)) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(REFERENCE_ID,N'0')) = MAX(isNull(REFERENCE_ID,N'1'))
				 THEN CASE WHEN MIN(isNull(REFERENCE_ID,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(REFERENCE_ID,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(CYCLE_COUNT_GROUP_NUM,0)) = MAX(isNull(CYCLE_COUNT_GROUP_NUM,1))
				 THEN CASE WHEN MIN(isNull(CYCLE_COUNT_GROUP_NUM,-1)) = -1
						   THEN null
						   ELSE MIN(isNull(CYCLE_COUNT_GROUP_NUM,-1)) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(LOGISTICS_UNIT,N'0')) = MAX(isNull(LOGISTICS_UNIT,N'1'))
				 THEN CASE WHEN MIN(isNull(LOGISTICS_UNIT,N'a')) = N'a'
						   THEN null
						   ELSE MIN(isNull(LOGISTICS_UNIT,N'a')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(LOGISTICS_UNIT,N'0')) = MAX(isNull(LOGISTICS_UNIT,N'1'))
				 THEN CASE WHEN MIN(isNull(LOGISTICS_UNIT,N'a')) = N'a'
						   THEN null
						   ELSE MIN(PARENT_LOGISTICS_UNIT) END
				 ELSE NULL END
	   FROM WORK_INSTRUCTION
	  WHERE 
	  LAUNCH_NUM = @iLaunchNum
	  AND 
	  INTERNAL_NUM_TYPE = N'Cycle Count');
	if (@@ERROR <> 0) return -1;
	  
	set @iHdrNum = scope_identity();
	
	-- retrieve CycleCountings SystemValue for workUnit field.
	SELECT @stWorkUnitField = SYSTEM_VALUE
	  FROM SYSTEM_CONFIG_DETAIL
	 WHERE RECORD_TYPE = N'Cycle Count'
	   AND SYS_KEY = N'70';
	   
	-- since we have to use dynamicSQL to retrieve the value in the
	-- workUnit field, we must use a temporary table to get a result
	-- set back from the dynamicSQL.
	if (@stWorkUnitField is not null)
	begin
		-- we store the workUnit field in DO notation (oneTwoThree).
		-- convert that field to DB notation (one_two_three).
		set @stWorkUnitField = dbo.DBHfn_TransDOToDBFieldName(@stWorkUnitField);

		CREATE TABLE #temp(workUnit nvarchar(50));
		INSERT INTO #temp EXEC (N'SELECT ' + @stWorkUnitField + 
								 N' FROM WORK_INSTRUCTION ' +
								 N'WHERE INTERNAL_INSTRUCTION_NUM = ' 
													+ @iHdrNum);
		SELECT @stWorkUnit = workUnit FROM #temp;
		DROP TABLE #temp;
	end; -- end if workUnit field configured.
			
	-- if the workUnit is null, use the Headers internalInstructionNum.
	if (@stWorkUnit is null)
		set @stWorkUnit = CAST(@iHdrNum AS numeric(9));
		
	-- retrieve a unique workUnit based on the workUnit we have so far.
	set @stWorkUnit = dbo.WRTRV_RtrvUniqueWorkUnit(@stWorkUnit);

	-- update the detail.
	UPDATE WORK_INSTRUCTION
	   SET PARENT_INSTR = @iHdrNum,
		   WORK_UNIT = @stWorkUnit,
		   USER_STAMP = @stUserName,
		   PROCESS_STAMP = N'CCP_CreateWorkFromRequest',
		   DATE_TIME_STAMP = dbo.DHfn_RoundToSec(GETUTCDATE())
	 WHERE LAUNCH_NUM = @iLaunchNum
	 AND INSTRUCTION_TYPE = N'Detail'
	 AND INTERNAL_NUM_TYPE = N'Cycle Count';
	if (@@ERROR <> 0) return -1;

	-- update the header.
	UPDATE WORK_INSTRUCTION
	   SET WORK_UNIT = @stWorkUnit,
		   USER_STAMP = @stUserName,
		   PROCESS_STAMP = N'CCP_CreateWorkFromRequest',
		   DATE_TIME_STAMP = dbo.DHfn_RoundToSec(GETUTCDATE())
	 WHERE INTERNAL_INSTRUCTION_NUM = @iHdrNum;
	if (@@ERROR <> 0) return -1;

