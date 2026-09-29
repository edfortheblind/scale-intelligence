-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */
































































































      
-- [comment omitted]

CREATE PROCEDURE INV_PutIntoLocation(
	@cForceOnHandZero nchar(1), -- [comment omitted]
	@cReversal nchar(1), -- [comment omitted]
	@cToAllocEffect nchar(1), -- [comment omitted]
	@cToInTransEffect nchar(1), -- [comment omitted]
	@cToOnHandEffect nchar(1), -- [comment omitted]
	@cToSuspEffect nchar(1), -- [comment omitted]
	@dOverrodeVolumePerItem numeric(28,5),
	@dOverrodeWeightPerItem numeric(28,5),
	@dQuantity numeric(19,5),
	@dReferenceLine numeric(19,5),
	@dtExpDate datetime,
	@dtManDate datetime,
	@iInternalNum numeric(9),
	@stCompany nvarchar(25),
	@stEquipmentType nvarchar(25),
	@stInventorySts nvarchar(50),
	@stItem nvarchar(50),
	@stItemDesc nvarchar(100),
	@stLot nvarchar(25),
	@stQuantityUM nvarchar(25),
	@stRecContID nvarchar(25),
	@stParentLogisticsUnit nvarchar(50),
	@stReferenceID nvarchar(25),
	@stReferenceType nvarchar(50),
	@stTeam nvarchar(50),
	@stToContId nvarchar(50),
	@stToLoc nvarchar(25),
	@stToWhs nvarchar(25),
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
	@dtFromAgingDate datetime,
	@dtFromExpDate datetime,
	@dtFromManDate datetime,
	@dtFromRecDate datetime,
	@stFromInvSts nvarchar(50),
	@stFromItemColor nvarchar(25),
	@stFromItemDesc nvarchar(100),
	@stFromItemSize nvarchar(25),
	@stFromItemStyle nvarchar(25),
	@cTransHistActive nvarchar(250),
	@internalLocUMs nvarchar(100),
	@fromIntLocInv numeric(9),
	@isNegativeAvailableAllowed bit = false,	
	@catchWeight numeric(14,5) = NULL,
	@catchWeightUM nvarchar(25) = NULL,
	@shipContNum numeric(9) = NULL,
	@toLocInvAttributeId numeric(9) output)
