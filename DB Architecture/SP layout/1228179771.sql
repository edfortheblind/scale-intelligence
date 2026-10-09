/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	193276	| DP	| 02/14/17	| Created
	198467  | KSS   | 03/02/17  | Added InternalCountNum column
	207780	| TDA	| 07/03/17	| Added  Description and thumbnail image
*/

CREATE PROCEDURE CCR_InsightDetailPaneData(@internalCountNum numeric(9),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'SCALAR' AS SCALAR,
             CCR.LOCATION as Location,
             CCR.ITEM     as Item,
             CCR.COMPANY  as Company,
             CCR.ITEM_DESC as Description,
			 i.WEB_THUMBNAIL_IMG AS WebThumbnailImage,
			 CCR.Warehouse As Warehouse,
			 CCR.INTERNAL_COUNT_NUM as InternalCountNum	--Required for indicator tile		 
FROM CYCLE_COUNT_REQUEST CCR
LEFT OUTER JOIN ITEM i 
		on (CCR.ITEM = i.ITEM AND (CCR.COMPANY = i.COMPANY OR (CCR.COMPANY IS NULL AND i.COMPANY IS NULL)))
WHERE INTERNAL_COUNT_NUM = @internalCountNum;


-- Open work count
SELECT top 1 N'SCALAR' AS SCALAR,
	COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OpenWorkCount
FROM 
	WORK_INSTRUCTION WI
WHERE
	WI.INTERNAL_NUM_TYPE = N'Cycle Count'AND
	WI.INSTRUCTION_TYPE = N'Detail' AND
	WI.CONDITION <> N'Closed' AND
	WI.INTERNAL_REQ_NUM = @internalCountNum;

END

