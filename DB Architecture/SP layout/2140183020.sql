/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	      17568 | SAT  	    | 9/20/2005	| Created.
		  224179| SO		| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/


CREATE PROCEDURE dbc_IMainUiTemplate(
    @active nchar(1),
    @description nvarchar(50),
    @processStamp nvarchar(100),
    @template nvarchar(25),
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

    INSERT INTO MAIN_UI_TEMPLATE
        (ACTIVE,
         DATE_TIME_STAMP,
         DESCRIPTION,
         PROCESS_STAMP,
         TEMPLATE,
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
           getutcdate(),
           @description,
           @processStamp,
           @template,
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
                        FROM MAIN_UI_TEMPLATE
                       WHERE TEMPLATE = @template);
-- end dbc_IMainUiTemplate



