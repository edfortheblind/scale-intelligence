-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE dbc_IExitPoint(
    @active nchar(1),
    @description nvarchar(500),
    @executionIdentifier nvarchar(25) = NULL,
    @exitPoint nvarchar(500),
    @exitPointCategory nvarchar(25),
    @processStamp nvarchar(100),
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

    INSERT INTO EXIT_POINT
        (ACTIVE,
         DATE_TIME_STAMP,
         DESCRIPTION,
         EXECUTION_IDENTIFIER,
         EXIT_POINT,
         EXIT_POINT_CATEGORY,
         PROCESS_STAMP,
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
           @description,
           @executionIdentifier,
           @exitPoint,
           @exitPointCategory,
           @processStamp,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:1>'
     WHERE NOT EXISTS(SELECT *
                        FROM EXIT_POINT
                       WHERE EXIT_POINT = @exitPoint);
-- [comment omitted]