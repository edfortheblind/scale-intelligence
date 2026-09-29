-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











































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

-- [comment omitted]

declare @ifromSQL nvarchar(1000);
declare @warehouseCondition nvarchar(1000);
declare @allzone numeric; -- [comment omitted]
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
declare @fromLocTier int = 0; -- [comment omitted]
declare @fromLocFilter nvarchar(1000) = N'<literal:1>';
declare @topWsvPlfMinPriority int = NULL;        -- [comment omitted]
declare @topWsvPlfHasUserAssigned bit = 0;       -- [comment omitted]
declare @topWsvPlfPriorityPredicate nvarchar(500) = N'<literal:2>';

IF(@isCartPickingWork = 1 AND @isCcWorkUnit = 0)
	BEGIN
		IF(ISNULL(@groupNumber, N'<literal:3>') = N'<literal:4>' AND (ISNULL(@containerId, N'<literal:5>') != N'<literal:6>' OR ISNULL(@transportContId, N'<literal:7>') != N'<literal:8>'))
			SELECT TOP 1 @groupNumber = GROUP_NUM FROM WORK_INSTRUCTION where TRANSPORT_CONT_ID = @containerId OR TRANSPORT_CONT_ID = @transportContId
            SELECT TOP 1 @sequenced = SEQUENCE FROM WORK_INSTRUCTION where ((TRANSPORT_CONT_ID = @containerId OR TRANSPORT_CONT_ID = @transportContId) AND INSTRUCTION_TYPE = N'<literal:9>' AND GROUP_NUM IS NOT NULL);
			
			
			-- [comment omitted]
			if(@groupNumber > 0)	
			SELECT @pickedInstructionsCountFromGroup= COUNT(*)   FROM WORK_INSTRUCTION where FROM_QTY =0 and GROUP_NUM=@groupNumber and INSTRUCTION_TYPE = N'<literal:10>'
			-- [comment omitted]
		IF (@sequenced <= 0 and @pickedInstructionsCountFromGroup = 0)
		BEGIN
		-- [comment omitted]
        -- [comment omitted]
			DECLARE @sequenceOrderBy nvarchar(25), @tableFieldName nvarchar(50), @sequence numeric(5,0),@orderbystatement nvarchar(max) = N'<literal:11>';
			DECLARE @temp_work_regroup TABLE (ORDER_BY nvarchar(25),TABLE_FIELD_NAME nvarchar(50), SEQUENCE  numeric(5,0));
			INSERT into @temp_work_regroup(order_by,TABLE_FIELD_NAME,SEQUENCE) select  ORDER_BY, TABLE_FIELD_NAME,SEQUENCE  from work_regroup_order order by Sequence;
			While EXISTS(SELECT top 1 1 From @temp_work_regroup)  
				begin  
					SELECT top 1 @sequenceOrderBy = ORDER_BY, @tableFieldName = TABLE_FIELD_NAME,@sequence = SEQUENCE
					FROM @temp_work_regroup

					if(@sequenceOrderBy =N'<literal:12>')
						SET @orderbystatement = @orderbystatement + N'<literal:13>' + @tableFieldName + N'<literal:14>' + N'<literal:15>'
					else
						SET @orderbystatement = @orderbystatement + N'<literal:16>' + @tableFieldName + N'<literal:17>' + N'<literal:18>'	
					DELETE from  @temp_work_regroup where SEQUENCE=@sequence
				end 
	
				if(@orderbystatement <> N'<literal:19>')
				SET @orderbystatement = left(@orderbystatement, LEN(@orderbystatement)-1)
				else
				SET @orderbystatement = N'<literal:20>'

			DECLARE @sqlstmt nvarchar(max);
		  SET @sqlstmt = N'<literal:21>'

 +  @orderbystatement + N'<literal:22>'


		  execute sp_executesql @sqlstmt,N'<literal:23>',@groupNumber	
		END
		SET @initiationCondition = N'<literal:24>';
	END
ELSE	
	BEGIN
		IF(@groupNumber > 0 )
		BEGIN	
			set @groupCondition = N'<literal:25>';
		END
		ELSE	
		BEGIN
			set	@groupCondition = N'<literal:26>';
			IF(ISNULL(@workUnit,N'<literal:27>')=N'<literal:28>'AND ISNULL(@containerId,N'<literal:29>')=N'<literal:30>' AND ISNULL(@transportContId,N'<literal:31>')=N'<literal:32>')
			BEGIN
				set @initiationCondition =  N'<literal:33>';
				set @initiatedWithLocation = 1;
			END
			ELSE
				set @initiationCondition = N'<literal:34>';
		END
	END

