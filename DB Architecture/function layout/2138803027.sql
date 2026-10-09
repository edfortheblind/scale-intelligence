/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	11373		| RAB			| 05/07/03	| Created.

	Returns the specified datetime with the milliseconds removed.

	Parameters
		datetime	dt	The date to truncate - will usually be getDate().

	Return Value
		datetime		The current date with the milliseconds removed.
*/
CREATE FUNCTION DHfn_RoundToSec(@dt datetime)
RETURNS datetime										   
BEGIN
	return dateadd(ms, -datepart(ms, @dt), @dt);
END -- end DHfn_RoundToSec