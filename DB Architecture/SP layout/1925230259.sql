/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	191732	| DP	| 12/19/16	| Created
	192636	| SD	| 12/22/16	| Reformated the detail pane.
	193986	| SO	| 12/28/16	| Modified procedure to fetch warehouse
	193050	| MJ	| 01/04/17	| Modified Container Status column.
	191074	| DN	| 01/23/17	| Updated parameter types
	207780	| TDA	| 07/03/17	| Added Item, Company, Description and thumbnail image
*/
CREATE PROCEDURE RCPT_ContainerInsightDetailPaneData(@internalRecContNum numeric(9), @culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
    rc.INTERNAL_REC_CONT_NUM AS InternalRecContNum,
	rc.CONTAINER_ID AS ContainerId,
	rc.CONTAINER_TYPE AS ContainerType,
	rc.ITEM as Item,
	rc.COMPANY as Company,
	rc.ITEM_DESC as ItemDesc,
	i.WEB_THUMBNAIL_IMG AS WebThumbnailImage,
	dbo.STSfn_RtrvStsName(N'Inbound', rc.CONTAINER_STATUS) AS ContainerStatus,
	rc.WAREHOUSE AS Warehouse
FROM METADATA_INSIGHT_RECEIPT_CONTAINER_VIEW rc WITH(NOLOCK)
LEFT OUTER JOIN ITEM i
ON (rc.ITEM = i.ITEM AND (RC.COMPANY = i.COMPANY OR (rc.COMPANY IS NULL AND i.COMPANY IS NULL)))
WHERE rc.INTERNAL_REC_CONT_NUM = @internalRecContNum;

END




