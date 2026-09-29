-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE CCP_InsightDetailPaneData(@internalPlanNum numeric(9),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
             CCP.INTERNAL_PLAN_NUM as PlanNumber,
             CCP.MASTER_NAME     as MasterName,
             CCP.CREATED_DATE  as CreatedDate,
			 CCP.WAREHOUSE as Warehouse		 
FROM CYCLE_COUNT_PLAN CCP
WHERE INTERNAL_PLAN_NUM = @internalPlanNum;


-- [comment omitted]
SELECT top 1 N'<literal:2>' AS SCALAR,
	COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OpenWorkCount
FROM 
	WORK_INSTRUCTION WI
WHERE
	WI.INTERNAL_NUM_TYPE = N'<literal:3>'AND
	WI.INSTRUCTION_TYPE = N'<literal:4>' AND
	WI.CONDITION <> N'<literal:5>' AND
	WI.REFERENCE_ID = cast(@internalPlanNum as varchar(10));


-- [comment omitted]
SELECT top 1 N'<literal:6>' AS SCALAR,
	COUNT(CCR.INTERNAL_COUNT_NUM) AS RequestCount
FROM 
	CYCLE_COUNT_REQUEST CCR
WHERE
	CCR.INTERNAL_PLAN_NUM = @internalPlanNum



-- [comment omitted]
SELECT top 1 N'<literal:7>' AS SCALAR,
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