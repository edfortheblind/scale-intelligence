-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE INT_ErrorInsightDetailPaneData(@internalerrornumber numeric(9),@culture nvarchar(10))  
AS 
BEGIN
select 
N'<literal:1>' AS SCALAR,
INTERFACE_PROCESS	as InterfaceProcess, 
REFERENCE_ID01		as ReferenceId01,
ERROR_MSG			as ErrorMessage
			
 
FROM INTERFACE_ERROR
WHERE INTERNAL_ERROR_NUMBER= @internalerrornumber;
END