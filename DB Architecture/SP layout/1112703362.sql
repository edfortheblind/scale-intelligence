/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	193269		| KSS		   | 12/16/16    | Created.
	191074		| DN		   | 01/23/17	 | Updated parameter types
	*/

CREATE PROCEDURE INT_ErrorInsightDetailPaneData(@internalerrornumber numeric(9),@culture nvarchar(10))  
AS 
BEGIN
select 
N'SCALAR' AS SCALAR,
INTERFACE_PROCESS	as InterfaceProcess, 
REFERENCE_ID01		as ReferenceId01,
ERROR_MSG			as ErrorMessage
			
 
FROM INTERFACE_ERROR
WHERE INTERNAL_ERROR_NUMBER= @internalerrornumber;
END