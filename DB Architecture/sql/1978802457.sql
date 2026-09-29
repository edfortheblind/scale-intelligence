-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE dbc_IFilterConfigHeader(
	@allowMatches nchar(1) = N'<literal:1>',
    @allowOrderBy nchar(1),
    @description nvarchar(50),
    @doPath nvarchar(500),
    @joinClause nvarchar(2000) = NULL,
    @processStamp nvarchar(100),
    @recordType nvarchar(50),
    @tableDoName nvarchar(500) = NULL,
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
	@valueTableName varchar(500) = NULL)
AS
    SET NOCOUNT ON;

    INSERT INTO FILTER_CONFIG_HEADER
        (ALLOW_MATCHES,
         ALLOW_ORDER_BY,
         DATE_TIME_STAMP,
         DESCRIPTION,
         DO_PATH,
         JOIN_CLAUSE,
         PROCESS_STAMP,
         RECORD_TYPE,
         SYSTEM_CREATED,
         TABLE_DO_NAME,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP,
		 VALUE_TABLE_NAME)
    SELECT @allowMatches,
           @allowOrderBy,
           GETUTCDATE(),
           @description,
           @doPath,
           @joinClause,
           @processStamp,
           @recordType,
           N'<literal:2>',
           @tableDoName,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:3>',
		   @valueTableName
     WHERE NOT EXISTS(SELECT *
                        FROM FILTER_CONFIG_HEADER
                       WHERE RECORD_TYPE = @recordType);
-- [comment omitted]