SELECT @allzone = count(*) from (SELECT ZONE from ZONE where ZONE_TYPE=N'<literal:35>'
EXCEPT    
SELECT ZONE from WORK_PROFILE_ZONE_AUTH where WORK_PROFILE = @workprofile ) zones 


select @groupOnRF = GROUP_ON_RF, @workInitiationMethod = WORK_INITIATION_METHOD, @toAssignMethod =TO_ASSIGN_METHOD, @assignMultipleWorkUnits = ASSIGN_MULTIPLE_WORK_UNITS from WORK_PROFILE_DETAIL where WORK_PROFILE = @workProfile;
SELECT @workTypes = WORK_TYPES,@ConsolidateAfterPutAway = CONSOLIDATE_AFTER_PUTAWAY,@NestAfterPutAway = NEST_AFTER_PUTAWAY,@ShipContPut = SHIP_CONT_PUT,
@TotePick = TOTE_PICK, @ShipContPick = SHIP_CONT_PICK  from WORK_PROFILE_DETAIL where WORK_PROFILE = @workprofile and WORK_PROFILE_DETAIL.SEQUENCE = @workprofileSequence;
SELECT @workUnitWithWorkUnitDelimiter= SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where RECORD_TYPE=N'<literal:36>' and SYS_KEY = N'<literal:37>';
SELECT @workUnitWithLicensePlateDelimiter= SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where RECORD_TYPE = N'<literal:38>' and SYS_KEY=N'<literal:39>';

SELECT @workUnitWithWorkUnitDelimiter =  @workUnit + @workUnitWithWorkUnitDelimiter;
SELECT @workUnitWithLicensePlateDelimiter = @workUnit + @workUnitWithLicensePlateDelimiter;
select @fromAssignMethod = FROM_ASSIGN_METHOD from WORK_PROFILE_DETAIL where WORK_PROFILE = @workprofile and WORK_PROFILE_DETAIL.SEQUENCE = @workprofileSequence;

SELECT @companyaccess= case when 
 (SELECT COMPANY_AUTH from USER_PROFILE where user_name= @user)=N'<literal:40>' then N'<literal:41>'
  ELSE N'<literal:42>' END

-- [comment omitted]
-- [comment omitted]
-- [comment omitted]

-- [comment omitted]
SELECT @orderby = CASE WHEN @fromto = 0 then (CASE WHEN (@groupOnRF = N'<literal:43>' and @workInitiationMethod != N'<literal:44>') then N'<literal:45>' ELSE N'<literal:46>'  END)  
					ELSE (CASE WHEN @toAssignMethod = N'<literal:47>' then N'<literal:48>' else N'<literal:49>' END)  END

-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
IF(@fromto != 1 AND (@isSystemDirectedWork = 1 OR @initiatedWithLocation = 1))
	Begin
		declare @bug47910FeatureFlag nchar(2);
		SELECT @bug47910FeatureFlag = dbo.fn_GetFeatureEnabled(N'<literal:50>', @user);
		IF (@bug47910FeatureFlag = N'<literal:51>')
		BEGIN
			select @orderBy=case
				When @fromAssignMethod = N'<literal:52>'
					THEN N'<literal:53>'
				when  @fromAssignMethod = N'<literal:54>'
					THEN N'<literal:55>'										
				ELSE 
					N'<literal:56>'
			END
		END
		ELSE
		BEGIN
			select @orderBy=case
				When @fromAssignMethod = N'<literal:57>'
					THEN  N'<literal:58>'
				when  @fromAssignMethod = N'<literal:59>'
					THEN N'<literal:60>'										
				ELSE 
					N'<literal:61>'
			END
		END
	END

IF @allzone =0
                BEGIN
                                SET @zoneccess = N'<literal:62>' 
                END;
ELSE
	BEGIN
		if(@fromto = 0 or @fromto = 2)
		BEGIN
			SET @zoneccess =  N'<literal:63>'+ N'<literal:64>' +N'<literal:65>'+ N'<literal:66>' +N'<literal:67>'

