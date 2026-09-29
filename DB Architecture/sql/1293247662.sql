-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */
create function fn_greatest(
	@param1 decimal = null,
	@param2 decimal = null,
	@param3 decimal = null,
	@param4 decimal = null,
	@param5 decimal = null,
	@param6 decimal = null,
	@param7 decimal = null,
	@param8 decimal = null,
	@param9 decimal = null,
	@param10 decimal = null)
RETURNS decimal AS
BEGIN
   declare @highest decimal
   SET @highest = @param1

   if (@param2 > @highest) set @highest = @param2
   if (@param3 > @highest) set @highest = @param3
   if (@param4 > @highest) set @highest = @param4
   if (@param5 > @highest) set @highest = @param5
   if (@param6 > @highest) set @highest = @param6
   if (@param7 > @highest) set @highest = @param7
   if (@param8 > @highest) set @highest = @param8
   if (@param9 > @highest) set @highest = @param9
   if (@param10 > @highest) set @highest = @param10

   return @highest
END