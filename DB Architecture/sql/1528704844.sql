-- DOCUMENTATION ONLY: literals/comments removed; do not execute.




	-- [comment omitted]




CREATE PROCEDURE INV_UpdateFromLocInv(
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
	@stUserName nvarchar(30),
	@fromLocInvAttributeId numeric(9) =NULL,	
	@dtFromAgingDate datetime output,
	@dtFromExpDate datetime output,
	@dtFromManDate datetime output,
	@dtFromRecDate datetime output,
	@stFromInvSts nvarchar(50) output,
	@stFromItemColor nvarchar(25) output,
	@stFromItemDesc nvarchar(100) output,
	@stFromItemSize nvarchar(25) output,
	@stFromItemStyle nvarchar(25) output,
	@iRowCount int output)

AS
	SET NOCOUNT ON;

	-- [comment omitted]
	declare @cEmpty nchar(1); -- [comment omitted]
	declare @iError int;
	declare @stDfltInvSts nvarchar(200);
	
	-- [comment omitted]
	if (@dNewAllocQty = 0.0
		AND @dNewInTransQty = 0.0
		AND @dNewOnHandQty = 0.0
		AND @dInitSuspQty  = 0.0)
	begin
		set @cEmpty = N'<literal:1>';
		SELECT @stDfltInvSts = SYSTEM_VALUE
		  FROM SYSTEM_CONFIG_DETAIL
		 WHERE SYS_KEY = N'<literal:2>' AND RECORD_TYPE = N'<literal:3>'
	end;
	
	-- [comment omitted]
	-- [comment omitted]
	UPDATE LOCATION_INVENTORY
	   SET ALLOCATED_QTY = @dNewAllocQty,
		   IN_TRANSIT_QTY = @dNewInTransQty,
		   ON_HAND_QTY = @dNewOnHandQty,
		   SUSPENSE_QTY = @dNewSuspQty,
		   LOT = CASE WHEN (@dNewAllocQty = 0.0 AND @dNewInTransQty = 0.0 AND @dNewOnHandQty = 0.0 AND @dNewSuspQty = 0.0) THEN NULL ELSE LOT END,
		     -- [comment omitted]
		   TOTAL_COST = 
				CASE WHEN ON_HAND_QTY > 0.0
					 THEN TOTAL_COST / ON_HAND_QTY * @dNewOnHandQty
					 ELSE 0.0
					 END,
		   TOTAL_VALUE = 
				CASE WHEN ON_HAND_QTY > 0.0
					 THEN TOTAL_VALUE / ON_HAND_QTY * @dNewOnHandQty
					 ELSE 0.0
					 END,
				
		   -- [comment omitted]
		   TOTAL_VOLUME = 
				CASE WHEN ON_HAND_QTY = 0.0 
					 THEN 0.0
					 WHEN @dOverrodeVolumePerItem is not null
					 THEN TOTAL_VOLUME + ((@dNewOnHandQty - ON_HAND_QTY) 
										  * @dOverrodeVolumePerItem)
					 ELSE TOTAL_VOLUME / ON_HAND_QTY * @dNewOnHandQty
					 END,
		   TOTAL_WEIGHT = 
				CASE WHEN ON_HAND_QTY = 0.0
					 THEN 0.0
					 WHEN @dOverrodeWeightPerItem is not null
					 THEN TOTAL_WEIGHT + ((@dNewOnHandQty - ON_HAND_QTY) 
										  * @dOverrodeWeightPerItem)
					 ELSE TOTAL_WEIGHT / ON_HAND_QTY * @dNewOnHandQty
					 END,
					 
		   -- [comment omitted]
		   -- [comment omitted]
		   AGING_DATE = CASE WHEN AGING_DATE is null THEN GETUTCDATE()
                                         WHEN @cEmpty is not null 
                                         THEN null
				         ELSE AGING_DATE END,
		   EXPIRATION_DATE = CASE WHEN @cEmpty is not null THEN null
								  ELSE EXPIRATION_DATE END,
		   INVENTORY_STS = CASE WHEN @cEmpty is not null 
								THEN @stDfltInvSts
								ELSE INVENTORY_STS END,
		   MANUFACTURED_DATE = CASE WHEN @cEmpty is not null THEN null
									ELSE MANUFACTURED_DATE END,
		   RECEIVED_DATE = CASE WHEN @cEmpty is not null THEN null
								ELSE RECEIVED_DATE END,
		   
		   -- [comment omitted]
		   PROCESS_STAMP = N'<literal:4>',
		   USER_STAMP = @stUserName,
		   DATE_TIME_STAMP = GETUTCDATE(),

		   -- [comment omitted]
		   USER_DEF1 = CASE WHEN @cEmpty is not null then null else USER_DEF1 END,
		   USER_DEF2 = CASE WHEN @cEmpty is not null then null else USER_DEF2 END,
		   USER_DEF3 = CASE WHEN @cEmpty is not null then null else USER_DEF3 END,
       	           USER_DEF4 = CASE WHEN @cEmpty is not null then null else USER_DEF4 END,
		   USER_DEF5 = CASE WHEN @CEmpty is not null then null else USER_DEF5 END,
		   USER_DEF6 = CASE WHEN @CEmpty is not null then null else USER_DEF6 END,
		   USER_DEF7 = CASE WHEN @CEmpty is not null then null else USER_DEF7 END,
		   USER_DEF8 = CASE WHEN @CEmpty is not null then null else USER_DEF8 END,
		   LOGISTICS_UNIT = CASE WHEN @cEmpty is not null then null else LOGISTICS_UNIT END,
		   PARENT_LOGISTICS_UNIT = CASE WHEN @cEmpty is not null then null else PARENT_LOGISTICS_UNIT END,
           LOC_INV_ATTRIBUTES_ID = @fromLocInvAttributeId ,		      

		
		   
		   -- [comment omitted]
		   -- [comment omitted]
		   @dtFromAgingDate = AGING_DATE,
		   @dtFromExpDate = EXPIRATION_DATE,
		   @dtFromManDate = MANUFACTURED_DATE,
		   @dtFromRecDate = RECEIVED_DATE,
		   @stFromInvSts = INVENTORY_STS,
		   @stFromItemColor = ITEM_COLOR,
		   @stFromItemDesc = ITEM_DESC,
		   @stFromItemSize = ITEM_SIZE,
		   @stFromItemStyle = ITEM_STYLE
		   
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



