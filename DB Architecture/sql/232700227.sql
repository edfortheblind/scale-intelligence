-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE PROCEDURE dbc_IReportConnection(
	@document nvarchar(25),
	@processStamp nvarchar(100),
	@retrievingClass nvarchar(100),
	@storedProcedure nvarchar(50),
	@subreportName nvarchar(50) = NULL,
	@tableName nvarchar(50),
	@userDef1 nvarchar(25) = NULL,
	@userDef2 nvarchar(25) = NULL,
	@userDef3 nvarchar(25) = NULL,
	@userDef4 nvarchar(25) = NULL,
	@userDef5 nvarchar(25) = NULL,
	@userDef6 nvarchar(25) = NULL,
	@userDef7 numeric(19,5) = 0,
	@userDef8 numeric(19,5) = 0)
AS
	SET NOCOUNT ON;

	INSERT INTO REPORT_CONNECTION
        	(DATE_TIME_STAMP,
	         DOCUMENT,
        	 PROCESS_STAMP,
	         RETRIEVING_CLASS,
        	 STORED_PROCEDURE,
	         SUBREPORT_NAME,
        	 TABLE_NAME,
        	 USER_DEF1,
	         USER_DEF2,
        	 USER_DEF3,
	         USER_DEF4,
	         USER_DEF5,
        	 USER_DEF6,
	         USER_DEF7,
	         USER_DEF8,
        	 USER_STAMP)
	SELECT getutcdate(),
        	@document,
	        @processStamp,
        	@retrievingClass,
	        @storedProcedure,
        	@subreportName,
	        @tableName,
        	@userDef1,
	        @userDef2,
	        @userDef3,
	        @userDef4,
	        @userDef5,
        	@userDef6,
	        @userDef7,
	        @userDef8,
           	N'<literal:1>'
	WHERE NOT EXISTS(SELECT *
                        FROM REPORT_CONNECTION
                       	WHERE DOCUMENT = @document
                        AND TABLE_NAME = @tableName
                        AND ISNULL(SUBREPORT_NAME, N'<literal:2>') = ISNULL(@subreportName, N'<literal:3>'));
-- [comment omitted]
