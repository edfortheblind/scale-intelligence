-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





















-- [comment omitted]


CREATE PROCEDURE PM_WORKINSTRUCTION01
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
	SET NOCOUNT ON;
	
	DECLARE @sql nvarchar(max);
	DECLARE @dataType nvarchar(20);
	
	IF @Warehouse = N'<literal:1>'
	SET @Warehouse = NULL;

	SELECT @dataType = DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
	WHERE 
	TABLE_NAME = @Table_Name
	AND 
	COLUMN_NAME = @SELECT_COLUMN;
	
	IF @SELECT_COLUMN = N'<literal:2>'
	SET @SELECT_COLUMN = N'<literal:3>';

	ELSE IF (@dataType = N'<literal:4>')
	SET @SELECT_COLUMN = N'<literal:5>' + @SELECT_COLUMN + N'<literal:6>' + @SELECT_COLUMN;

	ELSE	
	SET @SELECT_COLUMN = N'<literal:7>' + @SELECT_COLUMN +N'<literal:8>' + @SELECT_COLUMN;
	
	SELECT @dataType = DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
	WHERE 
	TABLE_NAME = @Table_Name
	AND 
	COLUMN_NAME = @Group_By_Column;
	
	IF (@dataType = N'<literal:9>')
	BEGIN

	SET @sql = N'<literal:10>'+ @GROUP_BY_COLUMN +N'<literal:11>'+ @GROUP_BY_COLUMN + N'<literal:12>' 
	+ @SELECT_COLUMN +N'<literal:13>'
+ @TABLE_NAME +N'<literal:14>'
+ @DATE_RANGE_COLUMN +N'<literal:15>'










+ @GROUP_BY_COLUMN + N'<literal:16>';

	exec dbo.sp_executesql @sql,
	N'<literal:17>'







,
	@DATE_FROM, @DATE_TO, @DATE_RANGE_COLUMN, @GROUP_BY_COLUMN, @SELECT_COLUMN, @WAREHOUSE,
	@HEADER=N'<literal:18>', @IN_PROCESS=N'<literal:19>', @OPEN=N'<literal:20>';
	

	END;

	ELSE
	BEGIN

	SET @sql = N'<literal:21>'+ @GROUP_BY_COLUMN + N'<literal:22>' 
	+ @SELECT_COLUMN +N'<literal:23>'
+ @TABLE_NAME +N'<literal:24>'
+ @DATE_RANGE_COLUMN +N'<literal:25>'










+ @GROUP_BY_COLUMN ;

	exec dbo.sp_executesql @sql,
	N'<literal:26>'







,
	@DATE_FROM, @DATE_TO, @DATE_RANGE_COLUMN, @GROUP_BY_COLUMN, @SELECT_COLUMN, @WAREHOUSE,
	@HEADER=N'<literal:27>', @IN_PROCESS=N'<literal:28>', @OPEN=N'<literal:29>';
	
	

	END;

END	


