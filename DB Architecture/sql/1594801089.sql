-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */















		
CREATE PROCEDURE WTH_UpdateStatusDockMgmt(
	@iIntInstrNum numeric(9),
	@dConfQty numeric(19,5),
	@iMode numeric(1))
AS
	SET NOCOUNT ON

	-- [comment omitted]
	declare @iError int;
	declare @iIntShipLineNum numeric(9);
	declare @iIntContNum numeric(9);
	declare @iFromSts numeric(3);
	declare @iToSts numeric(3);
	declare @toWhs nvarchar(25);
	declare @customStsFlow nvarchar(25);
	declare @fromLocationSubclass numeric(9);
	declare @toLocationSubclass numeric(9);
	declare @toLocSubclassDesc nvarchar(500);	
	declare @stagingSubclass numeric(9);

	-- [comment omitted]
	IF (@iMode = 1 OR @iMode = 2)
	BEGIN
		SELECT 
			@fromLocationSubclass = FROMLOC.LOCATION_SUBCLASS,
			@toLocationSubclass = TOLOC.LOCATION_SUBCLASS,
			@toWhs = WI.TO_WHS,
			@customStsFlow = CASE 
								WHEN SC.STATUS_FLOW_NAME IS NOT NULL 
								THEN SC.STATUS_FLOW_NAME
								ELSE SD.STATUS_FLOW_NAME
							 END,
			@iFromSts = SC.STATUS,
			@iIntContNum = WI.INTERNAL_CONTAINER_NUM,
			@iIntShipLineNum = WI.INTERNAL_LINE_NUM
		FROM 
			WORK_INSTRUCTION WI,
			SHIPPING_CONTAINER SC,
			SHIPMENT_DETAIL SD,
			LOCATION FROMLOC,
			LOCATION TOLOC
		WHERE WI.INTERNAL_INSTRUCTION_NUM = @iIntInstrNum
			AND WI.INTERNAL_CONTAINER_NUM = SC.INTERNAL_CONTAINER_NUM
			AND WI.INTERNAL_LINE_NUM = SD.INTERNAL_SHIPMENT_LINE_NUM
			AND WI.FROM_LOC = FROMLOC.LOCATION
			AND WI.FROM_WHS = FROMLOC.WAREHOUSE
			AND WI.TO_LOC = TOLOC.LOCATION
			AND WI.TO_WHS = TOLOC.WAREHOUSE;

		-- [comment omitted]
		IF (@iFromSts >= 800)
			return 0;
		
		-- [comment omitted]
		IF (@fromLocationSubclass <> @toLocationSubclass)
		BEGIN
			SELECT TOP 1
				@iToSts = DETAIL.STATUS
			FROM 
				DOCK_MGMT_FLOW_DETAIL DETAIL,
				DOCK_MGMT_FLOW_HEADER HEADER 				
			WHERE
				DOCK_SUBCLASS = @toLocationSubclass
				AND DETAIL.HEADER_ID = HEADER.OBJECT_ID
				AND HEADER.WAREHOUSE = @toWhs
				AND ((HEADER.CUSTOM_STATUS_FLOW IS NOT NULL AND HEADER.CUSTOM_STATUS_FLOW = @customStsFlow)
					OR (HEADER.CUSTOM_STATUS_FLOW IS NULL AND @customStsFlow IS NULL))
			ORDER BY STATUS DESC;

			IF (@iToSts IS NULL)
			BEGIN
				SELECT @toLocSubclassDesc = DESCRIPTION 
				FROM GENERIC_CONFIG_DETAIL 
				WHERE OBJECT_ID = @toLocationSubclass;

				RAISERROR(N'<literal:1>', 
					18, 
					1, 
					@toWhs, 
					@customStsFlow, 
					@toLocSubclassDesc);
				return -1;
			END;
			
			-- [comment omitted]
			IF (@iFromSts <> @iToSts)
			BEGIN
				exec @iError = SCB_SetStatus @iIntContNum, @iToSts;
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

				-- [comment omitted]
				exec @iError = SDB_MoveQtyToSts @iIntShipLineNum, @dConfQty, @iFromSts, @iToSts;
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
			END;
		END;
	END;
-- [comment omitted]


