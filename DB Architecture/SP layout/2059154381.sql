


-- =============================================
-- Author:		Jimmy
-- Create date: 2009-12-10
-- Description:	ShipRec Chart FinishedToday AF
-- =============================================
CREATE PROCEDURE [dbo].[ShipRec_FinishedToday_AFChart] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT 
	SUM(CASE WHEN SH.TRAILING_STS >= 650 THEN 1 ELSE 0 END) AS COMPLETED,
	SUM(CASE WHEN SH.TRAILING_STS >= 650 THEN 0 ELSE 1 END) AS INCOMPLETE,
	CAST(DATEPART(yy, SH.PLANNED_SHIP_DATE) AS VARCHAR) + '-' + 
	RIGHT('0' + CAST(DATEPART(mm, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + '-' + 
	RIGHT('0' + CAST(DATEPART(dd, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) 
	as PlannedShipDate 
	--CONVERT(DateTime, FLOOR(CONVERT( Float, SH.PLANNED_SHIP_DATE  )))  AS PlannedShipDate
	FROM SHIPMENT_DETAIL AS SD
	INNER JOIN SHIPMENT_HEADER AS SH WITH(NOLOCK) ON SD.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM 
	WHERE SH.PLANNED_SHIP_DATE >= DATEADD(dd,DATEDIFF(dd,0,GETDATE()),0)  
	AND SD.ITEM_CATEGORY1 IN ('Air Force', 'Coast Guard') 
	AND (SH.LAUNCH_NUM IS NULL OR SH.LAUNCH_NUM NOT IN (49906, 49910) )
	AND SH.CUSTOMER_CATEGORY2 = 'Normal' 
	AND SD.TOTAL_QTY > 0
	GROUP BY 
	CAST(DATEPART(yy, SH.PLANNED_SHIP_DATE) AS VARCHAR) + '-' + 
	RIGHT('0' + CAST(DATEPART(mm, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + '-' + 
	RIGHT('0' + CAST(DATEPART(dd, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) 
	ORDER BY PlannedShipDate ASC

END