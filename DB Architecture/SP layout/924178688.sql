/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	193545		| RJR			| 12/16/16	| Created.
*/

CREATE PROCEDURE ADT_InsightDetailPaneData
(
	@internalId numeric(9), 
	@culture nvarchar(10)
)  
AS 
BEGIN

select * INTO #tempAuditLog
FROM AUDIT_LOG_VIEW
WHERE INTERNAL_ID = @internalId;

SELECT top 1 N'SCALAR' AS SCALAR,
	al.INTERNAL_ID as InternalId, 
    al.CLASS_NAME as ClassName,
	al.METHOD_NAME as MethodName,
	al.MACHINE_NAME as MachineName
FROM #tempAuditLog al;

END