/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE RCPT_InsightListPaneData(@internalReceiptNum numeric(9) , @culture nvarchar(10))  
AS 
BEGIN

select top 1 N'SCALAR' AS SCALAR,
	INTERNAL_RECEIPT_NUM AS InternalReceiptNum,
    RECEIPT_ID AS ReceiptId
FROM METADATA_INSIGHT_RECEIPT_VIEW
WHERE INTERNAL_RECEIPT_NUM = @internalReceiptNum;

END
