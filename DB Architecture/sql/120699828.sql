-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */









CREATE PROCEDURE dbc_IPmChartdata(
    @chartType nvarchar(50),
    @dateRangeColumn nvarchar(50),
    @groupByColumn nvarchar(50),
    @selectColumn nvarchar(50),
    @sequence numeric(9),
    @storedProcedure nvarchar(50),
    @tableName nvarchar(50),
    @title nvarchar(50),
    @processStamp nvarchar(100))
AS
    SET NOCOUNT ON;

    INSERT INTO PM_CHARTDATA
        (CHART_TYPE,
         DATE_RANGE_COLUMN,
         DATE_TIME_STAMP,
         GROUP_BY_COLUMN,	
	 PROCESS_STAMP,         
         SELECT_COLUMN,
         SEQUENCE,
         STORED_PROCEDURE,
         TABLE_NAME,
         TITLE,
         USER_STAMP)
    SELECT @chartType,
           @dateRangeColumn,
           getutcdate(),
           @groupByColumn,
           @processStamp,
           @selectColumn,
           @sequence,
           @storedProcedure,
           @tableName,
           @title,
           N'<literal:1>'
     WHERE NOT EXISTS(SELECT *
                        FROM PM_CHARTDATA
                       WHERE SEQUENCE = @sequence);
-- [comment omitted]
