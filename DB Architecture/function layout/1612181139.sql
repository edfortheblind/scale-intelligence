/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	219962		| MMM			| 04/16/18	| Created.  
	220921 		| AH			| 04/23/18	| Updated some kpi values for labor and receiving.  
	220353 		| DP			| 04/25/18	| Updated labor kpi values to calculate based on process type.  
	221340 		| AH			| 04/27/18	| Updated atrisk and high priority calculations.
	219676		| MMM			| 04/27/18	| Removed Receipts/Shipments by time records as this data is being fetched separately.
	223938      | SN            | 05/11/18  | Add counting work order activities (RF work and web screen process types) as inventory employees
	224193		| SHS			| 05/17/18  | Included High Risk values in Expected and Remaining calculations
	224293		| SHS			| 05/22/18	| Added activity type check in fetching max start_date_time for labor activity - fixed multiple labor issue
	224193      | SHS			| 05/24/18  | Modified Work Kpi calculations to include warehouse offset
	Calculates and returns the KPI value for given paramters
	224642      | MMM			| 06/04/18  | Updated total employees calculation to include employees logged into application previous days and not logged out 
	228910		| MMM			| 10/06/18	| Corrected work kpi calculation queries to not invoke warehouse offset function for every record which leads to performance issue  
	229806		| MHM			| 12/10/18	| Rempoved Isnull check for username, since this column is Not Null. 
	229806		| PS			| 02/13/20	| Added Isnull check for closed_date for receipt. 
