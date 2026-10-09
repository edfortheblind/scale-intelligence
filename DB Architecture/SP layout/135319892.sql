	
CREATE PROCEDURE SH_FillStringWithVarData(@stString nvarchar(2000) output,
										 @stDataList nvarchar(2000),
										 @stDelim nvarchar(50))
AS
	SET NOCOUNT ON;

	-- local variables
	declare @iIndex int;
	declare @iListPtr int;
	declare @stData nvarchar(2000); -- TEXT used to set varchar type
	
	-- grab the first element.
	set @iListPtr = 0;
	exec SH_GetNextElement @stDataList, @stDelim, 
						   @iListPtr output, @stData output;
	
	-- loop through all data.
	set @iIndex = 1;
	while (@stData is not null)
	begin
		set @stString = REPLACE(@stString, 
								N'&' + CAST(@iIndex AS nvarchar(50)), 
								@stData);
		
		-- grab the next data.
		exec SH_GetNextElement @stDataList, @stDelim, 
							   @iListPtr output, @stData output;
		set @iIndex = @iIndex + 1;
	end; -- end loop through @stInstrList
-- end SH_FillStringWithVarData