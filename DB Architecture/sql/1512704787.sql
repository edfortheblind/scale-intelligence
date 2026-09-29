-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



















-- [comment omitted]


CREATE PROCEDURE INV_TransferCompany(
		@item nvarchar(50),
		@fromCompany nvarchar(25),
		@toCompany nvarchar(25),
		@invSts nvarchar(50),
		@fromWarehouse nvarchar(25),
		@userDef1 nvarchar(50),
		@userDef2 nvarchar(50),
		@userDef3 nvarchar(50),
		@userDef4 nvarchar(50),
		@userDef5 nvarchar(50),
		@userDef6 nvarchar(50),
		@userDef7 numeric(19,5),
		@userDef8 numeric(19,5),
		@transactionType nvarchar(50),
		@userName nvarchar(30),
		@refId nvarchar(25),
		@refType nvarchar(50),
		@argumentGrpid nvarchar(32),
		@expDate datetime,
		@intLocInvNum numeric(9),
		@fromLocation nvarchar(25),
		@toLocInvAttributeId numeric(9) = NULL,
		@toIntLocInv numeric(9))
	
AS
	SET NOCOUNT ON;
	
	declare @fromToCompany nvarchar(2000);
	declare @fromCatchWeight numeric(14,5);
	declare @featureFlag54734 nchar(2); 
	declare @initAllocQty numeric(19,5);
	declare @initInTransQty numeric(19,5);
	declare @initOnHandQty numeric(19,5);
	declare @initSuspQty numeric(19,5);
	declare @initInvSts nvarchar(50);
	declare @cntTrack nchar(1);
	declare @lot nvarchar(25);
	declare @transHistActive nchar(1);
	declare @iError int;
	declare @rowcount int;
	declare @stErrorMsg nvarchar(2000);
	declare @tmpExpDate datetime;
	declare @quantityUM nvarchar(25);
	declare @logisticsUnit nvarchar(50);
	declare @parentLogisticsUnit nvarchar(50);
	declare @toLocInvNum numeric(9);
    declare @tempToLocInvNum numeric(9);
	declare @costPerItem numeric(19,5);
	declare @valuePerItem numeric(19,5);
	declare @volumePerItem numeric(19,5);
	declare @weightPerItem numeric(19,5);
	declare @itemColor nvarchar(25);
    declare @itemDesc nvarchar(100);
    declare @itemSize nvarchar(25);
    declare @itemStyle nvarchar(25);
	declare @fromLocInvAttributesId int;
	declare @isItemWithoutCompany bit;
	declare @catchWeight numeric(14,5) = NULL;
	declare @catchWeightUM nvarchar(25) = NULL;
    declare @catchWeightFeatureFlag nvarchar(1);
    -- [comment omitted]
	declare	@sameLotExistsWithOldCompany bit;

	-- [comment omitted]
	declare	@sameLotExistsWithNewCompany bit;

	declare @existingLotRecordId numeric(9);
	declare @insertedLotRecordId numeric(9);

	SET @sameLotExistsWithOldCompany = 0;
	SET @sameLotExistsWithNewCompany = 0;    
		
	select  @isItemWithoutCompany = count(*) from item where item = @item and company is null

	-- [comment omitted]
	if (@item is null
			or @invSts is null 
			or @fromLocation is null 
			or @fromWarehouse is null 
			or (@fromCompany is null and @isItemWithoutCompany = 0)
			or @toCompany is null)
	begin
		-- [comment omitted]
		-- [comment omitted]
		set @stErrorMsg = 
				N'<literal:1>' + dbo.RSCMfn_RtrvMsg(N'<literal:2>'); 
				
		set @fromToCompany = isnull(@fromCompany,N'<literal:3>') + N'<literal:4>' + 
			   isnull(@toCompany,N'<literal:5>');
			   
		exec @iError = ADT_LogAudit 
				N'<literal:6>',										-- [comment omitted]
				null,																		-- [comment omitted]
				@stErrorMsg,														-- [comment omitted]
				N'<literal:7>', @intLocInvNum,						-- [comment omitted]
				N'<literal:8>', @item,														-- [comment omitted]
				N'<literal:9>', @fromToCompany,				-- [comment omitted]
				N'<literal:10>', @fromLocation,							-- [comment omitted]
				N'<literal:11>', @invSts,								-- [comment omitted]
				N'<literal:12>', @transactionType,				-- [comment omitted]
				N'<literal:13>', @refId,											-- [comment omitted]
				N'<literal:14>', @refType,								-- [comment omitted]
				N'<literal:15>', @transHistActive,		-- [comment omitted]
				N'<literal:16>', @argumentGrpid,				-- [comment omitted]
				@userName,														-- [comment omitted]
				@fromWarehouse;												-- [comment omitted]
				
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		return;
	end; -- [comment omitted]

	SELECT @initAllocQty = LI.ALLOCATED_QTY,
			@initInTransQty = LI.IN_TRANSIT_QTY,
			@initOnHandQty = LI.ON_HAND_QTY,
			@initSuspQty = LI.SUSPENSE_QTY,
			@initInvSts = LI.INVENTORY_STS,
			@cntTrack = LOC.TRACK_CONTAINERS,
			@lot = LI.LOT,
			@quantityUM = LI.QUANTITY_UM,
			@tmpExpDate = LI.EXPIRATION_DATE,
			@logisticsUnit = LI.LOGISTICS_UNIT,
			@parentLogisticsUnit = LI.PARENT_LOGISTICS_UNIT,
			@fromLocInvAttributesId = LI.LOC_INV_ATTRIBUTES_ID
	FROM LOCATION_INVENTORY LI,
				LOCATION LOC
	WHERE LOC.LOCATION = LI.LOCATION
				AND LOC.WAREHOUSE = LI.WAREHOUSE	
				AND LI.INTERNAL_LOCATION_INV = @intLocInvNum
				AND LI.ALLOCATED_QTY = 0
				AND LI.IN_TRANSIT_QTY = 0
				AND LI.SUSPENSE_QTY = 0
				AND LI.ON_HAND_QTY > 0;

	SELECT @iError = @@ERROR, @rowcount = @@ROWCOUNT;
	
	if (@iError <> 0) return -1;

	IF(@expDate IS NULL
		AND @tmpExpDate IS NOT NULL) 
		SET	@expDate = @tmpExpDate;
	
	if (@rowcount <= 0)
	BEGIN
		-- [comment omitted]
		-- [comment omitted]
		SET @stErrorMsg = N'<literal:17>' 
						  + dbo.RSCMfn_RtrvMsg(N'<literal:18>'); 
						  
		SET @fromToCompany = ISNULL(@fromCompany,N'<literal:19>')
							 + N'<literal:20>' + 
						     ISNULL(@toCompany,N'<literal:21>');
						     
		EXEC @iError = ADT_LogAudit 
					N'<literal:22>',										-- [comment omitted]
					null,																		-- [comment omitted]
					@stErrorMsg,														-- [comment omitted]
					N'<literal:23>', @intLocInvNum,						-- [comment omitted]
					N'<literal:24>', @item,														-- [comment omitted]
					N'<literal:25>', @fromToCompany,				-- [comment omitted]
					N'<literal:26>', @fromLocation,							-- [comment omitted]
					N'<literal:27>', @invSts,								-- [comment omitted]
					N'<literal:28>', @transactionType,				-- [comment omitted]
					N'<literal:29>', @refId,											-- [comment omitted]
					N'<literal:30>', @refType,								-- [comment omitted]
					N'<literal:31>', @transHistActive,		-- [comment omitted]
					N'<literal:32>', @argumentGrpid,				-- [comment omitted]
					@userName,														-- [comment omitted]
					@fromWarehouse;												-- [comment omitted]
		
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		return;
	END;
	
