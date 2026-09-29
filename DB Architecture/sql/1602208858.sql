-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE TRAV_EXP_ReleaseWaveAfter (
    @SESSIONVALUE xml,
    @InternalWaveNum nvarchar(max)
)
AS
BEGIN

    SET NOCOUNT ON;     

    -- [comment omitted]

    EXEC TRAV_EX01_InsertDataForPS @InternalWaveNum;

END