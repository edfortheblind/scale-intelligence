-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













CREATE PROCEDURE dbc_IScreenPart(
    @active char(1),
    @defaultAction nvarchar(250) = NULL,
    @divCssClass nvarchar(1000) = NULL,
    @partName nvarchar(50),
    @partType numeric(3),
    @partialView nchar(1) = N'<literal:1>',
    @processStamp nvarchar(100),
    @resourceKey nvarchar(50) = NULL,
    @screenId numeric(9),
    @sequence numeric(9),
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

    INSERT INTO SCREEN_PART
        (ACTIVE,
         DATE_TIME_STAMP,
         DEFAULT_ACTION,
         DIV_CSS_CLASS,
         PART_NAME,
         PART_TYPE,
         PARTIAL_VIEW,
         PROCESS_STAMP,
         RESOURCE_KEY,
         SCREEN_ID,
         SEQUENCE,
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
           getutcdate(),
           @defaultAction,
           @divCssClass,
           @partName,
           @partType,
           @partialView,
           @processStamp,
           @resourceKey,
           @screenId,
           @sequence,
           N'<literal:2>',
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:3>'
     WHERE NOT EXISTS(SELECT *
                        FROM SCREEN_PART
                       WHERE PART_NAME = @partName and SCREEN_ID = @screenId);
-- [comment omitted]