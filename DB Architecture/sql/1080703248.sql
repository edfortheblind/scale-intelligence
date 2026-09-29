-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





























-- [comment omitted]


CREATE PROCEDURE HIST_SaveTransHist(
	@dAfterAllocQty numeric(19,5), 
	@dAfterInTransitQty numeric(19,5),
	@dAfterOnHandQty numeric(19,5),
	@stAfterSts nvarchar(50),
	@dAfterSuspenseQty numeric(19,5),
	@dBeforeAllocQty numeric(19,5), 
	@dBeforeInTransitQty numeric(19,5),
	@dBeforeOnHandQty numeric(19,5),
	@stBeforeSts nvarchar(50),
	@dBeforeSuspenseQty numeric(19,5),
	@stCompany nvarchar(25),
	@stContId nvarchar(50),
	@stDirection nvarchar(25),
	@stEquipmentType nvarchar(25), 
	@stInternalKeyId nvarchar(25), 
	@stItem nvarchar(50),
	@stLoc nvarchar(25),
	@stLot nvarchar(25),
	@stProcessStamp nvarchar(100),
	@dQuantity numeric(19,5),
	@stQuantityUm nvarchar(25),
	@stReferenceId nvarchar(25),
	@dReferenceLine numeric(19,5),
	@stReferenceType nvarchar(50),
	@toCompany nvarchar(25),
	@toWarehouse nvarchar(25),		
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
	@stWorkTeam nvarchar(50),
	@stWorkType nvarchar(25),
	@stWorkUnit nvarchar(50),
	@argumentGroupId nvarchar(32),
        @beforeExpDate datetime,
        @afterExpDate datetime,
        @locInvAttributesId numeric(9) = NULL,
	@cTransHistActive nvarchar(250) output,
	@internalContainerNum numeric(9) = 0,
	@catchWeight numeric(14,5) = NULL,
	@catchWeightUM nvarchar(25) = NULL)
