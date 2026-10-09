/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	9593		| RAB			| 10/09/02	| Modified for standards.

	Returns the position of @iSts

	Parameters
		int		iSts			The status to search for.
		int		iStatus1-10		The 10 ShipmentDetail status fields.

	Return Value
		int						The position of @iSts.
*/
CREATE FUNCTION SDBfn_GetPosOfSts(
	@iSts numeric(3),
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
	if (@iSts = @iStatus1)
		return 1;
	else if (@iSts = @iStatus2) 
		return 2;
	else if (@iSts = @iStatus3) 
		return 3;
	else if (@iSts = @iStatus4) 
		return 4;
	else if (@iSts = @iStatus5) 
		return 5;
	else if (@iSts = @iStatus6) 
		return 6;
	else if (@iSts = @iStatus7) 
		return 7;
	else if (@iSts = @iStatus8) 
		return 8;
	else if (@iSts = @iStatus9) 
		return 9;
	else if (@iSts = @iStatus10) 
		return 10;

	return 0;
END -- end SDBfn_GetPosOfSts

