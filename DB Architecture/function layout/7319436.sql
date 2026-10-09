/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB			| 08/14/02	| Created.
	11870       | TBS           | 09/16/03  | Added Multi-Byte support.

	Converts the specified LPDateTime String to a datetime.

	Parameters
		String		stLPDateTime	The LPDateTime string to convert.

	Return Value
		datetime					The converted value.
*/
CREATE FUNCTION DHfn_TransToSQLDate(@stLPDateTime nvarchar(50)) -- IDENTIFIER used to set varchar type
RETURNS datetime										   
BEGIN
	if (@stLPDateTime is null
		OR @stLPDateTime = N'')
		return null;
	
	return convert(datetime,
				   substring(@stLPDateTime, 1, 4) + N'-' +	-- Year
				   substring(@stLPDateTime, 5, 2) + N'-' +	-- Month
				   substring(@stLPDateTime, 7, 2) + N' ' +	-- Day
				   substring(@stLPDateTime, 9, 2) + N':' +	-- Hours
				   substring(@stLPDateTime, 11, 2) + N':' +	-- Minutes
				   substring(@stLPDateTime, 13, 2),			-- Seconds
				   20);
END -- end DHfn_TransToSQLDate