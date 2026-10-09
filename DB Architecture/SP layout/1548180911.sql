/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	219660		| AH			| 04/14/18  | Created.  
	219962		| MMM			| 04/16/18	| Removed all KPI parameters and replaced logic to fetch KPI values from DASHFn_GetKPIValue function
	219676		| MMM			| 04/27/18	| Modified to associate labor dashboard data records with expiry time config through new column i.e. EXPIRATION_TIME_CONFIG
	225230		| TDA			| 06/13/18	| Moved DASHSYSVALUES to system config
	232436		| PMB			| 04/04/19	| Modified to avoid counting duplicate kpi records using distinct.
	238119      | AS			| 09/04/19 | Changes made to fix the deadlock issue

	Inserts/Updates the dashboard table with new Labor data 
*/
CREATE PROCEDURE DASH_RefreshLabor(
	@warehouse  nvarchar(25),
	@todaysDateWithWarehouseOffset nvarchar(50),
	@todaysDate DATETIME
)
AS  
BEGIN
	DECLARE @validKPIRecordsExist BIT;
	DECLARE @kpiType nvarchar(50);
	SET @validKPIRecordsExist = 0;
	DECLARE @actualExpTimeForLabor numeric (9,0);
	SET @kpiType = N'Labor';
	SELECT @validKPIRecordsExist = (case when COUNT(DISTINCT IDENTIFIER) = 5 then 1 else 0 end) FROM DASHBOARD_DATA WHERE IDENTIFIER IN (660,670,680,690,700) AND WAREHOUSE = @warehouse;

	
DECLARE @jsonInfo NVARCHAR(MAX)

