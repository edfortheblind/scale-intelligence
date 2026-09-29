-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
	
CREATE PROCEDURE SH_GetNextElement(
	@stList nvarchar(2000),
	@stDelim nvarchar(50),
	@iPtr int = 0 output,
	@stNextElement nvarchar(2000) = null output)
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	declare @iDiff int;
	declare @iNextDelim int;
	
	-- [comment omitted]
	if (@iPtr > len(@stList))
	begin
		set @stNextElement = null;
		return;
	end;
    
	set @iNextDelim = charindex(@stDelim, @stList, @iPtr);
	
	if (@iNextDelim <= 0)
		set @iNextDelim = len(@stList) + 1;
		
	set @iDiff = @iNextDelim - @iPtr;
	set @stNextElement = substring(@stList, @iPtr, @iDiff);
	set @iPtr = @iNextDelim + len(@stDelim);

-- [comment omitted]
