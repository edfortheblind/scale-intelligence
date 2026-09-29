-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

















-- [comment omitted]

CREATE PROCEDURE WRK_InsightDetailPaneData(@internalinstructionnum numeric(9),@culture nvarchar(10))  
AS 
BEGIN

SELECT top 1 N'<literal:1>' AS SCALAR,
			 wi.WORK_UNIT		as WorkUnit,
			 wi.WORK_TYPE		as WorkType,
			 wi.FROM_LOC		as FromLocation,
			 wi.TO_LOC			as ToLocation,
			 wi.CONDITION		as Condition,
			 wi.INTERNAL_INSTRUCTION_NUM as InternalInstructionNum,
			 wi.ITEM as Item,
			 wi.COMPANY as Company,
			 wi.ITEM_DESC as ItemDesc,
			 i.WEB_THUMBNAIL_IMG AS WebThumbnailImage
FROM WORK_INSTRUCTION_VIEW wi
LEFT OUTER JOIN ITEM i
ON (wi.ITEM = i.ITEM AND (wi.COMPANY = i.COMPANY OR (wi.COMPANY IS NULL AND i.COMPANY IS NULL)))
WHERE INTERNAL_INSTRUCTION_NUM= @internalinstructionnum;


END

