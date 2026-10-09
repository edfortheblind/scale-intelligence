/*
	Mod Number	| Programmer	| Date   		| Modification Description
	-------------------------------------------------------------------- 
	193269		| DP			| 12/16/2016	| Created.
	196608		| RJR			| 01/17/2017	| Added warehouse
	207780		| TDA		    | 07/03/17		| Added  Description and thumbnail image
*/

CREATE PROCEDURE SHP_LotInsightDetailPaneData(@internalcontainernum numeric(9),@culture nvarchar(10))  
AS 
BEGIN
	SELECT top 1 N'SCALAR' AS SCALAR,
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
