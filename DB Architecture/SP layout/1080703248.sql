/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB			| 10/07/02	| Created.
	4415		| RAB			| 03/05/03	| Add userDef fields.
	11258		| RAB			| 05/07/03	| Truncate dates to nearest second.
	11870     	| TBS                   	| 09/16/03      	| Added Multi-Byte support.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	14842		| RAB			| 09/09/04	| Serial Number Tracking.
	16686		| SMF			| 06/02/05	| Handle null transaction type
	16413      	| KSP            		| 04/15/05      	| Expanded Lot Control
	16820	 	| RR			| 27/07/05	| Added toCompany & toWarehouse	
	63119		| DSK			| 12/15/09	| Set UPLOAD_INTERFACE_BATCH to Not Included if 
				|				|			| Include In Upload flag is N
	63561		| NB			| 01/08/10	| Added WORK_ZONE		
	70073		| SSH			| 05/26/10	| Added parameter @locInvAttributesId and update the same into TRANS_HIST_ATTRIBUTES.
    102778		| DRK			| 09/27/12	| Added @internalContainerNum to be added to Transaction History
	260380		| NRJ			| 10/29/20	| Modified to throw exception in case of mismatch in serial number quantities.
	260380		| NRJ			| 10/29/20	| Modified to throw exception when inv arguments are not passed for serial number adjustments.

	Records TransactionHistory.
	
	Parameters
	 	History Information.
		
	Output Parameters
		String		stTransTypeDesc		Null if the GenericConfDetail has not been
										queried.  Otherwise, that select is skipped.
*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


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
	-- determine if TransactionHistory is active for the 
	-- current transactionType.
	SELECT @cTransHistActive = CASE 
				WHEN @cTransHistActive is null 
				THEN SYS1VALUE
				ELSE @cTransHistActive 
				END,
		   @includeInUpload = SYS2VALUE
	FROM GENERIC_CONFIG_DETAIL
	WHERE RECORD_TYPE = N'HIST TR TY'
		AND IDENTIFIER = @stTransType;
		
	SELECT @stWorkZone = WORK_ZONE
	FROM LOCATION
	WHERE LOCATION = @stLoc
		AND WAREHOUSE = @stWhs ;	
		
	-- prevent null values in case the container could not be found
	IF (@internalContainerNum IS NULL)
	BEGIN
		SET @internalContainerNum = 0;
	END
		
	if (@cTransHistActive = N'Y' or @cTransHistActive = N'y')
	begin
		-- insert the record.
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
		VALUES (dbo.DHfn_RoundToSec(GETUTCDATE()), -- activityDateTime
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
				dbo.DHfn_RoundToSec(GETUTCDATE()), -- dateTimeStamp
				@stDirection,
				@stEquipmentType, -- equipmentType
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
				@stUserName, -- userName
				@stUserName, -- userStamp
				@stWhs,
				@stWorkGroup,
				@stWorkTeam,
				@stWorkType,
				@stWorkUnit,
				@stWorkZone,
                @beforeExpDate,
                @afterExpDate,
                CASE WHEN @includeInUpload = N'Y' OR @includeInUpload = N'y' 
                THEN NULL
                ELSE N'Not Included'
                END,
				@internalContainerNum);
		select @error = @@ERROR, @transHistId = @@IDENTITY;
		if (@error <> 0) return -1;		
		
		if (@transHistId > 0)
		begin
		SELECT @catchWeightFeatureFlag = dbo.fn_GetFeatureEnabled(N'FEATURE_54734_CATCH_WEIGHT', NULL);
		if(@catchWeightFeatureFlag = N'Y')
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
				       N'Catch Weight',
				       CAST(@catchWeight AS numeric(14,5)),
				       N'HIST_SaveTransHist.sql',
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
				       N'Catch Weight UM',
				       @catchWeightUM,
				       N'HIST_SaveTransHist.sql',
				       @stUserName,
				       dbo.DHfn_RoundToSec(GETUTCDATE());
				if (@@ERROR <> 0) return -1;
			end;
			end;
						
			-- insert attributes for any adjusted serial numbers.
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
			       N'SERIALNUMBER',
			       ARGUMENT_VALUE,
			       N'HIST_SaveTransHist.sql',
			       @stUserName,
			       dbo.DHfn_RoundToSec(GETUTCDATE())
			  FROM INVENTORY_ARGUMENT
			 WHERE GROUP_ID = @argumentGroupId
			   AND ARGUMENT_NAME = N'SERIALNUMBER';

			SELECT @error = @@ERROR, @rowCount = @@ROWCOUNT;

			if (@error <> 0) return -1;

			--only when attributes inserted and that happens only for serial numbers.
			IF(@rowCount>0)
				BEGIN
					SELECT @rowCount =(SELECT COUNT(DISTINCT(GROUP_ID)) from SERIAL_NUMBER 
											WHERE OBJECT_ID IN 
												(SELECT ARGUMENT_VALUE FROM INVENTORY_ARGUMENT 
												 WHERE GROUP_ID = @argumentGroupId
												 AND ARGUMENT_NAME = N'SERIALNUMBER'));
							 
					--if adjusted quantity is not matching to the attributes inserted raise 
					--error for adjustment transaction type (do not validate for suspense quantity adjustments).		
					IF (@rowCount > 0 AND @rowCount <> @dQuantity AND @stTransType = N'40' AND @dBeforeSuspenseQty = @dAfterSuspenseQty)
					BEGIN
						RAISERROR(N'Invalid transaction for serial number adjustments.' , 18, 1); 
						return -1;
					END
				END
			--no attributes passed
			ELSE
				BEGIN
					
					-- inventory location
					IF EXISTS (SELECT 1 FROM LOCATION WHERE LOCATION = @stLoc 
						AND WAREHOUSE = @stWhs AND LOCATION_CLASS = N'Inventory')
					BEGIN
						--for adjustment transactions
						--also when only on hand quantity changes.
						IF(@stTransType = N'40' AND @dBeforeOnHandQty <> @dAfterOnHandQty)
						BEGIN

							declare @serialNumTracking int;
							set @serialNumTracking=(SELECT ISNULL(SERIAL_NUM_TRACKING, 0) FROM ITEM 
													WHERE ITEM = @stItem 
													AND (COMPANY = @stCompany OR COMPANY IS NULL));

							--if serial number tracked item
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

								--if it is inventory tracked serial numbered item and adjustment transaction type 
								--no inventory attributes passed,then raise the error.
								--(Exclude cycle count adjustments for this check)

								IF(@cycleCountRequestsCount<=0)
								BEGIN
									RAISERROR(N'Invalid transaction for serial number adjustments. Serial numbers are not specified.' , 18, 1); 
									return -1;
								END					
							END
						END
					END
				END

            if (@locInvAttributesId IS NOT NULL AND @locInvAttributesId != 0)
			begin
				-- insert location inventory attributes for any transaction involving these values.
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
					   N'Inventory Attributes',
					   @locInvAttributesId,
					   N'HIST_SaveTransHist.sql',
					   @stUserName,
					   dbo.DHfn_RoundToSec(GETUTCDATE());
				if (@error <> 0) return -1;
			end;
		end;
	end; -- end if current TransactionHistory type is active   
-- end HIST_SaveTransHist


