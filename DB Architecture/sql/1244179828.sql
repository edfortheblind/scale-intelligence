-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







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

	-- [comment omitted]
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