set @jsonInfo = ( SELECT *  FROM   (SELECT user_name,
				   CASE WHEN lmd.process_type IN (	N'RECEIVING',
													N'NEST_RECEIPT_CONTAINER' ) THEN N'Receiving'
						WHEN lmd.process_type IN (	N'INVENTORY_MANAGEMENT',
													N'CYCLE_COUNT_CONFIRMATION',
													N'CYCLE_COUNT_RECONCILE',
													N'WORK_ORDER_CONFIRMATION' ) THEN N'Inventory'
						WHEN lmd.process_type IN (	N'PACKING',
													N'SHIPPING_CONT_WORKBENCH',
													N'NEST_SHPPING_CONTAINER',
													N'CLOSE_CONTAINER',
													N'UPDATE_QTY_TO_PACK',
													N'NEST_TO_MOPS',
													N'REMOVE_FROM_MOPS',
													N'COMBINE_MOPS',
													N'COMBINE_PALLETS',
													N'QC_CONFIRMATION',
													N'VAS_CONFIRMATION',
													N'TRANSFER_CONTAINER',
													N'TRANSFER_LOAD' ) THEN N'Shipping'
						ELSE N'N/A'
				   END AS type
			FROM   labor_management_detail lmd
			WHERE  lmd.start_date_time > Dateadd(minute, -15, @todaysDate) AND warehouse = @warehouse  AND process_type IN ( N'RECEIVING',
																															 N'NEST_RECEIPT_CONTAINER',
																															 N'INVENTORY_MANAGEMENT',
																															 N'CYCLE_COUNT_CONFIRMATION',
																															 N'CYCLE_COUNT_RECONCILE',
																															 N'WORK_ORDER_CONFIRMATION',
																															 N'PACKING',
																															 N'SHIPPING_CONT_WORKBENCH',
																															 N'NEST_SHPPING_CONTAINER',
																															 N'CLOSE_CONTAINER',
																															 N'UPDATE_QTY_TO_PACK',
																															 N'NEST_TO_MOPS',
																															 N'REMOVE_FROM_MOPS',
																															 N'COMBINE_MOPS',
																															 N'COMBINE_PALLETS',
																															 N'QC_CONFIRMATION',
																															 N'VAS_CONFIRMATION',
																															 N'TRANSFER_CONTAINER',
																															 N'TRANSFER_LOAD' )
			UNION
			SELECT user_name,
				   CASE
						 WHEN wiv.internal_num_type = N'Receipt' THEN N'Receiving'
						 WHEN wiv.internal_num_type IN (N'Cycle Count',
														N'Inventory Adjustment',
														N'Inventory Transfer', N'Work Order',
														N'Work Order Putaway') THEN N'Inventory'
						 WHEN wiv.internal_num_type = N'Replenishment' THEN N'Replenishment'
						 WHEN wiv.internal_num_type IN ( N'Shipment', N'Dock Management') THEN N'Shipping'
						 ELSE N'N/A'
				   END AS type
			FROM   labor_management_detail lmd JOIN work_instruction_view wiv ON lmd.internal_num = wiv.internal_instruction_num
			WHERE  lmd.start_date_time > Dateadd(minute, -15, @todaysDate) AND warehouse = @warehouse AND wiv.internal_num_type IN (
																												   N'Receipt', 
																												   N'Replenishment',
																												   N'Shipment',
																												   N'Dock Management',
																												   N'Cycle Count',
																												   N'Inventory Adjustment',
																												   N'Inventory Transfer',
																												   N'Work Order',
																												   N'Work Order Putaway' )) t1
				PIVOT(
					COUNT(user_name)    FOR type IN (
													[Inventory],
													[Receiving],
													[Shipping], 
													[Replenishment])
				) AS pivot_table for json auto, WITHOUT_ARRAY_WRAPPER
)--end of json info 

	IF @validKPIRecordsExist = 0 
	BEGIN	
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (660,670,680,690,700) AND WAREHOUSE = @warehouse;
		SELECT @actualExpTimeForLabor =   SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'80' AND RECORD_TYPE =N'DASHBOARDSYSVALUES'

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Total employees',80,dbo.DASHFn_GetKPIValue(@kpiType, 660, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,660,N'System',N'DASHFn_RefreshLaborData.sql',@todaysDate,@actualExpTimeForLabor)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Active receiving employees',80,COALESCE(JSON_VALUE(@jsonInfo, N'$.Receiving'),0),@todaysDate,@warehouse,670,N'System',N'DASHFn_RefreshLaborData.sql',@todaysDate,@actualExpTimeForLabor)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Active inventory employees',80,COALESCE(JSON_VALUE(@jsonInfo, N'$.Inventory'),0),@todaysDate,@warehouse,680,N'System',N'DASHFn_RefreshLaborData.sql',@todaysDate,@actualExpTimeForLabor)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Active replenishment employees',80,COALESCE(JSON_VALUE(@jsonInfo, N'$.Replenishment'),0),@todaysDate,@warehouse,690,N'System',N'DASHFn_RefreshLaborData.sql',@todaysDate,@actualExpTimeForLabor)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME)
		VALUES (N'Active shipping employees',80,COALESCE(JSON_VALUE(@jsonInfo, N'$.Shipping'),0),@todaysDate,@warehouse,700,N'System',N'DASHFn_RefreshLaborData.sql',@todaysDate,@actualExpTimeForLabor)	
	END
	ELSE 
	BEGIN
	
		UPDATE DASHBOARD_DATA
		SET VALUE = 
		 case 
			when IDENTIFIER = 660 then dbo.DASHFn_GetKPIValue(@kpiType, IDENTIFIER, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate)
			when IDENTIFIER = 670 then CASE WHEN JSON_VALUE(@jsonInfo, N'$.Receiving')  IS NULL THEN 0 ELSE JSON_VALUE(@jsonInfo, N'$.Receiving') END
			when IDENTIFIER = 680 then CASE WHEN JSON_VALUE(@jsonInfo, N'$.Inventory') IS NULL THEN 0 ELSE  JSON_VALUE(@jsonInfo, N'$.Inventory') END
			when IDENTIFIER = 690 then CASE WHEN JSON_VALUE(@jsonInfo, N'$.Replenishment') IS NULL THEN 0 ELSE  JSON_VALUE(@jsonInfo, N'$.Replenishment') END
			when IDENTIFIER = 700 then CASE WHEN JSON_VALUE(@jsonInfo, N'$.Shipping') IS NULL THEN 0 ELSE JSON_VALUE(@jsonInfo, N'$.Shipping') END
		end,
		LAST_UPDATED = @todaysDate
		WHERE DATEADD(MINUTE,EXPIRATION_TIME,LAST_UPDATED) < @todaysDate and WAREHOUSE = @warehouse and IDENTIFIER IN (660,670,680,690,700);

	END;

END