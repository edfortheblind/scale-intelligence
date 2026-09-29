-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE PROCEDURE dbc_IMainUiTemplateFunGrpXref(
    @functionalGroup nvarchar(50),
    @template nvarchar(25),
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

    INSERT INTO MAIN_UI_TEMP_FUN_GRP_XREF
        (DATE_TIME_STAMP,
         FUNCTIONAL_GROUP,
         MAIN_UI_TEMPLATE_ID,
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
    SELECT getutcdate(),
           @functionalGroup,
           OBJECT_ID,
           @processStamp,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:1>'
     FROM MAIN_UI_TEMPLATE
     WHERE TEMPLATE = @template AND NOT EXISTS (SELECT * 
     						FROM MAIN_UI_TEMP_FUN_GRP_XREF
     						WHERE FUNCTIONAL_GROUP = @functionalGroup
     						AND MAIN_UI_TEMPLATE_ID = MAIN_UI_TEMPLATE.OBJECT_ID);
-- [comment omitted]



