/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	  153125    | MJ	    | 2/4/2015	| Created.
	  224179	| SO		| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IMainUiWmLicenseXrefOriginal(
    @advanced nchar(1),
    @licenseKeyModule nvarchar(100),
    @mainUiScreenId numeric(9),
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

    INSERT INTO MAIN_UI_WM_LICENSE_XREF
        (ADVANCED,
         DATE_TIME_STAMP,
         LICENSE_KEY_MODULE,
         MAIN_UI_SCREEN_ID,
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
    SELECT @advanced,
           getutcdate(),
           @licenseKeyModule,
           MAIN_UI_SCREEN.OBJECT_ID,
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
    FROM
     	MAIN_UI_SCREEN              
     WHERE NOT EXISTS(SELECT *
                        FROM MAIN_UI_WM_LICENSE_XREF
                       WHERE MAIN_UI_SCREEN_ID = MAIN_UI_SCREEN.OBJECT_ID
                       		AND 
                       		LICENSE_KEY_MODULE = @licenseKeyModule
                       		AND
                       		ADVANCED = @advanced)
            AND MAIN_UI_SCREEN.OBJECT_ID = @mainUiScreenId;
-- end dbc_IMainUiWmLicenseXrefOriginal