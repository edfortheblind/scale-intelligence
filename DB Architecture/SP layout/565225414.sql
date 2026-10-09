/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	197694	| NRJ	| 02/22/17	| Created
	197695	| NRJ	| 03/15/17	| Added CycleCountMaster
	
*/
CREATE PROCEDURE MetaTrans_GetCycleCountMasterPlan(
@culture nvarchar(10))
AS
	SET NOCOUNT ON;
SELECT 
N'SCALAR' AS N'EntityType',
N'CycleCountMasterPlan' AS N'EntityName',
(SELECT SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE SYS_KEY=N'100' AND RECORD_TYPE =N'Cycle count') as N'CountsPerGroup',  
Convert(BIT, (case when (SELECT SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE SYS_KEY=N'10' AND RECORD_TYPE =N'Cycle count') = N'Y' then 1 else 0 end)) AS N'AutoPrintCycleCountList',
Convert(BIT, (case when (SELECT SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE SYS_KEY=N'20' AND RECORD_TYPE =N'Cycle count') = N'Y' then 1 else 0 end)) AS N'AutoReleasePlan',
N'' AS CycleCountMaster,
N'' AS Warehouse,
N'' AS Company 
