-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










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
	SET @kpiType = N'<literal:1>';
	SELECT @validKPIRecordsExist = (case when COUNT(DISTINCT IDENTIFIER) = 28 then 1 else 0 end) FROM DASHBOARD_DATA WHERE IDENTIFIER IN (540, 550, 560, 570, 580, 590, 600, 610, 620, 630, 640, 650, 730, 740, 750, 760, 770, 780, 790, 800, 810, 820, 830, 840, 850, 860, 870, 880) AND WAREHOUSE = @warehouse;

	IF @validKPIRecordsExist = 0 
	BEGIN	
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (540, 550, 560, 570, 580, 590, 600, 610, 620, 630, 640, 650, 730, 740, 750, 760, 770, 780, 790, 800, 810, 820, 830, 840, 850, 860, 870, 880) AND WAREHOUSE = @warehouse;
		SELECT @actualExpTimeForWork =    SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'<literal:2>' AND RECORD_TYPE =N'<literal:3>'
		
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:4>',70,dbo.DASHFn_GetKPIValue(@kpiType, 540, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,540,N'<literal:5>',N'<literal:6>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:7>',70,dbo.DASHFn_GetKPIValue(@kpiType, 550, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,550,N'<literal:8>',N'<literal:9>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:10>',70,dbo.DASHFn_GetKPIValue(@kpiType, 560, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,560,N'<literal:11>',N'<literal:12>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:13>',70,dbo.DASHFn_GetKPIValue(@kpiType, 570, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,570,N'<literal:14>',N'<literal:15>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:16>',70,dbo.DASHFn_GetKPIValue(@kpiType, 580, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,580,N'<literal:17>',N'<literal:18>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:19>',70,dbo.DASHFn_GetKPIValue(@kpiType, 590, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,590,N'<literal:20>',N'<literal:21>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:22>',70,dbo.DASHFn_GetKPIValue(@kpiType, 600, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,600,N'<literal:23>',N'<literal:24>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:25>',70,dbo.DASHFn_GetKPIValue(@kpiType, 610, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,610,N'<literal:26>',N'<literal:27>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:28>',70,dbo.DASHFn_GetKPIValue(@kpiType, 620, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,620,N'<literal:29>',N'<literal:30>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:31>',70,dbo.DASHFn_GetKPIValue(@kpiType, 630, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,630,N'<literal:32>',N'<literal:33>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:34>',70,dbo.DASHFn_GetKPIValue(@kpiType, 640, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,640,N'<literal:35>',N'<literal:36>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:37>',70,dbo.DASHFn_GetKPIValue(@kpiType, 650, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,650,N'<literal:38>',N'<literal:39>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:40>',70,dbo.DASHFn_GetKPIValue(@kpiType, 730, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,730,N'<literal:41>',N'<literal:42>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:43>',70,dbo.DASHFn_GetKPIValue(@kpiType, 740, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,740,N'<literal:44>',N'<literal:45>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:46>',70,dbo.DASHFn_GetKPIValue(@kpiType, 750, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,750,N'<literal:47>',N'<literal:48>',@todaysDate,@actualExpTimeForWork)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:49>',70,dbo.DASHFn_GetKPIValue(@kpiType, 760, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,760,N'<literal:50>',N'<literal:51>',@todaysDate,@actualExpTimeForWork)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:52>',70,dbo.DASHFn_GetKPIValue(@kpiType, 770, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,770,N'<literal:53>',N'<literal:54>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:55>',70,dbo.DASHFn_GetKPIValue(@kpiType, 780, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,780,N'<literal:56>',N'<literal:57>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:58>',70,dbo.DASHFn_GetKPIValue(@kpiType, 790, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,790,N'<literal:59>',N'<literal:60>',@todaysDate,@actualExpTimeForWork)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:61>',70,dbo.DASHFn_GetKPIValue(@kpiType, 800, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,800,N'<literal:62>',N'<literal:63>',@todaysDate,@actualExpTimeForWork)	
		
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:64>',70,dbo.DASHFn_GetKPIValue(@kpiType, 810, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,810,N'<literal:65>',N'<literal:66>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:67>',70,dbo.DASHFn_GetKPIValue(@kpiType, 820, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,820,N'<literal:68>',N'<literal:69>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:70>',70,dbo.DASHFn_GetKPIValue(@kpiType, 830, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,830,N'<literal:71>',N'<literal:72>',@todaysDate,@actualExpTimeForWork)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:73>',70,dbo.DASHFn_GetKPIValue(@kpiType, 840, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,840,N'<literal:74>',N'<literal:75>',@todaysDate,@actualExpTimeForWork)	
		
		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:76>',70,dbo.DASHFn_GetKPIValue(@kpiType, 850, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,850,N'<literal:77>',N'<literal:78>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:79>',70,dbo.DASHFn_GetKPIValue(@kpiType, 860, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,860,N'<literal:80>',N'<literal:81>',@todaysDate,@actualExpTimeForWork)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:82>',70,dbo.DASHFn_GetKPIValue(@kpiType, 870, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,870,N'<literal:83>',N'<literal:84>',@todaysDate,@actualExpTimeForWork)	

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:85>',70,dbo.DASHFn_GetKPIValue(@kpiType, 880, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,880,N'<literal:86>',N'<literal:87>',@todaysDate,@actualExpTimeForWork)		
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
		-- [comment omitted]
		UPDATE DASHBOARD_DATA
		SET VALUE = dbo.DASHFn_GetKPIValue(@kpiType, IDENTIFIER, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),
		LAST_UPDATED = @todaysDate
		WHERE  WAREHOUSE = @warehouse and IDENTIFIER IN (730, 740, 750, 760, 770, 780, 790, 800, 810, 820, 830, 840, 850, 860, 870, 880);
	end
	END;
END