AS
	SET NOCOUNT ON;
	
	declare @error int;
	declare @transHistId numeric(9);
	declare @includeInUpload nvarchar(250);
	declare @stWorkZone nvarchar(25);
	declare @rowCount int;
	declare @catchWeightFeatureFlag nvarchar(1);
	-- [comment omitted]
	-- [comment omitted]
	SELECT @cTransHistActive = CASE 
				WHEN @cTransHistActive is null 
				THEN SYS1VALUE
				ELSE @cTransHistActive 
				END,
		   @includeInUpload = SYS2VALUE
	FROM GENERIC_CONFIG_DETAIL
	WHERE RECORD_TYPE = N'<literal:1>'
		AND IDENTIFIER = @stTransType;
		
	SELECT @stWorkZone = WORK_ZONE
	FROM LOCATION
	WHERE LOCATION = @stLoc
		AND WAREHOUSE = @stWhs ;	
		
	-- [comment omitted]
	IF (@internalContainerNum IS NULL)
	BEGIN
		SET @internalContainerNum = 0;
	END
		
	if (@cTransHistActive = N'<literal:2>' or @cTransHistActive = N'<literal:3>')
	begin
		-- [comment omitted]
		INSERT INTO TRANSACTION_HISTORY
			   (ACTIVITY_DATE_TIME,
				AFTER_ALLOC_QTY,
				AFTER_IN_TRANSIT_QTY,
				AFTER_ON_HAND_QTY,
				AFTER_STS,
				AFTER_SUSPENSE_QTY,
				BEFORE_ALLOC_QTY,
				BEFORE_IN_TRANSIT_QTY,
				BEFORE_ON_HAND_QTY,
				BEFORE_STS,
				BEFORE_SUSPENSE_QTY,
				COMPANY,
				CONTAINER_ID,
				DATE_TIME_STAMP,
				DIRECTION,
				EQUIPMENT_TYPE,
				INTERNAL_KEY_ID,
				ITEM,
				LOCATION,
				LOT,
				PROCESS_STAMP,
				QUANTITY,
				QUANTITY_UM,
				REFERENCE_ID,
				REFERENCE_LINE_NUM,
				REFERENCE_TYPE,
				TO_COMPANY,	
				TO_WAREHOUSE,				
				TRANSACTION_TYPE,
				USER_DEF1,
				USER_DEF2,
				USER_DEF3,
				USER_DEF4,
				USER_DEF5,
				USER_DEF6,
				USER_DEF7,
				USER_DEF8,
				USER_NAME,
				USER_STAMP,
				WAREHOUSE,
				WORK_GROUP,
				WORK_TEAM,
				WORK_TYPE,
				WORK_UNIT,
				WORK_ZONE,
                BEFORE_EXPIRATION_DATE,
                AFTER_EXPIRATION_DATE,
                UPLOAD_INTERFACE_BATCH,
				INTERNAL_CONTAINER_NUM )
		VALUES (dbo.DHfn_RoundToSec(GETUTCDATE()), -- [comment omitted]
				@dAfterAllocQty, 
				@dAfterInTransitQty,
				@dAfterOnHandQty,
				@stAfterSts,
				@dAfterSuspenseQty,
				@dBeforeAllocQty, 
				@dBeforeInTransitQty,
				@dBeforeOnHandQty,
				@stBeforeSts,
				@dBeforeSuspenseQty,
				@stCompany,
				@stContId,
				dbo.DHfn_RoundToSec(GETUTCDATE()), -- [comment omitted]
				@stDirection,
				@stEquipmentType, -- [comment omitted]
				@stInternalKeyId,
				@stItem,
				@stLoc,
				@stLot,
				@stProcessStamp,
				@dQuantity,
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
				@stUserName, -- [comment omitted]
				@stUserName, -- [comment omitted]
				@stWhs,
				@stWorkGroup,
				@stWorkTeam,
				@stWorkType,
				@stWorkUnit,
				@stWorkZone,
                @beforeExpDate,
                @afterExpDate,
                CASE WHEN @includeInUpload = N'<literal:4>' OR @includeInUpload = N'<literal:5>' 
                THEN NULL
                ELSE N'<literal:6>'
                END,
				@internalContainerNum);
		select @error = @@ERROR, @transHistId = @@IDENTITY;
		if (@error <> 0) return -1;		
		
		if (@transHistId > 0)
		begin
		SELECT @catchWeightFeatureFlag = dbo.fn_GetFeatureEnabled(N'<literal:7>', NULL);
		if(@catchWeightFeatureFlag = N'<literal:8>')
		begin
			if (@catchWeight IS NOT NULL)
			begin
				INSERT TRANS_HIST_ATTRIBUTES
				(
					LINK_ID,
					ATTRIBUTE_TYPE,
					ATTRIBUTE_VALUE,
					PROCESS_STAMP,
					USER_STAMP,
					DATE_TIME_STAMP
				)
				SELECT @transHistId,
				       N'<literal:9>',
				       CAST(@catchWeight AS numeric(14,5)),
				       N'<literal:10>',
				       @stUserName,
				       dbo.DHfn_RoundToSec(GETUTCDATE());
				if (@@ERROR <> 0) return -1;
			end;
			
			if (@catchWeightUM IS NOT NULL)
			begin
				INSERT TRANS_HIST_ATTRIBUTES
				(
					LINK_ID,
					ATTRIBUTE_TYPE,
					ATTRIBUTE_VALUE,
					PROCESS_STAMP,
					USER_STAMP,
					DATE_TIME_STAMP
				)
				SELECT @transHistId,
				       N'<literal:11>',
				       @catchWeightUM,
				       N'<literal:12>',
				       @stUserName,
				       dbo.DHfn_RoundToSec(GETUTCDATE());
				if (@@ERROR <> 0) return -1;
			end;
			end;
						
			-- [comment omitted]
			INSERT TRANS_HIST_ATTRIBUTES
			(
				LINK_ID,
				ATTRIBUTE_TYPE,
				ATTRIBUTE_VALUE,
				PROCESS_STAMP,
				USER_STAMP,
				DATE_TIME_STAMP
			)
			SELECT @transHistId,
			       N'<literal:13>',
			       ARGUMENT_VALUE,
			       N'<literal:14>',
			       @stUserName,
			       dbo.DHfn_RoundToSec(GETUTCDATE())
			  FROM INVENTORY_ARGUMENT
			 WHERE GROUP_ID = @argumentGroupId
			   AND ARGUMENT_NAME = N'<literal:15>';

			SELECT @error = @@ERROR, @rowCount = @@ROWCOUNT;

			if (@error <> 0) return -1;

			-- [comment omitted]
			IF(@rowCount>0)
				BEGIN
					SELECT @rowCount =(SELECT COUNT(DISTINCT(GROUP_ID)) from SERIAL_NUMBER 
											WHERE OBJECT_ID IN 
												(SELECT ARGUMENT_VALUE FROM INVENTORY_ARGUMENT 
												 WHERE GROUP_ID = @argumentGroupId
												 AND ARGUMENT_NAME = N'<literal:16>'));
							 
					-- [comment omitted]
					-- [comment omitted]
					IF (@rowCount > 0 AND @rowCount <> @dQuantity AND @stTransType = N'<literal:17>' AND @dBeforeSuspenseQty = @dAfterSuspenseQty)
					BEGIN
						RAISERROR(N'<literal:18>' , 18, 1); 
						return -1;
					END
				END
			-- [comment omitted]
			ELSE
				BEGIN
					
					-- [comment omitted]
					IF EXISTS (SELECT 1 FROM LOCATION WHERE LOCATION = @stLoc 
						AND WAREHOUSE = @stWhs AND LOCATION_CLASS = N'<literal:19>')
					BEGIN
						-- [comment omitted]
						-- [comment omitted]
						IF(@stTransType = N'<literal:20>' AND @dBeforeOnHandQty <> @dAfterOnHandQty)
						BEGIN

							declare @serialNumTracking int;
							set @serialNumTracking=(SELECT ISNULL(SERIAL_NUM_TRACKING, 0) FROM ITEM 
													WHERE ITEM = @stItem 
													AND (COMPANY = @stCompany OR COMPANY IS NULL));

							-- [comment omitted]
							IF(@serialNumTracking=7)
							BEGIN

								declare @cycleCountRequestsCount int;
					
								IF(TRY_PARSE(@stReferenceId AS int) IS NOT NULL)
								BEGIN
									set @cycleCountRequestsCount=(SELECT COUNT(*) FROM CYCLE_COUNT_REQUEST 
																	WHERE INTERNAL_PLAN_NUM=@stReferenceId);
								END
								ELSE
								BEGIN
									set @cycleCountRequestsCount=-1;
								END

								-- [comment omitted]
								-- [comment omitted]
								-- [comment omitted]

								IF(@cycleCountRequestsCount<=0)
								BEGIN
									RAISERROR(N'<literal:21>' , 18, 1); 
									return -1;
								END					
							END
						END
					END
				END

            if (@locInvAttributesId IS NOT NULL AND @locInvAttributesId != 0)
			begin
				-- [comment omitted]
				INSERT TRANS_HIST_ATTRIBUTES
				( 
					LINK_ID,
					ATTRIBUTE_TYPE,
					ATTRIBUTE_VALUE,
					PROCESS_STAMP,
					USER_STAMP,
					DATE_TIME_STAMP
				)
				SELECT @transHistId,
					   N'<literal:22>',
					   @locInvAttributesId,
					   N'<literal:23>',
					   @stUserName,
					   dbo.DHfn_RoundToSec(GETUTCDATE());
				if (@error <> 0) return -1;
			end;
		end;
	end; -- [comment omitted]
-- [comment omitted]


