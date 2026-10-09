/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB		| 10/31/02	| Created.
	11868       	| TBS           | 09/15/03	| Added Multi-Byte support.
	14473		| TDL		| 04/13/04	| Fixed Apostrophes
	17400		| KMD		| 09/13/05	| Combined; remove leading underscores from DB-names

	Translates DO friendly field name (oneTwoThree) to a db friendly
	field name (one_two_three).
	
	Parameters
		String		stDOName	Has the form oneTwoThree.
		
	Return Value
		String		stDBName	Has the form one_two_three.
*/



CREATE FUNCTION DBHfn_TransDOToDBFieldName(
	@stDOName nvarchar(100))
RETURNS nvarchar(100)
BEGIN
	-- local variables.
	declare @c nchar(1);
	declare @i int;
	declare @iAsciiVal int;
	declare @iLen int;
	declare @stDBName nvarchar(100);
		
	-- loop through the DOs field name.
	set @i = 1;
	set @iLen = LEN(@stDOName);
	set @stDBName = N'';
	while (@i <= @iLen)
	begin
		set @c = SUBSTRING(@stDOName, @i, @i+1);
		set @iAsciiVal = ASCII(@c);
		
		-- place an underscore before uppercase letters.
		if (@iAsciiVal >= 65 -- 'A'
			AND @iAsciiVal <= 90) -- 'Z'
			set @stDBName = @stDBName + N'_' + @c;
		else
			set @stDBName = @stDBName + @c;
		
		set @i = @i + 1;
	end; -- end while through stDOName.

	-- remove a leading underscore
	if (SUBSTRING(@stDBName, 1, 1) = N'_')
		set @stDBName = SUBSTRING(@stDBName, 2, LEN(@stDBName));

	return @stDBName;
END -- end DBHfn_TransDOToDBFieldName




