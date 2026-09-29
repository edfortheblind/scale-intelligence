-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






-- [comment omitted]


CREATE PROCEDURE RCPT_ContainerInsightListPaneData(@internalRecContNum numeric(9), @culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
    RC.INTERNAL_REC_CONT_NUM AS InternalRecContNum
FROM METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW RC
WHERE INTERNAL_REC_CONT_NUM = @internalRecContNum;

END
