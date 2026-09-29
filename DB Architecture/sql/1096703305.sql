-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

 /* [comment omitted] */










CREATE PROCEDURE IN_InsightDetailPaneData(@internalrequestnum numeric(9),@culture nvarchar(10))  
AS 
BEGIN

select * INTO #tempIN
FROM IMMEDIATE_NEEDS_REQUEST
WHERE INTERNAL_REQUEST_NUM= @internalrequestnum;

SELECT top 1 N'<literal:1>' AS SCALAR,
             temp.INTERNAL_REQUEST_NUM	as Internalrequestnumber,	           
             temp.ITEM					as Item,
			 i.DESCRIPTION				as ItemDesc,
			 i.COMPANY					as Company,
			 i.WEB_THUMBNAIL_IMG		as WebThumbnailImage
FROM #tempIN temp LEFT OUTER JOIN ITEM i on temp.Item = i.ITEM AND (temp.Company = i.COMPANY OR (temp.Company IS NULL AND i.COMPANY IS NULL));

END