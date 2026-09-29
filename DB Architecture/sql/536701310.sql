-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



















CREATE FUNCTION DBHfn_TransDOToDBFieldName(
	@stDOName nvarchar(100))
RETURNS nvarchar(100)
BEGIN
	-- [comment omitted]
	declare @c nchar(1);
	declare @i int;
	declare @iAsciiVal int;
	declare @iLen int;
	declare @stDBName nvarchar(100);
		
	-- [comment omitted]
	set @i = 1;
	set @iLen = LEN(@stDOName);
	set @stDBName = N'<literal:1>';
	while (@i <= @iLen)
	begin
		set @c = SUBSTRING(@stDOName, @i, @i+1);
		set @iAsciiVal = ASCII(@c);
		
		-- [comment omitted]
		if (@iAsciiVal >= 65 -- [comment omitted]
			AND @iAsciiVal <= 90) -- [comment omitted]
			set @stDBName = @stDBName + N'<literal:2>' + @c;
		else
			set @stDBName = @stDBName + @c;
		
		set @i = @i + 1;
	end; -- [comment omitted]

	-- [comment omitted]
	if (SUBSTRING(@stDBName, 1, 1) = N'<literal:3>')
		set @stDBName = SUBSTRING(@stDBName, 2, LEN(@stDBName));

	return @stDBName;
END -- [comment omitted]




