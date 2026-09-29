-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */












CREATE PROCEDURE RCPT_LineInsightDetailPaneData(@internalReceiptLineNum numeric(9), @culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
    RL.INTERNAL_RECEIPT_NUM as InternalReceiptNum,
	RL.INTERNAL_RECEIPT_LINE_NUM as InternalReceiptLineNum,	
	RL.ERP_ORDER_LINE_NUM AS ErpOrderLineNum,
	RL.ITEM AS Item,
	RL.COMPANY AS Company,
	RL.ITEM_DESC AS ItemDesc,
	RL.RECEIPT_ID AS ReceiptId,
	RL.warehouse AS Warehouse,
	i.WEB_THUMBNAIL_IMG AS WebThumbnailImage
FROM METADATA_INSIGHT_RECEIPT_LINE_VIEW RL WITH(NOLOCK)
LEFT OUTER JOIN ITEM i
ON (RL.ITEM = i.ITEM AND (RL.COMPANY = i.COMPANY OR (RL.COMPANY IS NULL AND i.COMPANY IS NULL)))
WHERE INTERNAL_RECEIPT_LINE_NUM = @internalReceiptLineNum;

SELECT TOP 1 N'<literal:2>' AS SCALAR,
	COUNT(DISTINCT INTERNAL_REC_CONT_NUM) AS TotalContainers
FROM RECEIPT_CONTAINER WITH(NOLOCK)
WHERE INTERNAL_RECEIPT_LINE_NUM = @internalReceiptLineNum

END