AS
	SET NOCOUNT ON;
	
	-- [comment omitted]
	-- [comment omitted]
	declare @iOPTIMISTICLOCKFAILUREMAX int;
	declare @iDFLT_INVENTORY_STS int;
	declare @stINVENTORY nvarchar(25);
	
	set @iOPTIMISTICLOCKFAILUREMAX = 3;
	
	-- [comment omitted]
	declare @cAdjustmentCompleted nchar(1);
	declare @cEmpty nchar(1);
	declare @cPermanent nchar(1);
	declare @dInitAllocQty numeric(19,5);
	declare @dInitInTransQty numeric(19,5);
	declare @dInitOnHandQty numeric(19,5);
	declare @dInitSuspQty numeric(19,5);
	declare @dNewAllocQty numeric(19,5);
	declare @dNewInTransQty numeric(19,5);
	declare @dNewOnHandQty numeric(19,5);
	declare @dNewSuspQty numeric(19,5);
	declare @existingLocUmCount int;
	declare @iError int;
	declare @iIntLocInv numeric(9);
	declare @iNumOfLockFailures int;
	declare @iRowCount int;
	declare @stCntTrack nchar(1);
	declare @multiItem nchar(1);
	declare @stErrorMsg nvarchar(2000);
	declare @stInitInvSts nvarchar(50);
    declare @initExpDate datetime;
	declare @tempToWhs nvarchar(25);
	declare @toAgingDate datetime;	
	declare @toReceivedDate datetime;
	declare @agingDate datetime;
	declare @intContNum numeric(9);
	declare @fromLoc nvarchar(25);	
	declare @toLocLocationClass nvarchar(25);
	declare @fromLocLocationClass nvarchar(25);
	declare @toLocationStatus nvarchar(50);
	declare @HistToLocInvAttributeId numeric(9);
	declare @attrIDCount numeric(9);
	declare @allocateIntransit nchar(1)    
	declare @lockResource nvarchar(255);
	declare @lockResult int;	
	declare @newLocationInventoryRows int;
	declare @shouldCopyLUM char(1);
	declare @afterExpDateTime datetime;
	declare @catchWeightFeatureFlag nvarchar(1);
	declare @isItemCatchWeightRequired nchar(1);
	declare @isNewInventory nvarchar(1);
	declare @isValidCatchWeightUM nvarchar(1);
	set @lockResult = -1;
	
	-- [comment omitted]
	set @HistToLocInvAttributeId = @toLocInvAttributeId;

		
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	set @iNumOfLockFailures = 0;
	WHILE (@cAdjustmentCompleted is null
		   AND @iNumOfLockFailures < @iOPTIMISTICLOCKFAILUREMAX)
	begin

		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		
		SET @shouldCopyLUM = N'<literal:1>';		
		
		-- [comment omitted]
		if (@cToOnHandEffect in (N'<literal:2>',N'<literal:3>')
		    AND @stToContId is null)
		begin
			SELECT @stCntTrack = TRACK_CONTAINERS
		  	FROM LOCATION
		 	WHERE LOCATION = @stToLoc
		   	AND WAREHOUSE = @stToWhs
			
			if (@stCntTrack = N'<literal:4>')
			begin
				set @stErrorMsg = N'<literal:5>' + dbo.RSCMfn_RtrvMsg(N'<literal:6>'); 				
				RAISERROR(@stErrorMsg , 18, 1);
				return -1;
			end; 
		end;
		SELECT @catchWeightFeatureFlag = dbo.fn_GetFeatureEnabled(N'<literal:7>', NULL);
		-- [comment omitted]
		IF (@catchWeightFeatureFlag = N'<literal:8>')
		BEGIN
			SELECT @isItemCatchWeightRequired = CATCH_WEIGHT_REQD FROM ITEM WHERE ITEM = @stItem AND ISNULL(COMPANY, N'<literal:9>') = ISNULL(@stCompany, N'<literal:10>');
		END
		
		-- [comment omitted]
		SELECT @intContNum = INTERNAL_REC_CONT_NUM FROM RECEIPT_CONTAINER WHERE
		(CONTAINER_ID = @stRecContID OR CONTAINER_ID = @stToContId);

		-- [comment omitted]
		set  @dtFromExpDate = 	CASE WHEN @dtFromExpDate is not null
								THEN @dtFromExpDate
								ELSE @dtExpDate
								END;
								
		SET @toAgingDate = @dtFromAgingDate;
		SET @toReceivedDate = @dtFromRecDate;
								
		-- [comment omitted]
		IF EXISTS (SELECT 1 FROM LOCATION WHERE LOCATION = @stToLoc 
				AND WAREHOUSE = @stToWhs AND LOCATION_CLASS = N'<literal:11>')
		BEGIN
			-- [comment omitted]
			SELECT @agingDate = AGING_DATE 
			FROM LOCATION_INVENTORY
			WHERE LOCATION = @stToLoc
			AND WAREHOUSE = @stToWhs
			AND ITEM = @stItem
			AND ISNULL(COMPANY, N'<literal:12>') = ISNULL(@stCompany, N'<literal:13>')
			AND ISNULL(LOT, N'<literal:14>') = ISNULL(@stLot, N'<literal:15>')
			AND 
			(
				(ISNULL(LOGISTICS_UNIT, N'<literal:16>') = ISNULL(@stRecContID, N'<literal:17>'))
	    		OR
		   		(ISNULL(LOGISTICS_UNIT, N'<literal:18>')  = ISNULL(@stToContId, N'<literal:19>'))
			)
			AND 
			(
				ISNULL(LOC_INV_ATTRIBUTES_ID,0) = ISNULL(@toLocInvAttributeId,0)  					
			);

			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
			IF (@stTransType != N'<literal:20>' AND @stTransType != N'<literal:21>' AND @stTransType != N'<literal:22>' AND @stTransType != N'<literal:23>' AND @stTransType != N'<literal:24>')
			BEGIN
				IF (@agingDate IS NULL)
				BEGIN
					SET @toAgingDate = GETUTCDATE();
					SET @toReceivedDate = GETUTCDATE();
				END
				ELSE
				BEGIN
					SET @toAgingDate = @agingDate;				
					SET @toReceivedDate = @agingDate;
				END
			END
		END

        SELECT @toLocLocationClass = LOCATION_CLASS,
			@toLocationStatus = LOCATION_STS,
			@multiItem = MULTI_ITEM,
			@allocateIntransit = ALLOCATE_IN_TRANSIT
		  	FROM LOCATION
		 	WHERE LOCATION = @stToLoc
		   	AND WAREHOUSE = @stToWhs
	   		   	
	   	-- [comment omitted]
	   	-- [comment omitted]
	   	IF(@stTransType = N'<literal:25>')
	   		BEGIN 
	   			SELECT @iIntLocInv = INTERNAL_LOCATION_INV
					   FROM LOCATION_INVENTORY
					   WHERE LOCATION = @stToLoc
					   AND WAREHOUSE = @stToWhs
					   AND ITEM = @stItem
					   AND ISNULL(COMPANY,N'<literal:26>') = ISNULL(@stCompany,N'<literal:27>')
					   AND (
		   					ISNULL(LOT,N'<literal:28>') = ISNULL(@stLot,N'<literal:29>')
		   					OR (LOT IS NULL AND PERMANENT = N'<literal:30>')
							)
					  
					   AND (
		   					 LOGISTICS_UNIT = @stRecContID
		   		    				OR
		   					(ISNULL(LOGISTICS_UNIT,N'<literal:31>')  = ISNULL(@stToContId,N'<literal:32>')
									 OR (LOGISTICS_UNIT IS NULL AND PERMANENT = N'<literal:33>'))
							)
					                 
				   SET @existingLocUmCount = (SELECT COUNT(*) 
											FROM LOCATION_UNIT_OF_MEASURE 
											WHERE INTERNAL_LOCATION_INV = @iIntLocInv)
							
					IF (@existingLocUmCount > 0)
						BEGIN 		  
							SET @shouldCopyLUM =N'<literal:34>'			
						END
			END
				 
		-- [comment omitted]
		-- [comment omitted]
		IF EXISTS(SELECT 1 FROM WORK_INSTRUCTION 
				WHERE WORK_UNIT = @stWorkUnit AND INTERNAL_NUM_TYPE = N'<literal:35>')
			 
		BEGIN
			IF (@existingLocUmCount > 0)
				BEGIN 		  
					SET @shouldCopyLUM =N'<literal:36>'			
				END
		END
		
	   -- [comment omitted]
       -- [comment omitted]
       -- [comment omitted]
		if 
		(
		@toLocLocationClass = N'<literal:37>'
		or @toLocLocationClass = N'<literal:38>'
		or
		(
			@toLocLocationClass =N'<literal:39>'
			and
			EXISTS(SELECT 1 FROM LOCATION WHERE LOCATION =@stToLoc AND WAREHOUSE = @stToWhs AND TRACK_CONTAINERS =N'<literal:40>')
			and
			EXISTS(SELECT 1 FROM WORK_INSTRUCTION 
							WHERE WORK_UNIT = @stWorkUnit AND INTERNAL_NUM_TYPE = N'<literal:41>')
		)		
		)
            begin
                    -- [comment omitted]
                    SELECT @stInventorySts = INVENTORY_STS
                      FROM LOCATION_INVENTORY
						 WHERE LOCATION = @stToLoc
						   AND WAREHOUSE = @stToWhs
						   AND ITEM = @stItem
						   AND ISNULL(COMPANY,N'<literal:42>') = ISNULL(@stCompany,N'<literal:43>')
						   AND (
		   						ISNULL(LOT,N'<literal:44>') = ISNULL(@stLot,N'<literal:45>')
		   						OR (LOT IS NULL AND PERMANENT = N'<literal:46>')
								)
						  
						   AND (
		   						 LOGISTICS_UNIT = @stRecContID
		   		    					OR
		   						(ISNULL(LOGISTICS_UNIT,N'<literal:47>')  = ISNULL(@stToContId,N'<literal:48>')
										 OR (LOGISTICS_UNIT IS NULL AND PERMANENT = N'<literal:49>'))
							);
              end;

		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		if (@stTransType != N'<literal:50>' AND ISNULL(@toLocInvAttributeId, 0) > 0 AND @toLocLocationClass = N'<literal:51>' AND @stToContId is not null and @cToOnHandEffect = N'<literal:52>')
		begin 
			declare @existingInvAttrId numeric(9);
			declare @lpSeparator nvarchar(1);
			declare @recContLikeId nvarchar(50);
			declare @toContLikeId nvarchar(50);
			select @lpSeparator = SYSTEM_VALUE from SYSTEM_CONFIG_DETAIL where RECORD_TYPE = N'<literal:53>' and SYS_KEY = N'<literal:54>';

			-- [comment omitted]
			-- [comment omitted]
			if (@stRecContID is null)
				set @recContLikeId = @stRecContID;
			else
				set @recContLikeId = @stRecContID + @lpSeparator + N'<literal:55>';
			set @toContLikeId = @stToContId + @lpSeparator + N'<literal:56>';

			SELECT @existingInvAttrId = LOC_INV_ATTRIBUTES_ID
			FROM LOCATION_INVENTORY
			WHERE LOCATION = @stToLoc
			   AND WAREHOUSE = @stToWhs
			   AND ITEM = @stItem
			   AND ISNULL(COMPANY,N'<literal:57>') = ISNULL(@stCompany,N'<literal:58>')
			   AND (
		   			ISNULL(LOT,N'<literal:59>') = ISNULL(@stLot,N'<literal:60>')
		   			OR (LOT IS NULL AND PERMANENT = N'<literal:61>')
					)
		  
				AND (
		   			 LOGISTICS_UNIT LIKE @recContLikeId OR LOGISTICS_UNIT = @stRecContID
		   		    		OR
		   			(LOGISTICS_UNIT LIKE @toContLikeId OR LOGISTICS_UNIT = @stToContId 
							 OR (LOGISTICS_UNIT IS NULL AND PERMANENT = N'<literal:62>'))
				);

			if (@existingInvAttrId is not null and @toLocInvAttributeId != @existingInvAttrId)
			begin
				-- [comment omitted]
				if (dbo.INVfn_AreInvAttributeValuesSame(@toLocInvAttributeId, @existingInvAttrId) = 1)
				begin
					SET @toLocInvAttributeId = @existingInvAttrId;
					-- [comment omitted]
					SET @HistToLocInvAttributeId = @toLocInvAttributeId;
				end
			end;
		end;
		
		SET @lockResource = ISNULL(@stToLoc, N'<literal:63>') + ISNULL(@stToWhs, N'<literal:64>');
		if not(@multiItem = N'<literal:65>' and @toLocLocationClass = N'<literal:66>')
		begin 
			SET @lockResource = @lockResource + ISNULL(@stItem, N'<literal:67>') + ISNULL(@stCompany, N'<literal:68>') + ISNULL(@stLot, N'<literal:69>') + ISNULL(@stToContId, N'<literal:70>') + CONVERT(nvarchar, ISNULL(@toLocInvAttributeId, 0)); 
		end
		exec @lockResult = sp_getapplock @Resource=@lockResource, @LockMode = N'<literal:71>', @LockTimeout=-1
			
     	-- [comment omitted]
		SELECT @iIntLocInv = INTERNAL_LOCATION_INV,
			   @cPermanent = PERMANENT,
			   @dInitAllocQty = ALLOCATED_QTY,
			   @dInitInTransQty = IN_TRANSIT_QTY,
			   @dInitOnHandQty = ON_HAND_QTY,
			   @dInitSuspQty = SUSPENSE_QTY,
			   @stInitInvSts = INVENTORY_STS,
 		       @initExpDate = EXPIRATION_DATE
		  FROM LOCATION_INVENTORY WITH (updlock)
		 WHERE LOCATION = @stToLoc
		   AND WAREHOUSE = @stToWhs
		   AND ITEM = @stItem
		   AND ISNULL(COMPANY,N'<literal:72>') = ISNULL(@stCompany,N'<literal:73>')
		   AND (
		   		ISNULL(LOT,N'<literal:74>') = ISNULL(@stLot,N'<literal:75>')
		   		OR (LOT IS NULL AND PERMANENT = N'<literal:76>')
		        )
		  
		    AND (
		   		 LOGISTICS_UNIT = @stRecContID
		   		    	OR
		   		(ISNULL(LOGISTICS_UNIT,N'<literal:77>')  = ISNULL(@stToContId,N'<literal:78>')
		                 OR (LOGISTICS_UNIT IS NULL AND PERMANENT = N'<literal:79>'))
			)
			AND (
				ISNULL(LOC_INV_ATTRIBUTES_ID,0) = ISNULL(@toLocInvAttributeId,0)  
						OR
					@toLocLocationClass  = N'<literal:80>' 
					OR 
					(LOC_INV_ATTRIBUTES_ID IS NULL AND PERMANENT = N'<literal:81>' AND 
					(ALLOCATED_QTY = 0 AND IN_TRANSIT_QTY = 0 AND ON_HAND_QTY = 0 AND SUSPENSE_QTY = 0 ))
				);
		SELECT @iRowCount = @@ROWCOUNT;	
		IF (@iRowCount <= 0 AND @catchWeightFeatureFlag = N'<literal:82>')
		BEGIN
			SET @isNewInventory = N'<literal:83>'
		END
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		-- [comment omitted]
		if (@iRowCount <= 0 
			or ((@dInitAllocQty<>0 or @dInitInTransQty <>0 or  @dInitOnHandQty<>0 or  @dInitSuspQty<>0) 
				and @stInitInvSts<>@stInventorySts 
				and @toLocLocationClass <> N'<literal:84>'
				and @toLocLocationClass <> N'<literal:85>'
				and @toLocLocationClass <> N'<literal:86>'))
		begin
			set @dInitAllocQty = 0.0;
			set @dInitInTransQty = 0.0;
			set @dInitOnHandQty = 0.0;
			set @dInitSuspQty = 0.0;

			-- [comment omitted]
			-- [comment omitted]
			SELECT @cPermanent = PERMANENT
			  FROM LOCATION_INVENTORY
			 WHERE LOCATION = @stToLoc
			   AND WAREHOUSE = @stToWhs			   
			   AND ITEM = @stItem
			   AND ISNULL(COMPANY,N'<literal:87>') = ISNULL(@stCompany,N'<literal:88>')
			   AND PERMANENT = N'<literal:89>';
			          
			if ((@stFromInvSts is null OR @stFromInvSts = N'<literal:90>')
              AND (@stInventorySts is null OR @stInventorySts = N'<literal:91>'))
            begin
            
           if (@toLocLocationClass <> N'<literal:92>')  
           -- [comment omitted]
           -- [comment omitted]
           -- [comment omitted]
           -- [comment omitted]
              begin  
                    -- [comment omitted]
                    SELECT @stInventorySts = SYSTEM_CONFIG_DETAIL.SYSTEM_VALUE  
                    FROM SYSTEM_CONFIG_DETAIL  
                    WHERE SYS_KEY = N'<literal:93>'  
                    AND RECORD_TYPE = N'<literal:94>';  
              end;  
            end;

			-- [comment omitted]
			-- [comment omitted]
			if (ISNULL(@toLocInvAttributeId, 0) > 0 AND @toLocLocationClass = N'<literal:95>' AND @stToContId is not null and @cToOnHandEffect = N'<literal:96>')
			begin 
				select @attrIDCount = COUNT(*) 
				from 
					LOCATION_INVENTORY 
				inner join LOCATION ON 
					LOCATION.LOCATION = LOCATION_INVENTORY.LOCATION 
					AND LOCATION.warehouse = LOCATION_INVENTORY.warehouse 
					AND LOCATION.LOCATION_CLASS = N'<literal:97>' 
				 where 
					LOCATION_INVENTORY.warehouse = @stToWhs 
					and isnull(LOCATION_INVENTORY.LOC_INV_ATTRIBUTES_ID, 0) = @toLocInvAttributeId 
					and ON_HAND_QTY > 0;
					
				if (@attrIDCount > 0)
				begin
					INSERT INTO LOCATION_INVENTORY_ATTRIBUTES
						(LOC_INV_ATTRIBUTE1, LOC_INV_ATTRIBUTE2, LOC_INV_ATTRIBUTE3, LOC_INV_ATTRIBUTE4, LOC_INV_ATTRIBUTE5, 
						LOC_INV_ATTRIBUTE6, LOC_INV_ATTRIBUTE7, LOC_INV_ATTRIBUTE8, LOC_INV_ATTRIBUTE9, LOC_INV_ATTRIBUTE10, 
						LOC_INV_ATTRIBUTE11, LOC_INV_ATTRIBUTE12, LOC_INV_ATTRIBUTE13, LOC_INV_ATTRIBUTE14, LOC_INV_ATTRIBUTE15, 
						LOC_INV_ATTRIBUTE16, LOC_INV_ATTRIBUTE17, LOC_INV_ATTRIBUTE18, LOC_INV_ATTRIBUTE19, LOC_INV_ATTRIBUTE20, 
						USER_DEF1, USER_DEF2, USER_DEF3, USER_DEF4, USER_DEF5, USER_DEF6, USER_DEF7, USER_DEF8, 
						USER_STAMP, PROCESS_STAMP, DATE_TIME_STAMP, INTERNAL_SHIPPING_CONTAINER_NUM) 
					SELECT 
						LOC_INV_ATTRIBUTE1, LOC_INV_ATTRIBUTE2, LOC_INV_ATTRIBUTE3, LOC_INV_ATTRIBUTE4, LOC_INV_ATTRIBUTE5, 
						LOC_INV_ATTRIBUTE6, LOC_INV_ATTRIBUTE7, LOC_INV_ATTRIBUTE8, LOC_INV_ATTRIBUTE9, LOC_INV_ATTRIBUTE10, 
						LOC_INV_ATTRIBUTE11, LOC_INV_ATTRIBUTE12, LOC_INV_ATTRIBUTE13, LOC_INV_ATTRIBUTE14, LOC_INV_ATTRIBUTE15, 
						LOC_INV_ATTRIBUTE16, LOC_INV_ATTRIBUTE17, LOC_INV_ATTRIBUTE18, LOC_INV_ATTRIBUTE19, LOC_INV_ATTRIBUTE20, 
						USER_DEF1, USER_DEF2, USER_DEF3, USER_DEF4, USER_DEF5, USER_DEF6, USER_DEF7, USER_DEF8, 
						@stUserName, N'<literal:98>', GETUTCDATE(), INTERNAL_SHIPPING_CONTAINER_NUM 
					FROM 
						LOCATION_INVENTORY_ATTRIBUTES 
					WHERE 
						OBJECT_ID = @toLocInvAttributeId;
						
					SELECT @toLocInvAttributeId = @@IDENTITY;
					-- [comment omitted]
					set @HistToLocInvAttributeId = @toLocInvAttributeId;
				end; -- [comment omitted]
			end; -- [comment omitted]
			
			-- [comment omitted]
			if (@stTransType = N'<literal:99>' or @stTransType = N'<literal:100>')
			begin				
				set @dtFromExpDate = null
			end			
                
			exec @iError = INV_InsertLocationInventory
					@cToAllocEffect, @cToInTransEffect, @cToOnHandEffect, @cToSuspEffect, @dOverrodeVolumePerItem, @dOverrodeWeightPerItem, @dQuantity, @dtExpDate, @dtManDate, @stCompany, @stInventorySts output, @stItem, @stItemDesc, @stLot, @stQuantityUM, @stToLoc, @stToContID, @stParentLogisticsUnit, @stToWhs, @stUserName, 
					@toAgingDate, @dtFromExpDate, @dtFromManDate, @toReceivedDate, @stFromInvSts, @stFromItemColor, @stFromItemDesc, @stFromItemSize, @stFromItemStyle, @cPermanent,
					@stUserDef1, @stUserDef2, @stUserDef3, @stUserDef4, @stUserDef5, @stUserDef6, @dUserDef7, @dUserDef8, @toLocInvAttributeId, @stReferenceType, 
					@iRowCount output, @iIntLocInv output;
			if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
			set @newLocationInventoryRows = @iRowCount;

			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
			if (@iRowCount <= 0)
				set @iNumOfLockFailures = @iNumOfLockFailures + 1;
			else if ((@cToOnHandEffect = N'<literal:101>' or @cToInTransEffect = N'<literal:102>')
				       and @internalLocUMs is not null) 
				begin
				IF (NOT EXISTS (SELECT 1 FROM LOCATION_UNIT_OF_MEASURE WHERE 
					LOCATION = @stToLoc			
			AND		WAREHOUSE = @stToWhs
			AND		ITEM = @stItem
			AND		(
					(@stCompany IS NOT NULL AND COMPANY = @STCOMPANY)
					OR (@stCompany IS NULL AND COMPANY IS NULL)
					))
					OR
					(
					@toLocLocationClass =N'<literal:103>'
			AND
				 EXISTS (SELECT 1 FROM LOCATION_UNIT_OF_MEASURE WHERE   
				 LOCATION = @stToLoc     
			AND  WAREHOUSE = @stToWhs  
			AND  ITEM = @stItem  
			AND  (  
				(@stCompany IS NOT NULL AND COMPANY = @STCOMPANY)  
				OR (@stCompany IS NULL AND COMPANY IS NULL)  
				 )
					)
				 )
					)
				begin
					set @internalLocUMs = replace(@internalLocUMs,N'<literal:104>',N'<literal:105>');
					set @tempToWhs = replace(@stToWhs,N'<literal:106>',N'<literal:107>');	
			
					declare @sql nvarchar(1000);
					if (@toLocLocationClass <> N'<literal:108>' and @toLocLocationClass <> N'<literal:109>'
						and  @shouldCopyLUM =N'<literal:110>')
					BEGIN
						set @sql = N'<literal:111>' +
								N'<literal:112>'+ N'<literal:113>'+ @stToLoc + N'<literal:114>' +
						 		N'<literal:115>'+ N'<literal:116>' + @tempToWhs + N'<literal:117>' +
								N'<literal:118>' + str(@iIntLocInv) +
								N'<literal:119>' +
									N'<literal:120>'+ N'<literal:121>' + @stUserName + N'<literal:122>' +
								N'<literal:123>'+
					   			N'<literal:124>'+ @internalLocUMs +N'<literal:125>';
					
						-- [comment omitted]
						IF (@intContNum IS NOT NULL AND @toLocLocationClass = N'<literal:126>')
						BEGIN 
							SET @sql = @sql + N'<literal:127>'+ STR(@intContNum);
						END		
					END			
				end				
				else
                 begin
                 set @internalLocUMs = replace(@internalLocUMs,N'<literal:128>',N'<literal:129>')
                  set @sql = N'<literal:130>' +
							N'<literal:131>'+ @internalLocUMs + N'<literal:132>';
                 end
					exec sp_executesql @sql;
									
					if (@@ERROR <> 0) return -1;
									
					set @cAdjustmentCompleted = N'<literal:133>';				
				end
			else
				begin
					set @cAdjustmentCompleted = N'<literal:134>';
				
				end;
				-- [comment omitted]
				-- [comment omitted]
				-- [comment omitted]
				if (@toLocLocationClass <> N'<literal:135>' and @toLocLocationClass <> N'<literal:136>'  
					 and  @shouldCopyLUM =N'<literal:137>' and @toLocLocationClass <> N'<literal:138>' )  
				BEGIN	 
					   EXEC INV_CopyLocUmsForDestInventory @stToLoc,@iIntLocInv,@intContNum,@stUserName,N'<literal:139>',@fromIntLocInv				
				
				END
			
		end -- [comment omitted]
	
		else
		begin			
				
			-- [comment omitted]
			set @dNewAllocQty = CASE WHEN @cToAllocEffect = N'<literal:140>' 
									 THEN @dInitAllocQty + @dQuantity
									 WHEN @cToAllocEffect = N'<literal:141>' 
									 THEN @dInitAllocQty - @dQuantity
									 ELSE @dInitAllocQty 
									 END;
			set @dNewInTransQty = CASE WHEN @cToInTransEffect = N'<literal:142>' 
									   THEN @dInitInTransQty + @dQuantity
									   WHEN @cToInTransEffect = N'<literal:143>' 
									   THEN @dInitInTransQty - @dQuantity
									   ELSE @dInitInTransQty 
									   END;
			set @dNewOnHandQty = CASE WHEN @cToOnHandEffect = N'<literal:144>' 
									  THEN @dInitOnHandQty + @dQuantity
									  WHEN @cToOnHandEffect = N'<literal:145>' 
									  THEN CASE WHEN @dInitOnHandQty <= 0 
													 and (@cForceOnHandZero = N'<literal:146>' 
													      or @cForceOnHandZero = N'<literal:147>')
												THEN @dInitOnHandQty
												WHEN @dInitOnHandQty - @dQuantity < 0
													 and (@cForceOnHandZero = N'<literal:148>' 
													      or @cForceOnHandZero = N'<literal:149>')
												THEN 0
												ELSE @dInitOnHandQty - @dQuantity
												END
									  ELSE @dInitOnHandQty 
									  END;
			set @dNewSuspQty = CASE WHEN @cToSuspEffect = N'<literal:150>' 
									THEN @dInitSuspQty + @dQuantity
									WHEN @cToSuspEffect = N'<literal:151>' 
									THEN @dInitSuspQty - @dQuantity
									ELSE 	@dInitSuspQty									
									END;

			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
			-- [comment omitted]
			if (@cPermanent = N'<literal:152>' OR @cPermanent = N'<literal:153>')
			begin
				SELECT INTERNAL_LOCATION_INV
			 	FROM LOCATION_INVENTORY
				WHERE LOCATION = @stToLoc
			 		AND WAREHOUSE = @stToWhs
			 	 	AND ITEM = @stItem
			  	 	AND ISNULL(COMPANY,N'<literal:154>') = ISNULL(@stCompany,N'<literal:155>')
			 	  	AND (PERMANENT = N'<literal:156>' OR PERMANENT = N'<literal:157>');
				if (@@ROWCOUNT > 1)
					begin
						set @cPermanent = N'<literal:158>';
					end;
			end;

			-- [comment omitted]
			-- [comment omitted]
			if (@dNewAllocQty = 0.0
				AND @dNewInTransQty = 0.0
				AND @dNewOnHandQty = 0.0
				AND @dNewSuspQty = 0.0
				AND (@cPermanent <> N'<literal:159>' AND @cPermanent <> N'<literal:160>'))
			begin
				exec @iError = INV_ArchiveSerialNumbers @iIntLocInv;

				DECLARE @tableLUOM TABLE (INTERNAL_LOC_UM INT);
				
				INSERT INTO @tableLUOM
				SELECT INTERNAL_LOC_UM
				FROM LOCATION_UNIT_OF_MEASURE
				WHERE INTERNAL_LOCATION_INV = @iIntLocInv;

				UPDATE LOCATION_UNIT_OF_MEASURE
				SET INTERNAL_LOCATION_INV = NULL
					WHERE INTERNAL_LOCATION_INV = @iIntLocInv

				if (@catchWeightFeatureFlag = N'<literal:161>' AND @isItemCatchWeightRequired = N'<literal:162>')
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
					set @cAdjustmentCompleted = N'<literal:163>';
					
					DELETE FROM LOCATION_UNIT_OF_MEASURE
					WHERE INTERNAL_LOC_UM IN (SELECT INTERNAL_LOC_UM FROM @tableLUOM);
					
					if (@@ERROR <> 0) return -1;
				end; -- [comment omitted]

			end; -- [comment omitted]
			else
			begin
			if (@dNewAllocQty = 0.0
				AND @dNewInTransQty = 0.0
				AND @dNewOnHandQty = 0.0
				AND @dNewSuspQty = 0.0)
				begin
				  DELETE FROM LOCATION_UNIT_OF_MEASURE
					WHERE INTERNAL_LOCATION_INV =@iIntLocInv;
				
				 -- [comment omitted]
				 if((@cPermanent = N'<literal:164>' OR @cPermanent = N'<literal:165>'))
					SET @toLocInvAttributeId = NULL;
				 
				end;

				-- [comment omitted]
				-- [comment omitted]
				if (ISNULL(@toLocInvAttributeId, 0) > 0 AND @toLocLocationClass = N'<literal:166>' AND @stToContId is not null and @dNewOnHandQty > 0)
				begin 
					select @attrIDCount = COUNT(*) 
					from 
						LOCATION_INVENTORY 
					inner join LOCATION ON 
						LOCATION.LOCATION = LOCATION_INVENTORY.LOCATION 
						AND LOCATION.warehouse = LOCATION_INVENTORY.warehouse 
						AND LOCATION.LOCATION_CLASS = N'<literal:167>' 
					 where 
						LOCATION_INVENTORY.warehouse = @stToWhs 
						and isnull(LOCATION_INVENTORY.LOC_INV_ATTRIBUTES_ID, 0) = @toLocInvAttributeId
						and ON_HAND_QTY > 0 
						and INTERNAL_LOCATION_INV != @iIntLocInv;
						
					if (@attrIDCount > 0)
					begin
						INSERT INTO LOCATION_INVENTORY_ATTRIBUTES
							(LOC_INV_ATTRIBUTE1, LOC_INV_ATTRIBUTE2, LOC_INV_ATTRIBUTE3, LOC_INV_ATTRIBUTE4, LOC_INV_ATTRIBUTE5, 
							LOC_INV_ATTRIBUTE6, LOC_INV_ATTRIBUTE7, LOC_INV_ATTRIBUTE8, LOC_INV_ATTRIBUTE9, LOC_INV_ATTRIBUTE10, 
							LOC_INV_ATTRIBUTE11, LOC_INV_ATTRIBUTE12, LOC_INV_ATTRIBUTE13, LOC_INV_ATTRIBUTE14, LOC_INV_ATTRIBUTE15, 
							LOC_INV_ATTRIBUTE16, LOC_INV_ATTRIBUTE17, LOC_INV_ATTRIBUTE18, LOC_INV_ATTRIBUTE19, LOC_INV_ATTRIBUTE20, 
							USER_DEF1, USER_DEF2, USER_DEF3, USER_DEF4, USER_DEF5, USER_DEF6, USER_DEF7, USER_DEF8, 
							USER_STAMP, PROCESS_STAMP, DATE_TIME_STAMP, INTERNAL_SHIPPING_CONTAINER_NUM) 
						SELECT 
							LOC_INV_ATTRIBUTE1, LOC_INV_ATTRIBUTE2, LOC_INV_ATTRIBUTE3, LOC_INV_ATTRIBUTE4, LOC_INV_ATTRIBUTE5, 
							LOC_INV_ATTRIBUTE6, LOC_INV_ATTRIBUTE7, LOC_INV_ATTRIBUTE8, LOC_INV_ATTRIBUTE9, LOC_INV_ATTRIBUTE10, 
							LOC_INV_ATTRIBUTE11, LOC_INV_ATTRIBUTE12, LOC_INV_ATTRIBUTE13, LOC_INV_ATTRIBUTE14, LOC_INV_ATTRIBUTE15, 
							LOC_INV_ATTRIBUTE16, LOC_INV_ATTRIBUTE17, LOC_INV_ATTRIBUTE18, LOC_INV_ATTRIBUTE19, LOC_INV_ATTRIBUTE20, 
							USER_DEF1, USER_DEF2, USER_DEF3, USER_DEF4, USER_DEF5, USER_DEF6, USER_DEF7, USER_DEF8, 
							@stUserName, N'<literal:168>', GETUTCDATE(), INTERNAL_SHIPPING_CONTAINER_NUM 
						FROM 
							LOCATION_INVENTORY_ATTRIBUTES 
						WHERE 
							OBJECT_ID = @toLocInvAttributeId;
							
						SELECT @toLocInvAttributeId = @@IDENTITY;
					end; -- [comment omitted]
				end; -- [comment omitted]
				
						-- [comment omitted]
						If(@isNegativeAvailableAllowed =N'<literal:169>' AND @stTransType =N'<literal:170>')
						begin
							If((@toLocLocationClass = N'<literal:171>' AND @cToAllocEffect = N'<literal:172>'  AND (@allocateIntransit =N'<literal:173>' OR @allocateIntransit =N'<literal:174>') AND
							( @dInitOnHandQty + @dInitInTransQty - @dInitSuspQty) < 0) 
							OR
							(@toLocLocationClass =N'<literal:175>' AND @cToAllocEffect = N'<literal:176>'AND (@allocateIntransit =N'<literal:177>' OR @allocateIntransit =N'<literal:178>') AND 
							( @dInitOnHandQty - @dInitSuspQty) < 0))
							begin
						
								set @stErrorMsg = N'<literal:179>' + dbo.RSCMfn_RtrvMsg(N'<literal:180>'); 		
								RAISERROR(@stErrorMsg , 18, 1);
								return -1;   
							End
						End;
				exec @iError = INV_UpdateToLocInv
						@iIntLocInv,
						@dInitAllocQty, @dInitInTransQty, @dInitOnHandQty, @dInitSuspQty,
						@dNewAllocQty, @dNewInTransQty, @dNewOnHandQty, @dNewSuspQty, 
						@dOverrodeVolumePerItem, @dOverrodeWeightPerItem, 
						@dtExpDate, @dtManDate, @stCompany, @stInventorySts, @stItem, @stToLoc, @stLot, @stToContId,@stParentLogisticsUnit,@stQuantityUM, @stUserName, @stToWhs,
						@toAgingDate, @dtFromExpDate, @dtFromManDate, @toReceivedDate, @stFromInvSts,
						@stUserDef1,@stUserDef2,@stUserDef3,@stUserDef4,@stUserDef5,@stUserDef6,@dUserDef7,@dUserDef8,@toLocInvAttributeId,@iRowCount output;
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
				
				-- [comment omitted]
				-- [comment omitted]
				-- [comment omitted]
				if (@iRowCount <= 0)
					begin
						set @iNumOfLockFailures = @iNumOfLockFailures + 1;
					end;
				else
					begin
					
						if(@stInventorySts is null OR @stInventorySts = N'<literal:181>')
						begin
							set @stInventorySts = @stFromInvSts;
						end;

						if ((@cToOnHandEffect = N'<literal:182>' or @cToInTransEffect = N'<literal:183>')
				      			 and @internalLocUMs is not null) 
						begin
							set @internalLocUMs = replace(@internalLocUMs,N'<literal:184>',N'<literal:185>');
							set @tempToWhs = replace(@stToWhs,N'<literal:186>',N'<literal:187>');		
									
							-- [comment omitted]
							-- [comment omitted]
							set @sql = N'<literal:188>' +
							N'<literal:189>'+ @internalLocUMs + N'<literal:190>'+
							N'<literal:191>' +
							N'<literal:192>'+
								N'<literal:193>' +
								N'<literal:194>'+ str(@iIntLocInv) + 
								N'<literal:195>' +
								N'<literal:196>' +
									N'<literal:197>' +
									N'<literal:198>' +
									N'<literal:199>'+ @internalLocUMs +N'<literal:200>' +
								N'<literal:201>';	
							
							exec sp_executesql @sql;
							
							-- [comment omitted]
							-- [comment omitted]
							IF (NOT EXISTS (SELECT 1 FROM LOCATION_UNIT_OF_MEASURE WHERE 
							INTERNAL_LOCATION_INV = @iIntLocInv))
							BEGIN
								IF (@toLocLocationClass <> N'<literal:202>' and @toLocLocationClass <> N'<literal:203>' 
										and  @shouldCopyLUM =N'<literal:204>')
								BEGIN
									set @sql = N'<literal:205>' +
										N'<literal:206>'+ N'<literal:207>'+ @stToLoc + N'<literal:208>' +
						 				N'<literal:209>'+ N'<literal:210>' + @tempToWhs + N'<literal:211>' +
										N'<literal:212>' + str(@iIntLocInv) +
										N'<literal:213>' +
						       				 N'<literal:214>'+ N'<literal:215>' + @stUserName + N'<literal:216>' +
										N'<literal:217>'+
					   					N'<literal:218>'+ @internalLocUMs +N'<literal:219>';
								
									exec sp_executesql @sql;
									IF( @toLocLocationClass   <> N'<literal:220>')
									BEGIN									
									EXEC INV_CopyLocUmsForDestInventory @stToLoc,@iIntLocInv,@intContNum,@stUserName,N'<literal:221>',@fromIntLocInv		
									END
								END;
								ELSE IF (@toLocLocationClass = N'<literal:222>' or @toLocLocationClass = N'<literal:223>')
								BEGIN
									set @sql = N'<literal:224>' +									
												N'<literal:225>'+ @internalLocUMs +N'<literal:226>';
											
									EXEC sp_executesql 
										@query = @sql, 
										@params = N'<literal:227>', 
										@fromLoc = @fromLoc OUTPUT;
									
									SELECT @fromLocLocationClass = LOCATION_CLASS
		  								FROM LOCATION
		 								WHERE LOCATION = @fromLoc

									if (@fromLocLocationClass = N'<literal:228>')
									BEGIN
										set @sql = N'<literal:229>'

