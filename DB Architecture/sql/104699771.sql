-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */







CREATE PROCEDURE dbc_IOperationalGoal(
    @active nchar(1),
    @calculationType numeric(2),
    @description nvarchar(50),
    @displaySequence numeric(5),
    @goalDirection numeric(2),
    @goalValue numeric(9),
    @guidLargeText nvarchar(50) = NULL,
    @opGoalName nvarchar(50),
    @processStamp nvarchar(100),
    @sequenceLargeText numeric(3) = NULL,
    @startingValue numeric(9),
    @storedProcedure nvarchar(50) = NULL,
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(14,5) = NULL,
    @userDef8 numeric(14,5) = NULL,
    @warehouse nvarchar(25) = NULL)
AS
    SET NOCOUNT ON;

    INSERT INTO OPERATIONAL_GOAL
        (ACTIVE,
         CALCULATION_TYPE,
         DATE_TIME_STAMP,
         DESCRIPTION,
         DISPLAY_SEQUENCE,
         GOAL_DIRECTION,
         GOAL_VALUE,
         GUID_LARGE_TEXT,
         OP_GOAL_NAME,
         PROCESS_STAMP,
         SEQUENCE_LARGE_TEXT,
         STARTING_VALUE,
         STORED_PROCEDURE,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP,
         WAREHOUSE)
    SELECT @active,
           @calculationType,
           getutcdate(),
           @description,
           @displaySequence,
           @goalDirection,
           @goalValue,
           @guidLargeText,
           @opGoalName,
           @processStamp,
           @sequenceLargeText,
           @startingValue,
           @storedProcedure,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:1>',
           @warehouse;
-- [comment omitted]
