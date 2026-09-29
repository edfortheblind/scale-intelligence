-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */












































































-- [comment omitted]


CREATE PROCEDURE INV_PickFromLocation(
	@cForceOnHandZero nchar(1), -- [comment omitted]
	@cFromAllocEffect nchar(1), -- [comment omitted]
	@cFromInTransEffect nchar(1), -- [comment omitted]
	@cFromOnHandEffect nchar(1), -- [comment omitted]
	@cFromSuspEffect nchar(1), -- [comment omitted]
	@cToInTransitEffect nchar(1),
	@cToOnHandEffect nchar(1),
	@cReversal nchar(1), -- [comment omitted]
	@dOverrodeVolumePerItem numeric(28,5),
	@dOverrodeWeightPerItem numeric(28,5),
	@dQuantity numeric(19,5),
	@dReferenceLine numeric(19,5),
	@dtExpDate datetime,
	@dtManDate datetime,
	@iInternalNum numeric(9),
	@stCompany nvarchar(25),
	@stEquipmentType nvarchar(25),
	@stFromContId nvarchar(50),
	@stFromLoc nvarchar(25),	
	@stFromWhs nvarchar(25),
	@stInventorySts nvarchar(50),
	@stItem nvarchar(50),
	@stItemDesc nvarchar(100),
	@stLot nvarchar(25),
	@stQuantityUM nvarchar(25),
	@stRecContID nvarchar(25),
	@parentLogisticsUnit nvarchar(50),
	@stReferenceID nvarchar(25),
	@stReferenceType nvarchar(50),
	@stTeam nvarchar(50),
	@stTransType nvarchar(50),
	@stUserDef1 nvarchar(50),
	@stUserDef2 nvarchar(50),
	@stUserDef3 nvarchar(50),
	@stUserDef4 nvarchar(50),
	@stUserDef5 nvarchar(50),
	@stUserDef6 nvarchar(50),
	@dUserDef7 numeric(19,5),
	@dUserDef8 numeric(19,5),
	@stUserName nvarchar(30),
	@stWorkGroup nvarchar(25),
	@stWorkType nvarchar(25),
	@stWorkUnit nvarchar(50),
	@argumentGroupId nvarchar(32),
	@stToWhs nvarchar(25),
    @fromLocInvAttributeId numeric(9),
	@isNegativeAvailableAllowed bit = false,
	@catchWeight numeric(14,5) = NULL,
	@catchWeightUM nvarchar(25) = NULL,
	@dtFromAgingDate datetime output,
	@dtFromExpDate datetime output,
	@dtFromManDate datetime output,
	@dtFromRecDate datetime output,
	@stFromInvSts nvarchar(50) output,
	@stFromItemColor nvarchar(25) output,
	@stFromItemDesc nvarchar(100) output,
	@stFromItemSize nvarchar(25) output,
	@stFromItemStyle nvarchar(25) output,
	@cTransHistActive nvarchar(250) output,
	@internalLocUMs nvarchar(100) output,
	@fromIntLocInv numeric(9) output, -- [comment omitted]
    @shipContNum numeric(9) = NULL)