+ N'<literal:68>' +N'<literal:69>'+ N'<literal:70>' +N'<literal:71>'
+ N'<literal:72>' +N'<literal:73>'



+ N'<literal:74>' +N'<literal:75>'
	  END
	  ELSE
	  BEGIN
			SET @zoneccess =  N'<literal:76>'+ N'<literal:77>' +N'<literal:78>'



+ N'<literal:79>' +N'<literal:80>'
	  END
	END

-- [comment omitted]
SET @wrkGetWiSysDirPerfFF = N'<literal:81>';
SET @wrkGetWiSysDirTopWsvFF = N'<literal:82>';
IF (dbo.fn_GetFeatureEnabled(N'<literal:83>', @user) = N'<literal:84>')
	BEGIN
		SELECT @wrkGetWiSysDirPerfFF = dbo.fn_GetFeatureEnabled(N'<literal:85>', @user);
		SELECT @wrkGetWiSysDirTopWsvFF = dbo.fn_GetFeatureEnabled(N'<literal:86>', @user);
	END

-- [comment omitted]
IF (@wrkGetWiSysDirPerfFF = N'<literal:87>' AND @wrkGetWiSysDirTopWsvFF = N'<literal:88>'
	AND @isSystemDirectedWork = 1 AND @fromAssignMethod = N'<literal:89>' AND @fromto != 1)
BEGIN
	IF (CHARINDEX(N'<literal:90>', @orderby) > 0)
		SET @orderby = N'<literal:91>';
	ELSE
		SET @orderby = N'<literal:92>';
END

-- [comment omitted]
IF (@isSystemDirectedWork = 1 AND @fromto <> 1 AND ISNULL(@groupNumber, 0) > 0 AND @groupOnRF = N'<literal:93>' AND ISNULL(@assignMultipleWorkUnits, N'<literal:94>') = N'<literal:95>')
	SET @receiptSequenceOrder = 1;
SELECT @topWsvMaxRows = TRY_CAST(SYSTEM_VALUE AS int) FROM SYSTEM_CONFIG_DETAIL WHERE RECORD_TYPE = N'<literal:96>' AND SYS_KEY = N'<literal:97>';
IF (@topWsvMaxRows IS NULL OR @topWsvMaxRows <= 0)
	SET @topWsvMaxRows = 2000;

-- [comment omitted]
IF (@wrkGetWiSysDirPerfFF = N'<literal:98>' AND @isSystemDirectedWork = 1 AND ISNULL(@workUnit,N'<literal:99>')=N'<literal:100>' AND ISNULL(@containerId,N'<literal:101>')=N'<literal:102>' AND ISNULL(@transportContId,N'<literal:103>')=N'<literal:104>')
BEGIN
	SET @workProcess = NULL;
END
ELSE
BEGIN
	SELECT top 1 @workProcess = INTERNAL_NUM_TYPE FROM WORK_INSTRUCTION WHERE (TRANSPORT_CONT_ID = @containerId OR WORK_UNIT = @workunit OR TRANSPORT_CONT_ID = @transportContId) AND INSTRUCTION_TYPE = N'<literal:105>';
END
SELECT @warehouseAuthType =  WAREHOUSE_AUTH from USER_PROFILE where USER_NAME = @user;

if(@fromto = 0 or @fromto = 2)
begin
                set @ifromSQL =N'<literal:106>'
                if(@workProcess = N'<literal:107>')
                begin
                                set @warehouseCondition = N'<literal:108>' + N'<literal:109>' ; 
                end
                else
                begin
                                set @warehouseCondition = N'<literal:110>'
                end
end;
else if(@fromto = 1)
begin
                set @ifromSQL =N'<literal:111>'
                if(@workProcess = N'<literal:112>' and @warehouseAuthType = N'<literal:113>')
                begin
                                set @warehouseCondition = N'<literal:114>' 
                end
				else if(@workProcess = N'<literal:115>'  and @warehouseAuthType = N'<literal:116>')
				begin
				set @warehouseCondition = N'<literal:117>' ;
				end
                else
                begin
                                set @warehouseCondition = N'<literal:118>'
                end
end;

if(@fromto = 2)
begin	
if(@warehouseCondition != N'<literal:119>')
	set @warehouseCondition = @warehouseCondition + N'<literal:120>'
end;

