/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB			| 08/14/02	| Created.
	4415		| RAB			| 03/05/03	| Add userDef fields.
	11191		| RAB			| 04/29/03	| Added forceOnHandZero.
	11870       | TBS           | 09/16/03  | Added Multi-Byte support.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	14842		| RAB			| 09/09/04	| Added argumentGroupId.
        16413           | KSP                   | 04/23/05      | Expanded Lot Control
	16820		| RR			| 27/07/05	| Added toCompany & toWarehouse        
	16780		| SP			| 09/26/05	| Used _HISTTRLOCATING in place of stLOCATING 
	19167		| SAT			| 05/05/06	| License Plate Changes
	1558		| DNP			| 05/08/07	| Expiry dates should be written in transaction history properly
	17651       | AG            | 02/07/08  | Changed logic for getting After Status for Inventory Transfer
	Records TransactionHistory for the current adjustment.
	19733		| SMS			| 02/22/08	| Added logic to retrieve and assign LP/ContainerID to the Trans History
	29641		| AKN			| 07/22/08  | added a condition to change the direction variable.
	36137		| YHR			| 10/14/08  | Assigned Container to be logged in history for Dock Transfer
    40442       | AK            | 11/19/08  | Modified a condition to change the direction for cycle counting correctly.
    51901		| SVS			| 05/19/09  | Added logic to set the Exp dates correctly
    51919		| SVS			| 05/19/09  | Added logic to set the invntory status correctly.
    52334		| SVS			| 05/22/09  | Pass  correct exp date to the transaction history.
    63410		| DSK			| 12/31/09	| For Work Order Allocation To, set the before status as NULL 
	66738		| MM			| 03/19/10	| Putting a check if it is a FROM location before assigning after inventory status
	66621		| NB			| 03/24/10	| Modified to adjust the suspense qty 
	70383		| NB			| 06/02/10	| Reverted back the change done for 66621
	70073		| SSH			| 05/26/10	| Added parameter @locInvAttributesId.
	18417		| MMM			| 03/11/11	| Modified to update container id in Transaction History for Dock Management Pick & Putaway work
	82356		| RJR			| 03/21/11	| Modified to show LP/container id for unlocate transaction history. 

	82175		| DRK			| 04/13/2011| Fixed Inv Status in Xn History for Inv Mgmt
	93922		| DN			| 02/01/12	| Modified to look for diff transation type for dock confirm work
	98872		| SAM			| 04/27/12	| Added logic to update inventory status
	Parameters
		int		iFromTo		Either 0 or iTO.
		Adjustment information.
	99922		| NRJ			| 06/14/12	| Set the container Id to null for shipping Dock locations as these are Non-InventoryTracked.
    102778		| DRK			| 09/27/12	| Added Internal Container Num to Transaction History for Receipt Check-in/Cancel Check-In/locate/un-locate
	104545		| DRK			| 11/06/12	| Added Container Id/Internal Container Num for Receipt container delete/cancel
	107994		| SHS			| 04/23/13	| Updated AfterExpriryDate to copy from InitialExpiryDate when null.
	110824		| MJ			| 04/26/13	| Rolled back AfterExpriryDate Changes in 107994.
	144331		| MMM			| 07/15/14	| Reverted changes of 99922 and applied additional fix to handle 99922 scenario
	215783		| ALS			| 11/10/17	| Addressed performance issue with 144331
*/


