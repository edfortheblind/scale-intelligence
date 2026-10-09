/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	49908	| VK	| 02/05/25	| Created.
	Parameters:
		INTERNAL_INSTRUCTION_NUM  The internal instruction num.
	Returns:
		Header used for work instrcution label. 
*/

CREATE PROCEDURE LBL_WorkInstructionHeader (
	@INTERNAL_INSTRUCTION_NUM numeric(9))
AS
BEGIN

SET NOCOUNT ON;

DECLARE @PARENT_INSTR numeric(9)

SELECT @PARENT_INSTR = PARENT_INSTR
FROM WORK_INSTRUCTION_VIEW WITH (NOLOCK) 
WHERE INTERNAL_INSTRUCTION_NUM = @INTERNAL_INSTRUCTION_NUM

SELECT  WORK_UNIT 
FROM WORK_INSTRUCTION_VIEW WITH (NOLOCK) 
WHERE INTERNAL_INSTRUCTION_NUM = ISNULL(@PARENT_INSTR,@INTERNAL_INSTRUCTION_NUM) AND INSTRUCTION_TYPE=N'Header'

END