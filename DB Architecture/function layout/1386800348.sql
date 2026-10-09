
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB			| 10/08/02	| Created.
	11870       | TBS           | 09/16/03  | Added Multi-Byte support.

	Retrieves a unique workUnit based on the workUnit specified.
	
	Parameters
		String	stWorkUnit	Passed in as base for the unique workUnit
							that will be retrieved.
	
	Return Value
		String				The corresponding unique workUnit.
*/
CREATE FUNCTION WRTRV_RtrvUniqueWorkUnit(
	@stWorkUnit nvarchar(50))
RETURNS nvarchar(50)
BEGIN

	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;

	-- local variables.
	declare @iIndex int;
	declare @iSuffix int;
	declare @stDelim nvarchar(200);
	declare @stMaxWorkUnit nvarchar(50);
	declare @stSuffix nvarchar(200);

	-- retrieve the workDelimiter from the SystemValues.
	SELECT @stDelim = SYSTEM_VALUE
	  FROM SYSTEM_CONFIG_DETAIL
	 WHERE SYS_KEY = N'New Work Delim';
	 
	-- if the work unit contains the delimiter, remove it.
	set @iIndex = CHARINDEX(@stDelim, @stWorkUnit);
	if (@iIndex > 0)
		set @stWorkUnit = SUBSTRING(@stWorkUnit, 1, @iIndex - 1);
		
	-- retrieve the workUnit that has the maximum suffix.
	SELECT @stMaxWorkUnit = MAX(WORK_UNIT)
	  FROM WORK_INSTRUCTION
	 WHERE WORK_UNIT = @stWorkUnit
		OR WORK_UNIT LIKE (@stWorkUnit + @stDelim + N'%');
	
	-- if work unit is already unique, simply return it.
	if (@stMaxWorkUnit is null)
		return @stWorkUnit;

	-- otherwise, determine the suffix.
	set @iIndex = dbo.SHfn_LastIndexOf(@stDelim, @stMaxWorkUnit);
	if (@iIndex > 0)
		set @iSuffix = CAST(RIGHT(@stMaxWorkUnit, 
								  6) AS INT) + 1;
	else
		set @iSuffix = 1;
	
	-- front-pad the suffix with zeros.
	set @stSuffix = CAST(@iSuffix AS nvarchar(200));
	while (LEN(@stSuffix) < 6)
	begin
		set @stSuffix = N'0' + @stSuffix;
	end; -- end while to front-pad.
	
	return @stWorkUnit + @stDelim + @stSuffix;
END -- end WRTRV_RtrvUniqueWorkUnit



