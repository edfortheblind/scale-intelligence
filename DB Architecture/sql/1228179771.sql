-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE CCR_InsightDetailPaneData(@internalCountNum numeric(9),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
             CCR.LOCATION as Location,
             CCR.ITEM     as Item,
             CCR.COMPANY  as Company,
             CCR.ITEM_DESC as Description,
			 i.WEB_THUMBNAIL_IMG AS WebThumbnailImage,
			 CCR.Warehouse As Warehouse,
			 CCR.INTERNAL_COUNT_NUM as InternalCountNum	-- [comment omitted]
FROM CYCLE_COUNT_REQUEST CCR
LEFT OUTER JOIN ITEM i 
		on (CCR.ITEM = i.ITEM AND (CCR.COMPANY = i.COMPANY OR (CCR.COMPANY IS NULL AND i.COMPANY IS NULL)))
WHERE INTERNAL_COUNT_NUM = @internalCountNum;


-- [comment omitted]
SELECT top 1 N'<literal:2>' AS SCALAR,
	COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OpenWorkCount
FROM 
	WORK_INSTRUCTION WI
WHERE
	WI.INTERNAL_NUM_TYPE = N'<literal:3>'AND
	WI.INSTRUCTION_TYPE = N'<literal:4>' AND
	WI.CONDITION <> N'<literal:5>' AND
	WI.INTERNAL_REQ_NUM = @internalCountNum;

END

