-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
	
CREATE PROCEDURE SH_FillStringWithVarData(@stString nvarchar(2000) output,
										 @stDataList nvarchar(2000),
										 @stDelim nvarchar(50))
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	declare @iIndex int;
	declare @iListPtr int;
	declare @stData nvarchar(2000); -- [comment omitted]
	
	-- [comment omitted]
	set @iListPtr = 0;
	exec SH_GetNextElement @stDataList, @stDelim, 
						   @iListPtr output, @stData output;
	
	-- [comment omitted]
	set @iIndex = 1;
	while (@stData is not null)
	begin
		set @stString = REPLACE(@stString, 
								N'<literal:1>' + CAST(@iIndex AS nvarchar(50)), 
								@stData);
		
		-- [comment omitted]
		exec SH_GetNextElement @stDataList, @stDelim, 
							   @iListPtr output, @stData output;
		set @iIndex = @iIndex + 1;
	end; -- [comment omitted]
-- [comment omitted]