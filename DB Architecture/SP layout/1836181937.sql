/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 9/8/2005	 | Created.
	 57048      | MM			| 09/01/09	 | Added New fields
	 224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.
	Inserts a record for dbChange scripts.
*/

CREATE PROCEDURE dbc_IDataRetrievalStmtHeader(
    @processStamp nvarchar(100),
    @statementDesc nvarchar(50),
    @stmtHeaderKeyNum numeric(9),
    @calculationQuery nchar(1) = N'N',
    @allowExternalDataSource nchar(1) = N'N',
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL)
AS
    SET NOCOUNT ON;

    INSERT INTO DATA_RETRIEVAL_STMT_HEADER
        (DATE_TIME_STAMP,
         PROCESS_STAMP,
         STATEMENT_DESC,
         STMT_HEADER_KEY_NUM,
         SYSTEM_CREATED,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP,
         CALCULATION_QUERY,
         ALLOW_EXTERNAL_DATA_SOURCE)
    SELECT getutcdate(),
           @processStamp,
           @statementDesc,
           @stmtHeaderKeyNum,
           N'Y',
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'System',
           @calculationQuery,
           @allowExternalDataSource
     WHERE NOT EXISTS(SELECT *
                        FROM DATA_RETRIEVAL_STMT_HEADER
                       WHERE STMT_HEADER_KEY_NUM = @stmtHeaderKeyNum);
-- end dbc_IDataRetrievalStmtHeader


