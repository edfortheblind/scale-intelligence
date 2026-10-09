---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	205463	| MDL   | 05/24/17	| Created

*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE GetPreviewDocument(@printProcess int)

AS
	SET NOCOUNT ON;
SELECT DOCUMENT_TYPE AS Identifier,
       DESCRIPTION AS DisplayText
FROM DOCUMENT_TYPE
WHERE (PRINT_PROC1 = @printProcess
       OR PRINT_PROC2 = @printProcess
       OR PRINT_PROC3 = @printProcess
       OR PRINT_PROC4 = @printProcess
       OR PRINT_PROC5 = @printProcess)
  AND ALLOW_PRINT_PREVIEW=N'Y'
  AND  
	DOCUMENT_TYPE !=(CASE WHEN (select count(FEATURE_NAME) from FEATURE_MANAGEMENT where FEATURE_NAME = N'FEATURE_3325_COLLATE_DOCUMENT' and ENABLED =N'Y')>0 THEN N'0'
                  WHEN PRINT_PROC1 != 80 THEN N'0'
				  ELSE N'420'
                 END)
ORDER BY DESCRIPTION