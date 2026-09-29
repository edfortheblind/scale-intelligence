-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


CREATE PROCEDURE dbc_IAppIdentifier(
    @appIdentifier nvarchar(10),
    @decimalIndicator nchar(1),
    @defIlsMappedField nvarchar(50),
    @description nvarchar(250),
    @gs1Title nvarchar(50) = NULL,
    @processStamp nvarchar(100),
	@separatorASCIICode numeric(3) = NULL,
    @stringFormatType nvarchar(50) = NULL,
    @stringLength numeric(2),
    @stringLengthType nvarchar(50),
    @unitOfMeasure nvarchar(10) = NULL,
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

    INSERT INTO APP_IDENTIFIER
        (APP_IDENTIFIER,
         DATE_TIME_STAMP,
         DECIMAL_INDICATOR,
         DEF_ILS_MAPPED_FIELD,
         DESCRIPTION,
         GS1_TITLE,
         PROCESS_STAMP,
		 SEPARATOR_ASCII_CODE,
         STRING_FORMAT_TYPE,
         STRING_LENGTH,
         STRING_LENGTH_TYPE,
         SYSTEM_CREATED,
         UNIT_OF_MEASURE,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT @appIdentifier,
           getutcdate(),
           @decimalIndicator,
           @defIlsMappedField,
           @description,
           @gs1Title,
           @processStamp,
		   @separatorASCIICode,
           @stringFormatType,
           @stringLength,
           @stringLengthType,
           N'<literal:1>',
           @unitOfMeasure,
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
                        FROM APP_IDENTIFIER
                       WHERE APP_IDENTIFIER = @appIdentifier);
