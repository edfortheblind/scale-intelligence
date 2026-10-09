/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	193270		| AH			| 12/16/16	| Created.
	209524		| TDA			| 07/12/17	| Added ItemDesc and WebThumbnailImg

*/


CREATE PROCEDURE QLTYHST_InsightDetailPaneData(@internalId numeric(9) , @culture nvarchar(200))  
AS 
BEGIN
select * INTO #tempQH
FROM QUALITY_HISTORY
WHERE INTERNAL_ID= @internalId;

SELECT top 1 N'SCALAR' AS SCALAR,
			 temp.REFERENCE_ORDER	AS ReferenceOrder,
			 temp.WORK_TYPE			AS WorkType,
			 temp.ITEM				AS Item,
			 temp.COMPANY			AS Company,
			 i.DESCRIPTION			As ItemDesc,
			 i.WEB_THUMBNAIL_IMG	AS WebThumbnailImg,
			 temp.INTERNAL_ID        AS InternalId,
			 dbo.GENCONFIGfn_RtrvDesc(N'QUAL RC' ,REASON_CODE)  as ReasonCodeDesc
FROM #tempQH temp LEFT OUTER JOIN ITEM i on temp.Item = i.ITEM AND (temp.Company = i.COMPANY OR (temp.Company IS NULL AND i.COMPANY IS NULL));



END

