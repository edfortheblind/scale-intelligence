/*
 Mod Number 	| Programer	| Date	    | Modification Description
 ---------------|-----------|-----------|-------------------------
 180024			| RS        | 06/25/16  | Created.
 181915			| RS        | 06/26/16  | Fixed UX issues.
 181915			| RS        | 06/26/16  | Changed return type of LEADING_STS_FAILED and TRAILING_STS_FAILED.
 180253		    | AH        | 06/29/16  | Adding Hyperlink template for total shipment in total section
 181915			| RS        | 06/30/16  | Show dock door location instead of its id.
 186835			| RJR		| 09/13/16	| Open screens in current tab.
 185483			| AU		| 09/29/16	| Removed the components for accordions and added Indicator tile part
 195660			| RJR		| 01/11/17	| Added warehouse.
 191074			| DN		| 01/23/17	| Updated parameter types
*/

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

-- This table is used to store any additional formatting information about a column

SELECT top 1 N'SCALAR' AS SCALAR,
				INTERNAL_LOAD_NUM								    as HEADER_INTERNAL_LOAD_NUM,	
				CARRIER												as CARRIER,		
				SCHEDULED_SHIP_DATE                                 as ScheduledShipDate,
				dbo.STSfn_RtrvStsName(N'Outbound', LEADING_STS)		as LEADING_STS,
				dbo.STSfn_RtrvStsName(N'Outbound', TRAILING_STS)		as TRAILING_STS, 
				WAREHOUSE											as WAREHOUSE 
FROM #tempLI

----Indicator tiles

SELECT top 1 N'SCALAR' AS SCALAR,
			 TOTAL_SHIPMENTS AS TotalShipments,
			 TOTAL_CONTAINERS AS TotalContainers,
             (SELECT COUNT(INTERNAL_SHIPMENT_LINE_NUM) 
			 from METADATA_INSIGHT_SHIPMENT_DETAIL_VIEW where SHIPPING_LOAD_NUM=@internalLoadNum) AS TotalLines			 	  	             						 
FROM #tempLI 

END