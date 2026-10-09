-- =============================================
-- Author:		Jimmy
-- Create date: 2010-04-22
-- Description:	Open work for ShipRec page
-- =============================================
CREATE PROCEDURE [dbo].[ShipRec_CurrentWorkTotals] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
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
		SUM(ISNULL([To Cancel], 0)) as 'To Cancel'   
		FROM 
		(
				SELECT 
				CASE WHEN SH.LAUNCH_NUM IN (49906, 49910) THEN 'To Cancel' 
				ELSE
					CASE WHEN SH.CUSTOMER NOT IN ('SC0141', 'SC1143', 'SC0140', 'N66265', 'SC0116') THEN 
						CASE WHEN SH.CUSTOMER_CATEGORY1 = 'ROTC' THEN 'ROTC' 
							ELSE  'OTHERS'
						END
						ELSE ISNULL(SH.CUSTOMER, 'DRMO') 
					END
				END
				AS CUSTOMER,
				CASE WHEN SH.TRAILING_STS < 300 OR SH.TRAILING_STS = 100 THEN 'In Pool' ELSE
					CASE WHEN SH.TRAILING_STS >= 300 AND SH.TRAILING_STS < 650  THEN 'Waved' ELSE 
						CASE WHEN SH.TRAILING_STS >= 650 AND SH.TRAILING_STS < 900 THEN 'Staged To Ship' ELSE 'Dunno' END
					END
				END 
					AS TRAILING_STS 
				, COUNT(SD.ERP_ORDER) AS REQ_COUNT 
		--		, SUM(SD.TOTAL_QTY) AS QTY 
		--		, AVG(SD.TOTAL_QTY) AS AVG_QTY
				FROM SHIPMENT_DETAIL AS SD
				INNER JOIN SHIPMENT_HEADER AS SH ON SD.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM 
				WHERE SH.TRAILING_STS < 900
				--AND (/*SH.LAUNCH_NUM NOT IN (49906, 49910) OR */ SH.LAUNCH_NUM IS NULL)
				AND SH.CUSTOMER_CATEGORY2 = 'Normal' 
				GROUP BY 
				CASE WHEN SH.LAUNCH_NUM IN (49906, 49910) THEN 'To Cancel' 
				ELSE
					CASE WHEN SH.CUSTOMER NOT IN ('SC0141', 'SC1143', 'SC0140', 'N66265', 'SC0116') THEN 
						CASE WHEN SH.CUSTOMER_CATEGORY1 = 'ROTC' THEN 'ROTC' 
							ELSE  'OTHERS'
						END
						ELSE ISNULL(SH.CUSTOMER, 'DRMO') 
					END
				END
				,
				CASE WHEN SH.TRAILING_STS < 300 OR SH.TRAILING_STS = 100 THEN 'In Pool' ELSE
					CASE WHEN SH.TRAILING_STS >= 300 AND SH.TRAILING_STS < 650  THEN 'Waved' ELSE 
						CASE WHEN SH.TRAILING_STS >= 650 AND SH.TRAILING_STS < 900 THEN 'Staged To Ship' ELSE 'Dunno' END
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
				WHEN 'In Pool' THEN 1
				WHEN 'Waved' THEN 2
				WHEN 'Staged To Ship' THEN 3
				ELSE 99
			END --CASE

END