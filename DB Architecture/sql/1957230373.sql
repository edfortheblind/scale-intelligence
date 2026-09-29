-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE RCPT_InsightDetailPaneData(@internalReceiptNum numeric(9), @culture nvarchar(10))  
AS 
BEGIN

select top 1 N'<literal:1>' AS SCALAR,
	INTERNAL_RECEIPT_NUM AS InternalReceiptNum,
    RECEIPT_ID AS ReceiptId,
	SHIP_FROM_NAME AS ShipFromName,
	dbo.STSfn_RtrvStsName(N'<literal:2>' ,RECEIPT_HEADER_TRAILING_STS) AS TrailingSts ,
    dbo.STSfn_RtrvStsName(N'<literal:3>' ,RECEIPT_HEADER_LEADING_STS) AS LeadingSts,
	TOTAL_LINES AS TotalLines,
	TOTAL_CONTAINERS AS TotalContainers,
	WAREHOUSE AS Warehouse
FROM METADATA_INSIGHT_RECEIPT_VIEW WITH(NOLOCK)
WHERE INTERNAL_RECEIPT_NUM = @internalReceiptNum;

END






