-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
 -- [comment omitted]
 -- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]

CREATE PROCEDURE INV_LotInsightDetailPaneData(@objectid numeric(20),@culture nvarchar(10))  

AS 

BEGIN

select * INTO #tempLI
FROM LOT_VIEW WHERE OBJECT_ID= @objectid;

SELECT top 1 N'<literal:1>' AS SCALAR,
	LI.LOT				as Lot,	
	LI.ITEM				as Item,
	I.DESCRIPTION		as ItemDesc,
	LI.COMPANY			as Company,
	LI.OBJECT_ID		as ObjectId,
	LI.WAREHOUSE		as Warehouse,
	i.WEB_THUMBNAIL_IMG	as WebThumbnailImage,
	LI.ARCHIVED_LOT as ArchivedLot
FROM #tempLI LI LEFT OUTER JOIN ITEM i on LI.Item = i.ITEM AND (LI.Company = i.COMPANY OR (LI.Company IS NULL AND i.COMPANY IS NULL));

-- [comment omitted]
SELECT top 1 N'<literal:2>' AS SCALAR,
	LOCATIONS as LocationsCount
FROM #tempLI
WHERE
	OBJECT_ID = @objectid;

-- [comment omitted]
SELECT top 1 N'<literal:3>' AS SCALAR,
		COUNT(TH.INTERNAL_ID) AS TotalTransactions
	FROM 
	#tempLI LV,
	TRANSACTION_HISTORY TH
	WHERE
		LV.OBJECT_ID = @objectid
		AND LV.LOT = TH.LOT
		AND LV.WAREHOUSE = TH.WAREHOUSE
		AND LV.ITEM = TH.ITEM
		AND (LV.COMPANY = TH.COMPANY OR (LV.Company IS NULL AND TH.COMPANY IS NULL));
END