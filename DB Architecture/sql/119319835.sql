-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















CREATE FUNCTION SDBfn_GetQtyAtSts(
	@iSts		numeric(3),
	@iStatus1	numeric(3) = 0,
	@iStatus2	numeric(3) = 0,
	@iStatus3	numeric(3) = 0,
	@iStatus4	numeric(3) = 0,
	@iStatus5	numeric(3) = 0,
	@iStatus6	numeric(3) = 0,
	@iStatus7	numeric(3) = 0,
	@iStatus8	numeric(3) = 0,
	@iStatus9	numeric(3) = 0,
	@iStatus10	numeric(3) = 0,
	@dQtyAtSts1  numeric(19,5) = 0.0,
	@dQtyAtSts2  numeric(19,5) = 0.0,
	@dQtyAtSts3  numeric(19,5) = 0.0,
	@dQtyAtSts4  numeric(19,5) = 0.0,
	@dQtyAtSts5  numeric(19,5) = 0.0,
	@dQtyAtSts6  numeric(19,5) = 0.0,
	@dQtyAtSts7  numeric(19,5) = 0.0,
	@dQtyAtSts8  numeric(19,5) = 0.0,
	@dQtyAtSts9  numeric(19,5) = 0.0,
	@dQtyAtSts10 numeric(19,5) = 0.0)
RETURNS numeric(19,5)
BEGIN
	if (@iSts = @iStatus1)
		return @dQtyAtSts1;
	else if (@iSts = @iStatus2) 
		return @dQtyAtSts2;
	else if (@iSts = @iStatus3) 
		return @dQtyAtSts3;
	else if (@iSts = @iStatus4) 
		return @dQtyAtSts4;
	else if (@iSts = @iStatus5) 
		return @dQtyAtSts5;
	else if (@iSts = @iStatus6) 
		return @dQtyAtSts6;
	else if (@iSts = @iStatus7) 
		return @dQtyAtSts7;
	else if (@iSts = @iStatus8) 
		return @dQtyAtSts8;
	else if (@iSts = @iStatus9) 
		return @dQtyAtSts9;
	else if (@iSts = @iStatus10) 
		return @dQtyAtSts10;
	
	return 0.0;
END -- [comment omitted]

