/*
Mod Number | Programmer | Date     | Modification Description
--------------------------------------------------------------------
158153     | SP         | 03/16/15 | Created.

Function to get the last identity value inserted for the given table for the Configuration Coordinator toolbox utility
*/

CREATE FUNCTION CdGetIdentityColumn(
	@table_name nvarchar(128), 
	@column nvarchar(128), 
	@value nvarchar(max), 
	@operation int, 
	@isFk char)
RETURNS NVARCHAR(MAX)
WITH EXECUTE AS CALLER
AS
BEGIN
	DECLARE @ret NVARCHAR(max);

	--get the last identity value inserted for the given table
	SELECT @ret=CURRENT_VALUE 
	FROM CONFIG_DIR_CdGetIdentityColumn_DATA 
	WHERE TABLE_NAME=@table_name 
		and COLUMN_NAME=@column
		and ORIGINAL_VALUE=@value;
	
	IF(@ret is null)
	BEGIN
		SET @ret = @value;
	END

	RETURN (SELECT @ret);
END