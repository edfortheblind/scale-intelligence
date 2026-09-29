-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */


























-- [comment omitted]

CREATE PROCEDURE INV_InsertLocationInventory(
	@cAllocEffect nchar(1), -- [comment omitted]
	@cInTransEffect nchar(1), -- [comment omitted]
	@cOnHandEffect nchar(1), -- [comment omitted]
	@cSuspEffect nchar(1), -- [comment omitted]
	@dOverrodeVolumePerItem numeric(28,5),
	@dOverrodeWeightPerItem numeric(28,5),
	@dQuantity numeric(19,5),
	@dtExpDate datetime,
	@dtManDate datetime,
	@stCompany nvarchar(25),
	@stInventorySts nvarchar(50) output,
	@stItem nvarchar(50),
	@stItemDesc nvarchar(100),
	@stLot nvarchar(25),
	@stQuantityUm nvarchar(25),
	@stToLoc nvarchar(25),
	@logisticsUnit nvarchar(50),
	@parentLogisticsUnit nvarchar(50),
	@stToWhs nvarchar(25),
	@stUserName nvarchar(30),
	@dtFromAgingDate datetime,
	@dtFromExpDate datetime,
	@dtFromManDate datetime,
	@dtFromRecDate datetime,
	@stFromInvSts nvarchar(50),
	@stFromItemColor nvarchar(25),
	@stFromItemDesc nvarchar(100),
	@stFromItemSize nvarchar(25),
	@stFromItemStyle nvarchar(25),
	@cPermanent nchar(1),
	@stUserDef1 nvarchar(25),
	@stUserDef2 nvarchar(25),
	@stUserDef3 nvarchar(25),
	@stUserDef4 nvarchar(25),
	@stUserDef5 nvarchar(25),
	@stUserDef6 nvarchar(25),
	@dUserDef7 numeric(19,5),
	@dUserDef8 numeric(19,5),
    @locInvAttributeId numeric(9) = NULL,
	@stReferenceType nvarchar(50) ,
	@iRowCount int output,
	@locInvNum numeric(9) output)
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	declare @cOverride nchar(1);
	declare @dCostPerItem numeric(19,5);
	declare @dValuePerItem numeric(19,5);
	declare @dVolumePerItem numeric(28,5);
	declare @dWeightPerItem numeric(28,5);
	declare @stWeightUM nvarchar(25);
	declare @stVolumeUM nvarchar(25)
	declare @iError int;
	declare @stItemColor nvarchar(25);
	declare @stItemSize nvarchar(25);
	declare @stItemStyle nvarchar(25);
	declare @stLocTemplate nvarchar(25);
	declare @stTemplateField1 nvarchar(25);
	declare @stTemplateField2 nvarchar(25);
	declare @stTemplateField3 nvarchar(25);
	declare @stTemplateField4 nvarchar(25);
	declare @stTemplateField5 nvarchar(25);
	declare @locationClass nvarchar(25)
	declare @stErrorMsg nvarchar(2000);
	declare @multiItem nchar(1);

	-- [comment omitted]
	if (@dOverrodeVolumePerItem is not null
		OR @dOverrodeWeightPerItem is not null)
		set @cOverride = N'<literal:1>';

	if(@locInvAttributeId = 0)
		SET @locInvAttributeId = NULL;
	
	-- [comment omitted]
	SELECT @stLocTemplate = LOCATION_TEMPLATE,
		   @stTemplateField1 = TEMPLATE_FIELD1,
		   @stTemplateField2 = TEMPLATE_FIELD2,
		   @stTemplateField3 = TEMPLATE_FIELD3,
		   @stTemplateField4 = TEMPLATE_FIELD4,
		   @stTemplateField5 = TEMPLATE_FIELD5,
		   @locationClass =LOCATION_CLASS,
		   @multiItem = MULTI_ITEM
	  FROM LOCATION
	 WHERE LOCATION = @stToLoc
	   AND WAREHOUSE = @stToWhs;


	-- [comment omitted]
	-- [comment omitted]
	if (@@ROWCOUNT = 0)
	begin
		exec @iError = INV_InsertLocation @stToLoc, @stUserName, @stToWhs
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		set @stTemplateField1 = @stToLoc;
	end; -- [comment omitted]

	-- [comment omitted]
	SELECT @dCostPerItem = costPerItem,
		   @dValuePerItem = valuePerItem,
		   @dVolumePerItem = volumePerItem,
		   @dWeightPerItem = weightPerItem,
		   @stWeightUM= weightUm,
		   @stVolumeUM=volumeUm,
		   @stItemColor = itemColor,
		   @stItemDesc = ISNULL(@stItemDesc, itemDesc),
		   @stItemSize = itemSize,
		   @stItemStyle = itemStyle
	  FROM dbo.INVfn_RtrvItemInfo(@stItem, @stCompany, @stQuantityUm, 
								  @stToLoc, @stToWhs, @cOverride);

	-- [comment omitted]
	if (@stInventorySts is null)
		set @stInventorySts = @stFromInvSts;

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
			If(@locationClass = N'<literal:2>' AND @cAllocEffect = N'<literal:3>'  AND @dQuantity > 0) 
	     	begin
						
			    set @stErrorMsg = N'<literal:4>' + dbo.RSCMfn_RtrvMsg(N'<literal:5>'); 		
				RAISERROR(@stErrorMsg , 18, 1);
				return -1;   
			End;
			
	if (@multiItem = N'<literal:6>' 
		and @locationClass=N'<literal:7>' 
		and (@cInTransEffect = N'<literal:8>' or @cOnHandEffect = N'<literal:9>' )
		and @dQuantity > 0
		and exists (select top 1 *
			from LOCATION_INVENTORY
			where LOCATION = @stToLoc
			and warehouse = @stToWhs
			and ITEM <> @stItem
			and ((PERMANENT = N'<literal:10>' and ON_HAND_QTY > 0) or PERMANENT = N'<literal:11>') ))
	begin
		-- [comment omitted]
		if NOT EXISTS(SELECT TOP 1 SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL
							WHERE  SYS_KEY=N'<literal:12>' AND RECORD_TYPE = N'<literal:13>'
							AND SYSTEM_VALUE = @stReferenceType)
			BEGIN
				set @stErrorMsg = N'<literal:14>' + dbo.RSCMfn_RtrvMsg(N'<literal:15>'); 		
				RAISERROR(@stErrorMsg , 18, 1);
				return -1; 
			END
	end
		
	-- [comment omitted]
	INSERT INTO LOCATION_INVENTORY
		   (LOCATION,
		    WAREHOUSE,
		    ITEM,
		    COMPANY,
		    LOT,
		    PERMANENT,
		    ON_HAND_QTY,
		    IN_TRANSIT_QTY,
		    ALLOCATED_QTY,
		    SUSPENSE_QTY,
		    QUANTITY_UM,
		    INVENTORY_STS,
		    ITEM_DESC,
		    AGING_DATE,
		    RECEIVED_DATE,
		    MANUFACTURED_DATE,
		    EXPIRATION_DATE,
		    TEMPLATE_FIELD1,
		    TEMPLATE_FIELD2,
		    TEMPLATE_FIELD3,
		    TEMPLATE_FIELD4,
		    TEMPLATE_FIELD5,
		    LOCATION_TEMPLATE,
		    ITEM_COLOR,
		    ITEM_SIZE,
		    ITEM_STYLE,
		    TOTAL_COST,
		    TOTAL_VALUE,
		    TOTAL_VOLUME,
		    TOTAL_WEIGHT,
			WEIGHT_UM,
			VOLUME_UM,
		    PROCESS_STAMP,
		    USER_STAMP,
		    DATE_TIME_STAMP,
		    LOC_INV_ATTRIBUTES_ID,
		    LOGISTICS_UNIT,
		    PARENT_LOGISTICS_UNIT,
		    USER_DEF1,
		    USER_DEF2,
		    USER_DEF3,
		    USER_DEF4,
		    USER_DEF5,
		    USER_DEF6,
		    USER_DEF7,
		    USER_DEF8)
	VALUES (@stToLoc,
			@stToWhs,
			@stItem,
			@stCompany,
			@stLot,
			CASE WHEN @cPermanent IS NULL THEN N'<literal:16>' ELSE @cPermanent END, -- [comment omitted]
			CASE WHEN @cOnHandEffect = N'<literal:17>' THEN @dQuantity
				 ELSE 0.0 END, -- [comment omitted]
			CASE WHEN @cInTransEffect = N'<literal:18>' THEN @dQuantity
				 ELSE 0.0 END, -- [comment omitted]
			CASE WHEN @cAllocEffect = N'<literal:19>' THEN @dQuantity
				 ELSE 0.0 END, -- [comment omitted]
			CASE WHEN @cSuspEffect = N'<literal:20>' THEN @dQuantity
				 ELSE 0.0 END, -- [comment omitted]
		    @stQuantityUm,
			CASE -- [comment omitted]
				 WHEN @stInventorySts is not null
				 THEN @stInventorySts
				 -- [comment omitted]
				 ELSE @stFromInvSts
				 END, -- [comment omitted]
			CASE -- [comment omitted]
				 WHEN @stFromItemDesc is not null
				 THEN @stFromItemDesc
				 -- [comment omitted]
				 ELSE @stItemDesc
				 END, -- [comment omitted]
			CASE -- [comment omitted]
				 WHEN @dtFromAgingDate is not null
				 THEN @dtFromAgingDate
				 -- [comment omitted]
				 ELSE GETUTCDATE()
				 END, -- [comment omitted]
			CASE -- [comment omitted]
				 WHEN @dtFromRecDate is not null
				 THEN @dtFromRecDate
				 -- [comment omitted]
				 ELSE GETUTCDATE()
				 END, -- [comment omitted]
			CASE -- [comment omitted]
				 WHEN @dtFromManDate is not null
				 THEN @dtFromManDate
				 -- [comment omitted]
				 ELSE @dtManDate
				 END, -- [comment omitted]
			CASE -- [comment omitted]
				 WHEN @stLot is null
				 THEN dbo.DHfn_TransToSQLDate(N'<literal:21>')
				 -- [comment omitted]
				 WHEN @dtFromExpDate is not null
				 THEN @dtFromExpDate
				 -- [comment omitted]
				 ELSE @dtExpDate
				 END, -- [comment omitted]
			@stTemplateField1,
			@stTemplateField2,
			@stTemplateField3,
			@stTemplateField4,
			@stTemplateField5,
			@stLocTemplate,
			CASE -- [comment omitted]
				 WHEN @stFromItemColor is not null
				 THEN @stFromItemColor
				 -- [comment omitted]
				 ELSE @stItemColor
				 END, -- [comment omitted]
			CASE -- [comment omitted]
				 WHEN @stFromItemSize is not null
				 THEN @stFromItemSize
				 -- [comment omitted]
				 ELSE @stItemSize
				 END, -- [comment omitted]
			CASE -- [comment omitted]
				 WHEN @stFromItemStyle is not null
				 THEN @stFromItemStyle
				 -- [comment omitted]
				 ELSE @stItemStyle
				 END, -- [comment omitted]
			CASE WHEN @cOnHandEffect = N'<literal:22>'
				 THEN @dCostPerItem * @dQuantity
				 ELSE 0.0
				 END, -- [comment omitted]
			CASE WHEN @cOnHandEffect = N'<literal:23>'
				 THEN @dValuePerItem * @dQuantity
				 ELSE 0.0
				 END, -- [comment omitted]
				 
			-- [comment omitted]
			CASE WHEN @cOnHandEffect = N'<literal:24>'
					  AND @cOverride is not null
				 THEN @dOverrodeVolumePerItem * @dQuantity
				 WHEN @cOnHandEffect = N'<literal:25>'
				 THEN @dVolumePerItem * @dQuantity
				 ELSE 0.0
				 END, -- [comment omitted]
			CASE WHEN @cOnHandEffect = N'<literal:26>'
					  AND @cOverride is not null
				 THEN @dOverrodeWeightPerItem * @dQuantity
				 WHEN @cOnHandEffect = N'<literal:27>'
				 THEN @dWeightPerItem * @dQuantity
				 ELSE 0.0
				 END, -- [comment omitted]
				 @stWeightUM,
				 @stVolumeUM,
		   N'<literal:28>', -- [comment omitted]
		   @stUserName,
		   GETUTCDATE(),-- [comment omitted]
		   @locInvAttributeId,
		   @logisticsUnit,
		   @parentLogisticsUnit,
		   @stUserDef1,
		   @stUserDef2,
		   @stUserDef3,
		   @stUserDef4,
		   @stUserDef5,
		   @stUserDef6,
		   @dUserDef7,
		   @dUserDef8); 
	SELECT @iError = @@ERROR, @iRowCount = @@ROWCOUNT, @locInvNum = @@IDENTITY;
	return @iError;
-- [comment omitted]

