/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16812		| CRW			| 03/5/2026 	| created
*/

CREATE PROCEDURE TRAV_UpdateWorkUnitName (    
    @SESSIONVALUE xml,    
    @URL nvarchar(max),    
    @CUSTOM nvarchar(max),    
    @RETURNVALUE nvarchar(max) OUTPUT    
)    
 
AS
BEGIN
    SET NOCOUNT ON;
 
       -- Fix malformed JSON (known bug)    
    SET @CUSTOM = REPLACE(@CUSTOM, N'<ExecutionEntity>k__BackingField', N'ExecutionEntity');    
    --Declares parameters for SP Logic
    DECLARE @OLDWORKUNIT NVARCHAR(50), @NEWWORKUNIT NVARCHAR(50);
   -- Extract fields from JSON    
    SELECT     
      @NEWWORKUNIT = JSON_VALUE(@CUSTOM, N'$.WorkUnit');     
    SELECT     
      @OLDWORKUNIT = USER_DEF1
	  from WORK_INSTRUCTION
	  where WORK_UNIT = @NEWWORKUNIT;

    -- Update TRAV_PALLET.work_unit to the new work unit value

UPDATE TRAV_PALLET SET work_unit = @NEWWORKUNIT
  WHERE work_unit = @OLDWORKUNIT
 
END;
