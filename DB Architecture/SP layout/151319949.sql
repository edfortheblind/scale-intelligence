	
CREATE PROCEDURE SH_GetNextElement(
	@stList nvarchar(2000),
	@stDelim nvarchar(50),
	@iPtr int = 0 output,
	@stNextElement nvarchar(2000) = null output)
AS
	SET NOCOUNT ON;

	-- local variables
	declare @iDiff int;
	declare @iNextDelim int;
	
	-- if at the end of the list, return null
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

-- end SH_GetNextElement
