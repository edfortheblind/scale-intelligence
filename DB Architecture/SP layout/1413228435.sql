/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	17668		| RAB		| 10/13/05	| Created.
	161011		| SAM		| 06/03/15	| Modified NNR_GetNextNumber to return MinValue when NextNum exceeds MaxValue.

	Retrieves the next number for the specified key.
*/	

CREATE PROCEDURE NNR_GetNextNumber(
	@nextNumKey nvarchar(25),
	@nextNum nvarchar(25) output)
AS
	SET NOCOUNT ON;

	-- select and increment the counter in one statement to 
	-- make this a thread safe operation.
	update
		next_number
	set
		@nextNum = next_num,
		next_num = 
			case
				when cast(next_num as numeric) >= max_value
				then min_value
				else cast(next_num as numeric) + 1
			end
	where
		next_num_key = @nextNumKey;
-- end NNR_GetNextNumber