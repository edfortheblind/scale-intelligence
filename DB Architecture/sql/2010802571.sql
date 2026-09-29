-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE dbc_IFunctionalAreaStatusFlow(
    @changeAllowed nchar(1),
    @functionalArea nvarchar(25),
    @inDefaultFlow nchar(1),
    @mandatory nchar(1),
    @processStamp nvarchar(100),
    @relatedSts numeric(3) = NULL,
    @status numeric(3),
    @statusName nvarchar(50),
    @systemSts nvarchar(50) = NULL,
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

    INSERT INTO FUNCTIONAL_AREA_STATUS_FLOW
        (CHANGE_ALLOWED,
         DATE_TIME_STAMP,
         FUNCTIONAL_AREA,
         IN_DEFAULT_FLOW,
         MANDATORY,
         PROCESS_STAMP,
         RELATED_STS,
         status,
         STATUS_NAME,
         SYSTEM_CREATED,
         SYSTEM_STS,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP)
    SELECT @changeAllowed,
           GETUTCDATE(),
           @functionalArea,
           @inDefaultFlow,
           @mandatory,
           @processStamp,
           @relatedSts,
           @status,
           @statusName,
           N'<literal:1>',
           @systemSts,
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
                        FROM FUNCTIONAL_AREA_STATUS_FLOW
                       WHERE FUNCTIONAL_AREA = @functionalArea
                         AND status = @status);
-- [comment omitted]