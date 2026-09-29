-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE DASH_CaptureDashboardData(
	@warehouse  nvarchar(25),
	@dashboardArea  nvarchar(50)
)
AS  
BEGIN
	declare @todaysDateWithWarehouseOffset nvarchar(50);
	declare @todaysDate datetime;
	set @todaysDate = GETUTCDATE();
	-- [comment omitted]
	set @todaysDateWithWarehouseOffset = CAST(dbo.GetWarehouseTimezoneValue(@warehouse, @todaysDate) AS DATE);
			
	IF @dashboardArea = N'<literal:1>' 
	BEGIN
		declare @plannedReceipts numeric(9,0);
		declare @actualReceipts numeric(9,0);
		declare @captureReceiptsByTimeData BIT;
		SET @captureReceiptsByTimeData = 1;
	
		-- [comment omitted]
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (130, 200) AND LAST_UPDATED < DATEADD(HOUR,-14,@todaysDate) AND WAREHOUSE = @warehouse;
		
		-- [comment omitted]
		SELECT @captureReceiptsByTimeData = CASE WHEN COUNT(*) > 1 THEN 0 ELSE 1 END 
		FROM DASHBOARD_DATA DD LEFT OUTER JOIN SYSTEM_CONFIG_DETAIL SCD ON SCD.RECORD_TYPE = N'<literal:2>' AND DD.EXPIRATION_TIME_CONFIG = SCD.SYS_KEY 	
		WHERE DD.IDENTIFIER IN (130, 200) AND DD.WAREHOUSE = @warehouse AND DD.LAST_UPDATED > DATEADD(MINUTE,-COALESCE(SCD.SYSTEM_VALUE, 5),@todaysDate);

		IF @captureReceiptsByTimeData = 0
			RETURN;
		
		-- [comment omitted]
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
		VALUES (N'<literal:3>', 20, @plannedReceipts, @todaysDate,@warehouse,130,N'<literal:4>',N'<literal:5>',@todaysDate);

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP) 
		VALUES (N'<literal:6>', 20, @actualReceipts, @todaysDate,@warehouse,200,N'<literal:7>',N'<literal:8>',@todaysDate);	

	END
	ELSE IF @dashboardArea = N'<literal:9>' 
	BEGIN	
		declare @plannedShipments numeric(9,0);
		declare @actualShipments numeric(9,0);
		declare @captureShipmentsByTimeData BIT;
		SET @captureShipmentsByTimeData = 1;
		
		-- [comment omitted]
		DELETE FROM DASHBOARD_DATA WHERE IDENTIFIER IN (340,410) AND LAST_UPDATED < DATEADD(HOUR,-14,@todaysDate) AND WAREHOUSE = @warehouse;	

		-- [comment omitted]
		SELECT @captureShipmentsByTimeData = CASE WHEN COUNT(*) > 1 THEN 0 ELSE 1 END 
		FROM DASHBOARD_DATA DD LEFT OUTER JOIN SYSTEM_CONFIG_DETAIL SCD ON SCD.RECORD_TYPE = N'<literal:10>' AND DD.EXPIRATION_TIME_CONFIG = SCD.SYS_KEY
		WHERE DD.IDENTIFIER IN (340,410) AND DD.WAREHOUSE = @warehouse AND DD.LAST_UPDATED > DATEADD(MINUTE,-COALESCE(SCD.SYSTEM_VALUE, 5),@todaysDate);

		
		IF @captureShipmentsByTimeData = 0
			RETURN;
			
		-- [comment omitted]
		SELECT @plannedShipments =	COUNT(INTERNAL_SHIPMENT_NUM) 
									FROM SHIPMENT_HEADER 
									WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) = @todaysDateWithWarehouseOffset AND WAREHOUSE = @warehouse;

		SELECT @actualShipments	=	COUNT(INTERNAL_SHIPMENT_NUM) 
									FROM SHIPMENT_HEADER 
									WHERE CAST(SCHEDULED_SHIP_DATE AS DATE) = @todaysDateWithWarehouseOffset AND TRAILING_STS >= 600 AND WAREHOUSE = @warehouse;

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP) 
		VALUES (N'<literal:11>', 50, @plannedShipments, @todaysDate,@warehouse,340,N'<literal:12>',N'<literal:13>',@todaysDate);

		INSERT INTO DASHBOARD_DATA (DESCRIPTION,EXPIRATION_TIME_CONFIG,VALUE,LAST_UPDATED,WAREHOUSE,IDENTIFIER,USER_STAMP,PROCESS_STAMP,DATE_TIME_STAMP) 
		VALUES (N'<literal:14>', 50, @actualShipments, @todaysDate,@warehouse,410,N'<literal:15>',N'<literal:16>',@todaysDate)	;

	END
END

