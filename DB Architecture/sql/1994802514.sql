-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE dbc_IFilterStatement(
    @andOr nvarchar(3) = NULL,
    @attribute nvarchar(100),
    @filterName nvarchar(25),
    @leftParen numeric(2) = NULL,
    @literalValue nvarchar(200) = NULL,
    @operand nvarchar(15),
    @processStamp nvarchar(100),
    @recordType nvarchar(50),
    @rightParen numeric(2) = NULL,
    @sequence numeric(5),
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

    INSERT INTO FILTER_STATEMENT
        (AND_OR,
         ATTRIBUTE,
         DATE_TIME_STAMP,
         FILTER_NAME,
         LEFT_PAREN,
         LITERAL_VALUE,
         OPERAND,
         PROCESS_STAMP,
         RECORD_TYPE,
         RIGHT_PAREN,
         SEQUENCE,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT @andOr,
           @attribute,
           GETUTCDATE(),
           @filterName,
           @leftParen,
           @literalValue,
           @operand,
           @processStamp,
           @recordType,
           @rightParen,
           @sequence,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:1>'
     WHERE NOT EXISTS(SELECT *
                        FROM FILTER_STATEMENT
                       WHERE RECORD_TYPE = @recordType
                         AND FILTER_NAME = @filterName
                         AND SEQUENCE = @sequence);
-- [comment omitted]
