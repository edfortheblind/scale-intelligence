/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	9593		| RAB			| 10/09/02	| Modified for standards.

	Returns the position of the highest status.

	Parameters
		int		iStatus1-10		The 10 ShipmentDetail status fields.

	Return Value
		int						The position of the highest status.
*/
CREATE FUNCTION SDBfn_GetLeadingStsPos(
	@iStatus1	numeric(3) = 0,
	@iStatus2	numeric(3) = 0,
	@iStatus3	numeric(3) = 0,
	@iStatus4	numeric(3) = 0,
	@iStatus5	numeric(3) = 0,
	@iStatus6	numeric(3) = 0,
	@iStatus7	numeric(3) = 0,
	@iStatus8	numeric(3) = 0,
	@iStatus9	numeric(3) = 0,
	@iStatus10	numeric(3) = 0)
RETURNS int
BEGIN
	if (@iStatus1 = 0)
		return 0;
	else if (@iStatus2 = 0)
		return 1;
	else if (@iStatus3 = 0)
		return 2;
	else if (@iStatus4 = 0)
		return 3;
	else if (@iStatus5 = 0)
		return 4;
	else if (@iStatus6 = 0)
		return 5;
	else if (@iStatus7 = 0)
		return 6;
	else if (@iStatus8 = 0)
		return 7;
	else if (@iStatus9 = 0)
		return 8;
	else if (@iStatus10 = 0)
		return 9;
	else 
		return 10;
	
	return 0;
END -- end SDBfn_GetLeadingStsPos