-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE Replenishment_InsightDetailPaneData(@InternalReplenishReqNum numeric(9), @culture nvarchar(10))  
AS 
BEGIN

		 
SELECT top 1 N'<literal:1>' AS SCALAR,
RR.ITEM As Item,
RR.COMPANY As Company,
i.description as ItemDesc,
i.WEB_THUMBNAIL_IMG AS WebThumbnailImage,
RR.INTERNAL_RPLN_REQ_NUM As InternalReplenishReqNum,
RR.FROM_WHS as Warehouse  
FROM REPLENISHMENT_REQUEST RR
LEFT OUTER JOIN ITEM i
ON (rr.ITEM = i.ITEM AND (rr.COMPANY = i.COMPANY OR (rr.COMPANY IS NULL AND i.COMPANY IS NULL)))
WHERE INTERNAL_RPLN_REQ_NUM = @InternalReplenishReqNum;


-- [comment omitted]
SELECT top 1 N'<literal:2>' AS SCALAR,
	COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OpenWorkCount
FROM 
	WORK_INSTRUCTION WI
WHERE
	WI.INTERNAL_NUM_TYPE = N'<literal:3>'AND
	WI.INSTRUCTION_TYPE = N'<literal:4>' AND
	WI.CONDITION <> N'<literal:5>' AND
	WI.INTERNAL_NUM = @InternalReplenishReqNum;

SELECT TOP 1 N'<literal:6>' AS SCALAR, 
		COUNT(INTERNAL_ID) AS TotalTransactions
		FROM TRANSACTION_HISTORY WHERE TRANSACTION_TYPE =170
		AND REFERENCE_ID =CAST(@InternalReplenishReqNum AS varchar(100));

END