-- [comment omitted]
DECLARE @ContainerCreationOnFly nchar(2);
SELECT @ContainerCreationOnFly = dbo.fn_GetFeatureEnabled(N'<literal:121>', @user);
DECLARE @validationClause nvarchar(MAX) = N'<literal:122>';
IF(ISNULL(@ShipContPick,N'<literal:123>')=N'<literal:124>' AND @ContainerCreationOnFly = N'<literal:125>')
	SET @validationClause = @validationClause + N'<literal:126>';
DECLARE @leanValidationClause nvarchar(max) = N'<literal:127>';
IF(ISNULL(@ShipContPick,N'<literal:128>')=N'<literal:129>' AND @ContainerCreationOnFly = N'<literal:130>')
	SET @leanValidationClause = N'<literal:131>';
DECLARE @ccKeyZone nvarchar(max);
IF (@allzone = 0)
	SET @ccKeyZone = N'<literal:132>';
ELSE
	SET @ccKeyZone = N'<literal:133>'
;

-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
IF (@wrkGetWiSysDirTopWsvFF = N'<literal:134>' AND @isSystemDirectedWork = 1 AND ISNULL(@fromLoc, N'<literal:135>') <> N'<literal:136>'
	AND ISNULL(@fromAssignMethod, N'<literal:137>') <> N'<literal:138>' AND @fromto <> 1)
BEGIN
	DECLARE @topWsvProbeFound bit;
	DECLARE @topWsvProbeSql nvarchar(max);
	DECLARE @topWsvProbeBody nvarchar(max) = N'<literal:139>'








 + @groupCondition + N'<literal:140>' + @ifromSQL + N'<literal:141>'


 + @warehouseCondition + N'<literal:142>'

 + @companyaccess + N'<literal:143>'


 + @ccKeyZone + @leanValidationClause + N'<literal:144>'


 + @zoneccess + @validationClause + N'<literal:145>'

;

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	IF (@fromAssignMethod = N'<literal:146>')
	BEGIN
		DECLARE @topWsvPlfMinPrioritySql nvarchar(max) = N'<literal:147>' + @topWsvProbeBody;
		EXEC sp_executesql @topWsvPlfMinPrioritySql,
			N'<literal:148>',
			@fromLoc, @warehouse, @user, @workProfile, @groupNumber, @workTypes, @minPriority = @topWsvPlfMinPriority OUTPUT;

		IF (@topWsvPlfMinPriority IS NOT NULL)
		BEGIN
			DECLARE @topWsvPlfUserAssignedFound bit = 0;
			DECLARE @topWsvPlfUserAssignedSql nvarchar(max) = N'<literal:149>' + @topWsvProbeBody
				+ N'<literal:150>';
			EXEC sp_executesql @topWsvPlfUserAssignedSql,
				N'<literal:151>',
				@fromLoc, @warehouse, @user, @workProfile, @groupNumber, @workTypes, @topWsvPlfMinPriority, @found = @topWsvPlfUserAssignedFound OUTPUT;

			IF (@topWsvPlfUserAssignedFound = 1)
				SET @topWsvPlfPriorityPredicate = N'<literal:152>' + CAST(@topWsvPlfMinPriority AS nvarchar(20)) + N'<literal:153>';
			ELSE
				SET @topWsvPlfPriorityPredicate = N'<literal:154>' + CAST(@topWsvPlfMinPriority AS nvarchar(20)) + N'<literal:155>';
		END
	END

	SET @topWsvProbeFound = 0;
	SET @topWsvProbeSql = N'<literal:156>' + @topWsvProbeBody + N'<literal:157>' + @topWsvPlfPriorityPredicate + N'<literal:158>';
	EXEC sp_executesql @topWsvProbeSql,
		N'<literal:159>',
		@fromLoc, @warehouse, @user, @workProfile, @groupNumber, @workTypes, @found = @topWsvProbeFound OUTPUT;
	IF (@topWsvProbeFound = 1)
	BEGIN
		SET @fromLocTier = 1;
		SET @fromLocFilter = N'<literal:160>';
	END
	ELSE
	BEGIN
		SET @topWsvProbeFound = 0;
		SET @topWsvProbeSql = N'<literal:161>' + @topWsvProbeBody + N'<literal:162>' + @topWsvPlfPriorityPredicate + N'<literal:163>';
		EXEC sp_executesql @topWsvProbeSql,
			N'<literal:164>',
			@fromLoc, @warehouse, @user, @workProfile, @groupNumber, @workTypes, @found = @topWsvProbeFound OUTPUT;
		IF (@topWsvProbeFound = 1)
		BEGIN
			SET @fromLocTier = 2;
			SET @fromLocFilter = N'<literal:165>' + @topWsvPlfPriorityPredicate;
		END
		ELSE
		BEGIN
			SET @topWsvProbeFound = 0;
			SET @topWsvProbeSql = N'<literal:166>' + @topWsvProbeBody + N'<literal:167>' + @topWsvPlfPriorityPredicate + N'<literal:168>';
			EXEC sp_executesql @topWsvProbeSql,
				N'<literal:169>',
				@fromLoc, @warehouse, @user, @workProfile, @groupNumber, @workTypes, @found = @topWsvProbeFound OUTPUT;
			IF (@topWsvProbeFound = 1)
			BEGIN
				SET @fromLocTier = 3;
				SET @fromLocFilter = N'<literal:170>' + @topWsvPlfPriorityPredicate;
			END
		END
	END
