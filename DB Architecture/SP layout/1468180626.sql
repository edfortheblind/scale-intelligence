/*  
 Mod Number | Programmer | Date     | Modification Description    
 -----------------------------------------------------------------------------------------------------------------------------------------    
   238119    | KSS	     | 09/03/19 | Created. 
 Returns dashboard KPI data based for specified KPI type and warehouse  
*/    
  
CREATE PROCEDURE DASH_GetLaborKPIData( 
 @warehouse nvarchar(25))    
AS    
BEGIN   
  
 -- Get the todays date part with warehouse offset  
  declare @todaysDateWithWarehouseOffset nvarchar(50);  
 declare @todaysDate datetime;  
 set @todaysDate = GETUTCDATE();  
 set @todaysDateWithWarehouseOffset = CAST(dbo.GetWarehouseTimezoneValue(@warehouse, @todaysDate) AS DATE)  
  
 select [660] as TotalEmployees,[670] as ActiveReceivingEmployees, [680] as ActiveInventoryEmployees,   
  [690] as ActiveReplenishmentEmployees,[700] as ActiveShippingEmployees  
  from   
  (  
  select value,IDENTIFIER from dashboard_data where IDENTIFIER in (660,670,680,690,700)  
  and warehouse=@warehouse  
  )  
  SourceTable  
  
  PIVOT   
  (  
  max(value ) for  IDENTIFIER in ([660],[670],[680],[690],[700])      
  )piv;  
 
END