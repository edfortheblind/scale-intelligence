-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













CREATE FUNCTION DHfn_TransToSQLDate(@stLPDateTime nvarchar(50)) -- [comment omitted]
RETURNS datetime										   
BEGIN
	if (@stLPDateTime is null
		OR @stLPDateTime = N'<literal:1>')
		return null;
	
	return convert(datetime,
				   substring(@stLPDateTime, 1, 4) + N'<literal:2>' +	-- [comment omitted]
				   substring(@stLPDateTime, 5, 2) + N'<literal:3>' +	-- [comment omitted]
				   substring(@stLPDateTime, 7, 2) + N'<literal:4>' +	-- [comment omitted]
				   substring(@stLPDateTime, 9, 2) + N'<literal:5>' +	-- [comment omitted]
				   substring(@stLPDateTime, 11, 2) + N'<literal:6>' +	-- [comment omitted]
				   substring(@stLPDateTime, 13, 2),			-- [comment omitted]
				   20);
END -- [comment omitted]