-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE dbc_IWebScreenDataHeader(
    @active nchar(1) = N'<literal:1>',
    @assemblyName nvarchar(100) = N'<literal:2>',
    @className nvarchar(100) = N'<literal:3>',
    @company nvarchar(25) = NULL,
    @fieldListMethodName nvarchar(100) = N'<literal:4>',
    @maxNumFields numeric(9) = 0,
    @packageName nvarchar(100) = N'<literal:5>',
    @parentScreen nvarchar(50) = NULL,
    @processStamp nvarchar(100),
    @screenName nvarchar(50),
    @screenType nvarchar(25),
    @urlToCall nvarchar(500) = NULL,
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

    INSERT INTO WEB_SCREEN_DATA_HEADER
        (ACTIVE,
         ASSEMBLY_NAME,
         CLASS_NAME,
         COMPANY,
         DATE_TIME_STAMP,
         FIELD_LIST_METHOD_NAME,
         MAX_NUM_FIELDS,
         PACKAGE_NAME,
         PARENT_SCREEN,
         PROCESS_STAMP,
         SCREEN_NAME,
         SCREEN_TYPE,
         SYSTEM_CREATED,
         URL_TO_CALL,
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
           @assemblyName,
           @className,
           @company,
           getutcdate(),
           @fieldListMethodName,
           @maxNumFields,
           @packageName,
           @parentScreen,
           @processStamp,
           @screenName,
           @screenType,
           N'<literal:6>',
           @urlToCall,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:7>'
     WHERE NOT EXISTS(SELECT *
                        FROM WEB_SCREEN_DATA_HEADER
                       WHERE SCREEN_NAME = @screenName);
-- [comment omitted]