+ @internalLocUMs +N'<literal:230>';
										
										EXEC sp_executesql 
										@query = @sql, 
										@params = N'<literal:231>', 
										@fromLoc = @fromLoc ;
									END;

									-- [comment omitted]
									if ((@toLocLocationClass = N'<literal:232>' OR @toLocLocationClass = N'<literal:233>')
									 AND @fromLocLocationClass=N'<literal:234>')
									BEGIN
										set @sql = N'<literal:235>'




+ @internalLocUMs +N'<literal:236>';
										
										EXEC sp_executesql 
										@query = @sql, 
										@params = N'<literal:237>', 
										@fromLoc = @fromLoc,
										@stCompany =@stCompany,
										@stLot = @stLot,
										@stItem =@stItem;
									END;

								END;
							END;
							ELSE
							BEGIN
																											 
								set @sql = N'<literal:238>' +									
											N'<literal:239>'+ @internalLocUMs +N'<literal:240>';
																					
								EXEC sp_executesql 
									@query = @sql, 
									@params = N'<literal:241>', 
									@fromLoc = @fromLoc OUTPUT;
							   
							   set @sql = N'<literal:242>'




+ @internalLocUMs +N'<literal:243>';
										
										EXEC sp_executesql 
										@query = @sql, 
										@params = N'<literal:244>', 
										@fromLoc = @fromLoc,
										@stCompany =@stCompany,
										@stLot = @stLot,
										@stItem =@stItem;	
								
							
							END;
									
							if (@@ERROR <> 0) return -1;
						end;
						set @cAdjustmentCompleted = N'<literal:245>';
					end;
			end; -- [comment omitted]
		end; -- [comment omitted]
	end; -- [comment omitted]
	
	-- [comment omitted]
	-- [comment omitted]
	IF ((@cToOnHandEffect = N'<literal:246>' OR @cToInTransEffect = N'<literal:247>'))
	BEGIN

		IF (NOT EXISTS (SELECT 1 FROM LOCATION_UNIT_OF_MEASURE WHERE 
					INTERNAL_LOCATION_INV = @IIntLocInv AND WAREHOUSE = @stToWhs
					AND (((@intContNum IS NOT NULL AND INTERNAL_CONTAINER_NUM = @intContNum)
						OR (@intContNum IS NULL AND INTERNAL_CONTAINER_NUM IS NULL))
						OR (@toLocLocationClass   <> N'<literal:248>'))
					AND (@stTransType <> N'<literal:249>')))
					
		BEGIN	
		
		 IF (EXISTS 
			(SELECT 1 FROM LOCATION_UNIT_OF_MEASURE  
			WHERE	
				LOCATION = @stToLoc 			
				AND		WAREHOUSE = @stToWhs
				AND		ITEM = @stItem
				AND		
				(
					(@stCompany IS NOT NULL AND COMPANY = @STCOMPANY)
					OR (@stCompany IS NULL AND COMPANY IS NULL)
				)
				AND (INTERNAL_CONTAINER_NUM IS NULL OR @toLocLocationClass   <> N'<literal:250>')	-- [comment omitted]
			))	
					
			BEGIN
           INSERT INTO LOCATION_UNIT_OF_MEASURE 
					(ITEM, COMPANY, INTERNAL_CONTAINER_NUM, SEQUENCE, QUANTITY_UM, CONVERSION_QTY, LENGTH, WIDTH,
					HEIGHT, DIMENSION_UM, WEIGHT, WEIGHT_UM, USER_DEF1, USER_DEF2, USER_DEF3, USER_DEF4, 
					USER_DEF5, USER_DEF6,USER_DEF7, USER_DEF8, USER_STAMP, PROCESS_STAMP, DATE_TIME_STAMP,
					TREAT_FULL_PCT,	WAREHOUSE, LOCATION, MOVEMENT_CLS, TREAT_AS_LOOSE, EPC_PACKAGE_ID,
					INTERNAL_LOCATION_INV)
			SELECT DISTINCT
					ITEM, COMPANY, 
					CASE WHEN  @toLocLocationClass  = N'<literal:251>'
						THEN INTERNAL_CONTAINER_NUM 
						ELSE NULL END, SEQUENCE, QUANTITY_UM, CONVERSION_QTY, LENGTH, WIDTH,
					HEIGHT, DIMENSION_UM, WEIGHT, WEIGHT_UM, USER_DEF1, USER_DEF2, USER_DEF3, USER_DEF4, 
					USER_DEF5, USER_DEF6, USER_DEF7, USER_DEF8, USER_STAMP, N'<literal:252>', 
					GETUTCDATE(), TREAT_FULL_PCT, WAREHOUSE, @stToLoc, MOVEMENT_CLS, TREAT_AS_LOOSE,								EPC_PACKAGE_ID,	@iIntLocInv
					FROM	LOCATION_UNIT_OF_MEASURE 
			WHERE	LOCATION = @stToLoc 			
			AND		WAREHOUSE = @stToWhs
			AND		ITEM = @stItem
			AND		(
					(@stCompany IS NOT NULL AND COMPANY = @STCOMPANY)
					OR (@stCompany IS NULL AND COMPANY IS NULL)
					)
			AND @toLocLocationClass <> N'<literal:253>'
			and @toLocLocationClass <> N'<literal:254>'
			and Not Exists (select 1 from LOCATION_UNIT_OF_MEASURE where INTERNAL_LOCATION_INV =@iIntLocInv)
           END
           ELSE
           BEGIN		
					-- [comment omitted]
					-- [comment omitted]
					if (@toLocLocationClass <> N'<literal:255>' and @toLocLocationClass <> N'<literal:256>'
						and  @shouldCopyLUM =N'<literal:257>' and @toLocLocationClass   <> N'<literal:258>')
					BEGIN						
						EXEC INV_CopyLocUmsForDestInventory @stToLoc,@iIntLocInv,@intContNum,@stUserName,N'<literal:259>',@fromIntLocInv				
					END
           END	
			
		END
							
	END
	
	-- [comment omitted]
		if (@dInitAllocQty = 0.0
		   and @dInitInTransQty = 0.0
			and @dInitOnHandQty = 0.0
			and @dInitSuspQty = 0.0)
		begin
			-- [comment omitted]
			if (@stLot is not null)
			begin
				
				exec @iError = INV_ProcessLotInNewInventory @stToLoc,@stLot, @stItem, @stCompany, 
							@stToWhs, @dtExpDate, @stInventorySts,@argumentGroupId;
				if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
				
			end; -- [comment omitted]
		end; -- [comment omitted]

	-- [comment omitted]
		if (@dNewAllocQty = 0.0
		   AND @dNewInTransQty = 0.0
		   AND @dNewOnHandQty = 0.0
		   AND @dNewSuspQty = 0.0)
			begin
				if (@stLot is not null)
					begin
						exec @iError = INV_ProcessLotWhenEmptyingInv @stToLoc, @stLot, @stItem, @stCompany, @stToWhs;
						if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
					end;
			end;

	-- [comment omitted]
	if (@cAdjustmentCompleted is null)
	begin
		set @stErrorMsg = 
			N'<literal:260>' + dbo.RSCMfn_RtrvMsg(N'<literal:261>'); 				
		RAISERROR(@stErrorMsg , 18, 1);
		return -1;
	end; -- [comment omitted]

	if(@internalLocUMs is not null) 
	begin
	set @sql = N'<literal:262>'

