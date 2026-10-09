/*  
 Mod Number | Programmer  | Date     | Modification Description  
 -----------------------------------------------------------------------------------------------------------------------------------------  
 204169      | MHM         | 04/28/17 | Created.  
*/  


CREATE PROCEDURE WRK_DeactivateWork(  
 @internalInstructionNum numeric(9))  
AS  
Begin  
 SET NOCOUNT ON;  

--COPY HEADER
INSERT INTO IA_WORK_INSTRUCTION
  SELECT * FROM WORK_INSTRUCTION WHERE INTERNAL_INSTRUCTION_NUM=@internalInstructionNum AND CONDITION=N'Closed' AND INSTRUCTION_TYPE = N'Header';

--COPY DETAILS
INSERT INTO IA_WORK_INSTRUCTION
  SELECT * FROM WORK_INSTRUCTION WHERE PARENT_INSTR=@internalInstructionNum AND CONDITION=N'Closed' AND INSTRUCTION_TYPE = N'Detail';

--DELETE WORK_INSTRUCTION DETAILS
DELETE FROM WORK_INSTRUCTION WHERE PARENT_INSTR=@internalInstructionNum AND CONDITION=N'Closed' AND INSTRUCTION_TYPE = N'Detail';

--DELETE WORK_INSTRUCTION HEADER
DELETE FROM WORK_INSTRUCTION WHERE INTERNAL_INSTRUCTION_NUM=@internalInstructionNum AND CONDITION=N'Closed' AND INSTRUCTION_TYPE = N'Header';

END;  
 



