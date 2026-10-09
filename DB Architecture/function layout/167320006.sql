/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB			| 10/08/02	| Created.
	11870       | TBS           | 09/16/03  | Added Multi-Byte support.

	Returns the index of the last occurrence of the specified pattern in 
	the specified expression.  If the pattern is not found, 0 is returned.
	
	Parameters
		String		stPattern	The pattern to search for.
		String		stExpr		The string to search through.
		
	Return Value
		int						The last 1-based index of stPattern in
								stExpr or 0 if not found.
*/	
CREATE FUNCTION SHfn_LastIndexOf(
	@stPattern nvarchar(2000),
	@stExpr nvarchar(2000))
RETURNS int
BEGIN
	declare @iIndex int;
	declare @iNewIndex int;

	set @iIndex = 0;
	set @iNewIndex = CHARINDEX(@stPattern, @stExpr);
	
	while (@iNewIndex > 0)
	begin
		set @iIndex = @iNewIndex;
		set @iNewIndex = CHARINDEX(@stPattern, @stExpr, @iNewIndex + 1);
	end; -- end while through @stExpr
	
	return @iIndex;
END -- end SHfn_LastIndexOf