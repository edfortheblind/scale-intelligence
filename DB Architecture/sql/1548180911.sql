-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











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
	SET @kpiType = N'<literal:1>';
	SELECT @validKPIRecordsExist = (case when COUNT(DISTINCT IDENTIFIER) = 5 then 1 else 0 end) FROM DASHBOARD_DATA WHERE IDENTIFIER IN (660,670,680,690,700) AND WAREHOUSE = @warehouse;

	
DECLARE @jsonInfo NVARCHAR(MAX)

set @jsonInfo = ( SELECT *  FROM   (SELECT user_name,
				   CASE WHEN lmd.process_type IN (	N'<literal:2>',
													N'<literal:3>' ) THEN N'<literal:4>'
						WHEN lmd.process_type IN (	N'<literal:5>',
													N'<literal:6>',
													N'<literal:7>',
													N'<literal:8>' ) THEN N'<literal:9>'
						WHEN lmd.process_type IN (	N'<literal:10>',
													N'<literal:11>',
													N'<literal:12>',
													N'<literal:13>',
													N'<literal:14>',
													N'<literal:15>',
													N'<literal:16>',
													N'<literal:17>',
													N'<literal:18>',
													N'<literal:19>',
													N'<literal:20>',
													N'<literal:21>',
													N'<literal:22>' ) THEN N'<literal:23>'
						ELSE N'<literal:24>'
				   END AS type
			FROM   labor_management_detail lmd
			WHERE  lmd.start_date_time > Dateadd(minute, -15, @todaysDate) AND warehouse = @warehouse  AND process_type IN ( N'<literal:25>',
																															 N'<literal:26>',
																															 N'<literal:27>',
																															 N'<literal:28>',
																															 N'<literal:29>',
																															 N'<literal:30>',
																															 N'<literal:31>',
																															 N'<literal:32>',
																															 N'<literal:33>',
																															 N'<literal:34>',
																															 N'<literal:35>',
																															 N'<literal:36>',
																															 N'<literal:37>',
																															 N'<literal:38>',
																															 N'<literal:39>',
																															 N'<literal:40>',
																															 N'<literal:41>',
																															 N'<literal:42>',
																															 N'<literal:43>' )
			UNION
			SELECT user_name,
				   CASE
						 WHEN wiv.internal_num_type = N'<literal:44>' THEN N'<literal:45>'
						 WHEN wiv.internal_num_type IN (N'<literal:46>',
														N'<literal:47>',
														N'<literal:48>', N'<literal:49>',
														N'<literal:50>') THEN N'<literal:51>'
						 WHEN wiv.internal_num_type = N'<literal:52>' THEN N'<literal:53>'
						 WHEN wiv.internal_num_type IN ( N'<literal:54>', N'<literal:55>') THEN N'<literal:56>'
						 ELSE N'<literal:57>'
				   END AS type
			FROM   labor_management_detail lmd JOIN work_instruction_view wiv ON lmd.internal_num = wiv.internal_instruction_num
			WHERE  lmd.start_date_time > Dateadd(minute, -15, @todaysDate) AND warehouse = @warehouse AND wiv.internal_num_type IN (
																												   N'<literal:58>', 
																												   N'<literal:59>',
																												   N'<literal:60>',
																												   N'<literal:61>',
																												   N'<literal:62>',
																												   N'<literal:63>',
																												   N'<literal:64>',
																												   N'<literal:65>',
																												   N'<literal:66>' )) t1
				PIVOT(
					COUNT(user_name)    FOR type IN (
													[Inventory],
													[Receiving],
													[Shipping], 
													[Replenishment])
				) AS pivot_table for json auto, WITHOUT_ARRAY_WRAPPER
)-- [comment omitted]

	IF @validKPIRecordsExist = 0 
	BEGIN	
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (660,670,680,690,700) AND WAREHOUSE = @warehouse;
		SELECT @actualExpTimeForLabor =   SYSTEM_VALUE from  SYSTEM_CONFIG_DETAIL WHERE SYS_KEY =N'<literal:67>' AND RECORD_TYPE =N'<literal:68>'

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:69>',80,dbo.DASHFn_GetKPIValue(@kpiType, 660, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate),@todaysDate,@warehouse,660,N'<literal:70>',N'<literal:71>',@todaysDate,@actualExpTimeForLabor)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:72>',80,COALESCE(JSON_VALUE(@jsonInfo, N'<literal:73>'),0),@todaysDate,@warehouse,670,N'<literal:74>',N'<literal:75>',@todaysDate,@actualExpTimeForLabor)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:76>',80,COALESCE(JSON_VALUE(@jsonInfo, N'<literal:77>'),0),@todaysDate,@warehouse,680,N'<literal:78>',N'<literal:79>',@todaysDate,@actualExpTimeForLabor)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME) 
		VALUES (N'<literal:80>',80,COALESCE(JSON_VALUE(@jsonInfo, N'<literal:81>'),0),@todaysDate,@warehouse,690,N'<literal:82>',N'<literal:83>',@todaysDate,@actualExpTimeForLabor)

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP,EXPIRATION_TIME)
		VALUES (N'<literal:84>',80,COALESCE(JSON_VALUE(@jsonInfo, N'<literal:85>'),0),@todaysDate,@warehouse,700,N'<literal:86>',N'<literal:87>',@todaysDate,@actualExpTimeForLabor)	
	END
	ELSE 
	BEGIN
	
		UPDATE DASHBOARD_DATA
		SET VALUE = 
		 case 
			when IDENTIFIER = 660 then dbo.DASHFn_GetKPIValue(@kpiType, IDENTIFIER, @warehouse, @todaysDateWithWarehouseOffset,@todaysDate)
			when IDENTIFIER = 670 then CASE WHEN JSON_VALUE(@jsonInfo, N'<literal:88>')  IS NULL THEN 0 ELSE JSON_VALUE(@jsonInfo, N'<literal:89>') END
			when IDENTIFIER = 680 then CASE WHEN JSON_VALUE(@jsonInfo, N'<literal:90>') IS NULL THEN 0 ELSE  JSON_VALUE(@jsonInfo, N'<literal:91>') END
			when IDENTIFIER = 690 then CASE WHEN JSON_VALUE(@jsonInfo, N'<literal:92>') IS NULL THEN 0 ELSE  JSON_VALUE(@jsonInfo, N'<literal:93>') END
			when IDENTIFIER = 700 then CASE WHEN JSON_VALUE(@jsonInfo, N'<literal:94>') IS NULL THEN 0 ELSE JSON_VALUE(@jsonInfo, N'<literal:95>') END
		end,
		LAST_UPDATED = @todaysDate
		WHERE DATEADD(MINUTE,EXPIRATION_TIME,LAST_UPDATED) < @todaysDate and WAREHOUSE = @warehouse and IDENTIFIER IN (660,670,680,690,700);

	END;

END