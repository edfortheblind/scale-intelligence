-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE dbc_IScreenControl(
    @active char(1),
    @controlCssClass nvarchar(1000) = NULL,
    @controlName nvarchar(100),
    @controlType numeric(4),
    @dataSource nvarchar(2000) = NULL,
    @dataSourceType numeric(4) = NULL,
    @defaultAction nvarchar(250) = NULL,
    @defaultState numeric(4) = NULL,
    @divCssClass nvarchar(1000) = NULL,
    @labelOrientation numeric(4) = NULL,
    @processStamp nvarchar(100),
    @resourceKey nvarchar(50) = NULL,
    @screenGroupColumnId numeric(9) = NULL,
    @screenGroupId numeric(9),
    @sequence numeric(9),
    @templateName nvarchar(500) = NULL,
    @toolTipResourceKey nvarchar(50) = NULL,
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

    INSERT INTO SCREEN_CONTROL
        (ACTIVE,
         CONTROL_CSS_CLASS,
         CONTROL_NAME,
         CONTROL_TYPE,
         DATA_SOURCE,
         DATA_SOURCE_TYPE,
         DATE_TIME_STAMP,
         DEFAULT_ACTION,
         DEFAULT_STATE,
         DIV_CSS_CLASS,
         LABEL_ORIENTATION,
         PROCESS_STAMP,
         RESOURCE_KEY,
         SCREEN_GROUP_COLUMN_ID,
         SCREEN_GROUP_ID,
         SEQUENCE,
         SYSTEM_CREATED,
         TEMPLATE_NAME,
         TOOL_TIP_RESOURCE_KEY,
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
           @controlCssClass,
           @controlName,
           @controlType,
           @dataSource,
           @dataSourceType,
           getutcdate(),
           @defaultAction,
           @defaultState,
           @divCssClass,
           @labelOrientation,
           @processStamp,
           @resourceKey,
           @screenGroupColumnId,
           @screenGroupId,
           @sequence,
           N'<literal:1>',
           @templateName,
           @toolTipResourceKey,
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
                        FROM SCREEN_CONTROL
                       WHERE CONTROL_NAME = @controlName and SCREEN_GROUP_ID = @screenGroupId);
-- [comment omitted]