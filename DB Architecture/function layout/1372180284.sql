/*
Mod Number	| Programmer	| Date   	| Modification Description
--------------------------------------------------------------------
169395		| MJ			| 06/01/16	| Created.
*/
CREATE FUNCTION ConvertKeyValueTableToXML
(
 @table KeyValueTableType READONLY
)RETURNS nvarchar(max)
	AS BEGIN

	Declare @RETURNVALUE as nvarchar(max);

	select @RETURNVALUE = (	

		SELECT [Key] ,Value FROM @table FOR XML PATH(N'KeyValueOfstringstring'), ROOT(N'ArrayOfKeyValueOfstringstring')
	)
	select @RETURNVALUE = replace(@RETURNVALUE,N'<ArrayOfKeyValueOfstringstring', N'<ArrayOfKeyValueOfstringstring xmlns:i=''http://www.w3.org/2001/XMLSchema-instance'' xmlns=''http://schemas.microsoft.com/2003/10/Serialization/Arrays'' ')		

	return @RETURNVALUE;
	END