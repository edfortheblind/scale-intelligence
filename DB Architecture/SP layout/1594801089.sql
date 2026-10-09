
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	4972		| SP 			| 08/20/07	| Created.
	11746		| DSK			| 10/08/07	| Removed Pack & Hold Subclass
	12978		| RAB			| 11/04/07	| Modified to use "resulting" status

	Updates the associated data for which the specified Dock Management 
	WorkInstruction is being confirmed.  
	
	Parameters
		int		iIntInstrNum	the internalInstructionNum to use. 
		double	dConfQty		the quantity confirmed.
		int		iMode			Constants.iFROM to symbolize a pick, 
								Constants.iTO for putaway,
								Constants.iFROMTO for both.
*/		
CREATE PROCEDURE WTH_UpdateStatusDockMgmt(
	@iIntInstrNum numeric(9),
	@dConfQty numeric(19,5),
	@iMode numeric(1))
AS
	SET NOCOUNT ON

	-- local variables
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

	-- if mode is Constants.iTO or Constants.iFROMTO
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

		-- do not update the status of the Container if the current status is Load Confirm Pending or greater.
		IF (@iFromSts >= 800)
			return 0;
		
		--only process a new status on change of location subclass.
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

				RAISERROR(N'Could not find Dock Mgmt Flow Detail for Warehouse:%s, Status Flow:%s, Location Sub Class:%s', 
					18, 
					1, 
					@toWhs, 
					@customStsFlow, 
					@toLocSubclassDesc);
				return -1;
			END;
			
			--if there is a status change update the container and the Shipment Hdr, Dtl and load
			IF (@iFromSts <> @iToSts)
			BEGIN
				exec @iError = SCB_SetStatus @iIntContNum, @iToSts;
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

				--this will update the header and load as well.
				exec @iError = SDB_MoveQtyToSts @iIntShipLineNum, @dConfQty, @iFromSts, @iToSts;
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
			END;
		END;
	END;
-- end WTH_UpdateStatusDockMgmt


