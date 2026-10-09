/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	16820		| RR		| 07/28/05	| Created.
	19143		| KSP		| 07/23/06	| License Plate Tracking	
	20671		| DSK		| 03/06/07	| Consider if the transferred item/ company is present already
	11075		| VK		| 09/26/07	| Setting QtyUm on history
	22859		| KRG		| 03/25/08	| Updated LOT/LOT_ATTRIBUTE on Company Transfer for LOT controlled inventory
	75570		| SSH		| 05/26/10	| Added logic to consider inventory attributes and pass parameter @locInvAttributesId to INV_SaveHistInvChg.

	79393		| DN		| 01/31/11	| Modified to write LP to transaction history
	100514		| MMM		| 06/21/12	| Handled updation of new expiration date on company transfer
	101273		| SAM		| 07/13/12	| Handled exception caused by expiration date having null value 
	185012		| MJ		| 03/15/21	| Added support to transfer item without company in item master.
	Transfers company in inventory.
	
	Parameters
		All adjustment information passed from business logic.
*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


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
    --Check if the same LOT exists in any other Location Inventory with the old company
	declare	@sameLotExistsWithOldCompany bit;

	--Check if the same LOT exists in any other Location Inventory with the new company
	declare	@sameLotExistsWithNewCompany bit;

	declare @existingLotRecordId numeric(9);
	declare @insertedLotRecordId numeric(9);

	SET @sameLotExistsWithOldCompany = 0;
	SET @sameLotExistsWithNewCompany = 0;    
		
	select  @isItemWithoutCompany = count(*) from item where item = @item and company is null

	-- return immediately if invalid parameters are given.
	if (@item is null
			or @invSts is null 
			or @fromLocation is null 
			or @fromWarehouse is null 
			or (@fromCompany is null and @isItemWithoutCompany = 0)
			or @toCompany is null)
	begin
		-- log an audit to record that this procedure was called in
		-- an unexpected way.
		set @stErrorMsg = 
				N'MSG_INVENTORY16: ' + dbo.RSCMfn_RtrvMsg(N'MSG_INVENTORY16'); 
				
		set @fromToCompany = isnull(@fromCompany,N'null') + N' / ' + 
			   isnull(@toCompany,N'null');
			   
		exec @iError = ADT_LogAudit 
				N'INV_TransferCompany',										-- procName
				null,																		-- returnValue
				@stErrorMsg,														-- message
				N'intLocInvNum: ', @intLocInvNum,						-- parm1
				N'item: ', @item,														-- parm2
				N'from / to company: ', @fromToCompany,				-- parm3
				N'fromLocation: ', @fromLocation,							-- parm4
				N'inventoryStatus: ', @invSts,								-- parm5
				N'transactionType: ', @transactionType,				-- parm6
				N'referenceId: ', @refId,											-- parm7
				N'referenceType: ', @refType,								-- parm8
				N'transactionHistoryActive: ', @transHistActive,		-- parm9
				N'argumentGroupId: ', @argumentGrpid,				-- parm10
				@userName,														-- userName
				@fromWarehouse;												-- warehouse
				
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		return;
	end; -- end if no invalid parameters.

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
		-- log an audit to record that another process has changed 
		-- inventory before we could transfer the company
		SET @stErrorMsg = N'MSG_INVENTORY15: ' 
						  + dbo.RSCMfn_RtrvMsg(N'MSG_INVENTORY15'); 
						  
		SET @fromToCompany = ISNULL(@fromCompany,N'null')
							 + N' / ' + 
						     ISNULL(@toCompany,N'null');
						     
		EXEC @iError = ADT_LogAudit 
					N'INV_TransferCompany',										-- procName
					null,																		-- returnValue
					@stErrorMsg,														-- message
					N'intLocInvNum: ', @intLocInvNum,						-- parm1
					N'item: ', @item,														-- parm2
					N'from / to company: ', @fromToCompany,				-- parm3
					N'fromLocation: ', @fromLocation,							-- parm4
					N'inventoryStatus: ', @invSts,								-- parm5
					N'transactionType: ', @transactionType,				-- parm6
					N'referenceId: ', @refId,											-- parm7
					N'referenceType: ', @refType,								-- parm8
					N'transactionHistoryActive: ', @transHistActive,		-- parm9
					N'argumentGroupId: ', @argumentGrpid,				-- parm10
					@userName,														-- userName
					@fromWarehouse;												-- warehouse
		
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		return;
	END;
	
