-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */














































CREATE PROCEDURE INV_SaveHistInvChg(
	@iFromTo numeric(1,0),
	@cForceOnHandZero nchar(1), -- [comment omitted]
	@cAllocEffect nchar(1),
	@cInTransEffect nchar(1),
	@cOnHandEffect nchar(1),
	@cReversal nchar(1),
	@cSuspEffect nchar(1),
	@dQuantity numeric(19,5),
	@dReferenceLine numeric(19,5),
	@iInternalNum numeric(9),
	@stCompany nvarchar(25),
	@stContId nvarchar(50),
	@stEquipmentType nvarchar(25),
	@stInventorySts nvarchar(50),
	@stItem nvarchar(50),
	@stLoc nvarchar(25),
	@stLot nvarchar(25),
	@stQuantityUM nvarchar(25),
	@stRecContID nvarchar(25),
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
	@stWhs nvarchar(25),
	@stWorkGroup nvarchar(25),
	@stWorkType nvarchar(25),
	@stWorkUnit nvarchar(50),
	@toCompany nvarchar(25),
	@toWarehouse nvarchar(25),		
	@dInitAllocQty numeric(19,5),
	@dInitInTransQty numeric(19,5),
	@dInitOnHandQty numeric(19,5),
	@dInitSuspQty numeric(19,5),
	@stInitInvSts nvarchar(50),
	@argumentGroupId nvarchar(32),
        @ExpDate datetime,
        @initExpDate  datetime,
        @locInvAttributesId numeric(9) = NULL,
	@catchWeight numeric(14,5) = NULL,
	@catchWeightUM nvarchar(25) = NULL,
	@cTransHistActive nvarchar(250) output)

