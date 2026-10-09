CREATE PROCEDURE CancelWave_DeallocationOfRepReq(
@internalRepReqNum numeric(9),
@userStamp nvarchar(30))
AS
BEGIN
	
	SET NOCOUNT ON;

	BEGIN TRANSACTION;

	declare @error int;
	set @error=-1;

	declare @internalLocInvNum numeric(9)=0;
	declare @beforeOnHandQty numeric(19,5);
	declare @beforeAllocatedQty numeric(19,5);
	declare @beforeInTransitQty numeric(19,5);
	declare @beforeSuspenseQty numeric(19,5);
	declare @replenishedQuantity numeric(19,5);

	--delete the work for the replenishment request.
	Delete From WORK_INSTRUCTION Where INTERNAL_NUM=@internalRepReqNum and INTERNAL_NUM_TYPE=N'Replenishment';
		
	--this is to clear allocated quantity at the bulk location
	select top 1 @internalLocInvNum=Location_Inventory.INTERNAL_LOCATION_INV,
		@beforeOnHandQty = LOCATION_INVENTORY.ON_HAND_QTY,
		@beforeAllocatedQty = LOCATION_INVENTORY.ALLOCATED_QTY,
		@beforeInTransitQty = LOCATION_INVENTORY.IN_TRANSIT_QTY,
		@beforeSuspenseQty = LOCATION_INVENTORY.SUSPENSE_QTY,
		@replenishedQuantity = REPLENISHMENT_REQUEST.Allocated_Qty
	from     
		Location_Inventory inner join Replenishment_Request on 
		Replenishment_Request.From_Whs = Location_Inventory.Warehouse
		AND Replenishment_Request.FROM_LOC = Location_Inventory.Location
		AND Replenishment_Request.Item = Location_Inventory.Item
		AND ((Replenishment_Request.Lot is null
		AND Location_Inventory.Lot is null )  OR (Replenishment_Request.Lot = Location_Inventory.Lot ) ) 
		AND ((Replenishment_Request.Company is null
		AND Location_Inventory.Company is null )  OR (Replenishment_Request.Company = Location_Inventory.Company ) ) 
		AND ((REPLENISHMENT_REQUEST.FROM_LOGISTICS_UNIT IS NULL
		AND LOCATION_INVENTORY.LOGISTICS_UNIT IS NULL)  OR (REPLENISHMENT_REQUEST.FROM_LOGISTICS_UNIT = LOCATION_INVENTORY.LOGISTICS_UNIT) ) 
		AND ((REPLENISHMENT_REQUEST.FROM_LOC_INV_ATTRIBUTES_ID IS NULL
		AND LOCATION_INVENTORY.LOC_INV_ATTRIBUTES_ID IS NULL)  OR (REPLENISHMENT_REQUEST.FROM_LOC_INV_ATTRIBUTES_ID = LOCATION_INVENTORY.LOC_INV_ATTRIBUTES_ID) )     
	where 
		Replenishment_Request.INTERNAL_RPLN_REQ_NUM = @internalRepReqNum 
		AND Replenishment_Request.Work_Created <> N'I'; 	
					
	Update Location_Inventory Set 
		Location_Inventory.User_Stamp = @userStamp,
		Location_Inventory.Process_Stamp = N'LaunchCancel.cancelLaunch',
		Location_Inventory.ALLOCATED_QTY = (Location_Inventory.ALLOCATED_QTY - @replenishedQuantity)
	where 
		LOCATION_INVENTORY.INTERNAL_LOCATION_INV=@internalLocInvNum;

	if(@@ERROR <> 0 OR @@rowcount <=0)			 
	begin					
		ROLLBACK TRANSACTION;
		return @error;
	end
	
	if(@internalLocInvNum > 0)
	begin
		--write history for from loc(bulk loc) for replenishment deallocation.		
		exec @error=TranHist_RepDeallocation @internalLocInvNum,@userStamp,@replenishedQuantity,@beforeOnHandQty,
										@beforeAllocatedQty,@beforeInTransitQty,@beforeSuspenseQty,N'From';
		if(@error<>0)
		begin					
			ROLLBACK TRANSACTION;
			return @error;
		end				
	end
	else 		
		begin			
			ROLLBACK TRANSACTION;
			return @error;	
		end
		
	--this is to clear intransit quantity at the forward location.
	set @internalLocInvNum=0;
	
	Select top 1
	    @internalLocInvNum = Location_Inventory.INTERNAL_LOCATION_INV,
		@beforeOnHandQty = LOCATION_INVENTORY.ON_HAND_QTY,
		@beforeAllocatedQty = LOCATION_INVENTORY.ALLOCATED_QTY,
		@beforeInTransitQty = LOCATION_INVENTORY.IN_TRANSIT_QTY,
		@beforeSuspenseQty = LOCATION_INVENTORY.SUSPENSE_QTY,
		@replenishedQuantity = REPLENISHMENT_REQUEST.Allocated_Qty
	from     
		Location_Inventory inner join Replenishment_Request on 
		Replenishment_Request.From_Whs = Location_Inventory.Warehouse
		AND Replenishment_Request.TO_LOC = Location_Inventory.Location
		AND Replenishment_Request.Item = Location_Inventory.Item
		AND ((Replenishment_Request.Lot is null
		AND Location_Inventory.Lot is null )  OR (Replenishment_Request.Lot = Location_Inventory.Lot ) ) 
		AND ((Replenishment_Request.Company is null
		AND Location_Inventory.Company is null )  OR (Replenishment_Request.Company = Location_Inventory.Company ) ) 
		AND ((REPLENISHMENT_REQUEST.TO_LOGISTICS_UNIT IS NULL
		AND LOCATION_INVENTORY.LOGISTICS_UNIT IS NULL)  OR (REPLENISHMENT_REQUEST.TO_LOGISTICS_UNIT = LOCATION_INVENTORY.LOGISTICS_UNIT) ) 
		AND ((REPLENISHMENT_REQUEST.TO_LOC_INV_ATTRIBUTES_ID IS NULL
		AND LOCATION_INVENTORY.LOC_INV_ATTRIBUTES_ID IS NULL) OR (REPLENISHMENT_REQUEST.TO_LOC_INV_ATTRIBUTES_ID = LOCATION_INVENTORY.LOC_INV_ATTRIBUTES_ID) )     
	where 
		Replenishment_Request.INTERNAL_RPLN_REQ_NUM = @internalRepReqNum 
		AND Replenishment_Request.Work_Created <> N'I' 
		--determines whether replenished quantity used for allocating something else.
		--(either it could have been allocated for shipment(could be from the same wave or from the different wave) or for some kind of inventory transfer)
		--if allocated quantity is less than or equal to available quantity(after deducting the replenished quantity)
		--means it did not use the replenished quantity for allocation,so replenished quantity can be cleared.
		AND 
		(LOCATION_INVENTORY.ALLOCATED_QTY <= 
		LOCATION_INVENTORY.ON_HAND_QTY + LOCATION_INVENTORY.IN_TRANSIT_QTY - REPLENISHMENT_REQUEST.Allocated_Qty)
				
	Update
		Location_Inventory
	Set
		Location_Inventory.User_Stamp = @userStamp,
		Location_Inventory.Process_Stamp = N'LaunchCancel.cancelLaunch',
		Location_Inventory.IN_TRANSIT_QTY = (Location_Inventory.IN_TRANSIT_QTY - @replenishedQuantity)  
	where Location_Inventory.INTERNAL_LOCATION_INV=@internalLocInvNum 
			--making sure that inventory is not changed by another transaction
			AND Location_Inventory.ALLOCATED_QTY = @beforeAllocatedQty
			AND Location_Inventory.ON_HAND_QTY = @beforeOnHandQty
			AND LOCATION_INVENTORY.IN_TRANSIT_QTY = @beforeInTransitQty
			AND LOCATION_INVENTORY.SUSPENSE_QTY = @beforeSuspenseQty;
	
	if(@@ERROR <> 0 OR @@rowcount <=0)	
	begin
		ROLLBACK TRANSACTION;
		return @error;			
	end
	
	if(@internalLocInvNum > 0)
	begin
		--write history for to loc(forward loc) for replenishment deallocation.		
		exec @error=TranHist_RepDeallocation @internalLocInvNum,@userStamp,@replenishedQuantity,@beforeOnHandQty,
										@beforeAllocatedQty,@beforeInTransitQty,@beforeSuspenseQty,N'To';
		if(@error<>0)			
		begin				
			ROLLBACK TRANSACTION;
			return @error;	
		end							
	end
	else 	
		begin			
			ROLLBACK TRANSACTION;
			return @error;	
		end

	COMMIT TRANSACTION;

	set @error=0;
	return @error;
END