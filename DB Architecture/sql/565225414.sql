-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE MetaTrans_GetCycleCountMasterPlan(
@culture nvarchar(10))
AS
	SET NOCOUNT ON;
SELECT 
N'<literal:1>' AS N'<literal:2>',
N'<literal:3>' AS N'<literal:4>',
(SELECT SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE SYS_KEY=N'<literal:5>' AND RECORD_TYPE =N'<literal:6>') as N'<literal:7>',  
Convert(BIT, (case when (SELECT SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE SYS_KEY=N'<literal:8>' AND RECORD_TYPE =N'<literal:9>') = N'<literal:10>' then 1 else 0 end)) AS N'<literal:11>',
Convert(BIT, (case when (SELECT SYSTEM_VALUE FROM SYSTEM_CONFIG_DETAIL WHERE SYS_KEY=N'<literal:12>' AND RECORD_TYPE =N'<literal:13>') = N'<literal:14>' then 1 else 0 end)) AS N'<literal:15>',
N'<literal:16>' AS CycleCountMaster,
N'<literal:17>' AS Warehouse,
N'<literal:18>' AS Company 
