/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 6/10/2005	| Created.
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/

CREATE PROCEDURE dbc_IArchiveTables(
    @maxRows numeric(5),
    @processStamp nvarchar(100),
    @tableName nvarchar(50),
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

    INSERT INTO ARCHIVE_TABLES
        (DATE_TIME_STAMP,
         MAX_ROWS,
         PROCESS_STAMP,
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
           @maxRows,
           @processStamp,
           @tableName,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'System'
     WHERE NOT EXISTS(SELECT *
                        FROM ARCHIVE_TABLES
                       WHERE TABLE_NAME = @tableName);
-- end dbc_IArchiveTables
