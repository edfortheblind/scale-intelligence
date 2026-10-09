/*   
 Mod Number | Programmer  | Date		| Modification Description  
 -----------------------------------------------------------------
 80717		| SPJ		  | 02/21/11	| Created
 111660     | KSS         | 06/07/13	|update the sequence number on new work instructions for new inventory in the cycle
										 counted locations preserving the same order as the original work. 
										 This is done so as to respect the original "CC Work Criteria filter Order by"
										 which is not available at this stage
 
 Parameters:
 @internalPlanNum : Internal_Plan_Num of the CycleCount Request
 @workUnit		  : Work Unit Corresponding to the CycleCount Request
 @warehouse		  : WareHouse for the CC Request
 
 */

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
   AND WI.INSTRUCTION_TYPE=N'Detail'
   AND WI.INTERNAL_NUM_TYPE=N'Cycle Count'
   AND WI.WORK_UNIT=@workUnit
   AND WI.FROM_WHS=@warehouse
   AND CCR.INTERNAL_PLAN_NUM=@internalPlanNum)
UPDATE T
SET SEQUENCE=NEW_SEQ

END

