-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

CREATE PROCEDURE CCP_CreateWorkFromRequest(
	@iLaunchNum numeric(9),
	@stRelatedWorkUnit nvarchar(50),
	@stUserName nvarchar(30))
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	-- [comment omitted]

	-- [comment omitted]
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
			(SELECT ISNULL(CYCLE_COUNT_PREFERENCE,N'<literal:1>')
			FROM USER_PROFILE WHERE USER_NAME = @stUserName);

	SELECT 
		@srcIdentifier = SYSTEM_VALUE
	FROM 
		SYSTEM_CONFIG_DETAIL
	WHERE 
		RECORD_TYPE = N'<literal:2>'
		AND SYS_KEY = N'<literal:3>';

	if (@@ROWCOUNT <= 0 OR @stWorkType is null)
   		begin
			set @stMsg = N'<literal:4>' + dbo.RSCMfn_RtrvMsg(N'<literal:5>');
			RAISERROR(@stMsg, 18, 1);
			return -1;
		end;

	SELECT  @stWorkGroup = WORK_GROUP,
		@iDefaultPriority = DEFAULT_PRIORITY
		FROM WORK_TYPE
		WHERE WORK_TYPE=@stWorkType;

	-- [comment omitted]
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
			N'<literal:6>', -- [comment omitted]
			@stRelatedWorkUnit,
			CC.INTERNAL_COUNT_NUM,
			CC.INTERNAL_COUNT_NUM,
			N'<literal:7>', -- [comment omitted]
			CC.INTERNAL_COUNT_NUM,
			CC.LAUNCH_NUMBER,
			@stWorkType,
			@stWorkTeam,
			N'<literal:8>', -- [comment omitted]
			LOC.CHECK_DIG, -- [comment omitted]
			dbo.DHfn_RoundToSec(GETUTCDATE()), -- [comment omitted]
			N'<literal:9>', -- [comment omitted]
			dbo.DHfn_RoundToSec(GETUTCDATE()), -- [comment omitted]
			LOC.WORK_ZONE, -- [comment omitted]
			0, -- [comment omitted]
			@srcIdentifier,
			@iDefaultPriority,
			@stWorkGroup, 
			N'<literal:10>', -- [comment omitted]
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

	-- [comment omitted]
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
	
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
		    
	(SELECT CASE WHEN MIN(isNull(ITEM,N'<literal:11>')) = MAX(isNull(ITEM,N'<literal:12>')) 
				 THEN CASE WHEN MIN(isNull(ITEM,N'<literal:13>')) = N'<literal:14>'
						   THEN null
						   ELSE MIN(isNull(ITEM,N'<literal:15>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(ITEM_DESC,N'<literal:16>')) = MAX(isNull(ITEM_DESC,N'<literal:17>'))
				 THEN CASE WHEN MIN(isNull(ITEM_DESC,N'<literal:18>')) = N'<literal:19>'
						   THEN null
						   ELSE MIN(isNull(ITEM_DESC,N'<literal:20>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(COMPANY,N'<literal:21>')) = MAX(isNull(COMPANY,N'<literal:22>'))
				 THEN CASE WHEN MIN(isNull(COMPANY,N'<literal:23>')) = N'<literal:24>'
						   THEN null
						   ELSE MIN(isNull(COMPANY,N'<literal:25>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(LOT,N'<literal:26>')) = MAX(isNull(LOT,N'<literal:27>'))
				 THEN CASE WHEN MIN(isNull(LOT,N'<literal:28>')) = N'<literal:29>'
						   THEN null
						   ELSE MIN(isNull(LOT,N'<literal:30>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(FROM_LOC,N'<literal:31>')) = MAX(isNull(FROM_LOC,N'<literal:32>'))
				 THEN CASE WHEN MIN(isNull(FROM_LOC,N'<literal:33>')) = N'<literal:34>'
						   THEN null
						   ELSE MIN(isNull(FROM_LOC,N'<literal:35>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(FROM_WHS,N'<literal:36>')) = MAX(isNull(FROM_WHS,N'<literal:37>'))
				 THEN CASE WHEN MIN(isNull(FROM_WHS,N'<literal:38>')) = N'<literal:39>'
						   THEN null
						   ELSE MIN(isNull(FROM_WHS,N'<literal:40>')) END
				 ELSE NULL END,
			N'<literal:41>',
			CASE WHEN MIN(isNull(RELATED_WORK_UNIT,N'<literal:42>')) = MAX(isNull(RELATED_WORK_UNIT,N'<literal:43>'))
				 THEN CASE WHEN MIN(isNull(RELATED_WORK_UNIT,N'<literal:44>')) = N'<literal:45>'
						   THEN null
						   ELSE MIN(isNull(RELATED_WORK_UNIT,N'<literal:46>')) END
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
			CASE WHEN MIN(isNull(CYCLE_COUNT,N'<literal:47>')) = MAX(isNull(CYCLE_COUNT,N'<literal:48>'))
				 THEN CASE WHEN MIN(isNull(CYCLE_COUNT,N'<literal:49>')) = N'<literal:50>'
						   THEN null
						   ELSE MIN(isNull(CYCLE_COUNT,N'<literal:51>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(LAUNCH_NUM,0)) = MAX(isNull(LAUNCH_NUM,1))
				 THEN CASE WHEN MIN(isNull(LAUNCH_NUM,-1)) = -1
						   THEN null
						   ELSE MIN(isNull(LAUNCH_NUM,-1)) END
				 ELSE NULL END,
			MAX(WORK_TYPE),
			CASE WHEN MIN(isNull(TEAM_ASSIGNED,N'<literal:52>')) = MAX(isNull(TEAM_ASSIGNED,N'<literal:53>'))
				 THEN CASE WHEN MIN(isNull(TEAM_ASSIGNED,N'<literal:54>')) = N'<literal:55>'
						   THEN null
						   ELSE MIN(isNull(TEAM_ASSIGNED,N'<literal:56>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_ASSIGNED,N'<literal:57>')) = MAX(isNull(USER_ASSIGNED,N'<literal:58>'))
				 THEN CASE WHEN MIN(isNull(USER_ASSIGNED,N'<literal:59>')) = N'<literal:60>'
						   THEN null
						   ELSE MIN(isNull(USER_ASSIGNED,N'<literal:61>')) END
				 ELSE NULL END,
			N'<literal:62>', -- [comment omitted]
			CASE WHEN MIN(isNull(FROM_CHECK_DIG,N'<literal:63>')) = MAX(isNull(FROM_CHECK_DIG,N'<literal:64>'))
				 THEN CASE WHEN MIN(isNull(FROM_CHECK_DIG,N'<literal:65>')) = N'<literal:66>'
						   THEN null
						   ELSE MIN(isNull(FROM_CHECK_DIG,N'<literal:67>')) END
				 ELSE NULL END,
			MIN(AGING_DATE_TIME),
			MAX(INVENTORY_TRACKING),
			dbo.DHfn_RoundToSec(GETUTCDATE()), -- [comment omitted]
			CASE WHEN MIN(isNull(FROM_WORK_ZONE,N'<literal:68>')) = MAX(isNull(FROM_WORK_ZONE,N'<literal:69>'))
				 THEN CASE WHEN MIN(isNull(FROM_WORK_ZONE,N'<literal:70>')) = N'<literal:71>'
						   THEN null
						   ELSE MIN(isNull(FROM_WORK_ZONE,N'<literal:72>')) END
				 ELSE NULL END,
			0, -- [comment omitted]
			@srcIdentifier,
			CASE WHEN MIN(isNull(PRIORITY,0)) = MAX(isNull(PRIORITY,1))
				 THEN CASE WHEN MIN(isNull(PRIORITY,-1)) = -1
						   THEN null
						   ELSE MIN(isNull(PRIORITY,-1)) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(WORK_GROUP,N'<literal:73>')) = MAX(isNull(WORK_GROUP,N'<literal:74>'))
				 THEN CASE WHEN MIN(isNull(WORK_GROUP,N'<literal:75>')) = N'<literal:76>'
						   THEN null
						   ELSE MIN(isNull(WORK_GROUP,N'<literal:77>')) END
				 ELSE NULL END,
			COUNT(*), -- [comment omitted]
			N'<literal:78>', -- [comment omitted]
			CASE WHEN MIN(isNull(USER_DEF1,N'<literal:79>')) = MAX(isNull(USER_DEF1,N'<literal:80>'))
				 THEN CASE WHEN MIN(isNull(USER_DEF1,N'<literal:81>')) = N'<literal:82>'
						   THEN null
						   ELSE MIN(isNull(USER_DEF1,N'<literal:83>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF2,N'<literal:84>')) = MAX(isNull(USER_DEF2,N'<literal:85>'))
				 THEN CASE WHEN MIN(isNull(USER_DEF2,N'<literal:86>')) = N'<literal:87>'
						   THEN null
						   ELSE MIN(isNull(USER_DEF2,N'<literal:88>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF3,N'<literal:89>')) = MAX(isNull(USER_DEF3,N'<literal:90>'))
				 THEN CASE WHEN MIN(isNull(USER_DEF3,N'<literal:91>')) = N'<literal:92>'
						   THEN null
						   ELSE MIN(isNull(USER_DEF3,N'<literal:93>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF4,N'<literal:94>')) = MAX(isNull(USER_DEF4,N'<literal:95>'))
				 THEN CASE WHEN MIN(isNull(USER_DEF4,N'<literal:96>')) = N'<literal:97>'
						   THEN null
						   ELSE MIN(isNull(USER_DEF4,N'<literal:98>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF5,N'<literal:99>')) = MAX(isNull(USER_DEF5,N'<literal:100>'))
				 THEN CASE WHEN MIN(isNull(USER_DEF5,N'<literal:101>')) = N'<literal:102>'
						   THEN null
						   ELSE MIN(isNull(USER_DEF5,N'<literal:103>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(USER_DEF6,N'<literal:104>')) = MAX(isNull(USER_DEF6,N'<literal:105>'))
				 THEN CASE WHEN MIN(isNull(USER_DEF6,N'<literal:106>')) = N'<literal:107>'
						   THEN null
						   ELSE MIN(isNull(USER_DEF6,N'<literal:108>')) END
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
			CASE WHEN MIN(isNull(REFERENCE_ID,N'<literal:109>')) = MAX(isNull(REFERENCE_ID,N'<literal:110>'))
				 THEN CASE WHEN MIN(isNull(REFERENCE_ID,N'<literal:111>')) = N'<literal:112>'
						   THEN null
						   ELSE MIN(isNull(REFERENCE_ID,N'<literal:113>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(CYCLE_COUNT_GROUP_NUM,0)) = MAX(isNull(CYCLE_COUNT_GROUP_NUM,1))
				 THEN CASE WHEN MIN(isNull(CYCLE_COUNT_GROUP_NUM,-1)) = -1
						   THEN null
						   ELSE MIN(isNull(CYCLE_COUNT_GROUP_NUM,-1)) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(LOGISTICS_UNIT,N'<literal:114>')) = MAX(isNull(LOGISTICS_UNIT,N'<literal:115>'))
				 THEN CASE WHEN MIN(isNull(LOGISTICS_UNIT,N'<literal:116>')) = N'<literal:117>'
						   THEN null
						   ELSE MIN(isNull(LOGISTICS_UNIT,N'<literal:118>')) END
				 ELSE NULL END,
			CASE WHEN MIN(isNull(LOGISTICS_UNIT,N'<literal:119>')) = MAX(isNull(LOGISTICS_UNIT,N'<literal:120>'))
				 THEN CASE WHEN MIN(isNull(LOGISTICS_UNIT,N'<literal:121>')) = N'<literal:122>'
						   THEN null
						   ELSE MIN(PARENT_LOGISTICS_UNIT) END
				 ELSE NULL END
	   FROM WORK_INSTRUCTION
	  WHERE 
	  LAUNCH_NUM = @iLaunchNum
	  AND 
	  INTERNAL_NUM_TYPE = N'<literal:123>');
	if (@@ERROR <> 0) return -1;
	  
	set @iHdrNum = scope_identity();
	
	-- [comment omitted]
	SELECT @stWorkUnitField = SYSTEM_VALUE
	  FROM SYSTEM_CONFIG_DETAIL
	 WHERE RECORD_TYPE = N'<literal:124>'
	   AND SYS_KEY = N'<literal:125>';
	   
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	if (@stWorkUnitField is not null)
	begin
		-- [comment omitted]
		-- [comment omitted]
		set @stWorkUnitField = dbo.DBHfn_TransDOToDBFieldName(@stWorkUnitField);

		CREATE TABLE #temp(workUnit nvarchar(50));
		INSERT INTO #temp EXEC (N'<literal:126>' + @stWorkUnitField + 
								 N'<literal:127>' +
								 N'<literal:128>' 
													+ @iHdrNum);
		SELECT @stWorkUnit = workUnit FROM #temp;
		DROP TABLE #temp;
	end; -- [comment omitted]
			
	-- [comment omitted]
	if (@stWorkUnit is null)
		set @stWorkUnit = CAST(@iHdrNum AS numeric(9));
		
	-- [comment omitted]
	set @stWorkUnit = dbo.WRTRV_RtrvUniqueWorkUnit(@stWorkUnit);

	-- [comment omitted]
	UPDATE WORK_INSTRUCTION
	   SET PARENT_INSTR = @iHdrNum,
		   WORK_UNIT = @stWorkUnit,
		   USER_STAMP = @stUserName,
		   PROCESS_STAMP = N'<literal:129>',
		   DATE_TIME_STAMP = dbo.DHfn_RoundToSec(GETUTCDATE())
	 WHERE LAUNCH_NUM = @iLaunchNum
	 AND INSTRUCTION_TYPE = N'<literal:130>'
	 AND INTERNAL_NUM_TYPE = N'<literal:131>';
	if (@@ERROR <> 0) return -1;

	-- [comment omitted]
	UPDATE WORK_INSTRUCTION
	   SET WORK_UNIT = @stWorkUnit,
		   USER_STAMP = @stUserName,
		   PROCESS_STAMP = N'<literal:132>',
		   DATE_TIME_STAMP = dbo.DHfn_RoundToSec(GETUTCDATE())
	 WHERE INTERNAL_INSTRUCTION_NUM = @iHdrNum;
	if (@@ERROR <> 0) return -1;

