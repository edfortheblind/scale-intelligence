
/****** Object:  User Defined Function dbo.fn_least    Script Date: 8/6/01 11:19:33 AM ******/
create function fn_least(
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
RETURNS decimal 
BEGIN
   declare @lowest decimal
   SET @lowest = @param1

   if (@param2 < @lowest) set @lowest = @param2
   if (@param3 < @lowest) set @lowest = @param3
   if (@param4 < @lowest) set @lowest = @param4
   if (@param5 < @lowest) set @lowest = @param5
   if (@param6 < @lowest) set @lowest = @param6
   if (@param7 < @lowest) set @lowest = @param7
   if (@param8 < @lowest) set @lowest = @param8
   if (@param9 < @lowest) set @lowest = @param9
   if (@param10 < @lowest) set @lowest = @param10

   return @lowest
END