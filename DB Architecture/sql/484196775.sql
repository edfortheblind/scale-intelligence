-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
CREATE PROCEDURE [dbo].[PM_SHIPPED_TODAY_BY_MINUTE] 
	-- [comment omitted]
(
	@DATE_FROM datetime,
	@DATE_TO datetime,
	@DATE_RANGE_COLUMN nvarchar(50),
	@GROUP_BY_COLUMN nvarchar(50),
	@SELECT_COLUMN nvarchar(50),
	@TABLE_NAME nvarchar(50),
	@WAREHOUSE nvarchar(25) = NULL
)
AS
BEGIN
	-- [comment omitted]
	-- [comment omitted]
	SET NOCOUNT ON;

    -- [comment omitted]

	DECLARE @sql nvarchar(max);
	DECLARE @dataType nvarchar(20);

	SELECT @dataType = DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
	WHERE 
	TABLE_NAME = @Table_Name
	AND 
	COLUMN_NAME = @SELECT_COLUMN;  

SET @sql = '<literal:1>'






exec dbo.sp_executesql @sql
END