if (@iError <> 0) return -1; 

	-- [comment omitted]
	SELECT @costPerItem = costPerItem,
		   @valuePerItem = valuePerItem,
		   @volumePerItem = volumePerItem,
		   @weightPerItem = weightPerItem,
		   @itemColor = itemColor,
		   @itemDesc = itemDesc,
		   @itemSize = itemSize,
		   @itemStyle = itemStyle
	  FROM dbo.INVfn_RtrvItemInfo(@item, @toCompany, @quantityUM, 
								  @fromLocation, @fromWarehouse, NULL);
	
if (@iError <> 0) return -1; 

	-- [comment omitted]
    IF(@toLocInvAttributeId > 0)
	BEGIN
		SET @toLocInvNum = @toIntLocInv;	
	END;
    ELSE IF (@fromLocInvAttributesId = 0 OR @fromLocInvAttributesId IS NULL)
	BEGIN
        SELECT 
		@tempToLocInvNum  = INTERNAL_LOCATION_INV       
        FROM 
            LOCATION_INVENTORY
        WHERE 
            ITEM = @item
            AND COMPANY = @toCompany
            AND LOCATION = @fromLocation
            AND ((LOGISTICS_UNIT IS NULL AND @logisticsUnit IS NULL)
                            OR
                (LOGISTICS_UNIT = @logisticsunit))
            AND ((PARENT_LOGISTICS_UNIT IS NULL AND @parentLogisticsUnit IS NULL)
                            OR
                (PARENT_LOGISTICS_UNIT = @parentLogisticsUnit))
            AND ((LOT IS NULL AND @lot IS NULL)
                            OR
                (LOT = @lot))		
            AND (LOC_INV_ATTRIBUTES_ID IS NULL OR LOC_INV_ATTRIBUTES_ID = 0)
            AND INTERNAL_LOCATION_INV <> @intLocInvNum;
        
			SET @toLocInvNum = @tempToLocInvNum;
	END
	
	
 	-- [comment omitted]
 	-- [comment omitted]
 	-- [comment omitted]
 	IF(@lot IS NOT NULL)
	BEGIN
		IF EXISTS
		(
			SELECT
				N'<literal:33>'
			FROM
				LOCATION_INVENTORY
			WHERE
				LOT = @lot	
				AND (COMPANY = @fromCompany or COMPANY IS NULL)
				AND ITEM = @item
				AND WAREHOUSE = @fromWarehouse
				AND INTERNAL_LOCATION_INV <> @intLocInvNum
		)
			SET @sameLotExistsWithOldCompany = 1;

		IF EXISTS
		(
			SELECT
				N'<literal:34>'
			FROM
				LOCATION_INVENTORY
			WHERE
				LOT = @lot	
				AND COMPANY = @toCompany
				AND ITEM = @item
				AND WAREHOUSE = @fromWarehouse
				AND INTERNAL_LOCATION_INV <> @intLocInvNum
		)
			SET @sameLotExistsWithNewCompany = 1;
	END

	IF ISNULL(@toLocInvNum,0) <> 0
	BEGIN -- [comment omitted]

		-- [comment omitted]
		UPDATE 
			LOCATION_INVENTORY 
		SET 
			ALLOCATED_QTY = LI.ALLOCATED_QTY + @initAllocQty ,
			IN_TRANSIT_QTY  = LI.IN_TRANSIT_QTY + @initInTransQty  ,
			ON_HAND_QTY = LI.ON_HAND_QTY + @initOnHandQty ,
			SUSPENSE_QTY = LI.SUSPENSE_QTY + @initSuspQty ,			
			PROCESS_STAMP = N'<literal:35>',
			USER_STAMP = @userName,
			DATE_TIME_STAMP = GETUTCDATE(),
			EXPIRATION_DATE = @expDate
		FROM LOCATION_INVENTORY LI
		WHERE 
			INTERNAL_LOCATION_INV = @toLocInvNum

		if (@@ERROR <> 0) return -1;

		-- [comment omitted]
		-- [comment omitted]
	    UPDATE 
			SERIAL_NUMBER 
	    SET 
			LOC_INV_NUM  = @toLocInvNum,
			PROCESS_STAMP = N'<literal:36>',
			USER_STAMP = @userName,
			DATE_TIME_STAMP = GETUTCDATE()
		WHERE 
			LOC_INV_NUM = @intLocInvNum;

		if (@@ERROR <> 0) return -1; 

		-- [comment omitted]
