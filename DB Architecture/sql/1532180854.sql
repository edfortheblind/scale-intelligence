-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















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
	SET @kpiType = N'<literal:1>';
	SELECT @validKPIRecordsExist = (case when COUNT(DISTINCT IDENTIFIER) = 13 then 1 else 0 end) FROM DASHBOARD_DATA WHERE IDENTIFIER IN (10,20,30,40,50,60,70,80,90,100,110,120,710) AND WAREHOUSE = @warehouse;

	IF @validKPIRecordsExist = 0 
	BEGIN	
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (10,20,30,40,50,60,70,80,90,100,110,120,710) AND WAREHOUSE = @warehouse;
        SELECT @actualExpTimeForInbound =   SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'<literal:2>' AND RECORD_TYPE =N'<literal:3>'
		SELECT @actualExpTimeForDockTostock =   SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'<literal:4>' AND RECORD_TYPE =N'<literal:5>'
		
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:6>',10,dbo.DASHFn_GetKPIValue(@kpiType, 10, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,10,N'<literal:7>',N'<literal:8>',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:9>',10,dbo.DASHFn_GetKPIValue(@kpiType, 20, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,20,N'<literal:10>',N'<literal:11>',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:12>',10,dbo.DASHFn_GetKPIValue(@kpiType, 30, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,30,N'<literal:13>',N'<literal:14>',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:15>',10,dbo.DASHFn_GetKPIValue(@kpiType, 40, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,40,N'<literal:16>',N'<literal:17>',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:18>',10,dbo.DASHFn_GetKPIValue(@kpiType, 50, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,50,N'<literal:19>',N'<literal:20>',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:21>',10,dbo.DASHFn_GetKPIValue(@kpiType, 60, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,60,N'<literal:22>',N'<literal:23>',@todaysDate,@actualExpTimeForInbound)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:24>',10,dbo.DASHFn_GetKPIValue(@kpiType, 70, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,70,N'<literal:25>',N'<literal:26>',@todaysDate,@actualExpTimeForInbound)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:27>',10,dbo.DASHFn_GetKPIValue(@kpiType, 80, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,80,N'<literal:28>',N'<literal:29>',@todaysDate,@actualExpTimeForInbound)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:30>',30,dbo.DASHFn_GetKPIValue(@kpiType, 120, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,120,N'<literal:31>',N'<literal:32>',@todaysDate,@actualExpTimeForDockTostock)	
				
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:33>',30,dbo.DASHFn_GetKPIValue(@kpiType, 90, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,90,N'<literal:34>',N'<literal:35>',@todaysDate,@actualExpTimeForDockTostock)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:36>',30,dbo.DASHFn_GetKPIValue(@kpiType, 110, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,110,N'<literal:37>',N'<literal:38>',@todaysDate,@actualExpTimeForDockTostock)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:39>',30,dbo.DASHFn_GetKPIValue(@kpiType, 100, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,100,N'<literal:40>',N'<literal:41>',@todaysDate,@actualExpTimeForDockTostock)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:42>',30,dbo.DASHFn_GetKPIValue(@kpiType, 710, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,710,N'<literal:43>',N'<literal:44>',@todaysDate,@actualExpTimeForDockTostock)	
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
		-- [comment omitted]
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