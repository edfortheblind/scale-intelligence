/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	192636	| SD	| 12/22/16	| Created.
	193986	| SO	| 12/28/16	| Modified procedure to fetch warehouse
	191074	| DN	| 01/23/17	| Updated parameter types
*/CREATE PROCEDURE RCPT_InsightDetailPaneData(@internalReceiptNum numeric(9), @culture nvarchar(10))  
AS 
BEGIN

select top 1 N'SCALAR' AS SCALAR,
	INTERNAL_RECEIPT_NUM AS InternalReceiptNum,
    RECEIPT_ID AS ReceiptId,
	SHIP_FROM_NAME AS ShipFromName,
	dbo.STSfn_RtrvStsName(N'Inbound' ,RECEIPT_HEADER_TRAILING_STS) AS TrailingSts ,
    dbo.STSfn_RtrvStsName(N'Inbound' ,RECEIPT_HEADER_LEADING_STS) AS LeadingSts,
	TOTAL_LINES AS TotalLines,
	TOTAL_CONTAINERS AS TotalContainers,
	WAREHOUSE AS Warehouse
FROM METADATA_INSIGHT_RECEIPT_VIEW WITH(NOLOCK)
WHERE INTERNAL_RECEIPT_NUM = @internalReceiptNum;

END






