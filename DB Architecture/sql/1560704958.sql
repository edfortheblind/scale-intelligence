-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





























	
	-- [comment omitted]



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

	-- [comment omitted]
	declare @cEmpty nchar(1); -- [comment omitted]
	declare @cOverride nchar(1); -- [comment omitted]
	declare @dCostPerItem numeric(19,5);
	declare @dValuePerItem numeric(19,5);
	declare @dVolumePerItem numeric(28,5);
	declare @dWeightPerItem numeric(28,5);
	declare @iError int;
        declare @stDfltInvSts nvarchar(200);
        declare @fillUserDef nchar(1);

	-- [comment omitted]
	if (@dNewAllocQty = 0.0
		AND @dNewInTransQty = 0.0
		AND @dNewOnHandQty = 0.0
		AND @dNewSuspQty = 0.0)
	begin
		set @cEmpty = N'<literal:1>';
		SELECT @stDfltInvSts = SYSTEM_VALUE
                  FROM SYSTEM_CONFIG_DETAIL
                 WHERE SYS_KEY = N'<literal:2>' AND RECORD_TYPE = N'<literal:3>'
	end -- [comment omitted]
	
	if (@dInitAllocQty = 0.0
	            and @dInitInTransQty = 0.0
	            and @dInitOnHandQty = 0.0
	            and @dInitSuspQty = 0.0)
	begin
	             set @fillUserDef = N'<literal:4>';
        end

	if (@dOverrodeVolumePerItem is not null
		OR @dOverrodeWeightPerItem is not null)
		set @cOverride = N'<literal:5>';

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	if (@dInitOnHandQty = 0.0 
		AND @dInitOnHandQty <> @dNewOnHandQty)
	begin
		SELECT @dCostPerItem = costPerItem,
			   @dValuePerItem = valuePerItem,
			   @dVolumePerItem = volumePerItem,
			   @dWeightPerItem = weightPerItem
		  FROM dbo.INVfn_RtrvItemInfo(@stItem, @stCompany, @stQuantityUm, 
									  @stLoc, @stWhs, @cOverride);
	end -- [comment omitted]

	UPDATE LOCATION_INVENTORY
	   SET ALLOCATED_QTY = @dNewAllocQty,
		   IN_TRANSIT_QTY = @dNewInTransQty,
		   ON_HAND_QTY = @dNewOnHandQty,
		   SUSPENSE_QTY = @dNewSuspQty,
                   LOT = CASE WHEN (@dNewAllocQty = 0.0 AND @dNewInTransQty = 0.0 AND @dNewOnHandQty = 0.0 AND @dNewSuspQty = 0.0) THEN NULL ELSE  @stLot END,
		   AGING_DATE =	
					 -- [comment omitted]
				CASE WHEN @cEmpty is not null 
					 THEN null
					 -- [comment omitted]
					 WHEN AGING_DATE is not null
					 THEN AGING_DATE
					 -- [comment omitted]
					 WHEN @dtFromAgingDate is not null
					 THEN @dtFromAgingDate
					 -- [comment omitted]
					 ELSE GETUTCDATE()
					 END,
		   RECEIVED_DATE = 
					 -- [comment omitted]
				CASE WHEN @cEmpty is not null 
					 THEN null
					 -- [comment omitted]
					 WHEN RECEIVED_DATE is not null
					 THEN RECEIVED_DATE
					 -- [comment omitted]
					 WHEN @dtFromRecDate is not null
					 THEN @dtFromRecDate
					 -- [comment omitted]
					 ELSE GETUTCDATE()
					 END,
		   MANUFACTURED_DATE = 
					 -- [comment omitted]
				CASE WHEN @cEmpty is not null 
					 THEN null
					 -- [comment omitted]
					 WHEN MANUFACTURED_DATE is not null
					 THEN MANUFACTURED_DATE
					 -- [comment omitted]
					 WHEN @dtFromManDate is not null
					 THEN @dtFromManDate
					 -- [comment omitted]
					 ELSE @dtManDate
					 END,
		   EXPIRATION_DATE = 
					 -- [comment omitted]
				CASE WHEN @cEmpty is not null 
					 THEN null
					 -- [comment omitted]
					 WHEN EXPIRATION_DATE is not null
					 THEN EXPIRATION_DATE
					 -- [comment omitted]
					 WHEN @stLot is null
					 THEN dbo.DHfn_TransToSQLDate(N'<literal:6>')
					 -- [comment omitted]
					 WHEN @dtFromExpDate is not null
					 THEN @dtFromExpDate
					 -- [comment omitted]
					 ELSE @dtExpDate
					 END,
		   QUANTITY_UM = 
					 -- [comment omitted]
				CASE WHEN QUANTITY_UM is not null
					 THEN QUANTITY_UM
					 -- [comment omitted]
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
					 -- [comment omitted]
				CASE WHEN @cEmpty is not null 
					 THEN @stDfltInvSts
					 -- [comment omitted]
					 WHEN @stInventorySts is not null
					 THEN @stInventorySts
					 -- [comment omitted]
					 WHEN INVENTORY_STS is not null
					 THEN INVENTORY_STS
					 -- [comment omitted]
					 ELSE @stFromInvSts
					 END,

		   -- [comment omitted]
		   -- [comment omitted]
		   -- [comment omitted]
		   -- [comment omitted]
		   -- [comment omitted]
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
					 
		   -- [comment omitted]
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
			   
		   -- [comment omitted]
		   PROCESS_STAMP = N'<literal:7>',
		   USER_STAMP = @stUserName,
		   DATE_TIME_STAMP = GETUTCDATE(),
		   LOC_INV_ATTRIBUTES_ID = @toLocInvAttributeId ,		      
		   -- [comment omitted]
		   USER_DEF1 = CASE WHEN @fillUserDef is not null then @userDef1 ELSE USER_DEF1 END,
		   USER_DEF2 = CASE WHEN @fillUserDef is not null then @userDef2 ELSE USER_DEF2 END,		   
		   USER_DEF3 = CASE WHEN @fillUserDef is not null then @userDef3 ELSE USER_DEF3 END,
		   USER_DEF4 = CASE WHEN @fillUserDef is not null then @userDef4 ELSE USER_DEF4 END,
		   USER_DEF5 = CASE WHEN @fillUserDef is not null then @userDef5 ELSE USER_DEF5 END,
		   USER_DEF6 = CASE WHEN @fillUserDef is not null then @userDef6 ELSE USER_DEF6 END,
		   USER_DEF7 = CASE WHEN @fillUserDef is not null then @userDef7 ELSE USER_DEF7 END,
		   USER_DEF8 = CASE WHEN @fillUserDef is not null then @userDef8 ELSE USER_DEF8 END
		   
	  -- [comment omitted]
	  -- [comment omitted]
	 WHERE INTERNAL_LOCATION_INV = @iIntLocInv
	   AND ALLOCATED_QTY = @dInitAllocQty
	   AND IN_TRANSIT_QTY = @dInitInTransQty
	   AND ON_HAND_QTY = @dInitOnHandQty
	   AND SUSPENSE_QTY = @dInitSuspQty;
	 SELECT @iError = @@ERROR, @iRowCount = @@ROWCOUNT;
	 return @iError;
-- [comment omitted]



