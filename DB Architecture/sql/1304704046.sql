-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













CREATE PROCEDURE INV_LoadInsightDetailPaneData(@internalLoadNum numeric(9))  
AS 
SET NOCOUNT ON;
BEGIN

SELECT 
INTERNAL_LOAD_NUM,
CARRIER,
SCHEDULED_SHIP_DATE,
LEADING_STS,
TRAILING_STS,
TOTAL_SHIPMENTS,
TOTAL_CONTAINERS, 
WAREHOUSE INTO #tempLI
FROM SHIPPING_LOAD_VIEW
WHERE INTERNAL_LOAD_NUM= @internalLoadNum;

-- [comment omitted]

SELECT top 1 N'<literal:1>' AS SCALAR,
				INTERNAL_LOAD_NUM								    as HEADER_INTERNAL_LOAD_NUM,	
				CARRIER												as CARRIER,		
				SCHEDULED_SHIP_DATE                                 as ScheduledShipDate,
				dbo.STSfn_RtrvStsName(N'<literal:2>', LEADING_STS)		as LEADING_STS,
				dbo.STSfn_RtrvStsName(N'<literal:3>', TRAILING_STS)		as TRAILING_STS, 
				WAREHOUSE											as WAREHOUSE 
FROM #tempLI

-- [comment omitted]

SELECT top 1 N'<literal:4>' AS SCALAR,
			 TOTAL_SHIPMENTS AS TotalShipments,
			 TOTAL_CONTAINERS AS TotalContainers,
             (SELECT COUNT(INTERNAL_SHIPMENT_LINE_NUM) 
			 from METADATA_INSIGHT_SHIPMENT_DETAIL_VIEW where SHIPPING_LOAD_NUM=@internalLoadNum) AS TotalLines			 	  	             						 
FROM #tempLI 

END