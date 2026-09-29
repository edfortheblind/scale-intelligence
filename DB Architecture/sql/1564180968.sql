-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */














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
	SET @kpiType = N'<literal:1>';
	SELECT @validKPIRecordsExist = (case when COUNT(DISTINCT IDENTIFIER) = 15 then 1 else 0 end) FROM DASHBOARD_DATA WHERE IDENTIFIER IN (270,280,290,300,310,320,330,480,490,500,510,520,350,530,720) AND WAREHOUSE = @warehouse;

	IF @validKPIRecordsExist = 0 
	BEGIN	
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (270,280,290,300,310,320,330,480,490,500,510,520,350,530,720) AND WAREHOUSE = @warehouse;

		 SELECT @actualExpTimeForShipments =    SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'<literal:2>' AND RECORD_TYPE =N'<literal:3>'
		SELECT @actualExpTimeForOrders =    SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'<literal:4>' AND RECORD_TYPE =N'<literal:5>'
		
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:6>',40,dbo.DASHFn_GetKPIValue(@kpiType, 270, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,270,N'<literal:7>',N'<literal:8>',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:9>',40,dbo.DASHFn_GetKPIValue(@kpiType, 280, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,280,N'<literal:10>',N'<literal:11>',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:12>',40,dbo.DASHFn_GetKPIValue(@kpiType, 290, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,290,N'<literal:13>',N'<literal:14>',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:15>',40,dbo.DASHFn_GetKPIValue(@kpiType, 350, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,350,N'<literal:16>',N'<literal:17>',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:18>',40,dbo.DASHFn_GetKPIValue(@kpiType, 300, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,300,N'<literal:19>',N'<literal:20>',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:21>',40,dbo.DASHFn_GetKPIValue(@kpiType, 310, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,310,N'<literal:22>',N'<literal:23>',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:24>',40,dbo.DASHFn_GetKPIValue(@kpiType, 320, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,320,N'<literal:25>',N'<literal:26>',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:27>',40,dbo.DASHFn_GetKPIValue(@kpiType, 330, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,330,N'<literal:28>',N'<literal:29>',@todaysDate,@actualExpTimeForShipments)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:30>',60,dbo.DASHFn_GetKPIValue(@kpiType, 480, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,480,N'<literal:31>',N'<literal:32>',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:33>',60,dbo.DASHFn_GetKPIValue(@kpiType, 490, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,490,N'<literal:34>',N'<literal:35>',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:36>',60,dbo.DASHFn_GetKPIValue(@kpiType, 500, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,500,N'<literal:37>',N'<literal:38>',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:39>',60,dbo.DASHFn_GetKPIValue(@kpiType, 510, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,510,N'<literal:40>',N'<literal:41>',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:42>',60,dbo.DASHFn_GetKPIValue(@kpiType, 520, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,520,N'<literal:43>',N'<literal:44>',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:45>',60,dbo.DASHFn_GetKPIValue(@kpiType, 530, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,530,N'<literal:46>',N'<literal:47>',@todaysDate,@actualExpTimeForOrders)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
        VALUES (N'<literal:48>',60,dbo.DASHFn_GetKPIValue(@kpiType, 720, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,720,N'<literal:49>',N'<literal:50>',@todaysDate,@actualExpTimeForOrders)	
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
		-- [comment omitted]
		UPDATE DASHBOARD_DATA
		SET VALUE = dbo.DASHFn_GetKPIValue(@kpiType, IDENTIFIER, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),
		LAST_UPDATED = @todaysDate
		WHERE  WAREHOUSE = @warehouse and IDENTIFIER in (350, 720);
	end
	END;

END

