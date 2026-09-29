-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




    
  
CREATE PROCEDURE DASH_GetWorkKPIData( 
 @warehouse nvarchar(25))    
AS    
BEGIN   
  
 -- [comment omitted]
 declare @todaysDateWithWarehouseOffset nvarchar(50);  
 declare @todaysDate datetime;  
 set @todaysDate = GETUTCDATE();  
 set @todaysDateWithWarehouseOffset = CAST(dbo.GetWarehouseTimezoneValue(@warehouse, @todaysDate) AS DATE) 

  select [540] as ReceivingPutawayProcessed,[550] as ReceivingPutawayRemaining, [560] as ReceivingPutawayAtRisk,   
  [570] as CycleCountingProcessed,[580] as CycleCountingRemaining, [590] as CycleCountingAtRisk,   
  [600] as ReplenishmentProcessed,[610] as ReplenishmentRemaining, [620] as ReplenishmentAtRisk,    
  [630] as PickingProcessed,[640] as PickingRemaining, [650] as PickingAtRisk,[730] as PercentageReceivingPutAwayWorkHighPriority,  
  [740] as PercentageReceivingPutAwayWorkProcessed, [750] as PercentageReceivingPutAwayWorkRemaining, [760] as TotalReceivingPutAwayWork,  
  [770] as PercentageCycleCountWorkAtRisk,[780] as PercentageCycleCountWorkProcessed, [790] as PercentageCycleCountWorkRemaining,  
  [800] as TotalCycleCountWork, [810] as PercentageReplenishmentWorkAtRisk,[820] as PercentageReplenishmentWorkProcessed,  
  [830] as PercentageReplenishmentWorkRemaining, [840] as TotalReplenishmentWork, [850] as PercentagePickingWorkAtRisk,  
  [860] as PercentagePickingWorkProcessed, [870] as PercentagePickingWorkRemaining, [880] as TotalPickingWork  
  from   
  (  
  select value,IDENTIFIER from dashboard_data where IDENTIFIER in   
  (540,550,560,570,580,590,600,610,620,630,640,650,730,740,750,760,770,780,790,800,810,820,830,840,850,860,870,880)  
  and warehouse=@warehouse  
  )  
  SourceTable  
  
  PIVOT   
  (  
  max(value ) for  IDENTIFIER in   
  ([540],[550],[560],[570],[580],[590],[600],[610],[620],[630],[640],[650],[730],[740],[750],[760],[770],[780],[790],[800],[810],[820],[830],[840],[850],[860],[870],[880])      
  )piv;  
   
END