AS
	SET NOCOUNT ON;
	
	-- [comment omitted]

	-- [comment omitted]
	declare @dAfterAllocQty numeric(19,5);
	declare @dAfterInTransitQty numeric(19,5);
	declare @dAfterOnHandQty numeric(19,5);
	declare @dAfterSuspenseQty numeric(19,5);
	declare @dHistQty numeric(19,5);
	declare @iError int;
	declare @stAfterSts nvarchar(50);
	declare @stHistContId nvarchar(50);
	declare @stInternalKeyId nvarchar(25);
	declare @stDirection nvarchar(25);
	declare @afterExpDate datetime;     
	declare @isLocLPTracked nchar(1);
	declare @locationClass nvarchar(25);
	declare @internalContainerNum numeric(9);

	-- [comment omitted]
	if (@cTransHistActive = N'<literal:1>')
		return 0;
	
	-- [comment omitted]
	-- [comment omitted]
	-- [comment omitted]
	if (@stTransType = N'<literal:2>')
	begin
		SELECT @stWorkType = WORK_TYPE
		  FROM SHIPPING_PREFERENCES
		 WHERE PREFERENCE_NAME = (SELECT ISNULL(SHIPPING_PREFERENCE, 
												N'<literal:3>')
								    FROM USER_PROFILE
								   WHERE USER_NAME = @stUserName);
	end; -- [comment omitted]
		
	-- [comment omitted]
	set @dAfterAllocQty = 
			 CASE WHEN @cAllocEffect = N'<literal:4>'
				  THEN @dInitAllocQty + @dQuantity
				  WHEN @cAllocEffect = N'<literal:5>'
				  THEN @dInitAllocQty - @dQuantity
				  ELSE @dInitAllocQty
				  END;
	set @dAfterInTransitQty =
			 CASE WHEN @cInTransEffect = N'<literal:6>'
				  THEN @dInitInTransQty + @dQuantity
				  WHEN @cInTransEffect = N'<literal:7>'
				  THEN @dInitInTransQty - @dQuantity
				  ELSE @dInitInTransQty
				  END;
	set @dAfterOnHandQty = 
			 CASE WHEN @cOnHandEffect = N'<literal:8>' 
				  THEN @dInitOnHandQty + @dQuantity
				  WHEN @cOnHandEffect = N'<literal:9>' 
				  THEN CASE WHEN @dInitOnHandQty <= 0 
								 and (@cForceOnHandZero = N'<literal:10>' 
								      or @cForceOnHandZero = N'<literal:11>')
							THEN @dInitOnHandQty
							WHEN @dInitOnHandQty - @dQuantity < 0
								 and (@cForceOnHandZero = N'<literal:12>' 
								      or @cForceOnHandZero = N'<literal:13>')
							THEN 0
							ELSE @dInitOnHandQty - @dQuantity
							END
				  ELSE @dInitOnHandQty 
				  END;
	
	set @dAfterSuspenseQty =
			 CASE WHEN @cSuspEffect = N'<literal:14>'
				  THEN @dInitSuspQty + @dQuantity
				  WHEN @cSuspEffect = N'<literal:15>'
				  THEN @dInitSuspQty - @dQuantity
				  ELSE 	@dInitSuspQty				 
				  END;

	if(@stInventorySts is null OR @stInventorySts = N'<literal:16>')
		BEGIN
			if((@dAfterAllocQty + @dAfterInTransitQty + @dAfterOnHandQty + @dAfterSuspenseQty)>0)
				BEGIN
					set @stInventorySts = @stInitInvSts;
				END
		END
	if((@dAfterAllocQty + @dAfterInTransitQty + @dAfterOnHandQty + @dAfterSuspenseQty)=0)
		BEGIN
			set @stInventorySts = NULL;
		END

	set @stDirection =
			 CASE WHEN @stTransType = N'<literal:17>'
					   AND @cOnHandEffect is null
				  THEN CASE WHEN @iFromTo = 0
						    THEN N'<literal:18>'		-- [comment omitted]
						    ELSE N'<literal:19>'		-- [comment omitted]
						    END
				  WHEN @iFromTo = 0
				  THEN N'<literal:20>'				-- [comment omitted]
				  ELSE N'<literal:21>'					-- [comment omitted]
				  END;
	set @stAfterSts =
			 CASE 
			 -- [comment omitted]
				  WHEN (@stTransType = N'<literal:22>' or @stTransType = N'<literal:23>' or @stTransType = N'<literal:24>' or @stTransType = N'<literal:25>')
						AND @stInitInvSts is not null
						AND (@stDirection = N'<literal:26>' or ((@stTransType = N'<literal:27>' or @stTransType = N'<literal:28>' or @stTransType = N'<literal:29>') and @stDirection = N'<literal:30>'))
						AND @dAfterOnHandQty > 0
				  THEN @stInitInvSts
				  ELSE @stInventorySts
				  END;
	       -- [comment omitted]
	        if(@dInitSuspQty > @dAfterSuspenseQty) 
            set @stDirection = N'<literal:31>';			-- [comment omitted]
            else if(@dInitSuspQty < @dAfterSuspenseQty)
            set @stDirection = N'<literal:32>';
	set @stInternalKeyId = 
			CASE WHEN @iInternalNum = 0
					  AND (@stTransType = N'<literal:33>'
						   OR @stTransType = N'<literal:34>'
					       OR @stTransType = N'<literal:35>'
					       OR @stTransType = N'<literal:36>')
				 THEN N'<literal:37>'			-- [comment omitted]
				 ELSE CAST(@iInternalNum AS nvarchar(25))
				 END;
	set @dHistQty = 
			CASE WHEN @stTransType = N'<literal:38>'
				 THEN ABS(@dQuantity)
				 WHEN @cReversal is not null
				 THEN @dQuantity * -1
				 ELSE @dQuantity
				 END;
	set @stHistContId = 
			CASE WHEN @stTransType = N'<literal:39>'
					  OR @stTransType = N'<literal:40>'
					  OR @stTransType = N'<literal:41>'
					  OR @stTransType = N'<literal:42>'
					  OR @stTransType = N'<literal:43>'
				 THEN CASE WHEN isnull(@stRecContID, N'<literal:44>') = N'<literal:45>' THEN @stContID else @stRecContID END 
				 ELSE @stContID
				 END;
    set @afterExpDate = @expDate;			 
	
	set @toCompany = 
			CASE WHEN @toCompany is not null
				 THEN @toCompany
				 ELSE @stCompany
				 END; -- [comment omitted]

-- [comment omitted]
-- [comment omitted]
	IF ((@stTransType = N'<literal:46>') 
			AND (@stHistContId IS NULL) 
			AND (@stWorkUnit IS NOT NULL) 
			AND @iFromTo = 0)
	BEGIN
		-- [comment omitted]
		IF EXISTS (SELECT 1 FROM LOCATION WHERE LOCATION = @stLoc 
			AND WAREHOUSE = @stWhs AND TRACK_CONTAINERS = N'<literal:47>')
		BEGIN
			
			SELECT @stHistContId = LOGISTICS_UNIT FROM WORK_INSTRUCTION 
				WHERE INTERNAL_INSTRUCTION_NUM = @iInternalNum 
				AND WORK_UNIT = @stWorkUnit
		END				
	END				 

