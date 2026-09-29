-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE dbc_IGenericAddressHeader(
    @description nvarchar(50),
    @processStamp nvarchar(100),
    @recordType nvarchar(50),
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

    INSERT INTO GENERIC_ADDRESS_HEADER
        (DATE_TIME_STAMP,
         DESCRIPTION,
         PROCESS_STAMP,
         RECORD_TYPE,
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
    SELECT getutcdate(),
           @description,
           @processStamp,
           @recordType,
           N'<literal:1>',
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
                        FROM GENERIC_ADDRESS_HEADER
                       WHERE RECORD_TYPE = @recordType);
-- [comment omitted]
