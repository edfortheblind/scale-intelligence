/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	219648		| MMM			| 03/20/18	| Created.
	219654      | SN            | 04/02/18  | Added Insert statements for Time Widget.  
	220485		| MMM			| 04/09/18	| Added Shipments remaining today record
	219657  	| AH			| 04/10/18  | Modified to return actual data for dock to stock and orders widgets.
	219962		| MMM			| 04/16/18	| Removed all KPI parameters and replaced logic to fetch KPI values from DASHFn_GetKPIValue function
	219676		| MMM			| 04/27/18	| Invoked function to capture Shipments by time records
	225230		| TDA			| 06/13/18	| Moved DASHSYSVALUES to system config
	232436		| PMB			| 04/04/19	| Modified to avoid counting duplicate kpi records using distinct.
	238119      | KSS			| 09/04/19 | Changes made to fix the deadlock issue

	Inserts/Updates the dashboard table with new outbound data 
*/
CREATE PROCEDURE DASH_RefreshOutboundData(
	@warehouse  nvarchar(25),
	@todaysDateWithWarehouseOffset nvarchar(50),
	@todaysDate DATETIME
)
AS  
BEGIN

	DECLARE @validKPIRecordsExist BIT;
	DECLARE @kpiType nvarchar(50);
	SET @validKPIRecordsExist = 0;
	DECLARE @actualExpTimeForShipments numeric(9,0);
	DECLARE @actualExpTimeForOrders numeric(9,0);
	SET @kpiType = N'Shipping';
	SELECT @validKPIRecordsExist = (case when COUNT(DISTINCT IDENTIFIER) = 15 then 1 else 0 end) FROM DASHBOARD_DATA WHERE IDENTIFIER IN (270,280,290,300,310,320,330,480,490,500,510,520,350,530,720) AND WAREHOUSE = @warehouse;

	IF @validKPIRecordsExist = 0 
	BEGIN	
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (270,280,290,300,310,320,330,480,490,500,510,520,350,530,720) AND WAREHOUSE = @warehouse;

		 SELECT @actualExpTimeForShipments =    SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'40' AND RECORD_TYPE =N'DASHBOARDSYSVALUES'
		SELECT @actualExpTimeForOrders =    SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'60' AND RECORD_TYPE =N'DASHBOARDSYSVALUES'
		
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Shipments expected today',40,dbo.DASHFn_GetKPIValue(@kpiType, 270, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,270,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Shipments processed today',40,dbo.DASHFn_GetKPIValue(@kpiType, 280, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,280,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Shipments at risk today',40,dbo.DASHFn_GetKPIValue(@kpiType, 290, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,290,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Shipments remaining today',40,dbo.DASHFn_GetKPIValue(@kpiType, 350, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,350,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Shipments expected tomorrow',40,dbo.DASHFn_GetKPIValue(@kpiType, 300, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,300,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Average expected shipments per day',40,dbo.DASHFn_GetKPIValue(@kpiType, 310, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,310,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Shipments expected this week',40,dbo.DASHFn_GetKPIValue(@kpiType, 320, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,320,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Average expected shipments per week',40,dbo.DASHFn_GetKPIValue(@kpiType, 330, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,330,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Orders to be waved',60,dbo.DASHFn_GetKPIValue(@kpiType, 480, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,480,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Orders in process',60,dbo.DASHFn_GetKPIValue(@kpiType, 490, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,490,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Orders in packing',60,dbo.DASHFn_GetKPIValue(@kpiType, 500, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,500,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Orders in loading',60,dbo.DASHFn_GetKPIValue(@kpiType, 510, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,510,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Orders in ship confirmation',60,dbo.DASHFn_GetKPIValue(@kpiType, 520, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,520,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Orders throughput',60,dbo.DASHFn_GetKPIValue(@kpiType, 530, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,530,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
        VALUES (N'Total Orders',60,dbo.DASHFn_GetKPIValue(@kpiType, 720, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,720,N'System',N'DASHFn_RefreshOutboundData.sql',@todaysDate,@actualExpTimeForOrders)	
	END
	ELSE 
	BEGIN
	declare @result int
	select @result = count(*) from DASHBOARD_DATA WITH (NOLOCK) WHERE DATEADD(MINUTE,EXPIRATION_TIME,LAST_UPDATED) < @todaysDate and WAREHOUSE = @warehouse and IDENTIFIER in (270,280,290,300,310,320,330,480,490,500,510,520,530);
	 if @result>0 
		BEGIN
		UPDATE DASHBOARD_DATA
		SET VALUE = dbo.DASHFn_GetKPIValue(@kpiType, IDENTIFIER, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),
		LAST_UPDATED = @todaysDate
		WHERE  WAREHOUSE = @warehouse and IDENTIFIER in (270,280,290,300,310,320,330,480,490,500,510,520,530);
	end 
	set @result=0
	select @result = count(*) from DASHBOARD_DATA WITH (NOLOCK) WHERE DATEADD(MINUTE,EXPIRATION_TIME,LAST_UPDATED) < @todaysDate and WAREHOUSE = @warehouse and IDENTIFIER in (350, 720);
	 if @result>0 
		BEGIN
		-- Calculate data that is dependent Dashboard_Data table to get latest values updated in above statement
		UPDATE DASHBOARD_DATA
		SET VALUE = dbo.DASHFn_GetKPIValue(@kpiType, IDENTIFIER, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),
		LAST_UPDATED = @todaysDate
		WHERE  WAREHOUSE = @warehouse and IDENTIFIER in (350, 720);
	end
	END;

END