END
set @sql = N'<literal:171>'

 ;

DECLARE @immNeedsPutawayGroupFFEnabled as nchar(2)
SELECT @immNeedsPutawayGroupFFEnabled = dbo.fn_GetFeatureEnabled(N'<literal:172>', @user);
DECLARE @selectRowNumber as nvarchar(max);
DECLARE @selectColumns as nvarchar(max);
IF(@immNeedsPutawayGroupFFEnabled = N'<literal:173>')
	BEGIN
	 SELECT @selectRowNumber = N'<literal:174>'
	 SELECT @selectColumns = N'<literal:175>'
	END
ELSE
	BEGIN
	 SELECT @selectRowNumber = N'<literal:176>'
	 SELECT @selectColumns = N'<literal:177>'
	END

if(@isSystemDirectedWork =0)
Begin
set @sql = @sql + N'<literal:178>' + @selectRowNumber + N'<literal:179>'


































			+ @selectColumns
			+ N'<literal:180>'










+@initiationCondition+N'<literal:181>'

		+ @ifromSQL
		+N'<literal:182>'
		-- [comment omitted]
		+ @warehouseCondition + N'<literal:183>' + 
		+ @zoneccess + N'<literal:184>' + 
		+ N'<literal:185>'
		+ @companyaccess + N'<literal:186>' +
		+ N'<literal:187>'
		+ N'<literal:188>'
		+ @orderby
END
Else
Begin
-- [comment omitted]
	-- [comment omitted]
	IF(@wrkGetWiSysDirPerfFF = N'<literal:189>')
	BEGIN
	-- [comment omitted]
	declare @perfSelectCore nvarchar(max) = N'<literal:190>'
























;
	declare @perfSelectScCc nvarchar(max) = N'<literal:191>'





;
	declare @perfSelectScNonCc nvarchar(max) = N'<literal:192>'






;
	declare @perfSelectScGated nvarchar(max) = N'<literal:193>'








;
	declare @perfJoinsLoc nvarchar(max) = N'<literal:194>'


;
	declare @perfJoinsLotItem nvarchar(max) = N'<literal:195>'
;
	declare @perfJoinsShipGated nvarchar(max) = N'<literal:196>'




;
	declare @perfJoinsShipFull nvarchar(max) = N'<literal:197>'




