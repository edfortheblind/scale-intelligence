-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
CREATE PROCEDURE [dbo].[ShipRec_CurrentWorkTotals] 
	-- [comment omitted]

AS
BEGIN
	-- [comment omitted]
	-- [comment omitted]
	SET NOCOUNT ON;

		SELECT TRAILING_STS, 
		SUM(ISNULL([OTHERS], 0)) as Others ,
		SUM(ISNULL([ROTC], 0))	 as ROTC,
		SUM(ISNULL([SC0141], 0)) AS Lackland, 
		SUM(ISNULL([SC1143], 0)) as PI, 
		SUM(ISNULL([SC0140], 0)) as SD, 
		SUM(ISNULL([N66265], 0)) as NEXCOM, 
		SUM(ISNULL([SC0116], 0)) as KyLOC,
		SUM(ISNULL([DRMO], 0)) as DRMO,
		SUM(ISNULL([To Cancel], 0)) as '<literal:1>'   
		FROM 
		(
				SELECT 
				CASE WHEN SH.LAUNCH_NUM IN (49906, 49910) THEN '<literal:2>' 
				ELSE
					CASE WHEN SH.CUSTOMER NOT IN ('<literal:3>', '<literal:4>', '<literal:5>', '<literal:6>', '<literal:7>') THEN 
						CASE WHEN SH.CUSTOMER_CATEGORY1 = '<literal:8>' THEN '<literal:9>' 
							ELSE  '<literal:10>'
						END
						ELSE ISNULL(SH.CUSTOMER, '<literal:11>') 
					END
				END
				AS CUSTOMER,
				CASE WHEN SH.TRAILING_STS < 300 OR SH.TRAILING_STS = 100 THEN '<literal:12>' ELSE
					CASE WHEN SH.TRAILING_STS >= 300 AND SH.TRAILING_STS < 650  THEN '<literal:13>' ELSE 
						CASE WHEN SH.TRAILING_STS >= 650 AND SH.TRAILING_STS < 900 THEN '<literal:14>' ELSE '<literal:15>' END
					END
				END 
					AS TRAILING_STS 
				, COUNT(SD.ERP_ORDER) AS REQ_COUNT 
		-- [comment omitted]
		-- [comment omitted]
				FROM SHIPMENT_DETAIL AS SD
				INNER JOIN SHIPMENT_HEADER AS SH ON SD.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM 
				WHERE SH.TRAILING_STS < 900
				-- [comment omitted]
				AND SH.CUSTOMER_CATEGORY2 = '<literal:16>' 
				GROUP BY 
				CASE WHEN SH.LAUNCH_NUM IN (49906, 49910) THEN '<literal:17>' 
				ELSE
					CASE WHEN SH.CUSTOMER NOT IN ('<literal:18>', '<literal:19>', '<literal:20>', '<literal:21>', '<literal:22>') THEN 
						CASE WHEN SH.CUSTOMER_CATEGORY1 = '<literal:23>' THEN '<literal:24>' 
							ELSE  '<literal:25>'
						END
						ELSE ISNULL(SH.CUSTOMER, '<literal:26>') 
					END
				END
				,
				CASE WHEN SH.TRAILING_STS < 300 OR SH.TRAILING_STS = 100 THEN '<literal:27>' ELSE
					CASE WHEN SH.TRAILING_STS >= 300 AND SH.TRAILING_STS < 650  THEN '<literal:28>' ELSE 
						CASE WHEN SH.TRAILING_STS >= 650 AND SH.TRAILING_STS < 900 THEN '<literal:29>' ELSE '<literal:30>' END
					END
				END 
		) ps
		PIVOT
		(
		SUM(REQ_COUNT) 
		FOR CUSTOMER IN 
		( [SC0141], [SC1143], [SC0140], [N66265], [SC0116], [OTHERS], [DRMO], [ROTC], [To Cancel] )
		) AS pvt

		GROUP BY TRAILING_STS 
		ORDER BY 
			CASE TRAILING_STS 
				WHEN '<literal:31>' THEN 1
				WHEN '<literal:32>' THEN 2
				WHEN '<literal:33>' THEN 3
				ELSE 99
			END -- [comment omitted]

END