*/
CREATE FUNCTION DASHFn_GetKPIValue(
	@kpiType nvarchar(50), 
	@identifier numeric(9),
	@warehouse nvarchar(25),
	@todaysDateWithWarehouseOffset DATE,
	@todaysDate DATETIME
)
RETURNS nvarchar(50)
BEGIN
	declare @kpiValue nvarchar(50); 
	declare @value numeric(9,0);
	set @kpiValue = 0;
	declare @todayHours decimal(19,2);

	if @kpiType = N'Shipping' 
	begin		
		declare @currentDockToStock decimal(19,5);
		
		
		-- expectedShipmentsForToday
		if @identifier = 270 
		begin
			SELECT @kpiValue = COUNT(INTERNAL_SHIPMENT_NUM) FROM SHIPMENT_HEADER 
			WHERE 
			(CAST(SCHEDULED_SHIP_DATE AS DATE) = @todaysDateWithWarehouseOffset 
				OR (CAST(SCHEDULED_SHIP_DATE AS DATE) <= @todaysDateWithWarehouseOffset 
					AND DATEDIFF(SECOND, CREATION_DATE_TIME_STAMP , @todaysDate)/3600.0  > 24 AND TRAILING_STS< 600))				
			AND WAREHOUSE = @warehouse;
		end
		-- shipmentsProcessedToday
		else if @identifier = 280 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_SHIPMENT_NUM) 
								FROM SHIPMENT_HEADER 
								WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) = @todaysDateWithWarehouseOffset AND TRAILING_STS >= 600 AND WAREHOUSE = @warehouse;
		end
		-- shipmentsAtRisk
		else if @identifier = 290 
		begin 
			SELECT  @kpiValue =  COUNT(INTERNAL_SHIPMENT_NUM) FROM SHIPMENT_HEADER 
			WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) <= @todaysDateWithWarehouseOffset AND DATEDIFF(SECOND, CREATION_DATE_TIME_STAMP , @todaysDate)/3600.0  > 24 AND TRAILING_STS< 600 AND WAREHOUSE = @warehouse ;
		end
		-- expectedShipmentsForTomorrow
		else if @identifier = 300 
		begin 
			SELECT @kpiValue = COUNT(INTERNAL_SHIPMENT_NUM) FROM SHIPMENT_HEADER WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) = DATEADD(D, 1, @todaysDateWithWarehouseOffset) AND WAREHOUSE = @warehouse;
		end
		-- averageExpectedShipmentsPerDay
		else if @identifier = 310 
		begin 
			SET @kpiValue = 150;
		end
		-- expectedShipmentsForWeek
		else if @identifier = 320 
		begin 
			SELECT @kpiValue = COUNT(INTERNAL_SHIPMENT_NUM) 
			FROM SHIPMENT_HEADER 
			WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) BETWEEN dbo.DATEFn_GetWeekStartDate(@todaysDateWithWarehouseOffset, null)
				AND DATEADD(DAY, 1, dbo.DATEFn_GetWeekEndDate(@todaysDateWithWarehouseOffset, null)) AND WAREHOUSE = @warehouse;
		end
		-- averageExpectedShipmentsPerWeek
		else if @identifier = 330 
		begin 
			SET @kpiValue = 970;
		end
		-- remainingShipmentsForToday
		else if @identifier = 350 
		begin
			SET @value = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 270 AND WAREHOUSE = @warehouse) 
							- (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 280 AND WAREHOUSE = @warehouse) 
							- (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 290 AND WAREHOUSE = @warehouse) ;
			SET @kpiValue = CASE WHEN @value < 0 THEN 0 ELSE @value END;
		end
		-- OrdersToBeWaved
		else if @identifier = 480 
		begin 
			SELECT  @kpiValue =	ISNULL(count (*),0)  FROM SHIPMENT_HEADER  WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) <= @todaysDateWithWarehouseOffset   AND TRAILING_STS <300  AND WAREHOUSE = @warehouse;
		end
		-- OrdersInProcess
		else if @identifier = 490 
		begin 
			SELECT  @kpiValue =	ISNULL(count (*),0)  FROM SHIPMENT_HEADER WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) <= @todaysDateWithWarehouseOffset AND TRAILING_STS >=300 AND TRAILING_STS < 400  AND WAREHOUSE = @warehouse;
		end
		-- OrdersInPacking
		else if @identifier = 500 
		begin 
			SELECT  @kpiValue =	ISNULL(count (*),0)  FROM SHIPMENT_HEADER WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) <= @todaysDateWithWarehouseOffset AND TRAILING_STS >=400 AND TRAILING_STS < 600  AND WAREHOUSE = @warehouse;
		end
		-- OrdersInLoading
		else if @identifier = 510 
		begin 
			SELECT  @kpiValue =	ISNULL(count (*),0)  FROM SHIPMENT_HEADER WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) <= @todaysDateWithWarehouseOffset AND TRAILING_STS >=600 AND TRAILING_STS < 700  AND WAREHOUSE = @warehouse;
		end
		-- OrdersInShipConfirm
		else if @identifier = 520 
		begin 
			SELECT  @kpiValue =ISNULL(count (*),0) FROM SHIPMENT_HEADER WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) <= @todaysDateWithWarehouseOffset AND TRAILING_STS >=700 AND TRAILING_STS <900 AND WAREHOUSE = @warehouse;
		end
		-- ordersThroughput
		else if @identifier = 530 
		begin 
		    set @todayHours = DATEDIFF(second, CAST(CAST(@todaysDateWithWarehouseOffset AS DATE) AS DATETIME), dbo.GetWarehouseTimezoneValue(@warehouse, @todaysDate) ) / 3600.0;
			SELECT  @kpiValue = CASE WHEN @todayHours> 0 THEN 
			(SELECT ISNULL(count (*),0)/@todayHours FROM SHIPMENT_HEADER WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) = @todaysDateWithWarehouseOffset  AND TRAILING_STS >=600 AND  WAREHOUSE = @warehouse)
			ELSE 0 END;
		end
		-- total orders
		else if @identifier = 720 
		begin			 
			SELECT @kpiValue =  ISNULL(count (*),0) FROM SHIPMENT_HEADER WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) <= @todaysDateWithWarehouseOffset AND TRAILING_STS <900 AND WAREHOUSE = @warehouse;
		end
	end	
	else if @kpiType = N'Receiving' 
	begin
	
		-- Receipts expected today
		if @identifier = 10 
		begin
			SELECT @kpiValue =	COUNT(RH.INTERNAL_RECEIPT_NUM) from RECEIPT_HEADER RH 
								LEFT JOIN APPOINTMENT_SCHEDULE APPSCH on RH.INTERNAL_RECEIPT_NUM = APPSCH.INTERNAL_RECEIPT_NUM
								WHERE 
								(
								ISNULL(CAST(APPSCH.APPT_DATE_TIME as date),cast(RH.SCHEDULED_DATE_TIME as date)) = @todaysDateWithWarehouseOffset
								OR (ISNULL(CAST(APPSCH.APPT_DATE_TIME as date),cast(RH.SCHEDULED_DATE_TIME as date)) <= @todaysDateWithWarehouseOffset 
								AND  DATEDIFF(SECOND, CREATION_DATE_TIME_STAMP , @todaysDate)/3600.0  > 24)
															
								)
								AND RH.CLOSE_DATE IS NULL
								AND RH.WAREHOUSE = @warehouse;
		end
		-- Receipts high priority today
		else if @identifier = 20 
		begin 
			SELECT @kpiValue =	COUNT(RH.INTERNAL_RECEIPT_NUM) from RECEIPT_HEADER RH 
								LEFT JOIN APPOINTMENT_SCHEDULE APPSCH on RH.INTERNAL_RECEIPT_NUM = APPSCH.INTERNAL_RECEIPT_NUM
								WHERE ISNULL(CAST(APPSCH.APPT_DATE_TIME as date),cast(RH.SCHEDULED_DATE_TIME as date)) <= @todaysDateWithWarehouseOffset AND  DATEDIFF(SECOND, CREATION_DATE_TIME_STAMP , @todaysDate)/3600.0  > 24
							    AND RH.CLOSE_DATE IS NULL AND RH.WAREHOUSE = @warehouse;
		end
		-- Receipts processed today
		else if @identifier = 30 
		begin 
			SELECT @kpiValue =	COUNT(RH.INTERNAL_RECEIPT_NUM) from RECEIPT_HEADER RH 
								LEFT JOIN APPOINTMENT_SCHEDULE APPSCH on RH.INTERNAL_RECEIPT_NUM = APPSCH.INTERNAL_RECEIPT_NUM
								WHERE ISNULL(CAST(APPSCH.APPT_DATE_TIME as date),cast(RH.SCHEDULED_DATE_TIME as date)) = @todaysDateWithWarehouseOffset 
								AND CAST(RH.CLOSE_DATE AS DATE) = @todaysDateWithWarehouseOffset AND WAREHOUSE = @warehouse;
		end
		-- Receipts expected tomorrow
		else if @identifier = 40 
		begin 
			SELECT @kpiValue =	COUNT(RH.INTERNAL_RECEIPT_NUM) from RECEIPT_HEADER RH 
								LEFT JOIN APPOINTMENT_SCHEDULE APPSCH on RH.INTERNAL_RECEIPT_NUM = APPSCH.INTERNAL_RECEIPT_NUM 
								WHERE ISNULL(CAST(APPSCH.APPT_DATE_TIME as date),cast(RH.SCHEDULED_DATE_TIME as date)) = DATEADD(D, 1, @todaysDateWithWarehouseOffset) 
								AND WAREHOUSE = @warehouse;
		end
		-- Average expected receipts per day
		else if @identifier = 50 
		begin 
			SET @kpiValue = 102;
		end
		-- Receipts expected this week
		else if @identifier = 60 
		begin 
			SELECT @kpiValue =	COUNT(RH.INTERNAL_RECEIPT_NUM) from RECEIPT_HEADER RH 
								LEFT JOIN APPOINTMENT_SCHEDULE APPSCH on RH.INTERNAL_RECEIPT_NUM = APPSCH.INTERNAL_RECEIPT_NUM 
								WHERE ISNULL(CAST(APPSCH.APPT_DATE_TIME as date),cast(RH.SCHEDULED_DATE_TIME as date)) BETWEEN dbo.DATEFn_GetWeekStartDate(@todaysDateWithWarehouseOffset, null) 
								AND DATEADD(DAY, 1, dbo.DATEFn_GetWeekEndDate(@todaysDateWithWarehouseOffset, null)) AND WAREHOUSE = @warehouse;
		end
		-- Average expected receipts per week
		else if @identifier = 70 
		begin 
			SET @kpiValue = 1475;
		end
		-- Receipts remaining today
		else if @identifier = 80 
		begin 
			SET @value =	(SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 10 AND WAREHOUSE = @warehouse) -- expectedReceiptsForToday 
							- (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 30 AND WAREHOUSE = @warehouse) -- receiptsProcessedToday
							- (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 20 AND WAREHOUSE = @warehouse); --receiptsHighPriorityForToday
			SET @kpiValue = CASE WHEN @value < 0 THEN 0 ELSE @value END;
		end
		-- Shortest dock to stock
		else if @identifier = 110 
		begin 
			declare @shortestDockToStock decimal(19,5);
			
			SELECT @shortestDockToStock =	COALESCE(CASE WHEN COUNT(DATEDIFF(SECOND,START_UNITIZE_DATE_TIME, CLOSE_DATE)/ 3600.0 ) = 1 THEN 0 END,MIN(DATEDIFF(SECOND,START_UNITIZE_DATE_TIME, CLOSE_DATE)/ 3600.0 ),0)
											FROM RECEIPT_HEADER WHERE CAST (CLOSE_DATE AS DATE ) = @todaysDateWithWarehouseOffset AND START_UNITIZE_DATE_TIME IS NOT NULL AND WAREHOUSE = @warehouse 
			-- shortest equals to longest
			IF(@shortestDockToStock = (SELECT CONVERT(decimal(19,5), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 90 AND WAREHOUSE = @warehouse))
			BEGIN
				SET	@shortestDockToStock = 0;
			END


			SET @kpiValue = @shortestDockToStock;
		end
		-- Longest dock to stock
		else if @identifier = 90 
		begin 
			declare @logestDockToStock decimal(19,5);
		
			SELECT @logestDockToStock =	ISNULL(MAX(DATEDIFF(SECOND,START_UNITIZE_DATE_TIME, CLOSE_DATE)/ 3600.0 ),1) 
								FROM  RECEIPT_HEADER WHERE CAST (CLOSE_DATE AS DATE ) = @todaysDateWithWarehouseOffset AND START_UNITIZE_DATE_TIME IS NOT NULL AND WAREHOUSE = @warehouse 

			SET @kpiValue = @logestDockToStock;
		end
		-- AVG dock to stock
		else if @identifier = 120 
		begin 
			SELECT @kpiValue =	ISNULL(AVG((DATEDIFF(second, START_UNITIZE_DATE_TIME , CLOSE_DATE)/ 3600.0)),0)
								FROM RECEIPT_HEADER WHERE CAST (CLOSE_DATE AS DATE ) = @todaysDateWithWarehouseOffset AND START_UNITIZE_DATE_TIME IS NOT NULL AND WAREHOUSE = @warehouse 
								
							
		end
		-- throughput dock to stock
		else if @identifier = 100 
		begin 
			set @todayHours = DATEDIFF(second, CAST(CAST(@todaysDateWithWarehouseOffset AS DATE) AS DATETIME), dbo.GetWarehouseTimezoneValue(@warehouse, @todaysDate) ) / 3600.0;

			
			SELECT @kpiValue = CASE WHEN @todayHours>0 THEN  (SELECT ISNULL(count (*)/@todayHours,0)
								FROM RECEIPT_HEADER LEFT JOIN APPOINTMENT_SCHEDULE ON RECEIPT_HEADER.INTERNAL_RECEIPT_NUM = APPOINTMENT_SCHEDULE.INTERNAL_RECEIPT_NUM 
								LEFT JOIN RECEIPT_CONTAINER ON RECEIPT_CONTAINER.INTERNAL_RECEIPT_NUM = RECEIPT_HEADER.INTERNAL_RECEIPT_NUM 
								WHERE RECEIPT_HEADER.WAREHOUSE = @warehouse AND RECEIPT_CONTAINER.STATUS =900  AND ( ( CAST(APPOINTMENT_SCHEDULE.APPT_DATE_TIME  AS DATE) = @todaysDateWithWarehouseOffset )
								OR (CAST(APPOINTMENT_SCHEDULE.APPT_DATE_TIME AS DATE) IS NULL AND CAST(SCHEDULED_DATE_TIME AS DATE) = @todaysDateWithWarehouseOffset)) ) ELSE 0 END;

		end
		-- Goal dock to stock
		else if @identifier = 710 
		begin 
			SET @kpiValue = 0.5;
		end		
	end	
	else if @kpiType = N'Labor' 
	begin
	
		-- totalEmployees
		if @identifier = 660 
		begin
			SELECT @kpiValue = COUNT (DISTINCT(USER_ACTIVITY.USER_NAME))  FROM USER_ACTIVITY LEFT JOIN USER_PROFILE ON USER_ACTIVITY.USER_NAME =  USER_PROFILE.USER_NAME WHERE CAST(LOGON_DATE_TIME AS DATE) <= cast(@todaysDate as date)  AND  LOGOFF_DATE_TIME  IS NULL AND USER_PROFILE.DEFAULT_WHS = @warehouse;
		end
			
	end
	else if @kpiType = N'Work' 
	begin

		declare @workTypeReceivingPutaway nvarchar(100);
		declare @workTypeCycleCount nvarchar(100);
		declare @workTypeReplenishment nvarchar(100);
		declare @workInstructionType nvarchar(100);
		declare @workInstructionCondition nvarchar(100);
		
		declare @receivingPutawayProcessed numeric(9,0);
		declare @receivingPutawayRemaining numeric(9,0);
		declare @cycleCountingProcessed numeric(9,0);
		declare @cycleCountingRemaining numeric(9,0);
		declare @replenishmentProcessed numeric(9,0);
		declare @replenishmentRemaining numeric(9,0);
		declare @pickingProcessed numeric(9,0);
		declare @pickingRemaining numeric(9,0);
		declare @receivingAtRisk numeric(9,0);
		declare @cycleCountAtRisk numeric(9,0);
		declare @pickingAtRisk numeric(9,0);
		declare @replenishmentAtRisk numeric(9,0);

		declare @totalReceivingPutAwayWork numeric(9,0);
		declare @totalCycleCountWork numeric(9,0);
		declare @totalReplenishmentWork numeric(9,0);
		declare @totalPickingWork numeric(9,0);
		
		declare @warehouseDay12AMInUtc datetime;
		declare @warehouseNexDay12AMInUtc datetime;

		SET @warehouseDay12AMInUtc = @todaysDateWithWarehouseOffset;	
		declare @timezoneid nvarchar(50)
		select @timezoneId=time_zone from WAREHOUSE where warehouse = @warehouse
		SET @warehouseDay12AMInUtc = @warehouseDay12AMInUtc AT TIME ZONE @timezoneId AT TIME ZONE N'UTC'
		SET @warehouseNexDay12AMInUtc = DATEADD(day, 1, @warehouseDay12AMInUtc)

		SET @workTypeReceivingPutaway = N'Receipt';
		SET @workTypeCycleCount = N'Cycle Count';
		SET @workTypeReplenishment = N'Replenishment';
		SET @workInstructionType = N'Header';
		SET @workInstructionCondition = N'Closed';

		-- receivingPutawayProcessed
		if @identifier = 540 
		begin
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION_VIEW 
								WHERE INTERNAL_NUM_TYPE = @workTypeReceivingPutaway AND INSTRUCTION_TYPE = @workInstructionType AND CONDITION = @workInstructionCondition 
									AND (END_DATE_TIME >= @warehouseDay12AMInUtc AND END_DATE_TIME < @warehouseNexDay12AMInUtc) AND FROM_WHS=@warehouse;
		end
		-- receivingPutawayRemaining
		else if @identifier = 550 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION 
								WHERE INTERNAL_NUM_TYPE = @workTypeReceivingPutaway AND INSTRUCTION_TYPE = @workInstructionType AND CONDITION <> @workInstructionCondition
									AND AGING_DATE_TIME < @warehouseNexDay12AMInUtc 
									AND DATEDIFF(SECOND, AGING_DATE_TIME , @todaysDate)/3600.0  <= 24
									AND FROM_WHS=@warehouse;
		end	
		-- receivingPutawayHighPriority
		else if @identifier = 560 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION 
								WHERE INTERNAL_NUM_TYPE = @workTypeReceivingPutaway AND INSTRUCTION_TYPE = @workInstructionType AND  CONDITION <> @workInstructionCondition  AND DATEDIFF(SECOND, AGING_DATE_TIME , @todaysDate)/3600.0  > 24
								AND FROM_WHS=@warehouse;
		end	
		-- totalReceivingPutAwayWork
		else if @identifier = 760 
		begin 
			SET @kpiValue = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 540 AND WAREHOUSE = @warehouse) --receivingPutawayProcessed 
							+ (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 550 AND WAREHOUSE = @warehouse) --receivingPutawayRemaining
							+ (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 560 AND WAREHOUSE = @warehouse) --receivingPutawayAtRisk
		end	
		-- percentageReceivingPutAwayWorkProcessed
		else if @identifier = 740 
		begin 	
			SET @receivingPutawayProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 540 AND WAREHOUSE = @warehouse)  --receivingPutawayProcessed 
			SET @receivingPutawayRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 550 AND WAREHOUSE = @warehouse)  --receivingPutawayRemaining  
			SET @receivingAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 560 AND WAREHOUSE = @warehouse) --receivingPutawayAtRisk
			SET @totalReceivingPutAwayWork =	@receivingPutawayProcessed + @receivingPutawayRemaining + @receivingAtRisk;
			SET @kpiValue = CASE WHEN @totalReceivingPutAwayWork > 0 THEN 
								@receivingPutawayProcessed * 100/ @totalReceivingPutAwayWork
							ELSE 0 END;
		end		
		-- percentageReceivingPutAwayWorkRemaining
		else if @identifier = 750 
		begin 
			SET @receivingPutawayProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 540 AND WAREHOUSE = @warehouse)  --receivingPutawayProcessed 
			SET @receivingPutawayRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 550 AND WAREHOUSE = @warehouse)  --receivingPutawayRemaining  
			SET @receivingAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 560 AND WAREHOUSE = @warehouse) --receivingPutawayAtRisk
			SET @totalReceivingPutAwayWork =	@receivingPutawayProcessed + @receivingPutawayRemaining + @receivingAtRisk;
			SET @kpiValue = CASE WHEN @totalReceivingPutAwayWork > 0 THEN 
								@receivingPutawayRemaining * 100 / @totalReceivingPutAwayWork
							ELSE 0 END;
		end	
		-- percentageReceivingPutAwayWorkHighPriority
		else if @identifier = 730 
		begin 			 
			SET @receivingPutawayProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 540 AND WAREHOUSE = @warehouse)  --receivingPutawayProcessed 
			SET @receivingPutawayRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 550 AND WAREHOUSE = @warehouse)  --receivingPutawayRemaining  
			SET @receivingAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 560 AND WAREHOUSE = @warehouse) --receivingPutawayAtRisk
			SET @totalReceivingPutAwayWork =	@receivingPutawayProcessed + @receivingPutawayRemaining + @receivingAtRisk;
			SET @kpiValue = CASE WHEN @totalReceivingPutAwayWork > 0 THEN 
								(SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 560 AND WAREHOUSE = @warehouse) * 100 / @totalReceivingPutAwayWork  -- receivingPutawayHighPriority / totalReceivingPutAwayWork
							ELSE 0 END;
		end	
		-- cycleCountingProcessed
		else if @identifier = 570 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION_VIEW 
								WHERE INTERNAL_NUM_TYPE = @workTypeCycleCount AND INSTRUCTION_TYPE = @workInstructionType AND CONDITION = @workInstructionCondition 
									AND (END_DATE_TIME >= @warehouseDay12AMInUtc AND END_DATE_TIME < @warehouseNexDay12AMInUtc) AND FROM_WHS=@warehouse;
		end	
		-- cycleCountingRemaining
		else if @identifier = 580 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION 
								WHERE INTERNAL_NUM_TYPE = @workTypeCycleCount AND INSTRUCTION_TYPE = @workInstructionType AND CONDITION <> @workInstructionCondition
									AND AGING_DATE_TIME < @warehouseNexDay12AMInUtc 
									AND DATEDIFF(SECOND, AGING_DATE_TIME , @todaysDate)/3600.0  <= 24
									AND FROM_WHS=@warehouse;
		end	
		-- cycleCountingAtRisk
		else if @identifier = 590 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION 
								WHERE INTERNAL_NUM_TYPE = @workTypeCycleCount AND INSTRUCTION_TYPE = @workInstructionType AND CONDITION <> @workInstructionCondition AND DATEDIFF(SECOND, AGING_DATE_TIME , @todaysDate)/3600.0  > 24
								AND FROM_WHS=@warehouse;
		end	
		-- totalCycleCountWork
		else if @identifier = 800 
		begin 
			SET @kpiValue = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 570 AND WAREHOUSE = @warehouse) --cycleCountingProcessed 
							+ (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 580 AND WAREHOUSE = @warehouse)--cycleCountingRemaining;
							+ (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 590 AND WAREHOUSE = @warehouse)--cycleCountingAtRisk;
		end	
		-- percentageCycleCountWorkProcessed
		else if @identifier = 780 
		begin 
			SET @cycleCountingProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 570 AND WAREHOUSE = @warehouse)  --cycleCountingProcessed 
			SET @cycleCountingRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 580 AND WAREHOUSE = @warehouse)--cycleCountingRemaining;
			SET @cycleCountAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 590 AND WAREHOUSE = @warehouse)--cycleCountingAtRisk;
			SET @totalCycleCountWork =	@cycleCountingProcessed + @cycleCountingRemaining + @cycleCountAtRisk;
										 
			SET @kpiValue = CASE WHEN @totalCycleCountWork > 0 THEN 
								@cycleCountingProcessed * 100/ @totalCycleCountWork
							ELSE 0 END;
		end	
		-- percentageCycleCountWorkRemaining
		else if @identifier = 790 
		begin 	
			SET @cycleCountingProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 570 AND WAREHOUSE = @warehouse)  --cycleCountingProcessed 
			SET @cycleCountingRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 580 AND WAREHOUSE = @warehouse)--cycleCountingRemaining;
			SET @cycleCountAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 590 AND WAREHOUSE = @warehouse)--cycleCountingAtRisk;
			SET @totalCycleCountWork =	@cycleCountingProcessed + @cycleCountingRemaining + @cycleCountAtRisk;
										 
			SET @kpiValue = CASE WHEN @totalCycleCountWork > 0 THEN 
								@cycleCountingRemaining * 100/ @totalCycleCountWork
							ELSE 0 END;
		end		
		-- percentageCycleCountWorkAtRisk
		else if @identifier = 770 
		begin 
			SET @cycleCountingProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 570 AND WAREHOUSE = @warehouse)  --cycleCountingProcessed 
			SET @cycleCountingRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 580 AND WAREHOUSE = @warehouse)--cycleCountingRemaining;
			SET @cycleCountAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 590 AND WAREHOUSE = @warehouse)--cycleCountingAtRisk;
			SET @totalCycleCountWork =	@cycleCountingProcessed + @cycleCountingRemaining + @cycleCountAtRisk;
										 
			SET @kpiValue = CASE WHEN @totalCycleCountWork > 0 THEN (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 590 AND WAREHOUSE = @warehouse) * 100/ @totalCycleCountWork ELSE 0 END; --cycleCountingAtRisk / totalCycleCountWork
		end		
		-- replenishmentProcessed
		else if @identifier = 600 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION_VIEW 
								WHERE INTERNAL_NUM_TYPE = @workTypeReplenishment AND INSTRUCTION_TYPE = @workInstructionType AND CONDITION = @workInstructionCondition 
									AND (END_DATE_TIME >= @warehouseDay12AMInUtc AND END_DATE_TIME < @warehouseNexDay12AMInUtc) AND FROM_WHS=@warehouse;
		end	
		-- replenishmentRemaining
		else if @identifier = 610 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION 
								WHERE INTERNAL_NUM_TYPE = @workTypeReplenishment AND INSTRUCTION_TYPE = @workInstructionType AND CONDITION <> @workInstructionCondition
									AND AGING_DATE_TIME < @warehouseNexDay12AMInUtc  
									AND DATEDIFF(SECOND, AGING_DATE_TIME , @todaysDate)/3600.0  <= 24
									AND FROM_WHS=@warehouse;
		end	
		-- replenishmentAtRisk
		else if @identifier = 620 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION 
								WHERE INTERNAL_NUM_TYPE = @workTypeReplenishment AND INSTRUCTION_TYPE = @workInstructionType AND CONDITION <> @workInstructionCondition AND  DATEDIFF(SECOND, AGING_DATE_TIME , @todaysDate)/3600.0  > 24  
								AND FROM_WHS=@warehouse;
		end	
		-- totalReplenishmentWork
		else if @identifier = 840 
		begin 
			SET @kpiValue = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 600 AND WAREHOUSE = @warehouse) --replenishmentProcessed
				+ (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 610 AND WAREHOUSE = @warehouse) --replenishmentRemaining
				+ (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 620 AND WAREHOUSE = @warehouse); --replenishmentRemaining
		end	
		-- percentageReplenishmentWorkProcessed
		else if @identifier = 820 
		begin 
			set @replenishmentProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 600 AND WAREHOUSE = @warehouse);
			set @replenishmentRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 610 AND WAREHOUSE = @warehouse);
			SET @replenishmentAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 620 AND WAREHOUSE = @warehouse);
			set @totalReplenishmentWork = @replenishmentProcessed+@replenishmentRemaining+@replenishmentAtRisk;

			SET @kpiValue = CASE WHEN @totalReplenishmentWork > 0 THEN @replenishmentProcessed * 100/ @totalReplenishmentWork ELSE 0 END;
		end	
		-- percentageReplenishmentWorkRemaining
		else if @identifier = 830 
		begin  
			set @replenishmentProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 600 AND WAREHOUSE = @warehouse);
			set @replenishmentRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 610 AND WAREHOUSE = @warehouse);
			SET @replenishmentAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 620 AND WAREHOUSE = @warehouse);
			set @totalReplenishmentWork = @replenishmentProcessed+@replenishmentRemaining+@replenishmentAtRisk;

			SET @kpiValue = CASE WHEN @totalReplenishmentWork > 0 THEN @replenishmentRemaining * 100/ @totalReplenishmentWork ELSE 0 END;
		end	
		-- percentageReplenishmentWorkAtRisk
		else if @identifier = 810 
		begin 
			set @replenishmentProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 600 AND WAREHOUSE = @warehouse);
			set @replenishmentRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 610 AND WAREHOUSE = @warehouse);
			SET @replenishmentAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 620 AND WAREHOUSE = @warehouse);
			set @totalReplenishmentWork = @replenishmentProcessed+@replenishmentRemaining+@replenishmentAtRisk;

			SET @kpiValue = CASE WHEN @totalReplenishmentWork > 0 THEN (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 620 AND WAREHOUSE = @warehouse) * 100/ @totalReplenishmentWork ELSE 0 END;
		end	
		-- pickingProcessed
		else if @identifier = 630 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION_VIEW 
								WHERE INTERNAL_NUM_TYPE IN (N'Shipment', N'Dock Management') AND INSTRUCTION_TYPE = @workInstructionType AND CONDITION = @workInstructionCondition 
									AND (END_DATE_TIME >= @warehouseDay12AMInUtc AND END_DATE_TIME < @warehouseNexDay12AMInUtc) AND FROM_WHS=@warehouse;
		end	
		-- pickingRemaining
		else if @identifier = 640 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION 
								WHERE INTERNAL_NUM_TYPE IN (N'Shipment', N'Dock Management') AND INSTRUCTION_TYPE = @workInstructionType AND CONDITION <> @workInstructionCondition
									AND AGING_DATE_TIME < @warehouseNexDay12AMInUtc 
									AND DATEDIFF(SECOND, AGING_DATE_TIME , @todaysDate)/3600.0  <= 24
									AND FROM_WHS=@warehouse;
		end	
		-- pickingAtRisk
		else if @identifier = 650 
		begin 
			SELECT @kpiValue =	COUNT(INTERNAL_INSTRUCTION_NUM) FROM WORK_INSTRUCTION 
								WHERE INTERNAL_NUM_TYPE IN (N'Shipment', N'Dock Management') AND INSTRUCTION_TYPE = @workInstructionType AND  CONDITION <> @workInstructionCondition AND DATEDIFF(SECOND, AGING_DATE_TIME , @todaysDate)/3600.0  > 24  
								AND FROM_WHS=@warehouse;
		end	
		-- totalPickingWork
		else if @identifier = 880 
		begin 
			SET @kpiValue = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 630 AND WAREHOUSE = @warehouse) 
				+ (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 640 AND WAREHOUSE = @warehouse)
				+ (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 650 AND WAREHOUSE = @warehouse);
		end	
		-- percentagePickingWorkProcessed
		else if @identifier = 860 
		begin 
			set @pickingProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 630 AND WAREHOUSE = @warehouse);
			set @pickingRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 640 AND WAREHOUSE = @warehouse);
			SET @pickingAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 650 AND WAREHOUSE = @warehouse);
			set @totalPickingWork = @pickingProcessed  + @pickingRemaining + @pickingAtRisk;
			SET @kpiValue = CASE WHEN @totalPickingWork > 0 THEN @pickingProcessed * 100/ @totalPickingWork ELSE 0 END;
		end	
		-- percentagePickingWorkRemaining
		else if @identifier = 870 
		begin 			
			set @pickingProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 630 AND WAREHOUSE = @warehouse);
			set @pickingRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 640 AND WAREHOUSE = @warehouse);
			SET @pickingAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 650 AND WAREHOUSE = @warehouse);
			set @totalPickingWork = @pickingProcessed  + @pickingRemaining + @pickingAtRisk;
			SET @kpiValue = CASE WHEN @totalPickingWork > 0 THEN @pickingRemaining * 100/ @totalPickingWork ELSE 0 END;
		end	
		-- percentagePickingWorkAtRisk
		else if @identifier = 850 
		begin 
			set @pickingProcessed = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 630 AND WAREHOUSE = @warehouse);
			set @pickingRemaining = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 640 AND WAREHOUSE = @warehouse);
			SET @pickingAtRisk = (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 650 AND WAREHOUSE = @warehouse);
			set @totalPickingWork = @pickingProcessed  + @pickingRemaining + @pickingAtRisk;

			SET @kpiValue = CASE WHEN @totalPickingWork > 0 THEN (SELECT CONVERT(numeric(9,0), VALUE) FROM DASHBOARD_DATA WHERE IDENTIFIER = 650 AND WAREHOUSE = @warehouse) * 100/ @totalPickingWork ELSE 0 END;
		end	
	end

	RETURN @kpiValue;
END