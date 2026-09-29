-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



    
  
CREATE PROCEDURE DASH_GetReceivingKPIData( 
 @warehouse nvarchar(25))    
AS    
BEGIN   
  
  
 -- [comment omitted]
 declare @todaysDateWithWarehouseOffset nvarchar(50);  
 declare @todaysDate datetime;  
 set @todaysDate = GETUTCDATE(); 
 set @todaysDateWithWarehouseOffset = CAST(dbo.GetWarehouseTimezoneValue(@warehouse, @todaysDate) AS DATE) 

 declare @receiptsTimeInterval nvarchar(100);  
  
  declare @plannedReceiptsByTime_now numeric(9,0);  
  declare @plannedReceiptsByTime_2 numeric(9,0);  
  declare @plannedReceiptsByTime_4 numeric(9,0);  
  declare @plannedReceiptsByTime_6 numeric(9,0);  
  declare @plannedReceiptsByTime_8 numeric(9,0);  
  declare @plannedReceiptsByTime_10 numeric(9,0);  
  declare @plannedReceiptsByTime_12 numeric(9,0);  
  
  declare @actualReceiptsByTime_now numeric(9,0);  
  declare @actualReceiptsByTime_2 numeric(9,0);  
  declare @actualReceiptsByTime_4 numeric(9,0);  
  declare @actualReceiptsByTime_6 numeric(9,0);  
  declare @actualReceiptsByTime_8 numeric(9,0);  
  declare @actualReceiptsByTime_10 numeric(9,0);  
  declare @actualReceiptsByTime_12 numeric(9,0);  
  
  set @receiptsTimeInterval = N'<literal:1>';  
    

  SET @plannedReceiptsByTime_now = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=130 AND WAREHOUSE=@warehouse ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedReceiptsByTime_2 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=130 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-4,@todaysDate) AND  DATEADD(HOUR,-2,@todaysDate) ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedReceiptsByTime_4 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=130 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-6,@todaysDate) AND  DATEADD(HOUR,-4,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedReceiptsByTime_6 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=130 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-8,@todaysDate) AND  DATEADD(HOUR,-6,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedReceiptsByTime_8 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=130 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-10,@todaysDate) AND  DATEADD(HOUR,-8,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedReceiptsByTime_10 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=130 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-12,@todaysDate) AND  DATEADD(HOUR,-10,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedReceiptsByTime_12 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=130 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-13,@todaysDate) AND  DATEADD(HOUR,-12,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  
  SET @actualReceiptsByTime_now = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=200 AND WAREHOUSE=@warehouse ORDER BY LAST_UPDATED DESC),0);  
  SET @actualReceiptsByTime_2 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=200 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-4,@todaysDate) AND  DATEADD(HOUR,-2,@todaysDate) ORDER BY LAST_UPDATED DESC),0);  
  SET @actualReceiptsByTime_4 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=200 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-6,@todaysDate) AND  DATEADD(HOUR,-4,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @actualReceiptsByTime_6 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=200 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-8,@todaysDate) AND  DATEADD(HOUR,-6,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @actualReceiptsByTime_8 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=200 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-10,@todaysDate) AND  DATEADD(HOUR,-8,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @actualReceiptsByTime_10 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=200 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-12,@todaysDate) AND  DATEADD(HOUR,-10,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @actualReceiptsByTime_12 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=200 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-13,@todaysDate) AND  DATEADD(HOUR,-12,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  
  select [10] as ReceiptsExpectedToday, [20] as ReceiptsHighPriorityToday, [30] as ReceiptsProcessedToday, [40] as ReceiptsExpectedTomorrow,  
  [50] as AverageExpectedReceiptsPerDay, [60] as ReceiptsExpectedThisWeek, [70] as AverageExpectedReceiptsPerWeek, [80] as ReceiptsRemainingToday,  
  [90] as LongestDockToStock, [100] as CurrentThroughputDockToStock, [110] as ShortestDockToStock, [120] as AverageDockToStock,[710] as GoalDockToStock,  
  @receiptsTimeInterval as TimeLineForReceipts,   
  convert(nvarchar(100),@plannedReceiptsByTime_12)+N'<literal:2>'+  
  convert(nvarchar(100),@plannedReceiptsByTime_10)+N'<literal:3>'+  
  convert(nvarchar(100),@plannedReceiptsByTime_8)+N'<literal:4>'+  
  convert(nvarchar(100),@plannedReceiptsByTime_6)+N'<literal:5>'+  
  convert(nvarchar(100),@plannedReceiptsByTime_4)+N'<literal:6>'+  
  convert(nvarchar(100),@plannedReceiptsByTime_2)+N'<literal:7>'+  
  convert(nvarchar(100),@plannedReceiptsByTime_now) as PlannedReceiptsByTime,  
  convert(nvarchar(100),@actualReceiptsByTime_12)+N'<literal:8>'+  
  convert(nvarchar(100),@actualReceiptsByTime_10)+N'<literal:9>'+  
  convert(nvarchar(100),@actualReceiptsByTime_8)+N'<literal:10>'+  
  convert(nvarchar(100),@actualReceiptsByTime_6)+N'<literal:11>'+  
  convert(nvarchar(100),@actualReceiptsByTime_4)+N'<literal:12>'+  
  convert(nvarchar(100),@actualReceiptsByTime_2)+N'<literal:13>'+  
  convert(nvarchar(100),@actualReceiptsByTime_now) as ActualReceiptsByTime  
  from   
  (  
  select value,IDENTIFIER from dashboard_data where IDENTIFIER in   
  (10,20,30,40,50,60,70,80,90,100,110,120,130,200,710)  
  and warehouse=@warehouse  
  )  
  SourceTable  
  
  PIVOT   
  (  
  max(value ) for  IDENTIFIER in   
  ([10],[20],[30],[40],[50],[60],[70],[80],[90],[100],[110],[120],[130],[200],[710])      
  )piv;    
END