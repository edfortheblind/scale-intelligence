/*
	Mod Number | Programmer	| Date     | Modification Description  
	-----------------------------------------------------------------------------------------------------------------------------------------  
		219648		| MMM			| 03/16/18 | Created.  
		219961		| SHS			| 03/22/18 | Modified to select from the tables
		220150		| SHS			| 03/26/18 | Modified receiving to insert actual data to dashboard_data table
		220386		| DP			| 03/27/18 | Modified few names in dock to stock and added average dock to stock
		220653		| SHS			| 03/29/18 | Modified to compare date_time fields with utcDate
		219654      | SN            | 03/28/18 | Modified to return actual data for Time Widget APIs.
		220793		| SHS			| 04/04/18 | Modified to use warehouse offset date instead of utc in calculations
		220485		| MMM			| 04/09/18 | Added Remaining shipments and receipts for today calculations
		219657		| AH			| 04/10/18 | Modified to return actual data for dock to stock and orders widgets.
		219660		| AH			| 04/17/18 | Modified to return actual data for labor.
		219651      | DP			| 04/14/18 | Modified to return actual data for Work KPIs
		219962		| MMM			| 04/16/18 | Moved all KPI calculation queries to DASHFn_GetKPIValue function
		219676		| MMM			| 04/27/18 | Modified to handle Shipments/Receipts by time records and to map dashboard data records with corresponding expiry time configured in 
												 generic config detail records per dashboard gadget. 
		225230		| TDA			| 06/13/18 | Moved DASHSYSVALUES to system config
	Returns dashboard KPI data based for specified KPI type and warehouse
*/  

CREATE PROCEDURE DASH_GetKPIData( 
	@kpiType nvarchar(50), 
	@warehouse nvarchar(25))  