+ @internalLocUMs +N'<literal:263>';
																				
	EXEC sp_executesql 
		@query = @sql;
	End

	-- [comment omitted]
	exec @iError = INV_UpdateLocation 
			1,
			@stToLoc, @stToWhs, @stUserName,
			@dNewAllocQty, @dNewInTransQty, @dNewOnHandQty, @dNewSuspQty,
			@cToOnHandEffect, @stCompany, @stItem, @stQuantityUM, @stLot,
			@stToContId;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	
	-- [comment omitted]
	IF (@catchWeightFeatureFlag = N'<literal:264>')
	BEGIN
		SET @isValidCatchWeightUM =
		CASE
			WHEN @isNewInventory IS NULL THEN N'<literal:265>'
			WHEN @isNewInventory = N'<literal:266>' AND @catchWeightUM IS NOT NULL THEN N'<literal:267>'
			ELSE N'<literal:268>'
		END;
	END
	ELSE
	BEGIN
		SET @isValidCatchWeightUM = N'<literal:269>'
	END
	
	/* [comment omitted] */
	if (@catchWeightFeatureFlag = N'<literal:270>' and @isItemCatchWeightRequired = N'<literal:271>' and @catchWeight is not null and @isValidCatchWeightUM = N'<literal:272>' and @cToOnHandEffect = N'<literal:273>')
	begin
			exec @iError = INV_UpsertCatchWeightInfo
			@iIntLocInv,
			@catchWeight,
			@catchWeightUM,
			@dInitOnHandQty,
			@dNewOnHandQty,
			@stUserName,
			@shipContNum,
			@stWorkType;
			
			if (@@ERROR <> 0) return -1; 
			else if (@iError <> 0) return @iError;
	end

	if (@dNewInTransQty is null
		AND @cToInTransEffect=N'<literal:274>'
		AND @dInitInTransQty=0.0
		AND @newLocationInventoryRows=1) 
		begin
			set   @dInitInTransQty=@dQuantity;
		end

   if(@afterExpDateTime is null and(@stTransType = N'<literal:275>' or @stTransType = N'<literal:276>'))
   begin
	   set @afterExpDateTime = CASE -- [comment omitted]
					 WHEN @stLot is null
					 THEN null
					 -- [comment omitted]
					 WHEN @dtFromExpDate is not null
					 THEN @dtFromExpDate
					 -- [comment omitted]
					 ELSE @dtExpDate 
					 END
	end
	else
	begin
		set @afterExpDateTime =@dtFromExpDate
	end
	-- [comment omitted]
	exec @iError = INV_SaveHistInvChg
			1,
			@cForceOnHandZero, @cToAllocEffect, @cToInTransEffect, @cToOnHandEffect, @cReversal, 
			@cToSuspEffect, @dQuantity, @dReferenceLine, @iInternalNum, @stCompany, @stToContId,
			@stEquipmentType, @stInventorySts, @stItem, @stToLoc, @stLot, @stQuantityUM, @stRecContID,
			@stReferenceID, @stReferenceType, @stTeam, @stTransType, @stUserDef1, @stUserDef2, 
			@stUserDef3, @stUserDef4, @stUserDef5, @stUserDef6, @dUserDef7, @dUserDef8, @stUserName, 
			@stToWhs, @stWorkGroup, @stWorkType, @stWorkUnit,
			@stCompany, @stToWhs, @dInitAllocQty, @dInitInTransQty, @dInitOnHandQty, @dInitSuspQty, @stInitInvSts,
			@argumentGroupId,@afterExpDateTime,@initExpDate,@HistToLocInvAttributeId,
			@catchWeight, @catchWeightUM,
			@cTransHistActive;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- [comment omitted]
