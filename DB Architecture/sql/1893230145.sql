-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE QLTYHST_InsightDetailPaneData(@internalId numeric(9) , @culture nvarchar(200))  
AS 
BEGIN
select * INTO #tempQH
FROM QUALITY_HISTORY
WHERE INTERNAL_ID= @internalId;

SELECT top 1 N'<literal:1>' AS SCALAR,
			 temp.REFERENCE_ORDER	AS ReferenceOrder,
			 temp.WORK_TYPE			AS WorkType,
			 temp.ITEM				AS Item,
			 temp.COMPANY			AS Company,
			 i.DESCRIPTION			As ItemDesc,
			 i.WEB_THUMBNAIL_IMG	AS WebThumbnailImg,
			 temp.INTERNAL_ID        AS InternalId,
			 dbo.GENCONFIGfn_RtrvDesc(N'<literal:2>' ,REASON_CODE)  as ReasonCodeDesc
FROM #tempQH temp LEFT OUTER JOIN ITEM i on temp.Item = i.ITEM AND (temp.Company = i.COMPANY OR (temp.Company IS NULL AND i.COMPANY IS NULL));



END

