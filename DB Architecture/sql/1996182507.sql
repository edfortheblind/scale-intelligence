-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE dbc_IFilterAttributes(
    @attribute nvarchar(100),
    @displayDesc nchar(1),
    @fieldType nvarchar(8),
    @processStamp nvarchar(100),
    @recordType nvarchar(50) = NULL,
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
    @validationList nvarchar(50) = NULL)
AS
    SET NOCOUNT ON;

    INSERT INTO FILTER_ATTRIBUTES
        (ATTRIBUTE,
         DATE_TIME_STAMP,
         DISPLAY_DESC,
         FIELD_TYPE,
         PROCESS_STAMP,
         RECORD_TYPE,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP,
         VALIDATION_LIST)
    SELECT @attribute,
           getutcdate(),
           @displayDesc,
           @fieldType,
           @processStamp,
           @recordType,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:1>',
           @validationList
     WHERE NOT EXISTS(SELECT *
                        FROM FILTER_ATTRIBUTES
                       WHERE ATTRIBUTE = @attribute);
-- [comment omitted]