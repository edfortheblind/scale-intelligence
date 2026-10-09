/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	19522	| SSG	| 07/28/06	| Created.
	89977 	| DN	| 09/21/11	| Added order clause
	
		
	Parameters:
		DATE_FROM  		Lower end of the date range.
		DATE_TO	   		Higher end of the date range.
		DATE_RANGE_COLUMN	Date range column name
		SELECT_COLUMN		Represents y-asis of the chart
		GROUP_BY_COLUMN		Represents group by column name of the chart data
		TABLE_NAME		Table to get records from
		WAREHOUSE		Represents the warehouse to fetch records from

	Returns:
		Data From SHIPMENT_HEADER table.

*/


CREATE PROCEDURE PM_SHIPMENTHEADER01
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
	
	IF @Warehouse = N''
	SET @Warehouse = NULL;

	SELECT @dataType = DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
	WHERE 
	TABLE_NAME = @Table_Name
	AND 
	COLUMN_NAME = @SELECT_COLUMN;
	
	IF @SELECT_COLUMN = N'COUNT(*)'
	SET @SELECT_COLUMN = N'COUNT(*) AS TOTAL_SHIPMENTS';

	ELSE IF (@dataType = N'numeric')
	SET @SELECT_COLUMN = N'SUM(' + @SELECT_COLUMN + N') AS ' + @SELECT_COLUMN;
	
	ELSE
	SET @SELECT_COLUMN = N'COUNT(' + @SELECT_COLUMN +N') AS ' + @SELECT_COLUMN;

	SELECT @dataType = DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
	WHERE 
	TABLE_NAME = @Table_Name
	AND 
	COLUMN_NAME = @Group_By_Column;
	
	IF (@dataType = N'datetime')
	BEGIN

	SET @sql = N'SELECT CONVERT(DateTime, FLOOR(CONVERT( Float, '+ @GROUP_BY_COLUMN +N'))) As '+ @GROUP_BY_COLUMN + N',' 
	+ @SELECT_COLUMN +N'
	FROM '+ @TABLE_NAME +N' 
	WHERE '+ @DATE_RANGE_COLUMN +N'
	BETWEEN CONVERT(datetime, @Date_From) 
	AND CONVERT(datetime,@Date_To) 
	AND Warehouse = ISNULL(@Warehouse, Warehouse) 
	GROUP BY CONVERT(DateTime, FLOOR( CONVERT( Float, '+ @GROUP_BY_COLUMN + N')))'
	+ N'ORDER BY CONVERT(DateTime, FLOOR( CONVERT( Float, '+ @GROUP_BY_COLUMN + N')))';

	exec dbo.sp_executesql @sql,
	N'@DATE_FROM datetime,
	@DATE_TO datetime,
	@DATE_RANGE_COLUMN nvarchar(50),
	@GROUP_BY_COLUMN nvarchar(50),
	@SELECT_COLUMN nvarchar(50),
	@WAREHOUSE nvarchar(25)',
	@DATE_FROM, @DATE_TO, @DATE_RANGE_COLUMN, @GROUP_BY_COLUMN, @SELECT_COLUMN, @WAREHOUSE;

	END;

	ELSE 
	BEGIN

	SET @sql = N'SELECT '+ @GROUP_BY_COLUMN + N',' 
	+ @SELECT_COLUMN +N'
	FROM '+ @TABLE_NAME +N' 
	WHERE '+ @DATE_RANGE_COLUMN +N'
	BETWEEN CONVERT(datetime, @Date_From) 
	AND CONVERT(datetime,@Date_To) 
	AND Warehouse = ISNULL(@Warehouse, Warehouse) 
	GROUP BY '+ @GROUP_BY_COLUMN 
	+ N' ORDER BY '+ @GROUP_BY_COLUMN ;

	exec dbo.sp_executesql @sql,
	N'@DATE_FROM datetime,
	@DATE_TO datetime,
	@DATE_RANGE_COLUMN nvarchar(50),
	@GROUP_BY_COLUMN nvarchar(50),
	@SELECT_COLUMN nvarchar(50),
	@WAREHOUSE nvarchar(25)',
	@DATE_FROM, @DATE_TO, @DATE_RANGE_COLUMN, @GROUP_BY_COLUMN, @SELECT_COLUMN, @WAREHOUSE;
	

	END;
	



END 


