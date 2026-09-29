-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE SHP_LotInsightDetailPaneData(@internalcontainernum numeric(9),@culture nvarchar(10))  
AS 
BEGIN
	SELECT top 1 N'<literal:1>' AS SCALAR,
	lot.LOT, 
	lot.ITEM, 
	i.DESCRIPTION as Description,
	i.WEB_THUMBNAIL_IMG AS WebThumbnailImage,
	lot.COMPANY, 
	lot.WAREHOUSE
	FROM METADATA_INSIGHT_SHIPPED_LOT_VIEW lot
	LEFT OUTER JOIN ITEM i 
		on (lot.ITEM = i.ITEM AND (lot.COMPANY = i.COMPANY OR (lot.COMPANY IS NULL AND i.COMPANY IS NULL)))
	WHERE INTERNAL_CONTAINER_NUM= @internalcontainernum;
END
