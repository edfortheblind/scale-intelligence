-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








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
           N'<literal:1>',
           N'<literal:2>'
    WHERE NOT EXISTS(SELECT *
                        FROM RATING_SERVICE_ACTION
                       WHERE OBJECT_ID = @objectId);
end 
