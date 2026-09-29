-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE PROCEDURE dbc_INextNumber(
    @maxValue nvarchar(25) = 999999999,
    @minValue nvarchar(25) = 1,
    @nextNum nvarchar(25) = 1,
    @nextNumKey nvarchar(25),
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

    INSERT INTO NEXT_NUMBER
        (DATE_TIME_STAMP,
	 MAX_VALUE,
	 MIN_VALUE,
         NEXT_NUM,
         NEXT_NUM_KEY,
         PROCESS_STAMP,
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
    SELECT getutcdate(),
	   @maxValue,
	   @minValue,
           @nextNum,
           @nextNumKey,
           @processStamp,
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
                        FROM NEXT_NUMBER
                       WHERE NEXT_NUM_KEY = @nextNumKey);
-- [comment omitted]
