-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
CREATE PROCEDURE [dbo].[ShipRec_FinishedToday_Grid1] 
	-- [comment omitted]
	 @TheDate datetime = 0 

AS
BEGIN
-- [comment omitted]
-- [comment omitted]
	SET NOCOUNT ON;

    -- [comment omitted]
/* [comment omitted] */
	SELECT  
	SUM(CASE WHEN SH.CARRIER = '<literal:1>' THEN 1 ELSE 0 END) AS '<literal:2>', 
	SUM(CASE WHEN SH.CARRIER = '<literal:3>' THEN 0 ELSE 1 END) AS '<literal:4>',
	/* [comment omitted] */
	CASE WHEN LEFT(SD.ALLOCATION_RULE, 3) = '<literal:5>' THEN '<literal:6>' ELSE '<literal:7>' END as BLDG 
	FROM 	(SELECT  ERP_ORDER,  MAX(INTERNAL_SHIPMENT_NUM) AS INTERNAL_SHIPMENT_NUM 
		, MAX(ALLOCATION_RULE) AS ALLOCATION_RULE , SUM(TOTAL_QTY) AS TOTAL_QTY
		 FROM SHIPMENT_DETAIL 
		 GROUP BY ERP_ORDER)  AS SD
	INNER JOIN SHIPMENT_HEADER AS SH ON SH.INTERNAL_SHIPMENT_NUM = SD.INTERNAL_SHIPMENT_NUM
	WHERE 
	(
		 (
		SH.ACTUAL_SHIP_DATE_TIME >= DATEADD(dd,DATEDIFF(dd,0,@TheDate),0) 
		AND SH.ACTUAL_SHIP_DATE_TIME < DATEADD(dd,DATEDIFF(dd,0,@TheDate + 1),0) 
		 ) 
		OR 
		(
		SH.TRAILING_STS >= 700 
		AND SH.TRAILING_STS_DATE >= DATEADD(dd,DATEDIFF(dd,0,@TheDate),0) 
		AND SH.TRAILING_STS_DATE < DATEADD(dd,DATEDIFF(dd,0,@TheDate + 1),0) 
		 )  
	)
	AND SH.CUSTOMER_CATEGORY2 = '<literal:8>' 
	AND SD.TOTAL_QTY > 0
	GROUP BY CASE WHEN LEFT(SD.ALLOCATION_RULE, 3) = '<literal:9>' THEN '<literal:10>' ELSE '<literal:11>' END 
	ORDER BY BLDG


END