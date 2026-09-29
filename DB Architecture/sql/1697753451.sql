-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE SHP_MonitorCustomerShipToChartData
@filterCriteria NVARCHAR(MAX),
@culture NVARCHAR(10) 
AS
    SET NOCOUNT ON
	DECLARE @warehouse as NVARCHAR(50);
	DECLARE @customerCat1 as NVARCHAR(50);
	DECLARE @customer as NVARCHAR(50);	
  
	DECLARE @criteriaTempTable TABLE (
   filterName NVARCHAR(300),
   filterValue NVARCHAR(300))

 /* [comment omitted] */
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)

  SELECT @warehouse = filterValue FROM @criteriaTempTable WHERE filterName = N'<literal:1>'
  SELECT @customerCat1 = filterValue from @criteriaTempTable WHERE filterName = N'<literal:2>'
  SELECT @customer = filterValue from @criteriaTempTable WHERE filterName = N'<literal:3>'
  DECLARE @Unassign NVARCHAR(2000);
  SET @Unassign=  dbo.RSCMfn_RtrvResource(N'<literal:4>',N'<literal:5>',@culture)
   IF(@customerCat1 = @Unassign)
	SET @customerCat1 = NULL;

   IF(@customer = @Unassign)
	SET @customer = NULL;

	
SELECT N'<literal:6>' AS CHARTDATA_MonitorCustomerShipTo, 
CATEGORY = CASE WHEN  SHIP_TO IS NULL THEN dbo.RSCMfn_RtrvResource(N'<literal:7>',N'<literal:8>',@culture) ELSE SHIP_TO END,
COUNT(distinct(INTERNAL_SHIPMENT_NUM)) AS N'<literal:9>' ,
DESCRIPTION = CASE WHEN  SHIP_TO IS NULL THEN NULL ELSE SHIP_TO END,
N'<literal:10>' AS XAXISTITLE, 
N'<literal:11>' AS YAXISTITLE, 
-1 AS NextDrillDownLevel, 
N'<literal:12>' AS CHARTTITLE
FROM Metadata_Insight_Shipment_View WHERE WAREHOUSE=@warehouse AND 
((@customerCat1 is null AND CUSTOMER_CATEGORY1 is null ) OR CUSTOMER_CATEGORY1=@customerCat1) AND 
((@customer is null AND CUSTOMER_NAME is null ) OR CUSTOMER_NAME=@customer ) AND SHIPMENT_HEADER_TRAILING_STS <900 
GROUP BY SHIP_TO;

/* [comment omitted] */
DECLARE @TOTAL_SHIPMENTS INT=0,@TOTAL_SHIPPING_LOAD INT=0,@WIP_SHIPMENTS INT=0,@SHIPMENT_NOT_PICKING INT=0;

SELECT @TOTAL_SHIPMENTS = COUNT(distinct(INTERNAL_SHIPMENT_NUM)) ,
	   @TOTAL_SHIPPING_LOAD =COUNT(DISTINCT(SHIPPING_LOAD_NUM)) FROM Metadata_Insight_Shipment_View WHERE WAREHOUSE=@warehouse AND ((@customerCat1 is null AND CUSTOMER_CATEGORY1 is null ) OR CUSTOMER_CATEGORY1=@customerCat1) AND 
((@customer is null AND CUSTOMER_NAME is null ) OR CUSTOMER_NAME=@customer) AND SHIPMENT_HEADER_TRAILING_STS <900  ;
SELECT @WIP_SHIPMENTS =COUNT(distinct(INTERNAL_SHIPMENT_NUM)) FROM Metadata_Insight_Shipment_View WHERE WAREHOUSE=@warehouse AND ((@customerCat1 is null AND CUSTOMER_CATEGORY1 is null ) OR CUSTOMER_CATEGORY1=@customerCat1) AND 
((@customer is null AND CUSTOMER_NAME is null ) OR CUSTOMER_NAME=@customer)
AND SHIPMENT_HEADER_LEADING_STS>300 AND SHIPMENT_HEADER_TRAILING_STS <700  ;
SELECT @SHIPMENT_NOT_PICKING=COUNT(DISTINCT(INTERNAL_SHIPMENT_NUM)) FROM Metadata_Insight_Shipment_View WHERE WAREHOUSE=@warehouse 
AND ((@customerCat1 is null AND CUSTOMER_CATEGORY1 is null ) OR CUSTOMER_CATEGORY1=@customerCat1)
AND ((@customer is null AND CUSTOMER_NAME is null ) OR CUSTOMER_NAME=@customer)
AND SHIPMENT_HEADER_TRAILING_STS =300 AND SHIPMENT_HEADER_LEADING_STS =300;
	

SELECT TOP 1 N'<literal:13>' AS SUMMARYTILE_TOTAL_SHIPMENTS,  @TOTAL_SHIPMENTS AS TOTAL_SHIPMENTS;
SELECT TOP 1 N'<literal:14>' AS SUMMARYTILE_TOTAL_SHIPPING_LOADS,  @TOTAL_SHIPPING_LOAD AS TOTAL_SHIPPING_LOADS;
SELECT TOP 1 N'<literal:15>' AS SUMMARYTILE_WIP_SHIPMENTS,  @WIP_SHIPMENTS AS WIP_SHIPMENTS;
SELECT TOP 1 N'<literal:16>' AS SUMMARYTILE_SHIPMENTS_NOT_STARTED_PICKING, @SHIPMENT_NOT_PICKING AS SHIPMENTS_NOT_STARTED_PICKING;