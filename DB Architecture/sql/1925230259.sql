-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE PROCEDURE RCPT_ContainerInsightDetailPaneData(@internalRecContNum numeric(9), @culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
    rc.INTERNAL_REC_CONT_NUM AS InternalRecContNum,
	rc.CONTAINER_ID AS ContainerId,
	rc.CONTAINER_TYPE AS ContainerType,
	rc.ITEM as Item,
	rc.COMPANY as Company,
	rc.ITEM_DESC as ItemDesc,
	i.WEB_THUMBNAIL_IMG AS WebThumbnailImage,
	dbo.STSfn_RtrvStsName(N'<literal:2>', rc.CONTAINER_STATUS) AS ContainerStatus,
	rc.WAREHOUSE AS Warehouse
FROM METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW rc WITH(NOLOCK)
LEFT OUTER JOIN ITEM i
ON (rc.ITEM = i.ITEM AND (RC.COMPANY = i.COMPANY OR (rc.COMPANY IS NULL AND i.COMPANY IS NULL)))
WHERE rc.INTERNAL_REC_CONT_NUM = @internalRecContNum;

END




