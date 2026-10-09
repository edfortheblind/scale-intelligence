/*
 Mod     | Programmer    | Date       | Modification Description
 --------------------------------------------------------------------
 EX01    | rphilip       | 03/10/2023  | Stored Procedure for exit point:Release Wave - After
*/

CREATE PROCEDURE TRAV_EXP_ReleaseWaveAfter (
    @SESSIONVALUE xml,
    @InternalWaveNum nvarchar(max)
)
AS
BEGIN

    SET NOCOUNT ON;     

    --insert custom sql 

    EXEC TRAV_EX01_InsertDataForPS @InternalWaveNum;

END