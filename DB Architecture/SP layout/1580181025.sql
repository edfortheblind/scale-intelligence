/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	219651		| DP			| 04/12/18	| Created.
	219962		| MMM			| 04/16/18	| Removed all KPI parameters and replaced logic to fetch KPI values from DASHFn_GetKPIValue function
	219676		| MMM			| 04/27/18	| Modified to associate work dashboard data records with expiry time config through new column i.e. EXPIRATION_TIME_CONFIG
	225230		| TDA			| 06/13/18	| Moved DASHSYSVALUES to system config
	232436		| PMB			| 04/04/19	| Modified to avoid counting duplicate kpi records using distinct.
	238119      | KSS			| 09/04/19 | Changes made to fix the deadlock issue
	Inserts/Updates the dashboard table with new work data 
*/
CREATE PROCEDURE DASH_RefreshWorkData(
	@warehouse  nvarchar(25),
	@todaysDateWithWarehouseOffset nvarchar(50),
	@todaysDate DATETIME
)
AS  
BEGIN
	DECLARE @validKPIRecordsExist BIT;
	DECLARE @kpiType nvarchar(50);
	SET @validKPIRecordsExist = 0;
	DECLARE @actualExpTimeForWork numeric (9,0);
	SET @kpiType = N'Work';
	SELECT @validKPIRecordsExist = (case when COUNT(DISTINCT IDENTIFIER) = 28 then 1 else 0 end) FROM DASHBOARD_DATA WHERE IDENTIFIER IN (540, 550, 560, 570, 580, 590, 600, 610, 620, 630, 640, 650, 730, 740, 750, 760, 770, 780, 790, 800, 810, 820, 830, 840, 850, 860, 870, 880) AND WAREHOUSE = @warehouse;

	IF @validKPIRecordsExist = 0 
	BEGIN	
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (540, 550, 560, 570, 580, 590, 600, 610, 620, 630, 640, 650, 730, 740, 750, 760, 770, 780, 790, 800, 810, 820, 830, 840, 850, 860, 870, 880) AND WAREHOUSE = @warehouse;
		SELECT @actualExpTimeForWork =    SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'70' AND RECORD_TYPE =N'DASHBOARDSYSVALUES'
		
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units processed - receiving putaway',70,dbo.DASHFn_GetKPIValue(@kpiType, 540, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,540,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units remaining - receiving putaway',70,dbo.DASHFn_GetKPIValue(@kpiType, 550, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,550,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units high priority - receiving putaway',70,dbo.DASHFn_GetKPIValue(@kpiType, 560, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,560,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units processed - cycle counting',70,dbo.DASHFn_GetKPIValue(@kpiType, 570, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,570,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units remaining - cycle counting',70,dbo.DASHFn_GetKPIValue(@kpiType, 580, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,580,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units at risk - cycle counting',70,dbo.DASHFn_GetKPIValue(@kpiType, 590, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,590,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units processed - replenishment',70,dbo.DASHFn_GetKPIValue(@kpiType, 600, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,600,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units remaining - replenishment',70,dbo.DASHFn_GetKPIValue(@kpiType, 610, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,610,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units at risk - replenishment',70,dbo.DASHFn_GetKPIValue(@kpiType, 620, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,620,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units processed - picking',70,dbo.DASHFn_GetKPIValue(@kpiType, 630, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,630,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units remaining - picking',70,dbo.DASHFn_GetKPIValue(@kpiType, 640, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,640,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Work units at risk - picking',70,dbo.DASHFn_GetKPIValue(@kpiType, 650, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,650,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% High priority - receiving putaway',70,dbo.DASHFn_GetKPIValue(@kpiType, 730, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,730,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% Processed - receiving putaway',70,dbo.DASHFn_GetKPIValue(@kpiType, 740, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,740,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% Remaining - receiving putaway',70,dbo.DASHFn_GetKPIValue(@kpiType, 750, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,750,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Total work units - receiving putaway',70,dbo.DASHFn_GetKPIValue(@kpiType, 760, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,760,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% At Risk - cycle counting',70,dbo.DASHFn_GetKPIValue(@kpiType, 770, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,770,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% Processed - cycle counting',70,dbo.DASHFn_GetKPIValue(@kpiType, 780, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,780,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% Remaining - cycle counting',70,dbo.DASHFn_GetKPIValue(@kpiType, 790, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,790,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Total work units - cycle counting',70,dbo.DASHFn_GetKPIValue(@kpiType, 800, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,800,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)	
		
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% At Risk - replenishment',70,dbo.DASHFn_GetKPIValue(@kpiType, 810, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,810,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% Processed - replenishment',70,dbo.DASHFn_GetKPIValue(@kpiType, 820, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,820,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% Remaining - replenishment',70,dbo.DASHFn_GetKPIValue(@kpiType, 830, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,830,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Total work units - replenishment',70,dbo.DASHFn_GetKPIValue(@kpiType, 840, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,840,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)	
		
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% At Risk - picking',70,dbo.DASHFn_GetKPIValue(@kpiType, 850, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,850,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% Processed - picking',70,dbo.DASHFn_GetKPIValue(@kpiType, 860, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,860,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'% Remaining - picking',70,dbo.DASHFn_GetKPIValue(@kpiType, 870, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,870,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'Total work units - picking',70,dbo.DASHFn_GetKPIValue(@kpiType, 880, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,880,N'System',N'DASH_RefreshWorkData.sql',@todaysDate,@actualExpTimeForWork)		
	END
	ELSE 
	BEGIN
	declare @result int
	select @result = count(*) from DASHBOARD_DATA WITH (NOLOCK) WHERE DATEADD(MINUTE,EXPIRATION_TIME,LAST_UPDATED) < @todaysDate and WAREHOUSE = @warehouse and IDENTIFIER IN 
		(540, 550, 560, 570, 580, 590, 600, 610, 620, 630, 640, 650);
	 if @result>0 
		BEGIN

		UPDATE DASHBOARD_DATA
		SET VALUE = dbo.DASHFn_GetKPIValue(@kpiType, IDENTIFIER, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),
		LAST_UPDATED = @todaysDate
		WHERE  WAREHOUSE = @warehouse and IDENTIFIER IN 
		(540, 550, 560, 570, 580, 590, 600, 610, 620, 630, 640, 650);
	end
	set @result =0
	select @result = count(*) from DASHBOARD_DATA WITH (NOLOCK) WHERE DATEADD(MINUTE,EXPIRATION_TIME,LAST_UPDATED) < @todaysDate and WAREHOUSE = @warehouse and IDENTIFIER IN (730, 740, 750, 760, 770, 780, 790, 800, 810, 820, 830, 840, 850, 860, 870, 880);

	 if @result>0 
		BEGIN
		-- Calculate data that is dependent Dashboard_Data table to get latest values updated in above statement
		UPDATE DASHBOARD_DATA
		SET VALUE = dbo.DASHFn_GetKPIValue(@kpiType, IDENTIFIER, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),
		LAST_UPDATED = @todaysDate
		WHERE  WAREHOUSE = @warehouse and IDENTIFIER IN (730, 740, 750, 760, 770, 780, 790, 800, 810, 820, 830, 840, 850, 860, 870, 880);
	end
	END;
END