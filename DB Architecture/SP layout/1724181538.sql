/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	74631       | DBCGenerator  | 9/2/2010	| Created.
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IActionMenuOption(
	@actionName nvarchar(50) = NULL,
    @menuName nvarchar(50),
    @defaultValue nchar(1),
    @processStamp nvarchar(100),
    @separator nchar(1),
    @sequence numeric(9),
    @shortcutKey numeric(9) = NULL,
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
    
    declare @actionId numeric(9);
    declare @actionMenuId numeric(9);

	if(@actionName is null)
		set @actionId = null
	else
	    select @actionId = OBJECT_ID from DYNAMIC_ACTION where ACTION_NAME = @actionName;
    
    select @actionMenuId = OBJECT_ID from ACTION_MENU where MENU_NAME = @menuName;

    INSERT INTO ACTION_MENU_OPTION
        (ACTION_ID,
         ACTION_MENU_ID,
         DATE_TIME_STAMP,
         DEFAULT_VALUE,
         PROCESS_STAMP,
         SEPARATOR,
         SEQUENCE,
         SHORTCUT_KEY,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT @actionId,
           @actionMenuId,
           getutcdate(),
           @defaultValue,
           @processStamp,
           @separator,
           @sequence,
           @shortcutKey,
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
                        FROM ACTION_MENU_OPTION
                       WHERE ACTION_MENU_ID = @actionMenuId 
                       AND SEQUENCE = @sequence);
           
-- end dbc_IActionMenuOption