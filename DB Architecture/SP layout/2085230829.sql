/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	193275	| DP	| 02/14/17	| Created
	198467  | KSS   | 03/02/17  | Added TotalTransactions 
    207780	| TDA	| 07/03/17	| Added  Description and thumbnail image
*/

CREATE PROCEDURE Replenishment_InsightDetailPaneData(@InternalReplenishReqNum numeric(9), @culture nvarchar(10))  
AS 
BEGIN

		 
SELECT top 1 N'SCALAR' AS SCALAR,
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


-- Open work count
SELECT top 1 N'SCALAR' AS SCALAR,
	COUNT(WI.INTERNAL_INSTRUCTION_NUM) AS OpenWorkCount
FROM 
	WORK_INSTRUCTION WI
WHERE
	WI.INTERNAL_NUM_TYPE = N'Replenishment'AND
	WI.INSTRUCTION_TYPE = N'Detail' AND
	WI.CONDITION <> N'Closed' AND
	WI.INTERNAL_NUM = @InternalReplenishReqNum;

SELECT TOP 1 N'SCALAR' AS SCALAR, 
		COUNT(INTERNAL_ID) AS TotalTransactions
		FROM TRANSACTION_HISTORY WHERE TRANSACTION_TYPE =170
		AND REFERENCE_ID =CAST(@InternalReplenishReqNum AS varchar(100));

END









