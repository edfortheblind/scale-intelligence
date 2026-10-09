/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	9593		| RAB			| 10/09/02	| Modified for standards.
	11868		| TBS			| 10/06/03	| Added "N" prefix to string literals (removed by
			|			|		| precompiler if single-byte database).
	16044		| SMF			| 01/13/04	| added status variables
	17039		| VK			| 06/13/05	| Added "WITH (NOLOCK)" only for SQL Server.
	5133		| DSK			| 06/05/07	| Modified the logic to update the status only when needed
	8215		| MDL			| 07/26/07	| Append underscore in oracle parameter
	224225		| SO			| 05/17/18	| Modified To updated trailing/leading status date with warehouse date.
	
	Updates the statuses of the ShippingLoad based on the 
	trailing and leading statuses of the ShipmentHeaders.
	
	Parameters
		int		iLoadNum	ShippingLoad to update.
*/

CREATE PROCEDURE STH_UpdateLoad(
	@iLoadNum numeric(9))
AS
	SET NOCOUNT ON;
	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;
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
		-- Get max and min values of shipment headers leading/trailing status
		SELECT 	@MinHeaderStatus = MIN(TRAILING_STS),
			@MaxHeaderStatus = MAX(LEADING_STS)
		FROM SHIPMENT_HEADER WITH (NOLOCK)
		WHERE SHIPPING_LOAD_NUM = @iLoadNum;
	
		-- Get the current Min/ Max load status
		SELECT @MinLoadStatus = TRAILING_STS, 
			@MaxLoadStatus = LEADING_STS,@warehouse = WAREHOUSE
		FROM SHIPPING_LOAD WITH (NOLOCK)
		WHERE INTERNAL_LOAD_NUM = @iLoadNum;
	
		-- If the shipping load does not have any shipments associated
		-- then the status should be updated to the default status
		IF(@MinHeaderStatus IS NULL OR @MaxHeaderStatus IS NULL OR 
			@MinHeaderStatus <=0 OR @MinHeaderStatus <=0)
		BEGIN
			SELECT @defaultLoadStatus = dbo.STSfn_RtrvStsForAction(N'Outbound', N'30');
			
			IF(@MinHeaderStatus IS NULL OR @MinHeaderStatus <=0)
				SELECT @MinHeaderStatus = @defaultLoadStatus;
				
			IF(@MaxHeaderStatus IS NULL OR @MinHeaderStatus <=0)
				SELECT @MaxHeaderStatus = @defaultLoadStatus;
			
		END
		
		-- SET the status changed flag if the shipment and load status are different
		IF(	(@MinLoadStatus <> @MinHeaderStatus)
			OR 
			(@MaxLoadStatus <> @MaxHeaderStatus))
		BEGIN
			SET @StatusChanged = 1;
		END
		
		--Update the load only if the status is changed
		IF(@StatusChanged = 1)
		BEGIN
			UPDATE SHIPPING_LOAD 
			   SET TRAILING_STS = @MinHeaderStatus,
				   TRAILING_STS_DATE = dbo.DHfn_GetDateNoTime(dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())),
				   TRAILING_STS_FAILED = N'N',
				   LEADING_STS = @MaxHeaderStatus,
				   LEADING_STS_DATE = dbo.DHfn_GetDateNoTime(dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())),
				   LEADING_STS_FAILED = N'N',
				   PROCESS_STAMP = N'STH_UpdateLoad',
				   USER_STAMP = N'System',
				   DATE_TIME_STAMP = GETUTCDATE()
			 WHERE INTERNAL_LOAD_NUM = @iLoadNum
			 AND TRAILING_STS = @MinLoadStatus
			 AND LEADING_STS = @MaxLoadStatus;
		
			SELECT @error = @@ERROR, @rowCount = @@ROWCOUNT;
			IF (@error <> 0) RETURN -1;
			IF (@rowCount <> 0) SELECT @rowsUpdated = 1;
		END --IF(@StatusChanged = 1)
		ELSE
		BEGIN
			-- RowUpdated flag has to be set to 1 
			-- when the header status need not be changed
			-- to come out of the while Loop
			SELECT @rowsUpdated = 1; 
		END 	-- End ELSE
	END -- END WHILE
	
-- END STH_UpdateLoad



