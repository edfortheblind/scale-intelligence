-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
  
/* [comment omitted] */





  
  
  
  
CREATE PROCEDURE dbc_IMultiSegmentMappedFields(  
    @appIdentifier nvarchar(10),  
    @autoExecute nchar(1) = N'<literal:1>',
	@autoFill nchar(1) = N'<literal:2>',
    @mappedField nvarchar(50),  
    @description nvarchar(250),  
    @processStamp nvarchar(100),
	@removeAi nchar(1) = N'<literal:3>',
	@srcIdentifier nvarchar(50),
	@systemCreated nchar(1) = N'<literal:4>',
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
  
    INSERT INTO MULTI_SEGMENT_MAPPED_FIELDS  
        (APP_IDENTIFIER,  
         DATE_TIME_STAMP,  
         AUTO_EXECUTE,  
         AUTO_FILL,  
         DESCRIPTION,
		 MAPPED_FIELD,
         PROCESS_STAMP,
		 REMOVE_AI,
		 SRC_IDENTIFIER,
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
    SELECT @appIdentifier,  
           getutcdate(),
		   @autoExecute,
		   @autoFill,
           @description,
		   @mappedField,
           @processStamp,
		   @removeAi,
		   @srcIdentifier,
           @systemCreated,
           @userDef1,  
           @userDef2,  
           @userDef3,  
           @userDef4,  
           @userDef5,  
           @userDef6,  
           @userDef7,  
           @userDef8,  
           N'<literal:5>'
	WHERE NOT EXISTS(SELECT *  
            FROM MULTI_SEGMENT_MAPPED_FIELDS  
            WHERE APP_IDENTIFIER = @appIdentifier
			and MAPPED_FIELD = @mappedField
			and SRC_IDENTIFIER = @srcIdentifier);
-- [comment omitted]
  