SELECT @featureFlag54734 = dbo.fn_GetFeatureEnabled(N'<literal:37>', NULL);  
  IF  (@featureFlag54734 = N'<literal:38>') 
		BEGIN
			-- [comment omitted]
			IF EXISTS (SELECT 1 FROM ITEM WHERE ITEM = @item  AND CATCH_WEIGHT_REQD = N'<literal:39>')
			BEGIN
				SELECT 
					@fromCatchWeight = CATCH_WEIGHT
				FROM CATCH_WEIGHT_INFORMATION
				WHERE INTERNAL_LOCATION_INV = @intLocInvNum;

				-- [comment omitted]
				UPDATE CATCH_WEIGHT_INFORMATION
				SET CATCH_WEIGHT = CATCH_WEIGHT + @fromCatchWeight,
					USER_STAMP = @userName,
					PROCESS_STAMP = N'<literal:40>',
					DATE_TIME_STAMP = GETUTCDATE()
				WHERE INTERNAL_LOCATION_INV = @toLocInvNum;

				if (@@ERROR <> 0) return -1;

				-- [comment omitted]
				DELETE FROM CATCH_WEIGHT_INFORMATION
				WHERE INTERNAL_LOCATION_INV = @intLocInvNum;

				if (@@ERROR <> 0) return -1;
			END
		END

		DELETE
			LOCATION_INVENTORY
		WHERE 
			INTERNAL_LOCATION_INV = @intLocInvNum;
		
		if (@@ERROR <> 0) return -1; 


		SET @intLocInvNum = @toLocInvNum;
		
	END
	
	-- [comment omitted]
	UPDATE 
		LOCATION_INVENTORY
	SET
		COMPANY = @toCompany,	
		ITEM_DESC =  @itemDesc,
		ITEM_SIZE =  @itemSize,
		ITEM_COLOR = @itemColor,
		ITEM_STYLE = @itemStyle,	
		TOTAL_COST = @costPerItem * ON_HAND_QTY ,
		TOTAL_VALUE = @valuePerItem * ON_HAND_QTY ,
		TOTAL_VOLUME = @volumePerItem * ON_HAND_QTY ,
		TOTAL_WEIGHT = @weightPerItem * ON_HAND_QTY ,
		USER_DEF1 = @userDef1,
		USER_DEF2 = @userDef2,
		USER_DEF3 = @userDef3,
		USER_DEF4 = @userDef4,
		USER_DEF5 = @userDef5,
		USER_DEF6 = @userDef6,
		USER_DEF7 = @userDef7,
		USER_DEF8 = @userDef8,
		INVENTORY_STS = @invSts,
		PROCESS_STAMP = N'<literal:41>',
		USER_STAMP = @userName,
		DATE_TIME_STAMP = GETUTCDATE(),
		EXPIRATION_DATE = @expDate
	WHERE
		INTERNAL_LOCATION_INV = @intLocInvNum;
	
	if (@@ERROR <> 0) return -1; 
	
	-- [comment omitted]
	IF(@lot IS NOT NULL)
	BEGIN
		-- [comment omitted]
		SELECT
			@existingLotRecordId = OBJECT_ID
		FROM
			LOT
		WHERE
			LOT = @lot
			AND ITEM = @item
			AND (COMPANY = @fromCompany or COMPANY IS NULL)
			AND WAREHOUSE = @fromWarehouse

		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		IF @sameLotExistsWithOldCompany = 1 AND @sameLotExistsWithNewCompany = 0
		BEGIN
			INSERT INTO
				LOT
			(
				LOT_TEMPLATE, 
				LOT, 
				ITEM, 
				COMPANY, 
				WAREHOUSE, 
				EXPIRATION_DATE, 
				FROZEN, 
				USER_DEF1, 
				USER_DEF2, 
				USER_DEF3, 
				USER_DEF4, 
				USER_DEF5, 
				USER_DEF6, 
				USER_DEF7, 
				USER_DEF8, 
				USER_STAMP, 
				PROCESS_STAMP, 
				DATE_TIME_STAMP, 
				INVENTORY_STS
			)
			SELECT
				LOT_TEMPLATE, 
				LOT, 
				ITEM, 
				@toCompany, 
				WAREHOUSE, 
				@expDate, 
				FROZEN, 
				USER_DEF1, 
				USER_DEF2, 
				USER_DEF3, 
				USER_DEF4, 
				USER_DEF5, 
				USER_DEF6, 
				USER_DEF7, 
				USER_DEF8, 
				USER_STAMP, 
				N'<literal:42>', 
				GETUTCDATE(), 
				INVENTORY_STS
			FROM
				LOT
			WHERE
				OBJECT_ID = @existingLotRecordId;
				
			if (@@ERROR <> 0) return -1; 

			SELECT
				@insertedLotRecordId = SCOPE_IDENTITY();
				
			-- [comment omitted]
			INSERT INTO
				LOT_ATTRIBUTE
			(
				LOT_ID, 
				ATTRIBUTE_TEMPLATE_ID, 
				VALUE, 
				USER_DEF1, 
				USER_DEF2, 
				USER_DEF3, 
				USER_DEF4, 
				USER_DEF5, 
				USER_DEF6, 
				USER_DEF7, 
				USER_DEF8, 
				USER_STAMP, 
				PROCESS_STAMP,
				DATE_TIME_STAMP
			)
			SELECT
				@insertedLotRecordId, 
				ATTRIBUTE_TEMPLATE_ID, 
				VALUE, 
				USER_DEF1, 
				USER_DEF2, 
				USER_DEF3, 
				USER_DEF4, 
				USER_DEF5, 
				USER_DEF6, 
				USER_DEF7, 
				USER_DEF8, 
				USER_STAMP, 
				N'<literal:43>', 
				GETUTCDATE()
			FROM
				LOT_ATTRIBUTE
			WHERE
				LOT_ID = @existingLotRecordId;
				
			if (@@ERROR <> 0) return -1; 
		END
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		ELSE IF @sameLotExistsWithOldCompany = 0 AND @sameLotExistsWithNewCompany = 1
		BEGIN
			-- [comment omitted]
			DELETE
				LOT_ATTRIBUTE
			WHERE
				LOT_ID = @existingLotRecordId;
				
			if (@@ERROR <> 0) return -1; 

			DELETE
				LOT
			WHERE
				OBJECT_ID = @existingLotRecordId;
				
			if (@@ERROR <> 0) return -1; 
		END
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		ELSE IF @sameLotExistsWithOldCompany = 0 AND @sameLotExistsWithNewCompany = 0
		BEGIN
			UPDATE
				LOT
			SET
				COMPANY = @toCompany,
				EXPIRATION_DATE = @expDate
			WHERE
				OBJECT_ID = @existingLotRecordId;
				
			if (@@ERROR <> 0) return -1; 
		END
	END
	
	UPDATE 
		LOCATION_UNIT_OF_MEASURE
	SET	
		COMPANY = @toCompany,
		PROCESS_STAMP = N'<literal:44>',
		USER_STAMP = @userName,
		DATE_TIME_STAMP = GETUTCDATE()
	WHERE
		INTERNAL_LOCATION_INV = @intLocInvNum;	
			
	if (@@ERROR <> 0) return -1; 

	INSERT INTO INVENTORY_ARGUMENT(
		GROUP_ID, 
		ARGUMENT_NAME, 
		ARGUMENT_VALUE)
		(SELECT 
				@argumentGrpid, 
				N'<literal:45>', 
				OBJECT_ID
		FROM 
				SERIAL_NUMBER 
		WHERE 
				LOC_INV_NUM = @intLocInvNum);
			
	if (@@ERROR <> 0) return -1; 
	SELECT @catchWeightFeatureFlag = dbo.fn_GetFeatureEnabled(N'<literal:46>', NULL);
		-- [comment omitted]
		IF (@catchWeightFeatureFlag = N'<literal:47>')
		BEGIN
	SELECT @catchWeight = CATCH_WEIGHT, @catchWeightUM = WEIGHT_UM FROM CATCH_WEIGHT_INFORMATION
	WHERE INTERNAL_LOCATION_INV = @toLocInvNum;
	end
	-- [comment omitted]
	exec @iError = INV_SaveHistInvChg 
			0,				
			null,									-- [comment omitted]
			null,									-- [comment omitted]
			null,									-- [comment omitted]
			null,									-- [comment omitted]
			null,									-- [comment omitted]
			null,									-- [comment omitted]
			@initOnHandQty,				-- [comment omitted]
			0,										-- [comment omitted]
			@intLocInvNum,				-- [comment omitted]
			@fromCompany,				-- [comment omitted]
			@logisticsUnit,									-- [comment omitted]
			null,									-- [comment omitted]
			@invSts, 							-- [comment omitted]
			@item,								-- [comment omitted]
			@fromLocation,				-- [comment omitted]
			@lot,								-- [comment omitted]
			@quantityUM,									-- [comment omitted]
			null,
			@refId,								-- [comment omitted]
			@refType,							-- [comment omitted]
			null, 
			@transactionType, 
			@userDef1, 
			@userDef2, 
			@userDef3, 
			@userDef4, 
			@userDef5, 
			@userDef6, 
			@userDef7, 
			@userDef8, 
			@userName, 
			@fromWarehouse, 
			null, 
			null, 
			null,
			@toCompany, 
			@fromWarehouse, 
			@initAllocQty, 
			@initInTransQty, 
			@initOnHandQty,
			@initSuspQty, 
			@initInvSts,
			@argumentGrpid,
			@expDate,
			null,
			@fromLocInvAttributesId,									-- [comment omitted]
			@catchWeight,
			@catchWeightUM ,
			@transHistActive; 
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

		
DELETE FROM 
	INVENTORY_ARGUMENT 
WHERE 
	GROUP_ID = @argumentGrpId;		
		
if (@@ERROR <> 0) return -1; 