;
	declare @perfWherePrefix nvarchar(max) = N'<literal:198>'+@groupCondition+N'<literal:199>' + @ifromSQL
		+ N'<literal:200>';
	declare @perfWhereSuffix nvarchar(max) = N'<literal:201>'
		+ @warehouseCondition + N'<literal:202>';
	declare @perfWhereWorkUser nvarchar(max) = N'<literal:203>'
		+ @companyaccess + N'<literal:204>';
	declare @perfInternalNumTypesAll nvarchar(max) = N'<literal:205>';
	declare @perfInternalNumTypesNonCc nvarchar(max) = N'<literal:206>';
	declare @perfSlConfirm nvarchar(max) = N'<literal:207>';

	IF (@wrkGetWiSysDirTopWsvFF = N'<literal:208>')
	BEGIN
		-- [comment omitted]
		declare @putLocExpr nvarchar(max) = N'<literal:209>';
		declare @ccKeyOrderBy nvarchar(max) =
			CASE
				WHEN @fromLocTier = 3 AND @fromAssignMethod = N'<literal:210>'
					THEN REPLACE(@orderby, N'<literal:211>', N'<literal:212>')
				WHEN @fromLocTier = 3 THEN N'<literal:213>' + @orderby
				ELSE @orderby
			END;
		SET @ccKeyOrderBy = REPLACE(@ccKeyOrderBy, N'<literal:214>', @putLocExpr);
		SET @ccKeyOrderBy = REPLACE(@ccKeyOrderBy, N'<literal:215>', @putLocExpr);
		declare @unionOrderBy nvarchar(max) = @orderby;
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'<literal:216>', N'<literal:217>');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'<literal:218>', N'<literal:219>');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'<literal:220>', N'<literal:221>');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'<literal:222>', N'<literal:223>');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'<literal:224>', N'<literal:225>');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'<literal:226>', N'<literal:227>');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'<literal:228>', N'<literal:229>');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'<literal:230>', N'<literal:231>');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'<literal:232>', N'<literal:233>');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'<literal:234>', N'<literal:235>');
		SET @unionOrderBy = REPLACE(@unionOrderBy, N'<literal:236>', N'<literal:237>');
		declare @topN nvarchar(20) = CAST(@topWsvMaxRows AS nvarchar(20));

		set @sql = @sql + N'<literal:238>' + @topN + N'<literal:239>'
		-- [comment omitted]
		+ N'<literal:240>' + @perfSelectCore + @perfSelectScCc
		+ N'<literal:241>'
 + @topN + N'<literal:242>'


		+ @perfWherePrefix
		+ N'<literal:243>'
		+ @perfWhereSuffix + @ccKeyZone
		+ N'<literal:244>' + @leanValidationClause
		+ @companyaccess + N'<literal:245>'
		+ @fromLocFilter
		+ N'<literal:246>' + @ccKeyOrderBy
		+ N'<literal:247>'

		+ @perfJoinsLoc + @perfJoinsLotItem
		+ N'<literal:248>'
		-- [comment omitted]
		+ N'<literal:249>' + @perfSelectCore + @perfSelectScNonCc
		+ N'<literal:250>'
		+ @perfJoinsLoc + @perfJoinsShipFull + @perfJoinsLotItem
		+ @perfWherePrefix + @perfInternalNumTypesNonCc + @perfWhereSuffix
		+ @zoneccess + @perfWhereWorkUser + @validationClause + @perfSlConfirm + @fromLocFilter
		+ N'<literal:251>'
		+ CASE
				WHEN @fromLocTier = 3 AND @fromAssignMethod = N'<literal:252>'
					THEN REPLACE(@unionOrderBy, N'<literal:253>', N'<literal:254>') + N'<literal:255>'
				WHEN @fromLocTier = 3 THEN N'<literal:256>' + @unionOrderBy
				ELSE @unionOrderBy
			END
	END
	ELSE
	BEGIN
	-- [comment omitted]
	set @sql = @sql + N'<literal:257>' + @selectRowNumber + N'<literal:258>' + @perfSelectCore + @perfSelectScGated
		+ @selectColumns
		+ N'<literal:259>'
		+ @perfJoinsLoc + @perfJoinsShipGated + @perfJoinsLotItem
		+ @perfWherePrefix + @perfInternalNumTypesAll + @perfWhereSuffix
		+ @zoneccess + @perfWhereWorkUser + @validationClause + @perfSlConfirm
		+ N'<literal:260>' + @orderby
	END
	END
	ELSE
	BEGIN
	-- [comment omitted]
	set @sql = @sql + N'<literal:261>' + @selectRowNumber + N'<literal:262>'













































			+ @selectColumns
			+ N'<literal:263>'












+@groupCondition+N'<literal:264>'

		+ @ifromSQL
		+N'<literal:265>'
		+N'<literal:266>'
		+N'<literal:267>'
		-- [comment omitted]
		-- [comment omitted]
		+@warehouseCondition + N'<literal:268>' + 
		+ @zoneccess + N'<literal:269>' + 
		+ N'<literal:270>'+@validationClause+
		+ @companyaccess + N'<literal:271>' +
		+ N'<literal:272>'
		+ N'<literal:273>'
		+ N'<literal:274>'
		+ @orderby
	END
End

  execute sp_executesql @sql,N'<literal:275>'
							,@workUnit,@workTypes,@user, @warehouse,@workProfile,@containerId,@fromLoc,@groupNumber,@transportContId;
