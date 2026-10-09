/*
	Mod Number  | Programmer    | Date       | Modification Description
	--------------------------------------------------------------------
	133104		| RJR			| 12/17/2013 | Created.
	136463		| RJR			| 02/12/2014 | Added ACTIVE and SYSTEM_CREATED.
	224179		| SO			| 05/11/2018 | Modified to pass current utc date for datetimestamp.

	Inserts a record for dbChange scripts.
*/
CREATE PROCEDURE dbc_IScreenControlEvent(
    @active char(1),
    @eventId nvarchar(100),
    @eventName nvarchar(250),
    @processStamp nvarchar(100),
    @screenControlId numeric(9),
	@gridColumn nvarchar(128) = NULL,
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

    INSERT INTO SCREEN_CONTROL_EVENT
        (ACTIVE,
         DATE_TIME_STAMP,
         EVENT_ID,
         EVENT_NAME,
		 GRID_COLUMN,
         PROCESS_STAMP,
         SCREEN_CONTROL_ID,
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
    SELECT @active,
           getutcdate(),
           @eventId,
           @eventName,
		   @gridColumn,
           @processStamp,
           @screenControlId,
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
                        FROM SCREEN_CONTROL_EVENT
                       WHERE EVENT_ID = @eventId and SCREEN_CONTROL_ID = @screenControlId);
-- end dbc_IScreenControlEvent