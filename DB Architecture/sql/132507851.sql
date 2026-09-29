-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE TRAV_UpdateWorkUnitName (    
    @SESSIONVALUE xml,    
    @URL nvarchar(max),    
    @CUSTOM nvarchar(max),    
    @RETURNVALUE nvarchar(max) OUTPUT    
)    
 
AS
BEGIN
    SET NOCOUNT ON;
 
       -- [comment omitted]
    SET @CUSTOM = REPLACE(@CUSTOM, N'<literal:1>', N'<literal:2>');    
    -- [comment omitted]
    DECLARE @OLDWORKUNIT NVARCHAR(50), @NEWWORKUNIT NVARCHAR(50);
   -- [comment omitted]
    SELECT     
      @NEWWORKUNIT = JSON_VALUE(@CUSTOM, N'<literal:3>');     
    SELECT     
      @OLDWORKUNIT = USER_DEF1
	  from WORK_INSTRUCTION
	  where WORK_UNIT = @NEWWORKUNIT;

    -- [comment omitted]

UPDATE TRAV_PALLET SET work_unit = @NEWWORKUNIT
  WHERE work_unit = @OLDWORKUNIT
 
END;
