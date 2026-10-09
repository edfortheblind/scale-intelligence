/*
                Mod Number  | Programmer    | Date       | Modification Description
                --------------------------------------------------------------------
                            | DBCGenerator  | 7/13/2010         | Created.
				224179		| SO			| 05/11/2018		| Modified to pass current utc date for datetimestamp.

                Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IDynamicAction(
    @actionEndpointIdentifier nvarchar(25),
    @actionName nvarchar(50),
    @actionResourceKey nvarchar(50),
    @active nchar(1),
    @alwaysAvailable nchar(1),
    @description nvarchar(50),
    @formId numeric(5) = NULL,
    @processStamp nvarchar(100),
    @securityCheckpoint numeric(3) = NULL,
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

declare @actionEndpointId numeric(9);

select @actionEndpointId = OBJECT_ID from DYNAMIC_CALLING_DETAIL where RECORD_TYPE = N'ACTIONENDP' AND IDENTIFIER= @actionEndpointIdentifier; 

    INSERT INTO DYNAMIC_ACTION
        (ACTION_ENDPOINT_ID,
         ACTION_NAME,
         ACTION_RESOURCE_KEY,
         ACTIVE,
         ALWAYS_AVAILABLE,
         DATE_TIME_STAMP,
         DESCRIPTION,
         FORM_ID,
         PROCESS_STAMP,
         SECURITY_CHECKPOINT,
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
    SELECT @actionEndpointId,
           @actionName,
           @actionResourceKey,
           @active,
           @alwaysAvailable,
           getutcdate(),
           @description,
           @formId,
           @processStamp,
           @securityCheckpoint,
           N'Y',
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'System'
     WHERE NOT EXISTS(SELECT *
                        FROM DYNAMIC_ACTION
                       WHERE ACTION_NAME = @actionName);
-- end dbc_IDynamicAction
