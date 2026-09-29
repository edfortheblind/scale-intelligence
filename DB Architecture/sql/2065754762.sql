-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


CREATE PROCEDURE STH_UpdateHeader(
	@iIntShipNum numeric(9))
AS
	SET NOCOUNT ON;
	-- [comment omitted]
	-- [comment omitted]
	DECLARE @statusChanged INT;
	DECLARE @rowCount INT;
	DECLARE @rowsUpdated INT;
	DECLARE @alertInserted INT;
	DECLARE @internalAlertReqNum INT;
	DECLARE @iError INT;
	DECLARE @qtyAtImmediatePendingSts numeric(19,5) = 0.0;
	DECLARE @iLoadNum numeric(9);
	DECLARE @minStatus numeric(3);
	DECLARE @maxStatus numeric(3);
	DECLARE @defaultStatus numeric(3);
	DECLARE @HdrTrailingSts numeric(3);
	DECLARE @HdrLeadingSts numeric(3);
	DECLARE @warehouse nvarchar(25);

	SELECT @rowsUpdated = 0;
	SELECT @alertInserted = 0;
	SELECT @statusChanged = 0;
	
	-- [comment omitted]
	-- [comment omitted]
	WHILE (@rowsUpdated = 0)
	BEGIN
		-- [comment omitted]
		-- [comment omitted]
		IF (NOT EXISTS(SELECT TOP 1 1 FROM SHIPPING_CONTAINER SC WHERE INTERNAL_SHIPMENT_NUM = @iIntShipNum AND STATUS >= 700 AND CONTAINER_TYPE <> N'<literal:1>'
			AND NOT EXISTS (SELECT TOP 1 1 FROM SHIPPING_CONTAINER WHERE INTERNAL_SHIPMENT_NUM = @iIntShipNum AND PARENT = SC.INTERNAL_CONTAINER_NUM AND CONTAINER_TYPE=N'<literal:2>'))
		OR EXISTS(SELECT TOP 1 1 FROM SHIPPING_CONTAINER WHERE INTERNAL_SHIPMENT_NUM = @iIntShipNum AND INTERNAL_SHIPMENT_LINE_NUM IS NOT NULL))
		BEGIN		
		SELECT 	@minStatus = MIN(STATUS1),
			@maxStatus = MAX(dbo.SDBfn_GetLeadingStsInRange(
						 STATUS1,
						 STATUS2,
						 STATUS3,
						 STATUS4,
						 STATUS5,
						 STATUS6,
						 STATUS7,
						 STATUS8,
						 STATUS9,
						 STATUS10))
		FROM SHIPMENT_DETAIL WITH (NOLOCK) 
		WHERE INTERNAL_SHIPMENT_NUM = @iIntShipNum;
		END
		
		-- [comment omitted]
		SELECT  @minStatus = CASE WHEN (MIN(SC.STATUS) < @minStatus OR @minStatus IS NULL)
				THEN MIN(SC.STATUS)
				ELSE @minStatus
				END,
			    @maxStatus = CASE WHEN (MAX(SC.STATUS) > @maxStatus OR @maxStatus IS NULL)
			    THEN MAX(SC.STATUS)
				ELSE @maxStatus
				END
		FROM SHIPPING_CONTAINER  SC WITH(NOLOCK)
		WHERE SC.INTERNAL_SHIPMENT_NUM = @iIntShipNum
			AND SC.PARENT IS NULL;
			
		-- [comment omitted]
		SELECT @HdrTrailingSts = TRAILING_STS, 
			@HdrLeadingSts = LEADING_STS,@warehouse = WAREHOUSE
		FROM SHIPMENT_HEADER WITH (NOLOCK) 
		WHERE INTERNAL_SHIPMENT_NUM = @iIntShipNum;

		-- [comment omitted]
		SELECT @qtyAtImmediatePendingSts = (SELECT TOP 1 dbo.SDBfn_GetQtyAtSts(997,
						 STATUS1, STATUS2, STATUS3, STATUS4, STATUS5, STATUS6, STATUS7, STATUS8, STATUS9, STATUS10,
						 QUANTITY_AT_STS1, QUANTITY_AT_STS2, QUANTITY_AT_STS3, QUANTITY_AT_STS4, QUANTITY_AT_STS5, QUANTITY_AT_STS6, QUANTITY_AT_STS7, QUANTITY_AT_STS8, QUANTITY_AT_STS9, QUANTITY_AT_STS10) AS QAI
		FROM SHIPMENT_DETAIL WITH (NOLOCK) 
		WHERE INTERNAL_SHIPMENT_NUM = @iIntShipNum ORDER BY QAI DESC);

		 -- [comment omitted]
		 IF (@qtyAtImmediatePendingSts > 0.0)
		   BEGIN		     
			-- [comment omitted]
		    SELECT @minStatus = dbo.STSfn_RtrvStsForAction(N'<literal:3>', N'<literal:4>'); 

			-- [comment omitted]
			IF (@minStatus > @maxStatus )
			 BEGIN
			   SELECT @minStatus = @maxStatus;
			 END
		   END
		
		-- [comment omitted]
		-- [comment omitted]
		IF(@maxStatus <= 0 OR 
				@maxStatus IS NULL OR -- [comment omitted]
				@minStatus <=0 OR 
				@minStatus IS NULL OR -- [comment omitted]
				@minStatus >= 994)
		BEGIN
			-- [comment omitted]
			-- [comment omitted]
			IF (@HdrLeadingSts >= 300 OR @minStatus = 997)			
				SELECT @defaultStatus = dbo.STSfn_RtrvStsForAction(N'<literal:5>', N'<literal:6>');
			ELSE
				SELECT @defaultStatus = dbo.STSfn_RtrvStsForAction(N'<literal:7>', N'<literal:8>');
			
			
			IF(@maxStatus <= 0 OR @maxStatus IS NULL)
			BEGIN
				SET @maxStatus = @defaultStatus;
			END
			IF(@minStatus <=0 OR @minStatus IS NULL OR @minStatus >= 994)
			BEGIN
				SET @minStatus = @defaultStatus;
			END
		
		END
			
		-- [comment omitted]
		-- [comment omitted]
		IF( (@HdrTrailingSts <> ISNULL(@minStatus,@HdrTrailingSts)) 
			OR 
			(@HdrLeadingSts <> ISNULL(@maxStatus,@HdrLeadingSts)) )
		BEGIN 
			SET @statusChanged = 1;
		END
		
		-- [comment omitted]
		IF(@statusChanged = 1 )
		BEGIN
			-- [comment omitted]
			IF (@alertInserted = 0)
			BEGIN
				-- [comment omitted]
				-- [comment omitted]
				INSERT INTO WAREHOUSE_ALERT_REQUEST (ALERT_TYPE, INTERNAL_ALERT_NUM, INTERNAL_SOURCE_NUM, WAREHOUSE, PROCESSED, ACTIVITY_DATE_TIME, USER_STAMP, PROCESS_STAMP, DATE_TIME_STAMP, PRIORITY, MESSAGE, IDENTIFIER1)
				SELECT ALERT.ALERT_TYPE,
					   ALERT.INTERNAL_ALERT_NUM,
					   SHIP.INTERNAL_SHIPMENT_NUM, 
					   SHIP.WAREHOUSE,
					   N'<literal:9>',
					   GETUTCDATE(),
					   N'<literal:10>',
					   N'<literal:11>',
					   GETUTCDATE(),
					   ALERT.PRIORITY,
					   ALERT.MESSAGE,
					   @minStatus
				 FROM SHIPMENT_HEADER SHIP WITH (NOLOCK) ,
					 WAREHOUSE_ALERT ALERT WITH (NOLOCK) 
			
				 WHERE ALERT.ALERT_TYPE = N'<literal:12>'
				   AND (SHIP.TRAILING_STS IS NULL OR SHIP.TRAILING_STS < @minStatus)
				   AND SHIP.INTERNAL_SHIPMENT_NUM = @iIntShipNum
				   AND ALERT.ACTIVE = N'<literal:13>'
				   AND NOT EXISTS (SELECT REQUEST.INTERNAL_ALERT_REQ_NUM
									 FROM WAREHOUSE_ALERT_REQUEST REQUEST WITH (NOLOCK) 
									WHERE REQUEST.INTERNAL_ALERT_NUM = ALERT.INTERNAL_ALERT_NUM
									  AND REQUEST.INTERNAL_SOURCE_NUM = SHIP.INTERNAL_SHIPMENT_NUM
									  AND REQUEST.IDENTIFIER1 = @minStatus);
				
				SELECT @iError = @@ERROR, 
						@rowCount = @@ROWCOUNT, 
						@internalAlertReqNum = SCOPE_IDENTITY();
				IF (@rowCount <> 0) SELECT @alertInserted = 1;
				IF (@iError <> 0) RETURN -1;
					
			END
			ELSE
			BEGIN
				UPDATE WAREHOUSE_ALERT_REQUEST
				SET IDENTIFIER1 = @minStatus
				WHERE INTERNAL_ALERT_REQ_NUM = @internalAlertReqNum;
			END
			-- [comment omitted]
		
			-- [comment omitted]
			UPDATE SHIPMENT_HEADER
				   -- [comment omitted]
			   SET TRAILING_STS = @minStatus,						
				   TRAILING_STS_DATE = dbo.DHfn_GETDATENoTime(dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())),
				   TRAILING_STS_FAILED = N'<literal:14>',
				   -- [comment omitted]
				   -- [comment omitted]
				   LEADING_STS = @maxStatus,
				   LEADING_STS_DATE = dbo.DHfn_GETDATENoTime(dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())),
				   LEADING_STS_FAILED = N'<literal:15>',
				   PROCESS_STAMP = N'<literal:16>',
				   USER_STAMP = N'<literal:17>',
				   DATE_TIME_STAMP = GETUTCDATE()
			 WHERE INTERNAL_SHIPMENT_NUM = @iIntShipNum
			 AND TRAILING_STS = @HdrTrailingSts
			 AND LEADING_STS = @HdrLeadingSts;	
			
			SELECT @iError = @@ERROR, @rowCount = @@ROWCOUNT;
			IF(@iError <> 0) RETURN -1;
			IF (@rowCount <> 0) SELECT @rowsUpdated = 1;
		END -- [comment omitted]
		ELSE
		BEGIN
			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
			SELECT @rowsUpdated = 1; 
		END 	-- [comment omitted]
	END -- [comment omitted]

	-- [comment omitted]
	IF(@statusChanged = 1 )
	BEGIN
		SELECT @iLoadNum = SHIPPING_LOAD_NUM
		FROM SHIPMENT_HEADER WITH (NOLOCK) 
		WHERE INTERNAL_SHIPMENT_NUM = @iIntShipNum;
		 
		IF (@iLoadNum > 0)
		BEGIN
			EXEC @iError = STH_UpdateLoad @iLoadNum;
			IF (@@ERROR <> 0) RETURN -1; 
			IF (@iError <> 0) RETURN @iError;
		END -- [comment omitted]
	END -- [comment omitted]
-- [comment omitted]
