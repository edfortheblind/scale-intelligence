CREATE PROCEDURE WRK_GetWorkUnits 
(
	@workUnit nvarchar(50),
	@workProfileName nvarchar(25),
	@warehouse nvarchar(25),
	@user nvarchar(30) = null
)
	AS
BEGIN
	SET NOCOUNT ON;

	-- FEATURE_63645_SYSDIR_PERF_ALL must be Y; child FEATURE_63645_WRK_GETWU_SYSDIR_PERF
	-- returns empty immediately when @workUnit is null/empty (LocationEntry often passes no work unit).
	IF (dbo.fn_GetFeatureEnabled(N'FEATURE_63645_SYSDIR_PERF_ALL', @user) = N'Y')
		BEGIN
			-- Empty/null @workUnit is not a real work-unit search; skip the LIKE logic below
			-- (empty string + delimiter would match unrelated work units).
			-- Callers already treat an empty result as no work units.
			Declare @wrkGetWuSysDirPerfFF nchar(2);
			SELECT @wrkGetWuSysDirPerfFF = dbo.fn_GetFeatureEnabled(N'FEATURE_63645_WRK_GETWU_SYSDIR_PERF', @user);
			IF (@wrkGetWuSysDirPerfFF = N'Y' AND ISNULL(@workUnit, N'') = N'')
			BEGIN
				SELECT WORK_UNIT, HOLD_CODE, WORK_TYPE, CONDITION, PRIORITY, REFERENCE_ID, FROM_LOC
				FROM WORK_INSTRUCTION
				WHERE 1 = 0;
				RETURN;
			END
		END


	Declare @workUnitWithWorkUnitDelimiter nvarchar(50);
	Declare @workUnitWithLicensePlateDelimiter nvarchar(50);
	Declare @count int;
	Declare @worktypes nvarchar(max);
	select @worktypes= COALESCE(@worktypes + N',', N'') + WORK_TYPES FROM WORK_PROFILE_DETAIL WHERE WORK_PROFILE = @workProfileName AND isnull(WORK_TYPES,N'') != N'';
	select @workUnitWithWorkUnitDelimiter = SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where  SYS_KEY = N'New Work Delim' and  RECORD_TYPE = N'Work Setup';
	select @workUnitWithLicensePlateDelimiter = SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where  SYS_KEY = N'200' and  RECORD_TYPE = N'Inventory';

	-- counting the WIs which are not closed.
	SET @count = (SELECT COUNT(DISTINCT WI.WORK_UNIT) FROM  WORK_INSTRUCTION WI  
					WHERE ( WI.WORK_UNIT = @workUnit OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithWorkUnitDelimiter + N'%' OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithLicensePlateDelimiter + N'%') 
					AND ( WI.USER_ASSIGNED IS NULL  OR  WI.USER_ASSIGNED = @user ) 
					AND ( WI.FROM_QTY + WI.TO_QTY > 0 OR WI.CYCLE_COUNT = N'Y' )  
					AND ( WI.INSTRUCTION_TYPE = N'Detail' OR WI.CYCLE_COUNT = N'Y' )
					AND WI.CONDITION <> N'Closed'  
					AND (WI.FROM_WHS = @warehouse OR WI.TO_WHS = @warehouse))
	IF @count = 1
	BEGIN
		SELECT WORK_UNIT, HOLD_CODE, WORK_TYPE,CONDITION, PRIORITY, REFERENCE_ID, FROM_LOC FROM WORK_INSTRUCTION WHERE WORK_UNIT IN 
			(SELECT DISTINCT WI.WORK_UNIT FROM  WORK_INSTRUCTION WI  
				WHERE ( WI.WORK_UNIT = @workUnit OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithWorkUnitDelimiter + N'%' OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithLicensePlateDelimiter + N'%') 
				AND ( WI.USER_ASSIGNED IS NULL  OR  WI.USER_ASSIGNED = @user ) 
				AND ( WI.FROM_QTY + WI.TO_QTY > 0 OR WI.CYCLE_COUNT = N'Y' )  
				AND ( WI.INSTRUCTION_TYPE = N'Detail' OR WI.CYCLE_COUNT = N'Y' )
				AND WI.CONDITION <> N'Closed'  
				AND (WI.FROM_WHS = @warehouse OR WI.TO_WHS = @warehouse)) 
			AND INSTRUCTION_TYPE = N'Header'; 
	END
	ELSE
	BEGIN
		SELECT WORK_UNIT, HOLD_CODE, WORK_TYPE,CONDITION, PRIORITY, REFERENCE_ID, FROM_LOC FROM WORK_INSTRUCTION WHERE WORK_UNIT IN 
			(SELECT DISTINCT WI.WORK_UNIT FROM  WORK_INSTRUCTION WI  
				WHERE ( WI.WORK_UNIT = @workUnit OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithWorkUnitDelimiter + N'%' OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithLicensePlateDelimiter + N'%') 
				AND ( WI.USER_ASSIGNED IS NULL  OR  WI.USER_ASSIGNED = @user ) 
				AND ( WI.FROM_QTY + WI.TO_QTY > 0 OR WI.CYCLE_COUNT = N'Y' )  
				AND ( WI.INSTRUCTION_TYPE = N'Detail' OR WI.CYCLE_COUNT = N'Y' )
				AND WI.HOLD_CODE IS NULL
				AND WI.CONDITION <> N'Closed'  
				AND (WI.FROM_WHS = @warehouse OR WI.TO_WHS = @warehouse)) 
				AND INSTRUCTION_TYPE = N'Header'
				AND WORK_TYPE IN ( select value from GENfn_SplitString(@worktypes, N',') );
	END	
END