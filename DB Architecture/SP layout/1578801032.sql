
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	9390		| RAB			| 07/27/02	| Added allowed for Picks & Puts and for short and partial picks.
	9593		| RAB			| 10/09/02	| Modified for standards.
	9980		| RAB			| 11/11/02	| Do not update status of ShipmentDetails whose status1 >= Packing Pending.
	11230		| RLE			| 04/30/03	| Always move status to status after "Packing Pending" when picking into container.
	13890		| LJM			| 02/12/04	| use correct constant for shipping work
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	14033		| LJM			| 04/15/04	| only update container if instruction totally picked
	14440		| LJM			| 04/23/04	| fix container statuses
	20063		| PP			| 11/15/06	| Stopped increasing the OnHandQty of the work order detail beyond the total quantity needed.
	765			| DSK			| 03/26/07	| Consider the container custom status flow to set the to status
	8952		| AK			| 08/24/07	| Fixed container status not getting updated when short picked the pick into shipping container
	4972		| SP			| 08/25/07	| Enhanced to handle Dock Management work
	20981		| BB			| 03/05/08	| Custom Status added to receiving after InPutaway
	34576       | AC		    | 09/08/08  | Merged putaway to shipping container changes.
	41456		| DSK			| 11/21/08	| Update the On_Hand_qty with existing quantity for Work order work
	45026		| DN			| 01/19/09	| Update On_Hand_Qty with confirmed quantity for work order work
	48033		| PP			| 03/06/09	| Added Internal_Num_Type in where clause while finding out open work instructions for receipt container.
	
	Updates the associated data for which the specified WorkInstruction
	is being confirmed.  
	
	Parameters
		int		iIntInstrNum	the internalInstructionNum to use. 
		double	dConfQty		the quantity confirmed.
		String	stInstrType		The type of work we are processing.							
		int		iMode			0 to symbolize a pick, 
								1 for putaway,
								2 for both.
		int		iConfType		0 for full confirmation,
								1 for short pick,
								2 for partial pick.
*/		
CREATE PROCEDURE WTH_UpdateStatus(
	@iIntInstrNum numeric(9),
	@dConfQty numeric(19,5),
	@stInstrType nvarchar(25),
	@iMode numeric(1), 
	@iConfType numeric(1))