CREATE PROCEDURE INV_SaveHistInvChg(
	@iFromTo numeric(1,0),
	@cForceOnHandZero nchar(1), -- SYSTEM_CREATED to set char type
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
	
	-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;

	-- local variables
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

	-- if history is turned off, return immediately
	if (@cTransHistActive = N'N')
		return 0;
	
	-- inventory transactions done during LoadConfirm
	-- write a different workType to history base on the
	-- users shipping preferences.
	if (@stTransType = N'70')
	begin
		SELECT @stWorkType = WORK_TYPE
		  FROM SHIPPING_PREFERENCES
		 WHERE PREFERENCE_NAME = (SELECT ISNULL(SHIPPING_PREFERENCE, 
												N'*Default')
								    FROM USER_PROFILE
								   WHERE USER_NAME = @stUserName);
	end; -- end if LoadConfirm.
		
	-- set other variables used to write history.
	set @dAfterAllocQty = 
			 CASE WHEN @cAllocEffect = N'+'
				  THEN @dInitAllocQty + @dQuantity
				  WHEN @cAllocEffect = N'-'
				  THEN @dInitAllocQty - @dQuantity
				  ELSE @dInitAllocQty
				  END;
	set @dAfterInTransitQty =
			 CASE WHEN @cInTransEffect = N'+'
				  THEN @dInitInTransQty + @dQuantity
				  WHEN @cInTransEffect = N'-'
				  THEN @dInitInTransQty - @dQuantity
				  ELSE @dInitInTransQty
				  END;
	set @dAfterOnHandQty = 
			 CASE WHEN @cOnHandEffect = N'+' 
				  THEN @dInitOnHandQty + @dQuantity
				  WHEN @cOnHandEffect = N'-' 
				  THEN CASE WHEN @dInitOnHandQty <= 0 
								 and (@cForceOnHandZero = N'Y' 
								      or @cForceOnHandZero = N'y')
							THEN @dInitOnHandQty
							WHEN @dInitOnHandQty - @dQuantity < 0
								 and (@cForceOnHandZero = N'Y' 
								      or @cForceOnHandZero = N'y')
							THEN 0
							ELSE @dInitOnHandQty - @dQuantity
							END
				  ELSE @dInitOnHandQty 
				  END;
	
	set @dAfterSuspenseQty =
			 CASE WHEN @cSuspEffect = N'+'
				  THEN @dInitSuspQty + @dQuantity
				  WHEN @cSuspEffect = N'-'
				  THEN @dInitSuspQty - @dQuantity
				  ELSE 	@dInitSuspQty				 
				  END;

	if(@stInventorySts is null OR @stInventorySts = N'')
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
			 CASE WHEN @stTransType = N'260'
					   AND @cOnHandEffect is null
				  THEN CASE WHEN @iFromTo = 0
						    THEN N'To'		-- hard coded resource key
						    ELSE N'From'		-- hard coded resource key
						    END
				  WHEN @iFromTo = 0
				  THEN N'From'				-- hard coded resource key
				  ELSE N'To'					-- hard coded resource key
				  END;
	set @stAfterSts =
			 CASE 
			 -- during inventory transfer (Transfer Type = 60), from location status should not change.
				  WHEN (@stTransType = N'60' or @stTransType = N'120' or @stTransType = N'130' or @stTransType = N'140')
						AND @stInitInvSts is not null
						AND (@stDirection = N'From' or ((@stTransType = N'120' or @stTransType = N'130' or @stTransType = N'140') and @stDirection = N'To'))
						AND @dAfterOnHandQty > 0
				  THEN @stInitInvSts
				  ELSE @stInventorySts
				  END;
	       -- IF Confirming Cycle Count Work
	        if(@dInitSuspQty > @dAfterSuspenseQty) 
            set @stDirection = N'From';			-- hard coded resource key
            else if(@dInitSuspQty < @dAfterSuspenseQty)
            set @stDirection = N'To';
	set @stInternalKeyId = 
			CASE WHEN @iInternalNum = 0
					  AND (@stTransType = N'130'
						   OR @stTransType = N'140'
					       OR @stTransType = N'120'
					       OR @stTransType = N'240')
				 THEN N'MULTIPLE'			-- hard coded resource key
				 ELSE CAST(@iInternalNum AS nvarchar(25))
				 END;
	set @dHistQty = 
			CASE WHEN @stTransType = N'260'
				 THEN ABS(@dQuantity)
				 WHEN @cReversal is not null
				 THEN @dQuantity * -1
				 ELSE @dQuantity
				 END;
	set @stHistContId = 
			CASE WHEN @stTransType = N'260'
					  OR @stTransType = N'80'
					  OR @stTransType = N'165'
					  OR @stTransType = N'20'
					  OR @stTransType = N'10'
				 THEN CASE WHEN isnull(@stRecContID, N'') = N'' THEN @stContID else @stRecContID END 
				 ELSE @stContID
				 END;
    set @afterExpDate = @expDate;			 
	
	set @toCompany = 
			CASE WHEN @toCompany is not null
				 THEN @toCompany
				 ELSE @stCompany
				 END; --fromCompany

--	If the stTransType is Pick Confirmation and its From location which is LP tracked
--	then ensure License plate is logged in transaction history
	IF ((@stTransType = N'130') 
			AND (@stHistContId IS NULL) 
			AND (@stWorkUnit IS NOT NULL) 
			AND @iFromTo = 0)
	BEGIN
		--If From location is LP tracked then log the logistics unit
		IF EXISTS (SELECT 1 FROM LOCATION WHERE LOCATION = @stLoc 
			AND WAREHOUSE = @stWhs AND TRACK_CONTAINERS = N'Y')
		BEGIN
			
			SELECT @stHistContId = LOGISTICS_UNIT FROM WORK_INSTRUCTION 
				WHERE INTERNAL_INSTRUCTION_NUM = @iInternalNum 
				AND WORK_UNIT = @stWorkUnit
		END				
	END				 

--	If the stTransType is Pick & Put Confirmation or putaway confirmation and 
--	its a To location then container id should be logged in transaction history if  picked into
--	shipping container, if To location is LP tracked then LP should be logged
	IF ((@stTransType = N'120' OR @stTransType = N'140') 
			AND (@stHistContId IS NULL) 
			AND (@stWorkUnit IS NOT NULL) 
			AND @iFromTo = 1)
	BEGIN	
		
		SELECT @isLocLPTracked = TRACK_CONTAINERS, @locationClass = LOCATION_CLASS 
		FROM LOCATION WHERE LOCATION = @stLoc AND WAREHOUSE = @stWhs

		--If shipping dock then log the container id else if To location is LP tracked then log LP
		IF ((@locationClass = N'Shipping Dock' OR @locationClass = N'Put to Store')
			AND @stRecContID IS NULL)
			SELECT @stHistContId = WI.CONTAINER_ID FROM WORK_INSTRUCTION WI
			WHERE INTERNAL_INSTRUCTION_NUM = @iInternalNum 
			AND WORK_UNIT = @stWorkUnit
		ELSE IF (@isLocLPTracked = N'Y')
			SELECT @stHistContId = LOGISTICS_UNIT FROM WORK_INSTRUCTION 
			WHERE INTERNAL_INSTRUCTION_NUM = @iInternalNum 
			AND WORK_UNIT = @stWorkUnit;
	END
	
	-- If stTransType is Dock Transfer and Container Id is in Receiving Container for the location
	IF ((@stTransType = N'410') 
		AND (@stHistContId IS NULL) )
	BEGIN	
		SET @stHistContId = @stRecContID;
	END

	--If TransType is Work Order Allocation To, 
	--set the before status as NULL always
	IF	((@stTransType = N'300')
		AND (@iFromTo = 1))
	BEGIN
		SET @stInitInvSts = NULL;
	END 		
	
	IF	(@stTransType = N'460')
	BEGIN
		SELECT @stHistContId = SC.CONTAINER_ID 
		FROM SHIPPING_CONTAINER SC, WORK_INSTRUCTION WI
		WHERE WI.INTERNAL_INSTRUCTION_NUM = @iInternalNum
			AND WI.WORK_UNIT = @stWorkUnit
			AND WI.PARENT_CONTAINER_NUM = SC.INTERNAL_CONTAINER_NUM
	END	 
	
	-- retrieve internal receipt container num if the transaction type is check-in/Cancel Check-In/locate/un-locate
	-- this in-turn will be set in the transaction history
	IF (@stTransType = N'20'
		OR @stTransType = N'165'
		OR @stTransType = N'10'
		OR @stTransType = N'260'
	    OR @stTransType = N'80')
	BEGIN
		SET  @internalContainerNum = @iInternalNum;
	END

	-- record the history.
	exec @iError = HIST_SaveTransHist
			 @dAfterAllocQty,
			 @dAfterInTransitQty,
			 @dAfterOnHandQty,
			 @stAfterSts,
			 @dAfterSuspenseQty,
			 @dInitAllocQty,		-- beforeAllocQty
			 @dInitInTransQty,		-- beforeInTransitQty
			 @dInitOnHandQty,		-- beforeOnHandQty
			 @stInitInvSts,			-- beforeSts
			 @dInitSuspQty,			-- beforeSuspenseQty
			 @stCompany,				-- fromCompany
			 @stHistContId,
			 @stDirection,
			 @stEquipmentType,			-- equipmentType
			 @stInternalKeyId,
			 @stItem,
			 @stLoc,
			 @stLot,
			 N'INV_SaveHistInvChg',	-- process stamp
			 @dHistQty,				-- quantity
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
			 @stWhs,						-- fromWarehouse
			 @stWorkGroup,
			 @stTeam,
			 @stWorkType,
			 @stWorkUnit,
			 @argumentGroupId,
                         @initExpDate,
                         @afterExpDate,
                         @locInvAttributesId,
			 @cTransHistActive output,	-- output parameter
			 @internalContainerNum,
			 @catchWeight,
			 @catchWeightUM;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- end INV_SaveHistInvChg



