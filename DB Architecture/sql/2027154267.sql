-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
CREATE PROCEDURE [dbo].[ShipRec_FinishedToday_Grid2] 
       -- [comment omitted]
       @TheDate datetime = 0 
AS
BEGIN
    /* [comment omitted] */

	SET NOCOUNT ON;

	-- [comment omitted]

    /* [comment omitted] */
	SELECT TrailingStatus, TRAILING_STS, CARRIER_TYPE, 
		SUM(CASE WHEN BLDG IN ('<literal:1>','<literal:2>','<literal:3>') THEN CCOUNT ELSE 0 END) AS '<literal:4>'
	FROM (
			SELECT COUNT(SD.ERP_ORDER) AS CCOUNT,
			CASE SH.TRAILING_STS 
				WHEN 100 THEN '<literal:5>'
				WHEN 200 THEN '<literal:6>'
				WHEN 201 THEN '<literal:7>'
				WHEN 300 THEN '<literal:8>'
				WHEN 301 THEN '<literal:9>'
				WHEN 400 THEN '<literal:10>'
				WHEN 401 THEN '<literal:11>'
				WHEN 600 THEN '<literal:12>'
				WHEN 650 THEN '<literal:13>'
				WHEN 700 THEN '<literal:14>'
				WHEN 800 THEN '<literal:15>'
				WHEN 900 THEN '<literal:16>'
				ELSE CAST(SH.TRAILING_STS AS VARCHAR) 
			END As TrailingStatus,
			SH.TRAILING_STS AS TRAILING_STS,
			'<literal:17>' as BLDG,
			CASE SH.CARRIER_TYPE
				WHEN '<literal:18>' THEN '<literal:19>'
				WHEN '<literal:20>' THEN '<literal:21>'
				WHEN '<literal:22>' THEN '<literal:23>'
				ELSE SH.CARRIER_TYPE END As CARRIER_TYPE
			FROM (
					SELECT DISTINCT ERP_ORDER,
						SUM(TOTAL_QTY) AS TOTAL_QTY, 
						MAX(INTERNAL_SHIPMENT_NUM) AS INTERNAL_SHIPMENT_NUM, 
						MAX(ITEM) AS ITEM, 
						MAX(ITEM_CATEGORY1) AS ITEM_CATEGORY1 
					FROM SHIPMENT_DETAIL 
					GROUP BY ERP_ORDER
				)  AS SD 
			INNER JOIN SHIPMENT_HEADER AS SH 
				ON SD.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM 
			WHERE SH.PLANNED_SHIP_DATE >= DATEADD(dd,DATEDIFF(dd,0, @TheDate ),0)  
			AND SH.PLANNED_SHIP_DATE < DATEADD(dd,DATEDIFF(dd,0, @TheDate + 1),0)  
			AND (SH.LAUNCH_NUM NOT IN (49906, 49910) OR SH.LAUNCH_NUM IS NULL)
			AND SH.CUSTOMER_CATEGORY2 = '<literal:24>'  
			GROUP BY SH.TRAILING_STS, SH.CARRIER_TYPE
		) AS DER 
	GROUP BY TrailingStatus, TRAILING_STS, CARRIER_TYPE
	ORDER BY CARRIER_TYPE, TRAILING_STS 

	SET NOCOUNT OFF
END