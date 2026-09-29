-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE PROCEDURE dbc_IInterfaceDetail(
    @active nchar(1),
    @description nvarchar(100),
    @dtlKeyNum numeric(9),
    @encoding numeric(1) = 1, -- [comment omitted]
    @errEventId numeric(9),
    @errExt nvarchar(10),
    @eventId numeric(9),
    @ext nvarchar(10),
    @hdrKeyNum numeric(9),
    @interfaceMode numeric(1),
    @managingApp numeric(1) = 0, -- [comment omitted]
    @maxTransSize numeric(9),
    @procExt nvarchar(25) = NULL,
    @process numeric(1),
    @processStamp nvarchar(100),
    @saveProcData nvarchar(1) = N'<literal:1>',
    @sequence numeric(9),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL,
    @dataSourceBatchFile numeric(9) = NULL)
AS
    SET NOCOUNT ON;

    INSERT INTO INTERFACE_DETAIL
        (ACTIVE,
         DATE_TIME_STAMP,
         DESCRIPTION,
		 DTL_KEY_NUM,
         ENCODING,
         ERR_EVENT_ID,
         ERR_EXT,
         EVENT_ID,
         EXT,
         HDR_KEY_NUM,
         INTERFACE_MODE,
         MANAGING_APP,
         MAX_TRANS_SIZE,
         PROC_EXT,
         PROCESS,
         PROCESS_STAMP,
         SAVE_PROC_DATA,
         SEQUENCE,
         SYSTEM_CREATED,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         DATA_SOURCE_BATCH_SIZE,
         USER_STAMP)
    SELECT @active,
           getutcdate(),
           @description,
	   @dtlKeyNum,
           @encoding,
           @errEventId,
           @errExt,
           @eventId,
           @ext,
           @hdrKeyNum,
           @interfaceMode,
           @managingApp,
           @maxTransSize,
           @procExt,
           @process,
           @processStamp,
           @saveProcData,
           @sequence,
           N'<literal:2>',
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           @dataSourceBatchFile,
           N'<literal:3>'
     WHERE NOT EXISTS(SELECT *
                        FROM INTERFACE_DETAIL
                       WHERE DTL_KEY_NUM = @dtlKeyNum);
-- [comment omitted]
