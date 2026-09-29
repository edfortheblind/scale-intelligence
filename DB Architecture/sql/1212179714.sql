-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















CREATE PROCEDURE CCP_UpdateWorkForNewInventory
(   
  @internalPlanNum numeric(9) ,  
  @workUnit nvarchar(50),
  @warehouse nvarchar(25)
)

AS
BEGIN

	WITH T AS (
   SELECT WI.INTERNAL_INSTRUCTION_NUM,
   ROW_NUMBER() OVER (ORDER BY WI.SEQUENCE,WI.FROM_LOC,WI.ITEM ASC) AS NEW_SEQ,
   WI.SEQUENCE
   FROM WORK_INSTRUCTION WI
   INNER JOIN CYCLE_COUNT_REQUEST CCR
   ON WI.INTERNAL_NUM=CCR.INTERNAL_COUNT_NUM
   AND WI.INSTRUCTION_TYPE=N'<literal:1>'
   AND WI.INTERNAL_NUM_TYPE=N'<literal:2>'
   AND WI.WORK_UNIT=@workUnit
   AND WI.FROM_WHS=@warehouse
   AND CCR.INTERNAL_PLAN_NUM=@internalPlanNum)
UPDATE T
SET SEQUENCE=NEW_SEQ

END

