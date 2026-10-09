/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB		| 08/15/02	| Created.
	10251		| TBS		| 03/24/03	| Added setting Inventory Status to 
			|		|		| default inventory status when null.
	11870		| TBS		| 09/16/03	| Added Multi-Byte support.
	10684		| LJM		| 11/03/03	| Support lot-controlled permanent locations
	13993		| RAB		| 02/19/04	| Maintain Manufactured Date.
	14714		| MD		| 06/16/04	| Fixed non update of lot when location got empty
	16780		| SP		| 09/06/05	| Added Record_type in query
	19166		| KSP		| 06/05/06	| License Plate Tracking
    17321		| CH		| 15/01/08	| Interchanged the 2nd and the 3rd case while updating the Inventory Status
										  so that if any inventory status was passed as a parameter it will get updated.
	35216		| BB		| 11/17/08	| Parent LP override fixed.	
	66607		| DSK		| 03/12/10	| Added parameter @toLocInvAttributeId.
	Updates the LocationInventory record associated with the to side
	of the current adjustment.
	
	Parameters
		The internalLocationInv off of the to LocationInventory record.
		Initial quantity values used to enforce the optimistic lock.
		The new quantity values.
		Adjustment information.
		Information off of the from LocationInventory record.
		
	Output Parameters.
		The number of rows affected.
*/

	
	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;



CREATE PROCEDURE INV_UpdateToLocInv(
	@iIntLocInv numeric(9),
	@dInitAllocQty numeric(19,5),
	@dInitInTransQty numeric(19,5),
	@dInitOnHandQty numeric(19,5),
	@dInitSuspQty numeric(19,5),
	@dNewAllocQty numeric(19,5),
	@dNewInTransQty numeric(19,5),
	@dNewOnHandQty numeric(19,5),
	@dNewSuspQty numeric(19,5),
	@dOverrodeVolumePerItem numeric(28,5),
	@dOverrodeWeightPerItem numeric(28,5),
	@dtExpDate datetime,
	@dtManDate datetime,
	@stCompany nvarchar(25),
	@stInventorySts nvarchar(50),
	@stItem nvarchar(50),
	@stLoc nvarchar(25),
	@stLot nvarchar(25),
	@logisticsUnit nvarchar(50),
	@parentLogisticsUnit nvarchar(50),
	@stQuantityUm nvarchar(25),
	@stUserName nvarchar(30),
	@stWhs nvarchar(25),
	@dtFromAgingDate datetime,
	@dtFromExpDate datetime,
	@dtFromManDate datetime,
	@dtFromRecDate datetime,
	@stFromInvSts nvarchar(50),
	@userDef1 nvarchar(25),
	@userDef2 nvarchar(25),
	@userDef3 nvarchar(25),
	@userDef4 nvarchar(25),
	@userDef5 nvarchar(25),
	@userDef6 nvarchar(25),
	@userDef7 numeric(19,5),
	@userDef8 numeric(19,5),
	@toLocInvAttributeId numeric(9) =NULL,
	@iRowCount int output)
