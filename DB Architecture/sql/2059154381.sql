-- DOCUMENTATION ONLY: literals/comments removed; do not execute.



-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
CREATE PROCEDURE [dbo].[ShipRec_FinishedToday_AFChart] 
	-- [comment omitted]

AS
BEGIN
	-- [comment omitted]
	-- [comment omitted]
	SET NOCOUNT ON;

    -- [comment omitted]

	SELECT 
	SUM(CASE WHEN SH.TRAILING_STS >= 650 THEN 1 ELSE 0 END) AS COMPLETED,
	SUM(CASE WHEN SH.TRAILING_STS >= 650 THEN 0 ELSE 1 END) AS INCOMPLETE,
	CAST(DATEPART(yy, SH.PLANNED_SHIP_DATE) AS VARCHAR) + '<literal:1>' + 
	RIGHT('<literal:2>' + CAST(DATEPART(mm, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + '<literal:3>' + 
	RIGHT('<literal:4>' + CAST(DATEPART(dd, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) 
	as PlannedShipDate 
	-- [comment omitted]
	FROM SHIPMENT_DETAIL AS SD
	INNER JOIN SHIPMENT_HEADER AS SH WITH(NOLOCK) ON SD.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM 
	WHERE SH.PLANNED_SHIP_DATE >= DATEADD(dd,DATEDIFF(dd,0,GETDATE()),0)  
	AND SD.ITEM_CATEGORY1 IN ('<literal:5>', '<literal:6>') 
	AND (SH.LAUNCH_NUM IS NULL OR SH.LAUNCH_NUM NOT IN (49906, 49910) )
	AND SH.CUSTOMER_CATEGORY2 = '<literal:7>' 
	AND SD.TOTAL_QTY > 0
	GROUP BY 
	CAST(DATEPART(yy, SH.PLANNED_SHIP_DATE) AS VARCHAR) + '<literal:8>' + 
	RIGHT('<literal:9>' + CAST(DATEPART(mm, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + '<literal:10>' + 
	RIGHT('<literal:11>' + CAST(DATEPART(dd, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) 
	ORDER BY PlannedShipDate ASC

END