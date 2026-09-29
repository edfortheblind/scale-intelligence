-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE PROCEDURE dbc_IArchivePreferences(
    @archiveId nvarchar(25),
    @archiveName nvarchar(50),
    @archiveProcess nvarchar(25),
    @dataFilter nvarchar(25) = NULL,
    @daysHist numeric(4),
    @doPath nvarchar(500) = NULL,
    @lastArchDateTime datetime = NULL,
    @processStamp nvarchar(100),
    @runByDefault nchar(1),
    @saveData nchar(1),
    @tableDoName nvarchar(50) = NULL,
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = NULL,
    @userDef8 numeric(19,5) = NULL)
AS
    

    INSERT INTO ARCHIVE_PREFERENCES
        (ACTIVE,
         ARCHIVE_ID,
         ARCHIVE_NAME,
         ARCHIVE_PROCESS,
         DATA_FILTER,
         DATE_TIME_STAMP,
         DAYS_HIST,
         DO_PATH,
         LAST_ARCH_DATE_TIME,
         PROCESS_STAMP,
         RUN_BY_DEFAULT,
         SAVE_DATA,
         SYSTEM_CREATED,
         TABLE_DO_NAME,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT N'<literal:1>',
           @archiveId,
           @archiveName,
           @archiveProcess,
           @dataFilter,
           getutcdate(),
           @daysHist,
           @doPath,
           @lastArchDateTime,
           @processStamp,
           @runByDefault,
           @saveData,
           N'<literal:2>',
           @tableDoName,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:3>'
     WHERE NOT EXISTS(SELECT *
                        FROM ARCHIVE_PREFERENCES
                       WHERE ARCHIVE_ID = @archiveId);