AS
	SET NOCOUNT ON

	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;
	
	-- local variables
	declare @dFromQty numeric(19,5);
	declare @dOnHandQty numeric(19,5);
	declare @dToQty numeric(19,5);
	declare @iClosedSts numeric(3);
	declare @iStatusAfterInPutaway numeric(3);
	declare @iError int;
	declare @workInstructionCount int;
	declare @iFromSts numeric(3);
	declare @iInPacking numeric(3);
	declare @iInPutawaySts numeric(3);
	declare @iIntContNum numeric(9);
	declare @iIntLineNum numeric(9);
	declare @iIntNum numeric(9);
	declare @iOneAftPickPendSts numeric(3);
	declare @iPackPendSts numeric(3);
	declare @iPickingPendingSts numeric(3);
	declare @iStatus1 numeric(3);
	declare @iToSts numeric(3);
	declare @iTwoAftPickPendSts numeric(3);
	declare @stStatusFlowName nvarchar(25);
	declare @containerStatusFlow nvarchar(25);
	
	-- process Shipment work.  Note that nothing should be done if 
	-- confirming a quantity of 0.0.
	if (@stInstrType = N'Shipment'
		AND @dConfQty > 0.0)
	begin
		SELECT @dFromQty = WI.FROM_QTY,
			   @iIntLineNum = WI.INTERNAL_LINE_NUM,
			   @iIntContNum = WI.INTERNAL_CONTAINER_NUM,
			   @stStatusFlowName = SD.STATUS_FLOW_NAME,	   
			   @iStatus1 = SD.STATUS1
		  FROM WORK_INSTRUCTION WI LEFT OUTER JOIN SHIPMENT_DETAIL SD
			ON WI.INTERNAL_LINE_NUM = SD.INTERNAL_SHIPMENT_LINE_NUM
		 WHERE WI.INTERNAL_INSTRUCTION_NUM = @iIntInstrNum;

		-- do not update the status of the Shipment if the details 
		-- trailing status is Packing Pending or greater.
		set @iPackPendSts =  dbo.STSfn_RtrvSts(N'Outbound', N'140')

		if (@iStatus1 >= @iPackPendSts)
			return 0;

		-- retrieve the Picking Pending statuses.
		set @iPickingPendingSts = dbo.STSfn_RtrvSts
					(N'Outbound', N'150');
		
		-- Start the logic to get the custom status flow 
		-- from Container/ Detail
		IF (@iIntContNum >0) -- If container exists
		BEGIN
			-- Get the flow name for the container if specified
			SELECT @containerStatusFlow = STATUS_FLOW_NAME
			FROM SHIPPING_CONTAINER SC
			WHERE SC.INTERNAL_CONTAINER_NUM = @iIntContNum;

			-- If the container does not have the flow set,set the container flow from the detail.
			-- In case multiple items are tied to the same container and they have different status 
			-- flow specified, then select the TOP 1 
			IF (@containerStatusFlow IS NULL)
			BEGIN
				SELECT  @containerStatusFlow = (SELECT TOP 1 SD.STATUS_FLOW_NAME
				FROM SHIPMENT_DETAIL SD
					WHERE SD.INTERNAL_SHIPMENT_LINE_NUM IN (
						SELECT SC.INTERNAL_SHIPMENT_LINE_NUM
						FROM WORK_INSTRUCTION WI 
							LEFT OUTER JOIN SHIPPING_CONTAINER SC
								ON(WI.INTERNAL_CONTAINER_NUM = SC.INTERNAL_CONTAINER_NUM
									AND WI.INTERNAL_INSTRUCTION_NUM  = @iIntInstrNum)));
			END

		IF (@containerStatusFlow IS NOT NULL)
			SELECT @stStatusFlowName = @containerStatusFlow;
					
		END

		-- retrieve the status after Picking Pending.
		set @iOneAftPickPendSts = dbo.STSfn_RtrvAdjacentSts(N'Outbound', 
											  @stStatusFlowName,
											  @iPickingPendingSts, 
											  1);
		-- retrieve the status two after Picking Pending if performing
		-- some sort of putaway
		if (@iMode <> 0)
		begin
			set @iInPacking = dbo.STSfn_RtrvAdjacentSts(N'Outbound', 
												  @stStatusFlowName, 
												  @iPackPendSts, 
												  1);
			
			set @iTwoAftPickPendSts = dbo.STSfn_RtrvAdjacentSts(N'Outbound', 
												  @stStatusFlowName, 
												  @iOneAftPickPendSts, 
												  1);
		end; -- end if puting.
		
		-- set the from and to statuses based on mode.
		if (@iMode = 0)
		begin
			set @iFromSts = @iPickingPendingSts;
			set @iToSts = @iOneAftPickPendSts;
		end; -- end if picking
		else if (@iMode = 1)
		begin
			set @iFromSts = @iOneAftPickPendSts;

			if(@iIntContNum > 0)
			begin
				set @iToSts = @iInPacking;
			end;
			else
			begin
				set @iToSts = @iTwoAftPickPendSts; 
			end;
		end; -- end if putaway
		else
		begin
			set @iFromSts = @iPickingPendingSts;

			if(@iIntContNum > 0)
			begin
				set @iToSts = @iInPacking;
			end;
			else
			begin
				set @iToSts = @iTwoAftPickPendSts; 
			end;
		end; -- end if pick & put

		-- if a statusFlow was found for this shipmentDetail, clear
		-- both cached after statuses, as they may not apply to the
		-- next detail.
		if (@stStatusFlowName is not null)
		begin
			set @iOneAftPickPendSts = null;
		end; -- end if statusFlow defined.

		-- if not performing a partial pick and a ShippingContainer 
		-- is specified on the WorkInstruction and the instruction
		-- is totally picked, update its status.
		if (@iConfType <> 2
			and @iIntContNum > 0
			and ((@iMode = 1 and @dFromQty = 0) or (@iMode <> 1)))
		begin
			
			exec @iError = SCB_SetStatus @iIntContNum, @iToSts;

			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		end -- end if ShippingContainer exists.

		-- update the ShippingTree starting at the ShipmentDetail.
		exec @iError = SDB_MoveQtyToSts @iIntLineNum, 
										@dConfQty, 
										@iFromSts, 
										@iToSts;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		
	end; -- end if Shipment work
	
	-- process Receiving work.
	else if (@stInstrType = N'Receipt')
	begin
		SELECT @iIntContNum = WI.INTERNAL_NUM,
			   @dFromQty = WI.FROM_QTY,
			   @dToQty = WI.TO_QTY,
			   @stStatusFlowName = RD.STATUS_FLOW_NAME
			FROM WORK_INSTRUCTION WI LEFT OUTER JOIN RECEIPT_DETAIL RD
			ON WI.INTERNAL_LINE_NUM = RD.INTERNAL_RECEIPT_LINE_NUM
			WHERE WI.INTERNAL_INSTRUCTION_NUM = @iIntInstrNum;
		
		--Select open Work Instruction for the Receipt Container other than the internal instruction number
		--which we are currently dealing. Helps out to finding out open work instruction for receipt container 
		--when we execute partial putaway.	
		set @workInstructionCount =  (SELECT COUNT(*) FROM WORK_INSTRUCTION WI
									WHERE
									WI.INTERNAL_INSTRUCTION_NUM <> @iIntInstrNum
									AND
									WI.INTERNAL_NUM = @iIntContNum
									AND
									WI.INSTRUCTION_TYPE = N'Detail'
									AND
									WI.INTERNAL_NUM_TYPE = N'Receipt'
									AND
									WI.CONDITION <> N'Closed');

		-- if picking, place the container In Putaway unless
		-- we are performing a short pick of 0.
		if (@iMode = 0
		    and (@iConfType <> 1 or @dConfQty > 0.0))
		begin
			set @iInPutawaySts = dbo.STSfn_RtrvSts(N'Inbound', 
												   N'30');
			exec @iError = RCB_SetStatus @iIntContNum, @iInPutawaySts;
			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		end; -- end if picking
		
		-- close the container if we are pick & puting the remaining 
		-- fromQty with no remaining toQty, or short picking
		-- with no remaining toQty, or puting with no fromQty.
		else if (((@iMode = 2 and @dFromQty = @dConfQty and @dToQty = 0.0)
				 or (@iConfType = 1 and @dToQty = 0.0)
				 or (@iMode = 1 and @dFromQty = 0.0)) and @workInstructionCount = 0)
		begin
				set @iStatusAfterInPutaway = dbo.STSfn_RtrvAdjacentSts(N'Inbound',
																	@stStatusFlowName,
																	301,
																	1);
				exec @iError = RCB_SetStatus @iIntContNum, @iStatusAfterInPutaway;

			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		end; -- end if closing container.
	end; -- end if Receiving work.
	
	-- process WorkOrder work.
	else if (@stInstrType = N'Work Order')
	begin
		-- WorkOrder records are only updated on putaway.
		if (@iMode = 1
			or @iMode = 2)
		begin
			-- retrieve information off of the WorkInstruction
			if (@iMode = 1)
			begin
				SELECT @iIntLineNum = INTERNAL_LINE_NUM,
					   @iIntNum = INTERNAL_NUM,
					   @dOnHandQty = CONVERTED_QTY / QUANTITY * (QUANTITY - FROM_QTY)
				  FROM WORK_INSTRUCTION
				 WHERE INTERNAL_INSTRUCTION_NUM = @iIntInstrNum;
			end; -- end if putaway
			
			-- note that on a pick and put, we cannot simply use 
			-- FROM_QTY because it has not been updated yet.
			else -- iFROMTO
			begin
				SELECT @iIntLineNum = INTERNAL_LINE_NUM,
					   @iIntNum = INTERNAL_NUM,
					   @dOnHandQty = CONVERTED_QTY / QUANTITY * 
									 (QUANTITY - (FROM_QTY - @dConfQty))
				  FROM WORK_INSTRUCTION
				 WHERE INTERNAL_INSTRUCTION_NUM = @iIntInstrNum;
			end; -- end if pick & put.
					
			-- update the WorkOrderDetails onHandQty.
			-- In case of partial pick, we would need to add to the existing quantity
			UPDATE WORK_ORDER_DETAIL
			   SET ON_HAND_QTY = (CASE
				   WHEN @dOnHandQty > TOTAL_CONVERTED_QTY_NEEDED
				   THEN TOTAL_CONVERTED_QTY_NEEDED
				   ELSE ON_HAND_QTY + @dConfQty END),
				   PROCESS_STAMP = N'WTH_UpdateStatus',
				   DATE_TIME_STAMP = GETUTCDATE()
			 WHERE INTERNAL_WRK_ORD_LINE_NUM = @iIntLineNum;
			if (@@ERROR <> 0) return -1;
			 
		    -- update the WorkOrderHeaders qtyAvailToBuild
		    exec WOHB_UpdateQtyAvailToBuild @iIntNum;
			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		end;	-- end if put or pick & put.
	end; -- end if WorkOrder work.
	
	-- process Dock Management work.
	ELSE IF (@stInstrType = N'Dock Management')
	BEGIN
		exec @iError = WTH_UpdateStatusDockMgmt @iIntInstrNum, @dConfQty, @iMode;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	END;
-- end WTH_UpdateStatus



