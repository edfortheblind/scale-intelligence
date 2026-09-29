-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE RCPT_InsightListPaneData(@internalReceiptNum numeric(9) , @culture nvarchar(10))  
AS 
BEGIN

select top 1 N'<literal:1>' AS SCALAR,
	INTERNAL_RECEIPT_NUM AS InternalReceiptNum,
    RECEIPT_ID AS ReceiptId
FROM METADATA_INSIGHT_RECEIPT_VIEW
WHERE INTERNAL_RECEIPT_NUM = @internalReceiptNum;

END
