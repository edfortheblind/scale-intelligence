-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




CREATE FUNCTION ConvertKeyValueTableToXML
(
 @table KeyValueTableType READONLY
)RETURNS nvarchar(max)
	AS BEGIN

	Declare @RETURNVALUE as nvarchar(max);

	select @RETURNVALUE = (	

		SELECT [Key] ,Value FROM @table FOR XML PATH(N'<literal:1>'), ROOT(N'<literal:2>')
	)
	select @RETURNVALUE = replace(@RETURNVALUE,N'<literal:3>', N'<literal:4>')		

	return @RETURNVALUE;
	END