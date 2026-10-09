/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	220150		| SHS			| 03/20/18  | Created.  
	220386		| DP			| 03/27/18  | Modified receipts at risk to Receipts high priority
	219654      | SN            | 04/02/18  | Added Insert statements for Time Widget. 
	220485		| MMM			| 04/09/18	| Added Receipts remaining today record
	219657		| AH			| 04/10/18  | Modified to return actual data for dock to stock and orders widgets.
	219962		| MMM			| 04/16/18	| Removed all KPI parameters and replaced logic to fetch KPI values from DASHFn_GetKPIValue function
	219676		| MMM			| 04/27/18	| Invoked function to capture Receipts by time records
	225230		| TDA			| 06/13/18	| Moved DASHSYSVALUES to system config
	232436		| PMB			| 04/04/19	| Modified to avoid counting duplicate kpi records using distinct.
	
	238119      | KSS			| 09/04/19 | Changes made to fix the deadlock issue
	Inserts/Updates the dashboard table with new inbound data 
*/
CREATE PROCEDURE DASH_RefreshInboundData(
	@warehouse  nvarchar(25),
	@todaysDateWithWarehouseOffset nvarchar(50),
	@todaysDate DATETIME)
AS  
BEGIN

	DECLARE @validKPIRecordsExist BIT;
	DECLARE @kpiType nvarchar(50);
	DECLARE @actualExpTimeForInbound numeric(9,0);
	DECLARE @actualExpTimeForDockTostock numeric(9,0);
	SET @validKPIRecordsExist = 0;
	SET @kpiType = N'Receiving';
	SELECT @validKPIRecordsExist = (case when COUNT(DISTINCT IDENTIFIER) = 13 then 1 else 0 end) FROM DASHBOARD_DATA WHERE IDENTIFIER IN (10,20,30,40,50,60,70,80,90,100,110,120,710) AND WAREHOUSE = @warehouse;

	IF @validKPIRecordsExist = 0 
	BEGIN	
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (10,20,30,40,50,60,70,80,90,100,110,120,710) AND WAREHOUSE = @warehouse;
        SELECT @actualExpTimeForInbound =   SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'10' AND RECORD_TYPE =N'DASHBOARDSYSVALUES'
		SELECT @actualExpTimeForDockTostock =   SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'30' AND RECORD_TYPE =N'DASHBOARDSYSVALUES'
		
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Receipts expected today',10,dbo.DASHFn_GetKPIValue(@kpiType, 10, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,10,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Receipts high priority today',10,dbo.DASHFn_GetKPIValue(@kpiType, 20, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,20,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Receipts processed today',10,dbo.DASHFn_GetKPIValue(@kpiType, 30, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,30,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Receipts expected tomorrow',10,dbo.DASHFn_GetKPIValue(@kpiType, 40, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,40,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Average expected receipts per day',10,dbo.DASHFn_GetKPIValue(@kpiType, 50, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,50,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Receipts expected this week',10,dbo.DASHFn_GetKPIValue(@kpiType, 60, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,60,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Average expected receipts per week',10,dbo.DASHFn_GetKPIValue(@kpiType, 70, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,70,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForInbound)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Receipts remaining today',10,dbo.DASHFn_GetKPIValue(@kpiType, 80, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,80,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForInbound)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Average dock to stock',30,dbo.DASHFn_GetKPIValue(@kpiType, 120, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,120,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForDockTostock)	
				
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Longest dock to stock',30,dbo.DASHFn_GetKPIValue(@kpiType, 90, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,90,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForDockTostock)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Shortest dock to stock',30,dbo.DASHFn_GetKPIValue(@kpiType, 110, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,110,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForDockTostock)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Current throughput dock to stock',30,dbo.DASHFn_GetKPIValue(@kpiType, 100, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,100,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForDockTostock)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Goal dock to stock',30,dbo.DASHFn_GetKPIValue(@kpiType, 710, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,710,N'System',N'DASHFn_RefreshInboundData.sql',@todaysDate,@actualExpTimeForDockTostock)	
	END
	ELSE 
	BEGIN

	declare @result int
	select @result = count(*) from DASHBOARD_DATA WITH (NOLOCK) WHERE DATEADD(MINUTE,EXPIRATION_TIME,LAST_UPDATED) < @todaysDate and WAREHOUSE = @warehouse and IDENTIFIER IN (10,20,30,40,50,60,70,100,120,710);
	 if @result>0 
		BEGIN
		UPDATE DASHBOARD_DATA
		SET VALUE = dbo.DASHFn_GetKPIValue(@kpiType, IDENTIFIER, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),
		LAST_UPDATED = @todaysDate
		WHERE  WAREHOUSE = @warehouse and IDENTIFIER IN (10,20,30,40,50,60,70,100,120,710);
	end
	set @result =0;
	select @result = count(*) from DASHBOARD_DATA WITH (NOLOCK) WHERE DATEADD(MINUTE,EXPIRATION_TIME,LAST_UPDATED) < @todaysDate and WAREHOUSE = @warehouse and IDENTIFIER IN (90);
	 if @result>0 
		BEGIN
		-- Calculate data that is dependent Dashboard_Data table to get latest values updated in above statement
		UPDATE DASHBOARD_DATA
		SET VALUE = dbo.DASHFn_GetKPIValue(@kpiType, IDENTIFIER, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),
		LAST_UPDATED = @todaysDate
		WHERE  WAREHOUSE = @warehouse and IDENTIFIER IN (90);
	end
	set @result =0;
	select @result = count(*) from DASHBOARD_DATA WITH (NOLOCK) WHERE DATEADD(MINUTE,EXPIRATION_TIME,LAST_UPDATED) < @todaysDate and WAREHOUSE = @warehouse and IDENTIFIER IN (80, 110);
	 if @result>0 
		BEGIN
		UPDATE DASHBOARD_DATA
		SET VALUE = dbo.DASHFn_GetKPIValue(@kpiType, IDENTIFIER, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),
		LAST_UPDATED = @todaysDate
		WHERE WAREHOUSE = @warehouse and IDENTIFIER IN (80, 110);
	end
	END
	
END