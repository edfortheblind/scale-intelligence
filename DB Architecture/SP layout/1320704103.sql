 --Mod Number 	| Programer	| Date	    | Modification Description
 ---------------|-----------|-----------|-------------------------
-- 162787		| AH        | 05/05/15  | Created.
-- 172838		| MSR		| 01/21/16	| Edited Resouce Keys of Userdefined 7 and 8 fields to reflect decimal position configurations.
-- 185879		| RJR		| 09/07/16	| Added Object_Id.
-- 185867       | AU        | 09/08/16  | Added OBJECT_ID and WebThumbnailImage to SCALAR
-- 197260       | DP        | 03/28/17  | Added Locations and total transactions
-- 201855       | KSS       | 04/13/17  | Changed the view name.
---205580		| NRJ		| 06/01/17	| Added ARCHIVED_LOT.
---209524		| TDA		| 07/12/17	| Added ItemDesc
---212932		| DP		| 11/09/17	| Handled Transactions tile to show proper records if company is not there

CREATE PROCEDURE INV_LotInsightDetailPaneData(@objectid numeric(20),@culture nvarchar(10))  

AS 

BEGIN

select * INTO #tempLI
FROM LOT_VIEW WHERE OBJECT_ID= @objectid;

SELECT top 1 N'SCALAR' AS SCALAR,
	LI.LOT				as Lot,	
	LI.ITEM				as Item,
	I.DESCRIPTION		as ItemDesc,
	LI.COMPANY			as Company,
	LI.OBJECT_ID		as ObjectId,
	LI.WAREHOUSE		as Warehouse,
	i.WEB_THUMBNAIL_IMG	as WebThumbnailImage,
	LI.ARCHIVED_LOT as ArchivedLot
FROM #tempLI LI LEFT OUTER JOIN ITEM i on LI.Item = i.ITEM AND (LI.Company = i.COMPANY OR (LI.Company IS NULL AND i.COMPANY IS NULL));

--Locations Count
SELECT top 1 N'SCALAR' AS SCALAR,
	LOCATIONS as LocationsCount
FROM #tempLI
WHERE
	OBJECT_ID = @objectid;

--Total Transactions
SELECT top 1 N'SCALAR' AS SCALAR,
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