-- [comment omitted]
-- [comment omitted]
-- [comment omitted]
	IF ((@stTransType = N'<literal:48>' OR @stTransType = N'<literal:49>') 
			AND (@stHistContId IS NULL) 
			AND (@stWorkUnit IS NOT NULL) 
			AND @iFromTo = 1)
	BEGIN	
		
		SELECT @isLocLPTracked = TRACK_CONTAINERS, @locationClass = LOCATION_CLASS 
		FROM LOCATION WHERE LOCATION = @stLoc AND WAREHOUSE = @stWhs

		-- [comment omitted]
		IF ((@locationClass = N'<literal:50>' OR @locationClass = N'<literal:51>')
			AND @stRecContID IS NULL)
			SELECT @stHistContId = WI.CONTAINER_ID FROM WORK_INSTRUCTION WI
			WHERE INTERNAL_INSTRUCTION_NUM = @iInternalNum 
			AND WORK_UNIT = @stWorkUnit
		ELSE IF (@isLocLPTracked = N'<literal:52>')
			SELECT @stHistContId = LOGISTICS_UNIT FROM WORK_INSTRUCTION 
			WHERE INTERNAL_INSTRUCTION_NUM = @iInternalNum 
			AND WORK_UNIT = @stWorkUnit;
	END
	
	-- [comment omitted]
	IF ((@stTransType = N'<literal:53>') 
		AND (@stHistContId IS NULL) )
	BEGIN	
		SET @stHistContId = @stRecContID;
	END

	-- [comment omitted]
	-- [comment omitted]
	IF	((@stTransType = N'<literal:54>')
		AND (@iFromTo = 1))
	BEGIN
		SET @stInitInvSts = NULL;
	END 		
	
	IF	(@stTransType = N'<literal:55>')
	BEGIN
		SELECT @stHistContId = SC.CONTAINER_ID 
		FROM SHIPPING_CONTAINER SC, WORK_INSTRUCTION WI
		WHERE WI.INTERNAL_INSTRUCTION_NUM = @iInternalNum
			AND WI.WORK_UNIT = @stWorkUnit
			AND WI.PARENT_CONTAINER_NUM = SC.INTERNAL_CONTAINER_NUM
	END	 
	
	-- [comment omitted]
	-- [comment omitted]
	IF (@stTransType = N'<literal:56>'
		OR @stTransType = N'<literal:57>'
		OR @stTransType = N'<literal:58>'
		OR @stTransType = N'<literal:59>'
	    OR @stTransType = N'<literal:60>')
	BEGIN
		SET  @internalContainerNum = @iInternalNum;
	END

	-- [comment omitted]
	exec @iError = HIST_SaveTransHist
			 @dAfterAllocQty,
			 @dAfterInTransitQty,
			 @dAfterOnHandQty,
			 @stAfterSts,
			 @dAfterSuspenseQty,
			 @dInitAllocQty,		-- [comment omitted]
			 @dInitInTransQty,		-- [comment omitted]
			 @dInitOnHandQty,		-- [comment omitted]
			 @stInitInvSts,			-- [comment omitted]
			 @dInitSuspQty,			-- [comment omitted]
			 @stCompany,				-- [comment omitted]
			 @stHistContId,
			 @stDirection,
			 @stEquipmentType,			-- [comment omitted]
			 @stInternalKeyId,
			 @stItem,
			 @stLoc,
			 @stLot,
			 N'<literal:61>',	-- [comment omitted]
			 @dHistQty,				-- [comment omitted]
			 @stQuantityUm,
			 @stReferenceId,
			 @dReferenceLine,
			 @stReferenceType,
			 @toCompany,			
			 @toWarehouse,			 
			 @stTransType,
			 @stUserDef1,
			 @stUserDef2,
			 @stUserDef3,
			 @stUserDef4,
			 @stUserDef5,
			 @stUserDef6,
			 @dUserDef7,
			 @dUserDef8,
			 @stUserName,
			 @stWhs,						-- [comment omitted]
			 @stWorkGroup,
			 @stTeam,
			 @stWorkType,
			 @stWorkUnit,
			 @argumentGroupId,
                         @initExpDate,
                         @afterExpDate,
                         @locInvAttributesId,
			 @cTransHistActive output,	-- [comment omitted]
			 @internalContainerNum,
			 @catchWeight,
			 @catchWeightUM;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- [comment omitted]



