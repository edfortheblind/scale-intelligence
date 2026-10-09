/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	193272	| MJ	| 12/16/16	| Created
	196608	| RJR	| 01/17/17	| Added warehouse
	207780	| TDA	| 07/03/17	| Added  Description and thumbnail image
*/


CREATE PROCEDURE RQH_InsightDetailPaneData(@internalid numeric(9),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
             RQH.RECEIPT_ID			as  ReceiptId,
             RQH.INTERNAL_ID		as InternalId,
             RQH.DESCRIPTION		as ReasonCodeDescription, 
			 RQH.ITEM as Item, 
			 i.DESCRIPTION as ItemDesc,
		     i.WEB_THUMBNAIL_IMG AS WebThumbnailImage,
			 RQH.COMPANY as Company, 
			 WAREHOUSE			as WAREHOUSE
FROM METADATA_RECEIPT_QUALITY_HISTORY RQH
LEFT OUTER JOIN ITEM i 
		on (RQH.ITEM = i.ITEM AND (RQH.COMPANY = i.COMPANY OR (RQH.COMPANY IS NULL AND i.COMPANY IS NULL)))
WHERE INTERNAL_ID= @internalid;

END