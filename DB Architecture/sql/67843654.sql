-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
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

	-- [comment omitted]
	-- [comment omitted]
	IF (dbo.fn_GetFeatureEnabled(N'<literal:1>', @user) = N'<literal:2>')
		BEGIN
			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
			Declare @wrkGetWuSysDirPerfFF nchar(2);
			SELECT @wrkGetWuSysDirPerfFF = dbo.fn_GetFeatureEnabled(N'<literal:3>', @user);
			IF (@wrkGetWuSysDirPerfFF = N'<literal:4>' AND ISNULL(@workUnit, N'<literal:5>') = N'<literal:6>')
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
	select @worktypes= COALESCE(@worktypes + N'<literal:7>', N'<literal:8>') + WORK_TYPES FROM WORK_PROFILE_DETAIL WHERE WORK_PROFILE = @workProfileName AND isnull(WORK_TYPES,N'<literal:9>') != N'<literal:10>';
	select @workUnitWithWorkUnitDelimiter = SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where  SYS_KEY = N'<literal:11>' and  RECORD_TYPE = N'<literal:12>';
	select @workUnitWithLicensePlateDelimiter = SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where  SYS_KEY = N'<literal:13>' and  RECORD_TYPE = N'<literal:14>';

	-- [comment omitted]
	SET @count = (SELECT COUNT(DISTINCT WI.WORK_UNIT) FROM  WORK_INSTRUCTION WI  
					WHERE ( WI.WORK_UNIT = @workUnit OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithWorkUnitDelimiter + N'<literal:15>' OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithLicensePlateDelimiter + N'<literal:16>') 
					AND ( WI.USER_ASSIGNED IS NULL  OR  WI.USER_ASSIGNED = @user ) 
					AND ( WI.FROM_QTY + WI.TO_QTY > 0 OR WI.CYCLE_COUNT = N'<literal:17>' )  
					AND ( WI.INSTRUCTION_TYPE = N'<literal:18>' OR WI.CYCLE_COUNT = N'<literal:19>' )
					AND WI.CONDITION <> N'<literal:20>'  
					AND (WI.FROM_WHS = @warehouse OR WI.TO_WHS = @warehouse))
	IF @count = 1
	BEGIN
		SELECT WORK_UNIT, HOLD_CODE, WORK_TYPE,CONDITION, PRIORITY, REFERENCE_ID, FROM_LOC FROM WORK_INSTRUCTION WHERE WORK_UNIT IN 
			(SELECT DISTINCT WI.WORK_UNIT FROM  WORK_INSTRUCTION WI  
				WHERE ( WI.WORK_UNIT = @workUnit OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithWorkUnitDelimiter + N'<literal:21>' OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithLicensePlateDelimiter + N'<literal:22>') 
				AND ( WI.USER_ASSIGNED IS NULL  OR  WI.USER_ASSIGNED = @user ) 
				AND ( WI.FROM_QTY + WI.TO_QTY > 0 OR WI.CYCLE_COUNT = N'<literal:23>' )  
				AND ( WI.INSTRUCTION_TYPE = N'<literal:24>' OR WI.CYCLE_COUNT = N'<literal:25>' )
				AND WI.CONDITION <> N'<literal:26>'  
				AND (WI.FROM_WHS = @warehouse OR WI.TO_WHS = @warehouse)) 
			AND INSTRUCTION_TYPE = N'<literal:27>'; 
	END
	ELSE
	BEGIN
		SELECT WORK_UNIT, HOLD_CODE, WORK_TYPE,CONDITION, PRIORITY, REFERENCE_ID, FROM_LOC FROM WORK_INSTRUCTION WHERE WORK_UNIT IN 
			(SELECT DISTINCT WI.WORK_UNIT FROM  WORK_INSTRUCTION WI  
				WHERE ( WI.WORK_UNIT = @workUnit OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithWorkUnitDelimiter + N'<literal:28>' OR  WI.WORK_UNIT LIKE @workUnit + @workUnitWithLicensePlateDelimiter + N'<literal:29>') 
				AND ( WI.USER_ASSIGNED IS NULL  OR  WI.USER_ASSIGNED = @user ) 
				AND ( WI.FROM_QTY + WI.TO_QTY > 0 OR WI.CYCLE_COUNT = N'<literal:30>' )  
				AND ( WI.INSTRUCTION_TYPE = N'<literal:31>' OR WI.CYCLE_COUNT = N'<literal:32>' )
				AND WI.HOLD_CODE IS NULL
				AND WI.CONDITION <> N'<literal:33>'  
				AND (WI.FROM_WHS = @warehouse OR WI.TO_WHS = @warehouse)) 
				AND INSTRUCTION_TYPE = N'<literal:34>'
				AND WORK_TYPE IN ( select value from GENfn_SplitString(@worktypes, N'<literal:35>') );
	END	
END