AS
	SET NOCOUNT ON;

    
	-- [comment omitted]
	-- [comment omitted]
	declare @iOPTIMISTICLOCKFAILUREMAX int;
	set @iOPTIMISTICLOCKFAILUREMAX = 3;

	-- [comment omitted]
	declare @dtAfterExpDate datetime;
	declare @cAdjustmentCompleted nchar(1);
	declare @cPermanent nchar(1);
	declare @cOriginalPermanent nchar(1);
	declare @dInitAllocQty numeric(19,5);
	declare @dInitInTransQty numeric(19,5);
	declare @dInitOnHandQty numeric(19,5);
	declare @dInitSuspQty numeric(19,5);
	declare @dNewAllocQty numeric(19,5);
	declare @dNewInTransQty numeric(19,5);
	declare @dNewOnHandQty numeric(19,5);
	declare @dNewSuspQty numeric(19,5);
	declare @dTotalOnHandQty numeric(19,5);
	declare @iError int;
	declare @iIntLocInv numeric(9);
    declare @initExpDate datetime;
	declare @iNumOfLockFailures int;
	declare @iRowCount int;
	declare @stCntTrack nchar(1);
	declare @stErrorMsg nvarchar(2000);
	declare @stInitInvSts nvarchar(50);
	declare @stDefaultInvSts nvarchar(200);
    declare @totalLotQty int;
    declare @internallocUM int;
    declare @histFromLocInvAttributeId numeric(9);
	declare @originalFromInvAttrId numeric(9);
	declare @allocateIntransit nchar(1)
	declare @fromLocationClass nvarchar(25)
	declare @lockResource nvarchar(255);
	declare @lockResult int;
	declare @catchWeightFeatureFlag nvarchar(1);
	declare @isItemCatchWeightRequired nchar(1);
	declare @isNewInventory nvarchar(1);
	declare @isValidCatchWeightUM nvarchar(1);
	declare @existingCatchWeightUM nvarchar(25);
	Declare @isCycleCountWork nvarchar(1);
	
	set @lockResult = -1;
	
	-- [comment omitted]
	set @originalFromInvAttrId = @fromLocInvAttributeId;

	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	set @iNumOfLockFailures = 0;
	WHILE (@cAdjustmentCompleted is null
		   AND @iNumOfLockFailures < @iOPTIMISTICLOCKFAILUREMAX)
	begin
		set @iRowCount = 0;
		WHILE @iRowCount <= 0
		begin
		
			SELECT @catchWeightFeatureFlag = dbo.fn_GetFeatureEnabled(N'<literal:1>', NULL);
			-- [comment omitted]
			IF (@catchWeightFeatureFlag = N'<literal:2>')
			BEGIN
				SELECT @isItemCatchWeightRequired = CATCH_WEIGHT_REQD FROM ITEM WHERE ITEM = @stItem AND ISNULL(COMPANY, N'<literal:3>') = ISNULL(@stCompany, N'<literal:4>');
			END
			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
			if (ISNULL(@fromLocInvAttributeId, 0) > 0 AND @stFromContId is not null AND NOT EXISTS (SELECT TOP 1 1 FROM LOCATION_INVENTORY WHERE LOC_INV_ATTRIBUTES_ID = @fromLocInvAttributeId and LOGISTICS_UNIT = @stFromContId))
			begin 
				declare @existingInvAttrId numeric(9);
				declare @lpSeparator nvarchar(1);
				declare @recContLikeId nvarchar(50);
				declare @fromContLikeId nvarchar(50);
				select @lpSeparator = SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where RECORD_TYPE = N'<literal:5>' and SYS_KEY = N'<literal:6>';

				-- [comment omitted]
				-- [comment omitted]
				if (@stRecContID is null)
					set @recContLikeId = @stRecContID;
				else
					set @recContLikeId = @stRecContID + @lpSeparator + N'<literal:7>';
				set @fromContLikeId = @stFromContId + @lpSeparator + N'<literal:8>';

				SELECT @existingInvAttrId = LOC_INV_ATTRIBUTES_ID
				FROM LOCATION_INVENTORY
				WHERE LOCATION = @stFromLoc
				   AND WAREHOUSE = @stFromWhs
				   AND ITEM = @stItem
				   AND ISNULL(COMPANY,N'<literal:9>') = ISNULL(@stCompany,N'<literal:10>')
				   AND (
		   				ISNULL(LOT,N'<literal:11>') = ISNULL(@stLot,N'<literal:12>')
		   				OR (LOT IS NULL AND PERMANENT = N'<literal:13>')
						)
		  
					AND (
		   				 LOGISTICS_UNIT LIKE @recContLikeId OR LOGISTICS_UNIT = @stRecContID
		   		    			OR
		   				 (LOGISTICS_UNIT LIKE @fromContLikeId OR LOGISTICS_UNIT = @stFromContId 
								 OR (LOGISTICS_UNIT IS NULL AND PERMANENT = N'<literal:14>'))
					     )
					AND (  
						 ISNULL(LOC_INV_ATTRIBUTES_ID,0) = ISNULL(@fromLocInvAttributeId,0)         
					     ); 	

				if (@existingInvAttrId is not null and @fromLocInvAttributeId != @existingInvAttrId)
				begin
					SET @fromLocInvAttributeId = @existingInvAttrId;
				end;
			end;

			SET @lockResource = ISNULL(@stFromLoc, N'<literal:15>') + ISNULL(@stFromWhs, N'<literal:16>') + ISNULL(@stItem, N'<literal:17>') + ISNULL(@stCompany, N'<literal:18>') + ISNULL(@stLot, N'<literal:19>') + ISNULL(@stFromContId, N'<literal:20>') + CONVERT(nvarchar, ISNULL(@fromLocInvAttributeId, 0)); 
			exec @lockResult = sp_getapplock @Resource=@lockResource, @LockMode = N'<literal:21>', @LockTimeout=-1
			
			-- [comment omitted]
			-- [comment omitted]
			SELECT @iIntLocInv = LI.INTERNAL_LOCATION_INV,
				   @cPermanent = LI.PERMANENT,
				   @cOriginalPermanent = LI.PERMANENT,
				   @dInitAllocQty = LI.ALLOCATED_QTY,
				   @dInitInTransQty = LI.IN_TRANSIT_QTY,
				   @dInitOnHandQty = LI.ON_HAND_QTY,
				   @dInitSuspQty = LI.SUSPENSE_QTY,
				   @stInitInvSts = LI.INVENTORY_STS,
				   @stCntTrack = LOC.TRACK_CONTAINERS,
                   @initExpDate = LI.EXPIRATION_DATE,
				   @allocateIntransit = LOC.ALLOCATE_IN_TRANSIT,
				   @fromLocationClass = LOC.LOCATION_CLASS
			  FROM LOCATION_INVENTORY LI WITH (updlock),
	  			LOCATION LOC
			 WHERE LOC.LOCATION = LI.LOCATION
			   AND LOC.WAREHOUSE = LI.WAREHOUSE	
			   AND LI.LOCATION = @stFromLoc
			   AND LI.WAREHOUSE = @stFromWhs
			   AND LI.ITEM = @stItem
			   AND (LI.COMPANY IS NULL OR (ISNULL(LI.COMPANY,N'<literal:22>') = ISNULL(@stCompany,N'<literal:23>')))
               AND (
				ISNULL(LI.LOC_INV_ATTRIBUTES_ID,0) = ISNULL(@fromLocInvAttributeId,0)	
				OR (LI.LOC_INV_ATTRIBUTES_ID IS NULL AND PERMANENT = N'<literal:24>')			
					)
			   AND (
			   	ISNULL(LOT,N'<literal:25>') = ISNULL(@stLot,N'<literal:26>')
			   	OR (LOT IS NULL AND PERMANENT = N'<literal:27>')
			       )
			   
			   AND (
			   	  LOGISTICS_UNIT = @stRecContID
			   		OR
			   	(ISNULL(LOGISTICS_UNIT,N'<literal:28>')  = ISNULL(@stFromContId,N'<literal:29>')
			         OR (LOGISTICS_UNIT IS NULL AND PERMANENT = N'<literal:30>'))
			);

	
			SELECT @iRowCount = @@ROWCOUNT;
			IF (@iRowCount <= 0 AND @catchWeightFeatureFlag = N'<literal:31>')
			BEGIN
				SET @isNewInventory = N'<literal:32>'
			END
			-- [comment omitted]
			if (@iRowCount <= 0)
			begin
				if (@stInventorySts is null
				    OR @stInventorySts = N'<literal:33>')
				begin
					-- [comment omitted]
					SELECT @stDefaultInvSts = SYSTEM_CONFIG_DETAIL.SYSTEM_VALUE
					FROM SYSTEM_CONFIG_DETAIL
					WHERE SYS_KEY = N'<literal:34>'
					AND RECORD_TYPE = N'<literal:35>';
				end;
				else SELECT @stDefaultInvSts = @stInventorySts;
				
				-- [comment omitted]
				set @dtAfterExpDate = @dtFromExpDate;

				-- [comment omitted]
				exec @iError = INV_InsertLocationInventory
					N'<literal:36>', N'<literal:37>', N'<literal:38>', N'<literal:39>', @dOverrodeVolumePerItem, @dOverrodeWeightPerItem, 
					0, @dtExpDate, @dtManDate, @stCompany, @stDefaultInvSts output, @stItem, @stItemDesc, @stLot, @stQuantityUM, 
					@stFromLoc, @stFromContId, @parentLogisticsUnit, @stFromWhs, @stUserName, @dtFromAgingDate, @dtFromExpDate, @dtFromManDate, @dtFromRecDate, @stFromInvSts, 
					@stFromItemColor, @stFromItemDesc, @stFromItemSize, @stFromItemStyle, @cPermanent, 
					@stUserDef1, @stUserDef2, @stUserDef3, @stUserDef4, @stUserDef5, @stUserDef6, @dUserDef7, @dUserDef8, @fromLocInvAttributeId, @stReferenceType,
					@iRowCount output, @iIntLocInv output;
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
				
				-- [comment omitted]
				UPDATE LOCATION SET LOCATION_STS = N'<literal:40>'
				WHERE LOCATION = @stFromLoc AND WAREHOUSE = @stFromWhs AND LOCATION_STS <> N'<literal:41>';
			end; -- [comment omitted]
		end;
		
		-- [comment omitted]
		if ((@cFromOnHandEffect = N'<literal:42>'
			AND @stCntTrack = N'<literal:43>' 
			AND @stFromContId is null)
		    OR (@cFromOnHandEffect = N'<literal:44>'
			AND @stCntTrack = N'<literal:45>' 
			AND @dInitOnHandQty > 0
			AND @stFromContId is null))
		begin
			set @stErrorMsg = N'<literal:46>' + dbo.RSCMfn_RtrvMsg(N'<literal:47>');
			RAISERROR(@stErrorMsg, 18, 1);
			return -1;
		end; -- [comment omitted]

		-- [comment omitted]
		set @dNewAllocQty = CASE WHEN @cFromAllocEffect = N'<literal:48>' 
								 THEN @dInitAllocQty + @dQuantity
								 WHEN @cFromAllocEffect = N'<literal:49>' 
								 THEN @dInitAllocQty - @dQuantity
								 ELSE @dInitAllocQty 
								 END;
		set @dNewInTransQty = CASE WHEN @cFromInTransEffect = N'<literal:50>' 
								   THEN @dInitInTransQty + @dQuantity
								   WHEN @cFromInTransEffect = N'<literal:51>' 
								   THEN @dInitInTransQty - @dQuantity
								   ELSE @dInitInTransQty 
								   END;
		set @dNewOnHandQty = CASE WHEN @cFromOnHandEffect = N'<literal:52>' 
								  THEN @dInitOnHandQty + @dQuantity
								  WHEN @cFromOnHandEffect = N'<literal:53>' 
								  THEN CASE WHEN @dInitOnHandQty <= 0 
												 and (@cForceOnHandZero = N'<literal:54>' 
												      or @cForceOnHandZero = N'<literal:55>')
											THEN @dInitOnHandQty
											WHEN @dInitOnHandQty - @dQuantity < 0
												 and (@cForceOnHandZero = N'<literal:56>' 
												      or @cForceOnHandZero = N'<literal:57>')
											THEN 0
											ELSE @dInitOnHandQty - @dQuantity
											END
								  ELSE @dInitOnHandQty 
								  END;
		set @dNewSuspQty = CASE WHEN @cFromSuspEffect = N'<literal:58>' 
								THEN @dInitSuspQty + @dQuantity
								WHEN @cFromSuspEffect = N'<literal:59>' 
								THEN @dInitSuspQty - @dQuantity
								ELSE 	@dInitSuspQty								
								END;

		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		if (@cPermanent = N'<literal:60>' OR @cPermanent = N'<literal:61>')
		begin
			SELECT INTERNAL_LOCATION_INV
			  FROM LOCATION_INVENTORY
			 WHERE LOCATION = @stFromLoc
			   AND WAREHOUSE = @stFromWhs
			   AND ITEM = @stItem
			   AND ISNULL(COMPANY,N'<literal:62>') = ISNULL(@stCompany,N'<literal:63>')
			   AND (PERMANENT = N'<literal:64>' OR PERMANENT = N'<literal:65>');

			if (@@ROWCOUNT > 1)
			begin
				set @cPermanent = N'<literal:66>';
			end;
		end;

		-- [comment omitted]
		-- [comment omitted]
		if (@dNewAllocQty = 0.0
			AND @dNewInTransQty = 0.0
			AND @dNewOnHandQty = 0.0
			AND @dNewSuspQty = 0.0)
		begin
			if(@cPermanent <> N'<literal:67>' AND @cPermanent <> N'<literal:68>')
			begin				
			-- [comment omitted]
			SELECT @dtFromAgingDate = AGING_DATE,
			   @dtFromExpDate = EXPIRATION_DATE,
			   @dtFromManDate = MANUFACTURED_DATE,
			   @dtFromRecDate = RECEIVED_DATE,
			   @stFromInvSts = INVENTORY_STS,
			   @stFromItemColor = ITEM_COLOR,
			   @stFromItemDesc = ITEM_DESC,
			   @stFromItemSize = ITEM_SIZE,
			   @stFromItemStyle = ITEM_STYLE 
			FROM LOCATION_INVENTORY
			WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
			
		
			exec @iError = INV_ArchiveSerialNumbers @iIntLocInv , @stTransType;
			end;
			
			if(@cPermanent = N'<literal:69>' OR @cPermanent = N'<literal:70>')
			begin
				SET @fromLocInvAttributeId = NULL;	
			end
			
			if (@cToOnHandEffect <> N'<literal:71>' AND @cToInTransitEffect <> N'<literal:72>')
			begin
				DELETE FROM LOCATION_UNIT_OF_MEASURE
				WHERE
					INTERNAL_LOCATION_INV = @iIntLocInv;

				if (@@ERROR <> 0) return -1;
			end
			else if exists(select internal_loc_um from location_unit_of_measure
					  where internal_location_inv = @iIntLocInv)
				begin
				      -- [comment omitted]
				       DECLARE  CURLUOM CURSOR FOR
					SELECT CAST(INTERNAL_LOC_UM AS VARCHAR) FROM LOCATION_UNIT_OF_MEASURE
					WHERE INTERNAL_LOCATION_INV = @iIntLocInv;

				      OPEN CURLUOM;

				      FETCH FROM CURLUOM INTO @internallocUM;

				      WHILE (@@FETCH_STATUS = 0)
					begin
						if (@internalLocUMs is null)
						begin
							set @internalLocUMs = ltrim(rtrim(@internallocUM));
						end
						else
						begin
						  set @internalLocUMs = @internalLocUMs + N'<literal:73>'+ ltrim(rtrim(@internallocUM));
						end;

						FETCH NEXT FROM CURLUOM INTO @internallocUM;
					        
					end;

				     	close curLUOM;

				     	deallocate curLUOM;
				

					UPDATE LOCATION_UNIT_OF_MEASURE
					SET  INTERNAL_LOCATION_INV = null
					WHERE
						INTERNAL_LOCATION_INV = @iIntLocInv;
				

				End
			else
			   Begin
				set @internalLocUMs = null;
			   End;

            if(@cPermanent <> N'<literal:74>' AND @cPermanent <> N'<literal:75>')
           begin
				if (@catchWeightFeatureFlag = N'<literal:76>' AND @isItemCatchWeightRequired = N'<literal:77>')
				BEGIN
					-- [comment omitted]
					IF EXISTS(SELECT 1 FROM LOCATION_INVENTORY
					 WHERE INTERNAL_LOCATION_INV = @iIntLocInv
					   AND ALLOCATED_QTY = @dInitAllocQty
					   AND IN_TRANSIT_QTY = @dInitInTransQty
					   AND ON_HAND_QTY = @dInitOnHandQty
					   AND SUSPENSE_QTY = @dInitSuspQty)
					BEGIN
						DELETE FROM CATCH_WEIGHT_INFORMATION 
						WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
						DELETE FROM SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION
						WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
					END
				END
				
			-- [comment omitted]
			DELETE LOCATION_INVENTORY
			 WHERE INTERNAL_LOCATION_INV = @iIntLocInv
			   AND ALLOCATED_QTY = @dInitAllocQty
			   AND IN_TRANSIT_QTY = @dInitInTransQty
			   AND ON_HAND_QTY = @dInitOnHandQty
			   AND SUSPENSE_QTY = @dInitSuspQty;
			SELECT @iError = @@ERROR, @iRowCount = @@ROWCOUNT;
			if (@iError <> 0) return -1;
			   
			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
			if (@iRowCount <= 0)
			begin
				set @iNumOfLockFailures = @iNumOfLockFailures + 1;
			end; -- [comment omitted]
			else
			begin
				set  @dtAfterExpDate = NULL;
				set @cAdjustmentCompleted = N'<literal:78>';				
			end;
			end;
		end; -- [comment omitted]
		if ((@dNewAllocQty <> 0.0
			OR @dNewInTransQty <> 0.0
			OR @dNewOnHandQty <> 0.0
			OR @dNewSuspQty <> 0.0 )
			OR @cPermanent = N'<literal:79>' OR @cPermanent = N'<literal:80>')
		begin
			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]

			-- [comment omitted]
			if(@isNegativeAvailableAllowed =N'<literal:81>')
			Begin
				If(
				(@fromLocationClass = N'<literal:82>' AND @cFromAllocEffect = N'<literal:83>'  AND (@allocateIntransit =N'<literal:84>' OR @allocateIntransit =N'<literal:85>') AND
				( @dInitOnHandQty + @dInitInTransQty - @dInitSuspQty - @dNewAllocQty) < 0) 
				OR
				(@fromLocationClass =N'<literal:86>' AND @cFromAllocEffect = N'<literal:87>'AND (@allocateIntransit =N'<literal:88>' OR @allocateIntransit =N'<literal:89>') AND 
				( @dInitOnHandQty - @dInitSuspQty - @dNewAllocQty) < 0)
				OR 
				(@fromLocationClass =N'<literal:90>' AND @cFromOnHandEffect =N'<literal:91>' AND @dNewOnHandQty < 0.0 AND @dNewInTransQty=0.0))
				begin
						
					set @stErrorMsg = N'<literal:92>' + dbo.RSCMfn_RtrvMsg(N'<literal:93>'); 		
					RAISERROR(@stErrorMsg , 18, 1);
					return -1;   
				End
			end;

			exec @iError = INV_UpdateFromLocInv
					@iIntLocInv,
					@dInitAllocQty, @dInitInTransQty, @dInitOnHandQty, @dInitSuspQty,
					@dNewAllocQty, @dNewInTransQty, @dNewOnHandQty, @dNewSuspQty, 
					@dOverrodeVolumePerItem, @dOverrodeWeightPerItem, 
					@stUserName,@fromLocInvAttributeId,
					@dtFromAgingDate output, @dtFromExpDate output, @dtFromManDate output, @dtFromRecDate output, @stFromInvSts output, @stFromItemColor output, @stFromItemDesc output, @stFromItemSize output, @stFromItemStyle output,
					@iRowCount output;
			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
			
			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
			if (@iRowCount <= 0)
				set @iNumOfLockFailures = @iNumOfLockFailures + 1;
			else
				begin
					set @dtAfterExpDate = @dtFromExpDate;
					set @cAdjustmentCompleted = N'<literal:94>';
				end;
		end; -- [comment omitted]
	end; -- [comment omitted]
	
	-- [comment omitted]
	if (@cAdjustmentCompleted is null)
	begin
		set @stErrorMsg = 
			N'<literal:95>' + dbo.RSCMfn_RtrvMsg(N'<literal:96>'); 				
		RAISERROR(@stErrorMsg , 18, 1);
		return -1;
	end; -- [comment omitted]

	-- [comment omitted]
	if (@dInitAllocQty = 0.0
		and @dInitInTransQty = 0.0
		and @dInitOnHandQty = 0.0
		and @dInitSuspQty = 0.0)
	begin
		-- [comment omitted]
		if (@stLot is not null)
		begin

			-- [comment omitted]
			-- [comment omitted]
			if(@cOriginalPermanent = N'<literal:97>' or @cOriginalPermanent = N'<literal:98>')
			begin
				UPDATE LOCATION_INVENTORY 
					SET LOT = @stLot, 
					EXPIRATION_DATE = @dtExpDate
				WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
			end;
			
			exec @iError = INV_ProcessLotInNewInventory @stFromLoc, @stLot, @stItem, @stCompany, 
					@stFromWhs, @dtExpDate, @stInventorySts,@argumentGroupId;
			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
			
		end; -- [comment omitted]
		
		if (@stFromContId is not null and (@stCntTrack = N'<literal:99>' or @stCntTrack = N'<literal:100>'))
		begin
			UPDATE LOCATION_INVENTORY SET LOGISTICS_UNIT = @stFromContId 
			WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
		end
		-- [comment omitted]
		else if (@stRecContID is not null and (@stCntTrack = N'<literal:101>' or @stCntTrack = N'<literal:102>'))
		begin
			UPDATE LOCATION_INVENTORY SET LOGISTICS_UNIT = @stRecContID
			WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
		end

		if (@fromLocInvAttributeId is not null and @fromLocInvAttributeId > 0)
		begin

			-- [comment omitted]
			if(@cOriginalPermanent = N'<literal:103>' or @cOriginalPermanent = N'<literal:104>')
			begin
				UPDATE LOCATION_INVENTORY 
					SET LOC_INV_ATTRIBUTES_ID = @fromLocInvAttributeId
				WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
			end;
			
		end; -- [comment omitted]
		
	end; -- [comment omitted]

	if ((@stTransType = N'<literal:105>' or @stTransType=N'<literal:106>') and @stDefaultInvSts is not null)
		set @stInventorySts = @stDefaultInvSts;					


	-- [comment omitted]
	if (@dNewAllocQty = 0.0
		AND @dNewInTransQty = 0.0
		AND @dNewOnHandQty = 0.0
		AND @dNewSuspQty = 0.0)
	begin
		if (@stLot is not null
		    and (isnull(@cToOnHandEffect, N'<literal:107>') <> N'<literal:108>' or 
			(@stFromWhs <> @stToWhs and @stFromWhs is not null 
			and @stToWhs is not null)))
		begin
			exec @iError = INV_ProcessLotWhenEmptyingInv @stFromLoc, @stLot, @stItem, @stCompany, @stFromWhs, @stFromContId;
			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
		end;

		-- [comment omitted]
		DELETE FROM LOCATION_UNIT_OF_MEASURE
		WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
			 
		-- [comment omitted]
		set @stInventorySts = null;
	end; -- [comment omitted]
	
	-- [comment omitted]
	SET @fromIntLocInv = @iIntLocInv;
	
	-- [comment omitted]
	if (@cFromOnHandEffect = N'<literal:109>')
	begin
		
		-- [comment omitted]
		SELECT @dTotalOnHandQty = ISNULL(SUM(LI.ON_HAND_QTY),0)
			  FROM LOCATION_INVENTORY LI,
	  			LOCATION LOC
			 WHERE LOC.LOCATION = LI.LOCATION
			   AND LOC.WAREHOUSE = LI.WAREHOUSE	
			   AND LI.LOCATION = @stFromLoc
			   AND LI.WAREHOUSE = @stFromWhs
			   AND LI.ITEM = @stItem
			   AND 
					((LI.COMPANY IS NULL AND @stCompany IS NULL)
					OR
					(LI.COMPANY = @stCompany));

		exec @iError = INV_CheckLocThreshold @stItem, @stItemDesc, @stCompany, @stLot,
								   @stFromLoc, @stFromWhs, @stFromContId, @fromLocInvAttributeId, 
								   @stWorkUnit, @dTotalOnHandQty, @stQuantityUm,
								   @stUserName;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	end; -- [comment omitted]
		
	-- [comment omitted]
	exec @iError = INV_UpdateLocation
			0,
			@stFromLoc, @stFromWhs, @stUserName,
			@dNewAllocQty, @dNewInTransQty, @dNewOnHandQty, @dNewSuspQty, 
			@cFromOnHandEffect,	@stCompany, @stItem, @stQuantityUm, @stLot,
			@stFromContId;	
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;

		-- [comment omitted]
	IF (@catchWeightFeatureFlag = N'<literal:110>')
	BEGIN
		SET @isValidCatchWeightUM =
		CASE
			WHEN @isNewInventory IS NULL THEN N'<literal:111>'
			WHEN @isNewInventory = N'<literal:112>' AND @catchWeightUM IS NOT NULL THEN N'<literal:113>'
			ELSE N'<literal:114>'
		END;
	END
	ELSE
	BEGIN
		SET @isValidCatchWeightUM = N'<literal:115>'
	END
	/* [comment omitted] */

	if (@catchWeightFeatureFlag = N'<literal:116>' and @isItemCatchWeightRequired = N'<literal:117>' and @catchWeight is not null and @isValidCatchWeightUM = N'<literal:118>')
	begin
		IF (@stWorkType IS NOT NULL and @stWorkType <> N'<literal:119>')

		BEGIN
			-- [comment omitted]

			-- [comment omitted]
			select @isCycleCountWork =

				CASE
					WHEN WORK_GROUP = N'<literal:120>' THEN N'<literal:121>'

					ELSE N'<literal:122>'
				END

			from WORK_TYPE where WORK_TYPE = @stWorkType;


			SET @isCycleCountWork = ISNULL(@isCycleCountWork, N'<literal:123>');

		END -- [comment omitted]
		ELSE
		BEGIN
			SET @isCycleCountWork = N'<literal:124>';
		END
        if (@dNewAllocQty = 0.0
			AND @dNewInTransQty = 0.0
			AND @dNewOnHandQty = 0.0
			AND @dNewSuspQty = 0.0)
		begin
			delete from catch_weight_information 
			where internal_location_inv = @iIntLocInv;
		end
		else
		begin
		if (@cFromOnHandEffect = N'<literal:125>')
		BEGIN
			-- [comment omitted]
            SELECT     
                @catchWeight = 
				CASE 
					WHEN (@catchWeight <= 0 AND @dInitOnHandQty > 0 AND @isCycleCountWork = N'<literal:126>') THEN 
						((CATCH_WEIGHT/@dInitOnHandQty) * (@dInitOnHandQty - @dNewOnHandQty))
					ELSE @catchWeight
				END,
                @existingCatchWeightUM = WEIGHT_UM
            FROM CATCH_WEIGHT_INFORMATION
            WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
    
			SET @catchWeightUM = 
			CASE
				WHEN @catchWeightUM IS NULL AND @existingCatchWeightUM IS NOT NULL THEN @existingCatchWeightUM
				ELSE @catchWeightUM
			END;
			
			if (@isCycleCountWork = N'<literal:127>' and (@shipContNum is null OR @shipContNum = 0 OR NOT EXISTS(SELECT 1 FROM SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION     
                      WHERE SHIP_CONT_NUM = @shipContNum)))
			begin
				UPDATE catch_weight_information
				SET CATCH_WEIGHT = (CATCH_WEIGHT + @catchWeight),
					WEIGHT_UM = @catchWeightUM,
					USER_STAMP = @stUserName,
					PROCESS_STAMP = N'<literal:128>',
					DATE_TIME_STAMP = GETUTCDATE()
				WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
			end
			else if(@shipContNum is null OR @shipContNum = 0 OR NOT EXISTS(SELECT 1 FROM SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION     
                      WHERE SHIP_CONT_NUM = @shipContNum))
			BEGIN
				UPDATE catch_weight_information
				SET CATCH_WEIGHT = (CATCH_WEIGHT - @catchWeight),
					WEIGHT_UM = @catchWeightUM,
					USER_STAMP = @stUserName,
					PROCESS_STAMP = N'<literal:129>',
					DATE_TIME_STAMP = GETUTCDATE()
				WHERE INTERNAL_LOCATION_INV = @iIntLocInv;
			END
		END
		end
	end;

	-- [comment omitted]
	set @histFromLocInvAttributeId = @fromLocInvAttributeId;
	-- [comment omitted]
	if (isnull(@histFromLocInvAttributeId, 0) = 0)
	begin 
		set @histFromLocInvAttributeId = @originalFromInvAttrId;
	end

	-- [comment omitted]
	exec @iError = INV_SaveHistInvChg
			0,
			@cForceOnHandZero, @cFromAllocEffect, @cFromInTransEffect, @cFromOnHandEffect, @cReversal, @cFromSuspEffect, @dQuantity, @dReferenceLine, @iInternalNum, @stCompany, @stFromContId, @stEquipmentType, @stInventorySts, @stItem, @stFromLoc, @stLot, @stQuantityUM, @stRecContID, @stReferenceID, @stReferenceType, @stTeam, @stTransType, @stUserDef1, @stUserDef2, @stUserDef3, @stUserDef4, @stUserDef5, @stUserDef6, @dUserDef7, @dUserDef8, @stUserName, @stFromWhs, @stWorkGroup, @stWorkType, @stWorkUnit,
			@stCompany, @stToWhs, @dInitAllocQty, @dInitInTransQty, @dInitOnHandQty, @dInitSuspQty, @stInitInvSts,
			@argumentGroupId,@dtAfterExpDate,@initExpDate,@histFromLocInvAttributeId,
			@catchWeight, @catchWeightUM,
			@cTransHistActive output;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- [comment omitted]
