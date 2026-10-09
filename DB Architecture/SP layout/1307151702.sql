
-- =============================================
-- Author:		Jimmy
-- Create date: 2010-03-27
-- Description:	AF Zero-day gadget query
-- =============================================
CREATE PROCEDURE [dbo].[TRAV_Gadget_AFZeroDay] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

DECLARE @TheNumber as int
/*
SET @TheNumber = (
	SELECT TOP 1 
	CAST(100*(cast(COMPLETED as REAL))/ cast((isnull(COMPLETED, 0) + isnull(INCOMPLETE, 0)) as REAL) AS INT)
	AS TTOTAL 
	FROM (
		SELECT 
		SUM(CASE WHEN SH.TRAILING_STS >= 650 THEN 1 ELSE 0 END) AS COMPLETED,
		SUM(CASE WHEN SH.TRAILING_STS >= 650 THEN 0 ELSE 1 END) AS INCOMPLETE,
		RIGHT('0' + CAST(DATEPART(mm, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + '/' + 
		RIGHT('0' + CAST(DATEPART(dd, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + '/' + 
		CAST(DATEPART(yy, SH.PLANNED_SHIP_DATE) AS VARCHAR) 
		as PlannedShipDate 
		--CONVERT(DateTime, FLOOR(CONVERT( Float, SH.PLANNED_SHIP_DATE  )))  AS PlannedShipDate
		FROM 	(SELECT DISTINCT ERP_ORDER, SUM(TOTAL_QTY) AS TOTAL_QTY, MAX(INTERNAL_SHIPMENT_NUM) AS INTERNAL_SHIPMENT_NUM, MAX(ITEM) AS ITEM , MAX(ITEM_CATEGORY1) AS ITEM_CATEGORY1 
			 FROM VPVWMS3.ILS.dbo.SHIPMENT_DETAIL 
			 GROUP BY ERP_ORDER)   AS SD 
		INNER JOIN SHIPMENT_HEADER AS SH WITH(NOLOCK) ON SD.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM 
		WHERE SH.PLANNED_SHIP_DATE >= DATEADD(dd,DATEDIFF(dd,0,GETDATE()),0)  
		AND SH.PLANNED_SHIP_DATE < GETDATE()
		AND SD.ITEM_CATEGORY1 IN ('Army', 'Air Force') 
			AND SH.LAUNCH_NUM NOT IN (49906, 49910) 
		AND SH.SHIP_TO NOT IN ('SZ3547', 'SC1143', 'SC0140', 'SC0141', 'N66265')
		GROUP BY 
		RIGHT('0' + CAST(DATEPART(mm, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + '/' + 
		RIGHT('0' + CAST(DATEPART(dd, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + '/' + 
		CAST(DATEPART(yy, SH.PLANNED_SHIP_DATE) AS VARCHAR) 
	) AS DER
)
*/
SET @TheNumber = 55
SELECT isnull(@TheNumber, 0)


END