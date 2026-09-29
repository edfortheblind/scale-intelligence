-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */














CREATE FUNCTION WRTRV_RtrvUniqueWorkUnit(
	@stWorkUnit nvarchar(50))
RETURNS nvarchar(50)
BEGIN

	-- [comment omitted]

	-- [comment omitted]
	declare @iIndex int;
	declare @iSuffix int;
	declare @stDelim nvarchar(200);
	declare @stMaxWorkUnit nvarchar(50);
	declare @stSuffix nvarchar(200);

	-- [comment omitted]
	SELECT @stDelim = SYSTEM_VALUE
	  FROM SYSTEM_CONFIG_DETAIL
	 WHERE SYS_KEY = N'<literal:1>';
	 
	-- [comment omitted]
	set @iIndex = CHARINDEX(@stDelim, @stWorkUnit);
	if (@iIndex > 0)
		set @stWorkUnit = SUBSTRING(@stWorkUnit, 1, @iIndex - 1);
		
	-- [comment omitted]
	SELECT @stMaxWorkUnit = MAX(WORK_UNIT)
	  FROM WORK_INSTRUCTION
	 WHERE WORK_UNIT = @stWorkUnit
		OR WORK_UNIT LIKE (@stWorkUnit + @stDelim + N'<literal:2>');
	
	-- [comment omitted]
	if (@stMaxWorkUnit is null)
		return @stWorkUnit;

	-- [comment omitted]
	set @iIndex = dbo.SHfn_LastIndexOf(@stDelim, @stMaxWorkUnit);
	if (@iIndex > 0)
		set @iSuffix = CAST(RIGHT(@stMaxWorkUnit, 
								  6) AS INT) + 1;
	else
		set @iSuffix = 1;
	
	-- [comment omitted]
	set @stSuffix = CAST(@iSuffix AS nvarchar(200));
	while (LEN(@stSuffix) < 6)
	begin
		set @stSuffix = N'<literal:3>' + @stSuffix;
	end; -- [comment omitted]
	
	return @stWorkUnit + @stDelim + @stSuffix;
END -- [comment omitted]



