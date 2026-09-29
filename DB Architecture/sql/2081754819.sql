-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



















CREATE PROCEDURE STH_UpdateLoad(
	@iLoadNum numeric(9))
AS
	SET NOCOUNT ON;
	-- [comment omitted]
	DECLARE @error INT;
	DECLARE @MinHeaderStatus numeric(3);
	DECLARE @MaxHeaderStatus numeric(3);
	DECLARE @MinLoadStatus numeric(3);
	DECLARE @MaxLoadStatus numeric(3);
	DECLARE @defaultLoadStatus numeric(3);
	DECLARE @rowCount INT;
	DECLARE @rowsUpdated INT;
	DECLARE @StatusChanged INT;
	DECLARE @warehouse nvarchar(25);
	
	SELECT @rowsUpdated = 0;
	SELECT @StatusChanged = 0;
	
	WHILE (@rowsUpdated = 0)
	BEGIN
		-- [comment omitted]
		SELECT 	@MinHeaderStatus = MIN(TRAILING_STS),
			@MaxHeaderStatus = MAX(LEADING_STS)
		FROM SHIPMENT_HEADER WITH (NOLOCK)
		WHERE SHIPPING_LOAD_NUM = @iLoadNum;
	
		-- [comment omitted]
		SELECT @MinLoadStatus = TRAILING_STS, 
			@MaxLoadStatus = LEADING_STS,@warehouse = WAREHOUSE
		FROM SHIPPING_LOAD WITH (NOLOCK)
		WHERE INTERNAL_LOAD_NUM = @iLoadNum;
	
		-- [comment omitted]
		-- [comment omitted]
		IF(@MinHeaderStatus IS NULL OR @MaxHeaderStatus IS NULL OR 
			@MinHeaderStatus <=0 OR @MinHeaderStatus <=0)
		BEGIN
			SELECT @defaultLoadStatus = dbo.STSfn_RtrvStsForAction(N'<literal:1>', N'<literal:2>');
			
			IF(@MinHeaderStatus IS NULL OR @MinHeaderStatus <=0)
				SELECT @MinHeaderStatus = @defaultLoadStatus;
				
			IF(@MaxHeaderStatus IS NULL OR @MinHeaderStatus <=0)
				SELECT @MaxHeaderStatus = @defaultLoadStatus;
			
		END
		
		-- [comment omitted]
		IF(	(@MinLoadStatus <> @MinHeaderStatus)
			OR 
			(@MaxLoadStatus <> @MaxHeaderStatus))
		BEGIN
			SET @StatusChanged = 1;
		END
		
		-- [comment omitted]
		IF(@StatusChanged = 1)
		BEGIN
			UPDATE SHIPPING_LOAD 
			   SET TRAILING_STS = @MinHeaderStatus,
				   TRAILING_STS_DATE = dbo.DHfn_GetDateNoTime(dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())),
				   TRAILING_STS_FAILED = N'<literal:3>',
				   LEADING_STS = @MaxHeaderStatus,
				   LEADING_STS_DATE = dbo.DHfn_GetDateNoTime(dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())),
				   LEADING_STS_FAILED = N'<literal:4>',
				   PROCESS_STAMP = N'<literal:5>',
				   USER_STAMP = N'<literal:6>',
				   DATE_TIME_STAMP = GETUTCDATE()
			 WHERE INTERNAL_LOAD_NUM = @iLoadNum
			 AND TRAILING_STS = @MinLoadStatus
			 AND LEADING_STS = @MaxLoadStatus;
		
			SELECT @error = @@ERROR, @rowCount = @@ROWCOUNT;
			IF (@error <> 0) RETURN -1;
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



