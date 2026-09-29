-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */














CREATE FUNCTION SDBfn_GetLeadingStsInRange(
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
RETURNS numeric(3)										   
BEGIN
	
	-- [comment omitted]
	
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	if (@iStatus1 = 0 or @iStatus1 >= 994)
		return -1;
	else if (@iStatus2 = 0 or @iStatus2 >= 994)
		return @iStatus1;
	else if (@iStatus3 = 0 or @iStatus3 >= 994)
		return @iStatus2;
	else if (@iStatus4 = 0 or @iStatus4 >= 994)
		return @iStatus3;
	else if (@iStatus5 = 0 or @iStatus5 >= 994)
		return @iStatus4;
	else if (@iStatus6 = 0 or @iStatus6 >= 994)
		return @iStatus5;
	else if (@iStatus7 = 0 or @iStatus7 >= 994)
		return @iStatus6;
	else if (@iStatus8 = 0 or @iStatus8 >= 994)
		return @iStatus7;
	else if (@iStatus9 = 0 or @iStatus9 >= 994)
		return @iStatus8;
	else if (@iStatus10 = 0 or @iStatus10 >= 994)
		return @iStatus9;
	else 
		return @iStatus10;	

	return 0;

END -- [comment omitted]