if (@iError <> 0) return -1; 

	-- Get the item details for the company transfered
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

	-- Check if the item/company record already exists for the Location/ License plate combination
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
	
	
 	--If this is a LOT controlled inventory,
 	--Set a couple of flags to indicate whether the same LOT exists in some other inventory
 	--with/without the same Company associated with it.
 	IF(@lot IS NOT NULL)
	BEGIN
		IF EXISTS
		(
			SELECT
				N'true'
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
				N'true'
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
	BEGIN -- Needs to merge the record

		--Update the quantity, cost, volume etc
		UPDATE 
			LOCATION_INVENTORY 
		SET 
			ALLOCATED_QTY = LI.ALLOCATED_QTY + @initAllocQty ,
			IN_TRANSIT_QTY  = LI.IN_TRANSIT_QTY + @initInTransQty  ,
			ON_HAND_QTY = LI.ON_HAND_QTY + @initOnHandQty ,
			SUSPENSE_QTY = LI.SUSPENSE_QTY + @initSuspQty ,			
			PROCESS_STAMP = N'INV_TransferCompany',
			USER_STAMP = @userName,
			DATE_TIME_STAMP = GETUTCDATE(),
			EXPIRATION_DATE = @expDate
		FROM LOCATION_INVENTORY LI
		WHERE 
			INTERNAL_LOCATION_INV = @toLocInvNum

		if (@@ERROR <> 0) return -1;

		-- If the item is serial number tracked, update the serial number to point to the
		-- modified location
	    UPDATE 
			SERIAL_NUMBER 
	    SET 
			LOC_INV_NUM  = @toLocInvNum,
			PROCESS_STAMP = N'INV_TransferCompany',
			USER_STAMP = @userName,
			DATE_TIME_STAMP = GETUTCDATE()
		WHERE 
			LOC_INV_NUM = @intLocInvNum;

		if (@@ERROR <> 0) return -1; 

		-- Handle catch weight merge if feature is enabled and item requires catch weight    
SELECT @featureFlag54734 = dbo.fn_GetFeatureEnabled(N'FEATURE_54734_CATCH_WEIGHT', NULL);  
  IF  (@featureFlag54734 = N'Y') 
		BEGIN
			-- Only process catch weight if item requires it
			IF EXISTS (SELECT 1 FROM ITEM WHERE ITEM = @item  AND CATCH_WEIGHT_REQD = N'Y')
			BEGIN
				SELECT 
					@fromCatchWeight = CATCH_WEIGHT
				FROM CATCH_WEIGHT_INFORMATION
				WHERE INTERNAL_LOCATION_INV = @intLocInvNum;

				-- Update target catch weight
				UPDATE CATCH_WEIGHT_INFORMATION
				SET CATCH_WEIGHT = CATCH_WEIGHT + @fromCatchWeight,
					USER_STAMP = @userName,
					PROCESS_STAMP = N'INV_TransferCompany',
					DATE_TIME_STAMP = GETUTCDATE()
				WHERE INTERNAL_LOCATION_INV = @toLocInvNum;

				if (@@ERROR <> 0) return -1;

				-- Delete catch weight record for source location inventory
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
	
	-- This is the normal flow, When no merging occurs
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
		PROCESS_STAMP = N'INV_TransferCompany',
		USER_STAMP = @userName,
		DATE_TIME_STAMP = GETUTCDATE(),
		EXPIRATION_DATE = @expDate
	WHERE
		INTERNAL_LOCATION_INV = @intLocInvNum;
	
	if (@@ERROR <> 0) return -1; 
	
	--If this is a LOT controlled inventory, we might need to update LOT/LOT_ATTRIBUTE tables
	IF(@lot IS NOT NULL)
	BEGIN
		--Store the primary key of the LOT record for the current inventory
		SELECT
			@existingLotRecordId = OBJECT_ID
		FROM
			LOT
		WHERE
			LOT = @lot
			AND ITEM = @item
			AND (COMPANY = @fromCompany or COMPANY IS NULL)
			AND WAREHOUSE = @fromWarehouse

		--If the same LOT is associated with the old company in a different inventory,
		--and if the same LOT is not associated with the new Company in any other inventory,
		--we need to insert a fresh record in the LOT table.
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
				N'INV_TransferCompany', 
				GETUTCDATE(), 
				INVENTORY_STS
			FROM
				LOT
			WHERE
				OBJECT_ID = @existingLotRecordId;
				
			if (@@ERROR <> 0) return -1; 

			SELECT
				@insertedLotRecordId = SCOPE_IDENTITY();
				
			--If the same LOT has attribute(s) assciated with it, we need to insert fresh record(s) for the same	
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
				N'INV_TransferCompany', 
				GETUTCDATE()
			FROM
				LOT_ATTRIBUTE
			WHERE
				LOT_ID = @existingLotRecordId;
				
			if (@@ERROR <> 0) return -1; 
		END
		--If the same LOT is not associated with the old company in a different inventory,
		--and if the same LOT is associated with the new Company in any other inventory,
		--we need to delete off the LOT record associated with the old company.
		ELSE IF @sameLotExistsWithOldCompany = 0 AND @sameLotExistsWithNewCompany = 1
		BEGIN
			--If the same LOT has attribute(s) assciated with it, we need to delete them
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
		--If the same LOT is not associated with the old company in a different inventory,
		--and if the same LOT is not associated with the new Company in any other inventory,
		--we need to update the existing LOT record associated with the old company.
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
		PROCESS_STAMP = N'INV_TransferCompany',
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
				N'SERIALNUMBER', 
				OBJECT_ID
		FROM 
				SERIAL_NUMBER 
		WHERE 
				LOC_INV_NUM = @intLocInvNum);
			
	if (@@ERROR <> 0) return -1; 
	SELECT @catchWeightFeatureFlag = dbo.fn_GetFeatureEnabled(N'FEATURE_54734_CATCH_WEIGHT', NULL);
		-- set variable to know if item is catchweight required or not. if FF 
		IF (@catchWeightFeatureFlag = N'Y')
		BEGIN
	SELECT @catchWeight = CATCH_WEIGHT, @catchWeightUM = WEIGHT_UM FROM CATCH_WEIGHT_INFORMATION
	WHERE INTERNAL_LOCATION_INV = @toLocInvNum;
	end
	-- write TransactionHistory.
	exec @iError = INV_SaveHistInvChg 
			0,				
			null,									--cForceOnHandZero nchar(1)
			null,									--@cAllocEffect nchar(1),
			null,									--@cInTransEffect nchar(1),
			null,									--@cOnHandEffect nchar(1),
			null,									--@cReversal nchar(1),
			null,									--@cSuspEffect nchar(1),
			@initOnHandQty,				--@dQuantity numeric(19,5),
			0,										--@dReferenceLine numeric(19,5),
			@intLocInvNum,				--@iInternalNum numeric(9),
			@fromCompany,				--@stCompany nvarchar(25),
			@logisticsUnit,									--@stContId nvarchar(50),
			null,									--@stEquipmentType nvarchar(25),
			@invSts, 							--@stInventorySts nvarchar(50),
			@item,								--@stItem nvarchar(50),
			@fromLocation,				--@stLoc nvarchar(25),
			@lot,								--@stLot nvarchar(25),
			@quantityUM,									--@stQuantityUM nvarchar(25),
			null,
			@refId,								--@stReferenceID nvarchar(25),
			@refType,							--@stReferenceType nvarchar(50),
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
			@fromLocInvAttributesId,									--@locInvAttributesId
			@catchWeight,
			@catchWeightUM ,
			@transHistActive; 
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

		
DELETE FROM 
	INVENTORY_ARGUMENT 
WHERE 
	GROUP_ID = @argumentGrpId;		
		
if (@@ERROR <> 0) return -1; 





