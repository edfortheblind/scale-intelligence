-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















	
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
	end; -- [comment omitted]
	
	return @iIndex;
END -- [comment omitted]