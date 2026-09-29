-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */








CREATE PROCEDURE dbc_IRateWeightBreakHdr(
    @active nchar(1),
    @description nvarchar(50) = NULL,
    @minimumWeightBreak numeric(19,5) = 0,
    @processStamp nvarchar(100),
    @userDef1 nvarchar(25) = NULL,
    @userDef2 nvarchar(25) = NULL,
    @userDef3 nvarchar(25) = NULL,
    @userDef4 nvarchar(25) = NULL,
    @userDef5 nvarchar(25) = NULL,
    @userDef6 nvarchar(25) = NULL,
    @userDef7 numeric(19,5) = 0,
    @userDef8 numeric(19,5) = 0,
    @weightBreak nvarchar(25))
AS
    SET NOCOUNT ON;

    INSERT INTO RATE_WEIGHT_BREAK_HDR
        (ACTIVE,
         DATE_TIME_STAMP,
         DESCRIPTION,
         MINIMUM_WEIGHT_BREAK,
         PROCESS_STAMP,
         USER_DEF1,
         USER_DEF2,
         USER_DEF3,
         USER_DEF4,
         USER_DEF5,
         USER_DEF6,
         USER_DEF7,
         USER_DEF8,
         USER_STAMP,
         WEIGHT_BREAK)
    SELECT @active,
           getutcdate(),
           @description,
           @minimumWeightBreak,
           @processStamp,
           @userDef1,
           @userDef2,
           @userDef3,
           @userDef4,
           @userDef5,
           @userDef6,
           @userDef7,
           @userDef8,
           N'<literal:1>',
           @weightBreak
     WHERE NOT EXISTS(SELECT *
                        FROM RATE_WEIGHT_BREAK_HDR
                       WHERE WEIGHT_BREAK = @weightBreak);
-- [comment omitted]
