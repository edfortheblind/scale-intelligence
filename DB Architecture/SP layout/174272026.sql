/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	193173		| MMM			| 12/16/16	| Created.
	191074		| DN			| 01/23/17	| Updated parameter types
	197545		| RS			| 02/11/17	| Added INTERNAL_ID.
	207780		| TDA			| 07/10/17	| Added item information
*/

CREATE PROCEDURE TRNHST_InsightDetailPaneData(@internalId numeric(9) ,@culture nvarchar(200))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
	th.INTERNAL_ID as InternalId,
	th.REFERENCE_ID as ReferenceId,
	dbo.GENCONFIGfn_RtrvDesc(N'HIST TR TY' ,TRANSACTION_TYPE) as TransactionType,
	th.LOCATION as Location,
	th.ITEM as Item,
	th.COMPANY as Company,
	i.DESCRIPTION as ItemDesc,
	i.WEB_THUMBNAIL_IMG AS WebThumbnailImage
FROM TRANSACTION_HISTORY th
LEFT OUTER JOIN ITEM i
ON (th.ITEM = i.ITEM AND (th.COMPANY = i.COMPANY OR (th.COMPANY IS NULL AND i.COMPANY IS NULL)))
WHERE INTERNAL_ID = @internalId;

END