AS  
BEGIN 

	-- Get the todays date part with warehouse offset
	declare @todaysDateWithWarehouseOffset nvarchar(50);
	declare @todaysDate datetime;
	set @todaysDate = GETUTCDATE();
	set @todaysDateWithWarehouseOffset = CAST(dbo.GetWarehouseTimezoneValue(@warehouse, @todaysDate) AS DATE)

	-- Update the expiration time column on dashboard data table records if it has changed recently 
	UPDATE DASHBOARD_DATA 
	SET EXPIRATION_TIME = CASE WHEN SCD.SYSTEM_VALUE IS NOT NULL THEN SCD.SYSTEM_VALUE ELSE 5 END, DATE_TIME_STAMP = @todaysDate
	FROM DASHBOARD_DATA DD LEFT OUTER JOIN SYSTEM_CONFIG_DETAIL SCD ON SCD.RECORD_TYPE = N'DASHBOARDSYSVALUES' AND DD.EXPIRATION_TIME_CONFIG = SCD.SYS_KEY
	WHERE (DD.DATE_TIME_STAMP < SCD.DATE_TIME_STAMP AND DD.IDENTIFIER NOT IN (130, 200, 340, 410));
	
	-- Calculate and return shipping KPIs
	if @kpiType = N'Shipping' 
	begin
	
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

		set @shipmentsTimeInterval = N'-12, -10, -8, -6, -4, -2, 0';

		-- Insert/update the stale outbound data on the dashboard table
		EXEC DASH_RefreshOutboundData @warehouse, @todaysDateWithWarehouseOffset,@todaysDate;

		SET @plannedShipmentsByTime_now = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse ORDER BY LAST_UPDATED DESC),0);
		SET @plannedShipmentsByTime_2 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-4,@todaysDate) AND  DATEADD(HOUR,-2,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);
		SET @plannedShipmentsByTime_4 = ISNULL((SELECT top 1 CAST(VALUE  AS NUMERIC(9,0))  FROM DASHBOARD_DATA WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-6,@todaysDate) AND  DATEADD(HOUR,-4,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);
		SET @plannedShipmentsByTime_6 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0))  FROM DASHBOARD_DATA WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-8,@todaysDate) AND  DATEADD(HOUR,-6,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);
		SET @plannedShipmentsByTime_8 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0))  FROM DASHBOARD_DATA WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-10,@todaysDate) AND  DATEADD(HOUR,-8,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);
		SET @plannedShipmentsByTime_10 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-12,@todaysDate) AND  DATEADD(HOUR,-10,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);
		SET @plannedShipmentsByTime_12 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=340 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-14,@todaysDate) AND  DATEADD(HOUR,-12,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);

		SET @actualShipmentsByTime_now = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse ORDER BY LAST_UPDATED DESC),0);
		SET @actualShipmentsByTime_2 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0))  FROM DASHBOARD_DATA WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-4,@todaysDate) AND  DATEADD(HOUR,-2,@todaysDate) ORDER BY LAST_UPDATED DESC),0);
		SET @actualShipmentsByTime_4 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-6,@todaysDate) AND  DATEADD(HOUR,-4,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);
		SET @actualShipmentsByTime_6 = ISNULL((SELECT top 1 CAST(VALUE  AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-8,@todaysDate) AND  DATEADD(HOUR,-6,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);
		SET @actualShipmentsByTime_8 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-10,@todaysDate) AND  DATEADD(HOUR,-8,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);
		SET @actualShipmentsByTime_10 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-12,@todaysDate) AND  DATEADD(HOUR,-10,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);
		SET @actualShipmentsByTime_12 = ISNULL((SELECT top 1 CAST(VALUE AS NUMERIC(9,0)) FROM DASHBOARD_DATA WHERE IDENTIFIER=410 AND WAREHOUSE=@warehouse AND LAST_UPDATED BETWEEN DATEADD(HOUR,-14,@todaysDate) AND  DATEADD(HOUR,-12,@todaysDate)  ORDER BY LAST_UPDATED DESC),0);

		-- Return the KPIs
		select [270] as ExpectedShipmentsForToday,[280] as ShipmentsProcessedToday, [290] as ShipmentsAtRiskForToday, 
		[300] as ExpectedShipmentsForTomorrow, [310] as AverageExpectedShipmentsPerDay, [320] as ExpectedShipmentsForWeek,
		[330] as AverageExpectedShipmentsPerWeek,
		[350] as RemainingShipmentsForToday, @shipmentsTimeInterval as TimeLineForShipments, 
			convert(nvarchar(100),@plannedShipmentsByTime_12)+N','+
			convert(nvarchar(100),@plannedShipmentsByTime_10)+N','+
			convert(nvarchar(100),@plannedShipmentsByTime_8)+N','+
			convert(nvarchar(100),@plannedShipmentsByTime_6)+N','+
			convert(nvarchar(100),@plannedShipmentsByTime_4)+N','+
			convert(nvarchar(100),@plannedShipmentsByTime_2)+N','+
			convert(nvarchar(100),@plannedShipmentsByTime_now) as PlannedShipmentsByTimeForToday,

			convert(nvarchar(100),@actualShipmentsByTime_12)+N','+
			convert(nvarchar(100),@actualShipmentsByTime_10)+N','+
			convert(nvarchar(100),@actualShipmentsByTime_8)+N','+
			convert(nvarchar(100),@actualShipmentsByTime_6)+N','+
			convert(nvarchar(100),@actualShipmentsByTime_4)+N','+
			convert(nvarchar(100),@actualShipmentsByTime_2)+N','+
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
	end
	-- Calculate and return Receiving KPIs
	else if @kpiType = N'Receiving' 
	begin
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

		set @receiptsTimeInterval = N'-12, -10, -8, -6, -4, -2, 0';
		
		-- Insert/update the stale receiving data on the dashboard table
		EXEC DASH_RefreshInboundData @warehouse, @todaysDateWithWarehouseOffset,@todaysDate;

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
		convert(nvarchar(100),@plannedReceiptsByTime_12)+N','+
		convert(nvarchar(100),@plannedReceiptsByTime_10)+N','+
		convert(nvarchar(100),@plannedReceiptsByTime_8)+N','+
		convert(nvarchar(100),@plannedReceiptsByTime_6)+N','+
		convert(nvarchar(100),@plannedReceiptsByTime_4)+N','+
		convert(nvarchar(100),@plannedReceiptsByTime_2)+N','+
		convert(nvarchar(100),@plannedReceiptsByTime_now) as PlannedReceiptsByTime,
		convert(nvarchar(100),@actualReceiptsByTime_12)+N','+
		convert(nvarchar(100),@actualReceiptsByTime_10)+N','+
		convert(nvarchar(100),@actualReceiptsByTime_8)+N','+
		convert(nvarchar(100),@actualReceiptsByTime_6)+N','+
		convert(nvarchar(100),@actualReceiptsByTime_4)+N','+
		convert(nvarchar(100),@actualReceiptsByTime_2)+N','+
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
	end
	-- Calculate and return Work KPIs
	else if @kpiType = N'Work' 
	begin

		-- Insert/update the stale receiving data on the dashboard table
		EXEC DASH_RefreshWorkData @warehouse, @todaysDateWithWarehouseOffset, @todaysDate;

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
	end
	-- Calculate and return Labor KPIs
	else if @kpiType = N'Labor' 
	begin

		-- Insert/update the stale outbound data on the dashboard table
		EXEC DASH_RefreshLabor @warehouse, @todaysDateWithWarehouseOffset,@todaysDate;

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
	end
END