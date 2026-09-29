-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE TRNHST_InsightDetailPaneData(@internalId numeric(9) ,@culture nvarchar(200))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
	th.INTERNAL_ID as InternalId,
	th.REFERENCE_ID as ReferenceId,
	dbo.GENCONFIGfn_RtrvDesc(N'<literal:2>' ,TRANSACTION_TYPE) as TransactionType,
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