AS
	SET NOCOUNT ON;

	-- local variables
	declare @cEmpty nchar(1); -- SYSTEM_CREATED used to set char type
	declare @cOverride nchar(1); -- SYSTEM_CREATED used to set char type
	declare @dCostPerItem numeric(19,5);
	declare @dValuePerItem numeric(19,5);
	declare @dVolumePerItem numeric(28,5);
	declare @dWeightPerItem numeric(28,5);
	declare @iError int;
        declare @stDfltInvSts nvarchar(200);
        declare @fillUserDef nchar(1);

	-- set booleans
	if (@dNewAllocQty = 0.0
		AND @dNewInTransQty = 0.0
		AND @dNewOnHandQty = 0.0
		AND @dNewSuspQty = 0.0)
	begin
		set @cEmpty = N'Y';
		SELECT @stDfltInvSts = SYSTEM_VALUE
                  FROM SYSTEM_CONFIG_DETAIL
                 WHERE SYS_KEY = N'40' AND RECORD_TYPE = N'Inventory'
	end -- end if
	
	if (@dInitAllocQty = 0.0
	            and @dInitInTransQty = 0.0
	            and @dInitOnHandQty = 0.0
	            and @dInitSuspQty = 0.0)
	begin
	             set @fillUserDef = N'Y';
        end

	if (@dOverrodeVolumePerItem is not null
		OR @dOverrodeWeightPerItem is not null)
		set @cOverride = N'Y';

	-- if the initial onHandQty is 0.0 and we are adjusting
	-- the onHandQty, retrieve the valuePerItem fields so that
	-- we can update the total fields.  Note that volume and weight
	-- per item do not take into acount LocationUnitOfMeasure records.
	if (@dInitOnHandQty = 0.0 
		AND @dInitOnHandQty <> @dNewOnHandQty)
	begin
		SELECT @dCostPerItem = costPerItem,
			   @dValuePerItem = valuePerItem,
			   @dVolumePerItem = volumePerItem,
			   @dWeightPerItem = weightPerItem
		  FROM dbo.INVfn_RtrvItemInfo(@stItem, @stCompany, @stQuantityUm, 
									  @stLoc, @stWhs, @cOverride);
	end -- end if valuePerItem needs to be retrieved.

	UPDATE LOCATION_INVENTORY
	   SET ALLOCATED_QTY = @dNewAllocQty,
		   IN_TRANSIT_QTY = @dNewInTransQty,
		   ON_HAND_QTY = @dNewOnHandQty,
		   SUSPENSE_QTY = @dNewSuspQty,
                   LOT = CASE WHEN (@dNewAllocQty = 0.0 AND @dNewInTransQty = 0.0 AND @dNewOnHandQty = 0.0 AND @dNewSuspQty = 0.0) THEN NULL ELSE  @stLot END,
		   AGING_DATE =	
					 -- if becoming empty, reset the value.
				CASE WHEN @cEmpty is not null 
					 THEN null
					 -- if filled, maintain the value.
					 WHEN AGING_DATE is not null
					 THEN AGING_DATE
					 -- if blank and from value exists, use it.
					 WHEN @dtFromAgingDate is not null
					 THEN @dtFromAgingDate
					 -- otherwise, set to current datetime.
					 ELSE GETUTCDATE()
					 END,
		   RECEIVED_DATE = 
					 -- if becoming empty, reset the value.
				CASE WHEN @cEmpty is not null 
					 THEN null
					 -- if filled, maintain the value.
					 WHEN RECEIVED_DATE is not null
					 THEN RECEIVED_DATE
					 -- if blank and from value exists, use it.
					 WHEN @dtFromRecDate is not null
					 THEN @dtFromRecDate
					 -- otherwise, set to current datetime.
					 ELSE GETUTCDATE()
					 END,
		   MANUFACTURED_DATE = 
					 -- if becoming empty, reset the value.
				CASE WHEN @cEmpty is not null 
					 THEN null
					 -- if filled, maintain the value.
					 WHEN MANUFACTURED_DATE is not null
					 THEN MANUFACTURED_DATE
					 -- if blank and from value exists, use it.
					 WHEN @dtFromManDate is not null
					 THEN @dtFromManDate
					 -- otherwise, use the specified value.
					 ELSE @dtManDate
					 END,
		   EXPIRATION_DATE = 
					 -- if becoming empty, reset the value.
				CASE WHEN @cEmpty is not null 
					 THEN null
					 -- if filled, maintain the value.
					 WHEN EXPIRATION_DATE is not null
					 THEN EXPIRATION_DATE
					 -- if blank and not lot controlled, use the max time.
					 WHEN @stLot is null
					 THEN dbo.DHfn_TransToSQLDate(N'47121231000000')
					 -- if blank and from value exists, use it.
					 WHEN @dtFromExpDate is not null
					 THEN @dtFromExpDate
					 -- otherwise, use the specified value.
					 ELSE @dtExpDate
					 END,
		   QUANTITY_UM = 
					 -- if filled, maintain the value.
				CASE WHEN QUANTITY_UM is not null
					 THEN QUANTITY_UM
					 -- otherwise, use the specified value.
					 ELSE @stQuantityUm
					 END,
					 
		    LOGISTICS_UNIT = 
		   		CASE WHEN  @cEmpty is not null then null
		   		     WHEN LOGISTICS_UNIT IS NULL 
		   		          and @logisticsUnit is not null
		   		     THEN  @logisticsUnit
		   		     ELSE LOGISTICS_UNIT
		   		     END,
		   		     
		   PARENT_LOGISTICS_UNIT = 
		   		 CASE WHEN  @cEmpty is not null then null
					 WHEN ((PARENT_LOGISTICS_UNIT IS NULL 
					  and @parentLogisticsUnit is not null)
					  or PARENT_LOGISTICS_UNIT != @parentLogisticsUnit)
				     THEN  @parentLogisticsUnit
				     ELSE PARENT_LOGISTICS_UNIT
		   		     END,
		   INVENTORY_STS = 
					 -- if becoming empty, reset the value.
				CASE WHEN @cEmpty is not null 
					 THEN @stDfltInvSts
					 -- if blank and a value was passed in, use it.
					 WHEN @stInventorySts is not null
					 THEN @stInventorySts
					 -- if filled, maintain the value.
					 WHEN INVENTORY_STS is not null
					 THEN INVENTORY_STS
					 -- otherwise, use the from value.
					 ELSE @stFromInvSts
					 END,

		   -- the total fields need to be adjusted for the new onHandQty.
		   -- note that if the current onHandQty is 0.0, we cannot calculate
		   -- per-item values with the information off of the record alone.
		   -- per-item values should have been retrieved in an earlier 
		   -- stored proc call and will be used in that situation.
		   TOTAL_COST = 
				CASE WHEN @dInitOnHandQty > 0.0  
					 THEN TOTAL_COST / @dInitOnHandQty * @dNewOnHandQty
					 ELSE @dCostPerItem * @dNewOnHandQty 
					 END,
		   TOTAL_VALUE = 
				CASE WHEN @dInitOnHandQty > 0.0  
					 THEN TOTAL_VALUE / @dInitOnHandQty * @dNewOnHandQty 
					 ELSE @dValuePerItem * @dNewOnHandQty 
					 END,
					 
		   -- totalVolume and Weight may be overridden.
		   TOTAL_VOLUME = 
				CASE WHEN @cOverride is not null
					 THEN TOTAL_VOLUME + ((@dNewOnHandQty - ON_HAND_QTY)
										  * @dOverrodeVolumePerItem)
					 WHEN @dInitOnHandQty > 0.0
					 THEN TOTAL_VOLUME / @dInitOnHandQty * @dNewOnHandQty 
					 ELSE @dVolumePerItem * @dNewOnHandQty 
					 END,
		   TOTAL_WEIGHT = 
				CASE WHEN @cOverride is not null
					 THEN TOTAL_WEIGHT + ((@dNewOnHandQty - ON_HAND_QTY)
										  * @dOverrodeWeightPerItem)
					 WHEN @dInitOnHandQty > 0.0
					 THEN TOTAL_WEIGHT / @dInitOnHandQty * @dNewOnHandQty 
					 ELSE @dWeightPerItem * @dNewOnHandQty 
					 END,
			   
		   -- update other common fields.
		   PROCESS_STAMP = N'INV_UpdateToLocInv',
		   USER_STAMP = @stUserName,
		   DATE_TIME_STAMP = GETUTCDATE(),
		   LOC_INV_ATTRIBUTES_ID = @toLocInvAttributeId ,		      
		   -- User Defined Fields
		   USER_DEF1 = CASE WHEN @fillUserDef is not null then @userDef1 ELSE USER_DEF1 END,
		   USER_DEF2 = CASE WHEN @fillUserDef is not null then @userDef2 ELSE USER_DEF2 END,		   
		   USER_DEF3 = CASE WHEN @fillUserDef is not null then @userDef3 ELSE USER_DEF3 END,
		   USER_DEF4 = CASE WHEN @fillUserDef is not null then @userDef4 ELSE USER_DEF4 END,
		   USER_DEF5 = CASE WHEN @fillUserDef is not null then @userDef5 ELSE USER_DEF5 END,
		   USER_DEF6 = CASE WHEN @fillUserDef is not null then @userDef6 ELSE USER_DEF6 END,
		   USER_DEF7 = CASE WHEN @fillUserDef is not null then @userDef7 ELSE USER_DEF7 END,
		   USER_DEF8 = CASE WHEN @fillUserDef is not null then @userDef8 ELSE USER_DEF8 END
		   
	  -- make sure to include the initial quantity values to
	  -- enforce the optimistic lock.
	 WHERE INTERNAL_LOCATION_INV = @iIntLocInv
	   AND ALLOCATED_QTY = @dInitAllocQty
	   AND IN_TRANSIT_QTY = @dInitInTransQty
	   AND ON_HAND_QTY = @dInitOnHandQty
	   AND SUSPENSE_QTY = @dInitSuspQty;
	 SELECT @iError = @@ERROR, @iRowCount = @@ROWCOUNT;
	 return @iError;
-- end INV_UpdateToLocInv



