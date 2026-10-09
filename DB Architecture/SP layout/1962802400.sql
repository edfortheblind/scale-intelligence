/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 12/4/2003	| Created.
	102782		| DRK			| 11/8/12	| Modified to set nvarchar(max) directly since SCALE parser does not recognize this
	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IFilterConfigDetail(
    @active nchar(1),
    @description nvarchar(50),
    @filterName nvarchar(25),
    @filterStatement nvarchar(max) = NULL,
    @processStamp nvarchar(100),
    @recordType nvarchar(50),
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

    INSERT INTO FILTER_CONFIG_DETAIL
        (ACTIVE,
         DATE_TIME_STAMP,
         DESCRIPTION,
         FILTER_NAME,
         FILTER_STATEMENT,
         PROCESS_STAMP,
         RECORD_TYPE,
         SYSTEM_CREATED,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT @active,
           GETUTCDATE(),
           @description,
           @filterName,
           @filterStatement,
           @processStamp,
           @recordType,
           N'Y',
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
                        FROM FILTER_CONFIG_DETAIL
                       WHERE RECORD_TYPE = @recordType
                         AND FILTER_NAME = @filterName);
-- end dbc_IFilterConfigDetail
