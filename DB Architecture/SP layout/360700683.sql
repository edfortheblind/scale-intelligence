/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	            | DBCGenerator  | 3/26/2014	| Created.
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IScreenGroupColumn(
    @columnCssClass nvarchar(1000) = NULL,
    @columnName nvarchar(50),
	@screenGroupId numeric(9),
	@sequence numeric(9),
    @processStamp nvarchar(100),
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

    INSERT INTO SCREEN_GROUP_COLUMN
        (COLUMN_CSS_CLASS,
         COLUMN_NAME,
		 SCREEN_GROUP_ID,
		 SEQUENCE,
		 SYSTEM_CREATED, 
         DATE_TIME_STAMP,
         PROCESS_STAMP,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT @columnCssClass,
           @columnName,
		   @screenGroupId,
		   @sequence,
		   N'Y', 
           getutcdate(),
           @processStamp,
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
                        FROM SCREEN_GROUP_COLUMN
                       WHERE COLUMN_NAME = @columnName and SCREEN_GROUP_ID = @screenGroupId);
-- end dbc_IScreenGroupColumn