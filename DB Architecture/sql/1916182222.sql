-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE PROCEDURE dbc_IDynamicCallingDetail(
    @active nchar(1),
    @assemblyName nvarchar(100) = NULL,
    @description nvarchar(50) = NULL,
    @identifier nvarchar(25),
    @localObjectId nvarchar(100) = NULL,
    @processClass nvarchar(100) = NULL,
    @processMethod nvarchar(100) = NULL,
    @processPackage nvarchar(100) = NULL,
    @processStamp nvarchar(100),
    @recordType nvarchar(10),
    @remoteObjecType nvarchar(100) = NULL,
    @endpointType numeric(3) = 1,
    @uri nvarchar(MAX) = NULL,
    @requestTransform nvarchar(200) = NULL,
    @responseTransform nvarchar(200) = NULL,
    @operation nvarchar(100) = NULL,
    @messageName nvarchar(25) = NULL,
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL)
AS
begin

SET NOCOUNT ON;

INSERT INTO DYNAMIC_CALLING_DETAIL
        (ACTIVE,
         Assembly_Name,
         DATE_TIME_STAMP,
         DESCRIPTION,
         IDENTIFIER,
         LOCAL_OBJECT_IDENTIFIER,
         PROCESS_CLASS,
         PROCESS_METHOD,
         PROCESS_PACKAGE,
         PROCESS_STAMP,
         RECORD_TYPE,
         REMOTE_OBJECT_TYPE,
	 ENDPOINT_TYPE,
	 URI,
	 REQUEST_TRANSFORM,
	 RESPONSE_TRANSFORM,
	 OPERATION,
	 MESSAGE_NAME,
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
    select @active,
           @assemblyName,
           getutcdate(),
           @description,
           @identifier,
           @localObjectId,
           @processClass,
           @processMethod,
           @processPackage,
           @processStamp,
           @recordType,
           @remoteObjecType,
	   @endpointType,
	   @uri,
	   @requestTransform,
           @responseTransform,
	   @operation,
	   @messageName,
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
                        FROM DYNAMIC_CALLING_DETAIL
                       WHERE RECORD_TYPE = @recordType
                         AND IDENTIFIER = @identifier);
end -- [comment omitted]
