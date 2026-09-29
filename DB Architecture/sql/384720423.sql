-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE dbc_IWarehouseMobileMenu(
    @active nvarchar(1),
    @formId numeric(5) = NULL,
    @menuOptionName nvarchar(50),
    @menuResourceKey nvarchar(50) = NULL,
    @parentObjectId numeric(9) = NULL,
    @processStamp nvarchar(100),
    @sequence numeric(2) = NULL,
    @srcIdentifier nvarchar(50) = NULL,
    @submenuAuthorization nvarchar(50) = NULL,
	@systemCreated nchar(1) = N'<literal:1>',
    @submenuName nvarchar(50) = NULL,
    @submenuResourceKey nvarchar(50) = NULL,
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

    INSERT INTO WAREHOUSE_MOBILE_MENU
        (ACTIVE,
         DATE_TIME_STAMP,
         FORM_ID,
         MENU_OPTION_NAME,
         MENU_RESOURCE_KEY,
         PARENT_OBJECT_ID,
         PROCESS_STAMP,
         SEQUENCE,
         SRC_IDENTIFIER,
         SUBMENU_AUTHORIZATION,
         SUBMENU_NAME,
         SUBMENU_RESOURCE_KEY,
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
           getDate(),
           @formId,
           @menuOptionName,
           @menuResourceKey,
           @parentObjectId,
           @processStamp,
           @sequence,
           @srcIdentifier,
           @submenuAuthorization,
           @submenuName,
           @submenuResourceKey,
		   @systemCreated,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:2>'
     WHERE NOT EXISTS(SELECT *
                        FROM WAREHOUSE_MOBILE_MENU
                       WHERE MENU_OPTION_NAME = @menuOptionName and ((PARENT_OBJECT_ID is null AND @parentObjectId is null) OR PARENT_OBJECT_ID =@parentObjectId)) ;
-- [comment omitted]