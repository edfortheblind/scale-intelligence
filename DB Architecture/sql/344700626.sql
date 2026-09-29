-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */














CREATE PROCEDURE dbc_IScreenGroup(
    @active char(1),
    @contentLoadingType numeric(5) = 0,
    @defaultAction nvarchar(250) = NULL,
    @divCssClass nvarchar(1000) = NULL,
    @fixedToTop char(1) = N'<literal:1>',
    @groupName nvarchar(50),
    @groupType numeric(3),
    @nestedGroupUnit numeric(9),
    @parentGroupId numeric(9) = NULL,
    @processStamp nvarchar(100),
    @resourceKey nvarchar(50) = NULL,
    @rowCssClass nvarchar(1000) = NULL,
    @screenPartId numeric(9),
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

    INSERT INTO SCREEN_GROUP
        (ACTIVE,
         Content_Loading_Type,
         DATE_TIME_STAMP,
         DEFAULT_ACTION,
         DIV_CSS_CLASS,
         FIXED_TO_TOP,
         GROUP_NAME,
         GROUP_TYPE,
         NESTED_GROUP_UNIT,
         PARENT_GROUP_ID,
         PROCESS_STAMP,
         RESOURCE_KEY,
         ROW_CSS_CLASS,
         SCREEN_PART_ID,
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
           @contentLoadingType,
           getutcdate(),
           @defaultAction,
           @divCssClass,
           @fixedToTop,
           @groupName,
           @groupType,
           @nestedGroupUnit,
           @parentGroupId,
           @processStamp,
           @resourceKey,
           @rowCssClass,
           @screenPartId,
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
                        FROM SCREEN_GROUP
                       WHERE GROUP_NAME = @groupName and SCREEN_PART_ID = @screenPartId);
-- [comment omitted]
-- [comment omitted]