-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



  


CREATE PROCEDURE WRK_DeactivateWork(  
 @internalInstructionNum numeric(9))  
AS  
Begin  
 SET NOCOUNT ON;  

-- [comment omitted]
INSERT INTO IA_WORK_INSTRUCTION
  SELECT * FROM WORK_INSTRUCTION WHERE INTERNAL_INSTRUCTION_NUM=@internalInstructionNum AND CONDITION=N'<literal:1>' AND INSTRUCTION_TYPE = N'<literal:2>';

-- [comment omitted]
INSERT INTO IA_WORK_INSTRUCTION
  SELECT * FROM WORK_INSTRUCTION WHERE PARENT_INSTR=@internalInstructionNum AND CONDITION=N'<literal:3>' AND INSTRUCTION_TYPE = N'<literal:4>';

-- [comment omitted]
DELETE FROM WORK_INSTRUCTION WHERE PARENT_INSTR=@internalInstructionNum AND CONDITION=N'<literal:5>' AND INSTRUCTION_TYPE = N'<literal:6>';

-- [comment omitted]
DELETE FROM WORK_INSTRUCTION WHERE INTERNAL_INSTRUCTION_NUM=@internalInstructionNum AND CONDITION=N'<literal:7>' AND INSTRUCTION_TYPE = N'<literal:8>';

END;  
 



