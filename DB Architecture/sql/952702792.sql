-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
-- [comment omitted]


/* [comment omitted] */





-- [comment omitted]


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
  AND ALLOW_PRINT_PREVIEW=N'<literal:1>'
  AND  
	DOCUMENT_TYPE !=(CASE WHEN (select count(FEATURE_NAME) from FEATURE_MANAGEMENT where FEATURE_NAME = N'<literal:2>' and ENABLED =N'<literal:3>')>0 THEN N'<literal:4>'
                  WHEN PRINT_PROC1 != 80 THEN N'<literal:5>'
				  ELSE N'<literal:6>'
                 END)
ORDER BY DESCRIPTION