/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	219676		| MMM			| 04/24/18	| Created
	225230		| TDA			| 06/13/18	| Moved DASHSYSVALUES to system config

	This procedure is invoked from scheduled job, calculates and inserts the dashboard data.
	At present it is capturing planned and actual number of shipments/receipts processed data
*/
CREATE PROCEDURE DASH_CaptureDashboardData(
	@warehouse  nvarchar(25),
	@dashboardArea  nvarchar(50)
)
AS  
BEGIN
	declare @todaysDateWithWarehouseOffset nvarchar(50);
	declare @todaysDate datetime;
	set @todaysDate = GETUTCDATE();
	-- Get the todays date part with warehouse offset
	set @todaysDateWithWarehouseOffset = CAST(dbo.GetWarehouseTimezoneValue(@warehouse, @todaysDate) AS DATE);
			
	IF @dashboardArea = N'10' 
	BEGIN
		declare @plannedReceipts numeric(9,0);
		declare @actualReceipts numeric(9,0);
		declare @captureReceiptsByTimeData BIT;
		SET @captureReceiptsByTimeData = 1;
	
		--Delete the data from Dashboard table older than 14 hours
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (130, 200) AND LAST_UPDATED < DATEADD(HOUR,-14,@todaysDate) AND WAREHOUSE = @warehouse;
		
		-- Check if there exists recent(as per expiration time configured in system config detail table) Receipts by time records captured by system
		SELECT @captureReceiptsByTimeData = CASE WHEN COUNT(*) > 1 THEN 0 ELSE 1 END 
		FROM DASHBOARD_DATA DD LEFT OUTER JOIN SYSTEM_CONFIG_DETAIL SCD ON SCD.RECORD_TYPE = N'DASHBOARDSYSVALUES' AND DD.EXPIRATION_TIME_CONFIG = SCD.SYS_KEY 	
		WHERE DD.IDENTIFIER IN (130, 200) AND DD.WAREHOUSE = @warehouse AND DD.LAST_UPDATED > DATEADD(MINUTE,-COALESCE(SCD.SYSTEM_VALUE, 5),@todaysDate);

		IF @captureReceiptsByTimeData = 0
			RETURN;
		
		-- Capture Receipts by time data
		SELECT @plannedReceipts	=	COUNT(RH.INTERNAL_RECEIPT_NUM) 
									FROM RECEIPT_HEADER RH 
									LEFT JOIN APPOINTMENT_SCHEDULE APPSCH on RH.INTERNAL_RECEIPT_NUM = APPSCH.INTERNAL_RECEIPT_NUM
									WHERE ISNULL(CAST(APPSCH.APPT_DATE_TIME as date),cast(RH.SCHEDULED_DATE_TIME as date)) = @todaysDateWithWarehouseOffset
									AND RH.WAREHOUSE = @warehouse;

		SELECT @actualReceipts	=	COUNT(RH.INTERNAL_RECEIPT_NUM) 
									FROM RECEIPT_HEADER RH 
									LEFT JOIN APPOINTMENT_SCHEDULE APPSCH on RH.INTERNAL_RECEIPT_NUM = APPSCH.INTERNAL_RECEIPT_NUM
									WHERE ISNULL(CAST(APPSCH.APPT_DATE_TIME as date),cast(RH.SCHEDULED_DATE_TIME as date)) = @todaysDateWithWarehouseOffset 
									AND CAST(RH.CLOSE_DATE AS DATE) = @todaysDateWithWarehouseOffset AND WAREHOUSE = @warehouse;

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP) 
		VALUES (N'Planned receipts by time', 20, @plannedReceipts, @todaysDate,@warehouse,130,N'System',N'DASH_CaptureDashboardData.sql',@todaysDate);

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP) 
		VALUES (N'Actual receipts by time', 20, @actualReceipts, @todaysDate,@warehouse,200,N'System',N'DASH_CaptureDashboardData.sql',@todaysDate);	

	END
	ELSE IF @dashboardArea = N'20' 
	BEGIN	
		declare @plannedShipments numeric(9,0);
		declare @actualShipments numeric(9,0);
		declare @captureShipmentsByTimeData BIT;
		SET @captureShipmentsByTimeData = 1;
		
		--Delete the data from Dashboard table older than 14 hours
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (340,410) AND LAST_UPDATED < DATEADD(HOUR,-14,@todaysDate) AND WAREHOUSE = @warehouse;	

		-- Check if there exists recent(as per expiration time configured in system config detail table) Shipments by time records captured by system
		SELECT @captureShipmentsByTimeData = CASE WHEN COUNT(*) > 1 THEN 0 ELSE 1 END 
		FROM DASHBOARD_DATA DD LEFT OUTER JOIN SYSTEM_CONFIG_DETAIL SCD ON SCD.RECORD_TYPE = N'DASHBOARDSYSVALUES' AND DD.EXPIRATION_TIME_CONFIG = SCD.SYS_KEY
		WHERE DD.IDENTIFIER IN (340,410) AND DD.WAREHOUSE = @warehouse AND DD.LAST_UPDATED > DATEADD(MINUTE,-COALESCE(SCD.SYSTEM_VALUE, 5),@todaysDate);

		
		IF @captureShipmentsByTimeData = 0
			RETURN;
			
		-- Capture Shipments by time data
		SELECT @plannedShipments =	COUNT(INTERNAL_SHIPMENT_NUM) 
									FROM SHIPMENT_HEADER 
									WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) = @todaysDateWithWarehouseOffset AND WAREHOUSE = @warehouse;

		SELECT @actualShipments	=	COUNT(INTERNAL_SHIPMENT_NUM) 
									FROM SHIPMENT_HEADER 
									WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) = @todaysDateWithWarehouseOffset AND TRAILING_STS >= 600 AND WAREHOUSE = @warehouse;

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP) 
		VALUES (N'Planned shipments by time', 50, @plannedShipments, @todaysDate,@warehouse,340,N'System',N'DASH_CaptureDashboardData.sql',@todaysDate);

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP) 
		VALUES (N'Actual shipments by time', 50, @actualShipments, @todaysDate,@warehouse,410,N'System',N'DASH_CaptureDashboardData.sql',@todaysDate)	;

	END
END

