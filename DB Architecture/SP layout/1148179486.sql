/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	197111	| DP	| 02/21/17	| Created
	207970	| TDA	| 06/15/17	| Cast plan number for reference id comparison
*/

CREATE PROCEDURE CCP_InsightDetailPaneData(@internalPlanNum numeric(9),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
             CCP.INTERNAL_PLAN_NUM as PlanNumber,
             CCP.MASTER_NAME     as MasterName,
             CCP.CREATED_DATE  as CreatedDate,
			 CCP.WAREHOUSE as Warehouse		 
FROM CYCLE_COUNT_PLAN CCP
WHERE INTERNAL_PLAN_NUM = @internalPlanNum;


-- Open work count
SELECT top 1 N'SCALAR' AS SCALAR,
	COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OpenWorkCount
FROM 
	WORK_INSTRUCTION WI
WHERE
	WI.INTERNAL_NUM_TYPE = N'Cycle Count'AND
	WI.INSTRUCTION_TYPE = N'Detail' AND
	WI.CONDITION <> N'Closed' AND
	WI.REFERENCE_ID = cast(@internalPlanNum as varchar(10));


-- Requests Count
SELECT top 1 N'SCALAR' AS SCALAR,
	COUNT(CCR.INTERNAL_COUNT_NUM) AS RequestCount
FROM 
	CYCLE_COUNT_REQUEST CCR
WHERE
	CCR.INTERNAL_PLAN_NUM = @internalPlanNum



-- Transactions Count
SELECT top 1 N'SCALAR' AS SCALAR,
	COUNT(TH.INTERNAL_ID) AS Transactions
FROM 
	CYCLE_COUNT_PLAN CCP,
	TRANSACTION_HISTORY TH
WHERE 
	CCP.INTERNAL_PLAN_NUM = @internalPlanNum AND
	TH.REFERENCE_ID = cast(CCP.INTERNAL_PLAN_NUM as varchar(10)) AND
	TH.WAREHOUSE = CCP.WAREHOUSE AND
	TH.TRANSACTION_TYPE = 40;

END