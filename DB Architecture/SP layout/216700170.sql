/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	19133       | VK		    | 05/10/2006 | Created
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.
	
	Inserts a record for dbChange scripts.
*/

CREATE PROCEDURE dbc_IRatingServiceAction(
    @objectId numeric(9),
    @description nvarchar(50),
    @requestSchema nvarchar(50) = NULL,
    @responseSchema nvarchar(50) = NULL,
    @processStamp nvarchar(100))
AS
begin

SET NOCOUNT ON;

INSERT INTO RATING_SERVICE_ACTION
        (OBJECT_ID,
         DESCRIPTION,
         REQUEST_SCHEMA,
         RESPONSE_SCHEMA,
         DATE_TIME_STAMP,
         PROCESS_STAMP,
         USER_STAMP,
         SYSTEM_CREATED)
    select @objectId,
           @description,
           @requestSchema,
           @responseSchema,
           getutcdate(),
           @processStamp,
           N'System',
           N'Y'
    WHERE NOT EXISTS(SELECT *
                        FROM RATING_SERVICE_ACTION
                       WHERE OBJECT_ID = @objectId);
end 
