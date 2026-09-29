-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



     
  
CREATE PROCEDURE DASH_GetShippingKPIData( 
 @warehouse nvarchar(25))    
AS    
BEGIN   
  
 -- [comment omitted]
 declare @todaysDateWithWarehouseOffset nvarchar(50);  
 declare @todaysDate datetime;  
 set @todaysDate = GETUTCDATE();  
 set @todaysDateWithWarehouseOffset = CAST(dbo.GetWarehouseTimezoneValue(@warehouse, @todaysDate) AS DATE)  
 
  declare @shipmentsTimeInterval nvarchar(100);  
  declare @plannedShipmentsByTime_now numeric(9,0)=0;  
  declare @plannedShipmentsByTime_2 numeric(9,0)=0;  
  declare @plannedShipmentsByTime_4 numeric(9,0)=0;  
  declare @plannedShipmentsByTime_6 numeric(9,0)=0;  
  declare @plannedShipmentsByTime_8 numeric(9,0)=0;  
  declare @plannedShipmentsByTime_10 numeric(9,0)=0;  
  declare @plannedShipmentsByTime_12 numeric(9,0)=0;  
  
  declare @actualShipmentsByTime_now numeric(9,0)=0;  
  declare @actualShipmentsByTime_2 numeric(9,0)=0;  
  declare @actualShipmentsByTime_4 numeric(9,0)=0;  
  declare @actualShipmentsByTime_6 numeric(9,0)=0;  
  declare @actualShipmentsByTime_8 numeric(9,0)=0;  
  declare @actualShipmentsByTime_10 numeric(9,0)=0;  
  declare @actualShipmentsByTime_12 numeric(9,0)=0;  
  
  set @shipmentsTimeInterval = N'<literal:1>';    
  
  SET @plannedShipmentsByTime_now = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedShipmentsByTime_2 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-4,@todaysDate) AND  DATEADD(HOUR,-2,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedShipmentsByTime_4 = ISNULL((SELECT top 1 CAST(VALUE  AS NUMERIC(9,0))  FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-6,@todaysDate) AND  DATEADD(HOUR,-4,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedShipmentsByTime_6 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0))  FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-8,@todaysDate) AND  DATEADD(HOUR,-6,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedShipmentsByTime_8 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0))  FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-10,@todaysDate) AND  DATEADD(HOUR,-8,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedShipmentsByTime_10 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-12,@todaysDate) AND  DATEADD(HOUR,-10,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @plannedShipmentsByTime_12 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-14,@todaysDate) AND  DATEADD(HOUR,-12,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  
  SET @actualShipmentsByTime_now = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse ORDER BY LAST_UPDATED DESC),0);  
  SET @actualShipmentsByTime_2 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0))  FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-4,@todaysDate) AND  DATEADD(HOUR,-2,@todaysDate) ORDER BY LAST_UPDATED DESC),0);  
  SET @actualShipmentsByTime_4 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-6,@todaysDate) AND  DATEADD(HOUR,-4,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @actualShipmentsByTime_6 = ISNULL((SELECT top 1 CAST(VALUE  AS NUMERIC(9,0)) FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-8,@todaysDate) AND  DATEADD(HOUR,-6,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @actualShipmentsByTime_8 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-10,@todaysDate) AND  DATEADD(HOUR,-8,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @actualShipmentsByTime_10 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-12,@todaysDate) AND  DATEADD(HOUR,-10,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  SET @actualShipmentsByTime_12 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA 
										WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-14,@todaysDate) AND  DATEADD(HOUR,-12,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);  
  
  -- [comment omitted]
  select [270] as ExpectedShipmentsForToday,[280] as ShipmentsProcessedToday, [290] as ShipmentsAtRiskForToday,   
  [300] as ExpectedShipmentsForTomorrow, [310] as AverageExpectedShipmentsPerDay, [320] as ExpectedShipmentsForWeek,  
  [330] as AverageExpectedShipmentsPerWeek,  
  [350] as RemainingShipmentsForToday, @shipmentsTimeInterval as TimeLineForShipments,   
   convert(nvarchar(100),@plannedShipmentsByTime_12)+N'<literal:2>'+  
   convert(nvarchar(100),@plannedShipmentsByTime_10)+N'<literal:3>'+  
   convert(nvarchar(100),@plannedShipmentsByTime_8)+N'<literal:4>'+  
   convert(nvarchar(100),@plannedShipmentsByTime_6)+N'<literal:5>'+  
   convert(nvarchar(100),@plannedShipmentsByTime_4)+N'<literal:6>'+  
   convert(nvarchar(100),@plannedShipmentsByTime_2)+N'<literal:7>'+  
   convert(nvarchar(100),@plannedShipmentsByTime_now) as PlannedShipmentsByTimeForToday,  
  
   convert(nvarchar(100),@actualShipmentsByTime_12)+N'<literal:8>'+  
   convert(nvarchar(100),@actualShipmentsByTime_10)+N'<literal:9>'+  
   convert(nvarchar(100),@actualShipmentsByTime_8)+N'<literal:10>'+  
   convert(nvarchar(100),@actualShipmentsByTime_6)+N'<literal:11>'+  
   convert(nvarchar(100),@actualShipmentsByTime_4)+N'<literal:12>'+  
   convert(nvarchar(100),@actualShipmentsByTime_2)+N'<literal:13>'+  
   convert(nvarchar(100),@actualShipmentsByTime_now) as ActualShipmentsByTimeForToday,  
   [480] as OrdersToBeWaved, [490] as OrdersInProcess, [500] as OrdersInPacking, [510] as OrdersInLoading, [520] as OrdersInShipConfirm,[530] OrdersThroughput,[720] TotalOrders   
  from   
  (  
  select value,IDENTIFIER from dashboard_data where IDENTIFIER in   
  (270,280,290,300,310,320,330,340,410,480,490,500,510,520,350,530,720)  
  and warehouse=@warehouse  
  )  
  SourceTable  
  
  PIVOT   
  (  
  max(value ) for  IDENTIFIER in   
  ([270],[280],[290],[300],[310],[320],[330],[340],[410],[480],[490],[500],[510],[520],[350],[530],[720])      
  )piv;    
   
END