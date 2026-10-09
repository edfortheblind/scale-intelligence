/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	11870       | TBS           | 09/16/03  | Added Multi-Byte support.

	Returns the current date with the time removed.

	Parameters
		datetime	dt	The date to truncate - will usually be getDate().

	Return Value
		datetime		The current date with the time removed.
*/
CREATE FUNCTION DHfn_GetDateNoTime(@dt datetime)
RETURNS datetime										   
BEGIN
	return convert(datetime,convert(nvarchar(50),@dt,101)); -- IDENTIFIER used to set char type
END -- end DHfn_GetDateNoTime