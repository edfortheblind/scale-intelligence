-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */


































-- [comment omitted]


CREATE PROCEDURE INV_AdjustInv(
	@cFromAllocEffect nchar(1), -- [comment omitted]
	@cFromInTransEffect nchar(1),
	@cFromOnHandEffect nchar(1),
	@cFromSuspEffect nchar(1),
	@cReversal nchar(1),
	@cToAllocEffect nchar(1),
	@cToInTransEffect nchar(1),
	@cToOnHandEffect nchar(1),
	@cToSuspEffect nchar(1),
	@dFromContQty numeric(19,5),
	@dQuantity numeric(19,5),
	@dReferenceLine numeric(19,5),
	@iInternalNum numeric(9),
	@stCompany nvarchar(25),
	@stEquipmentType nvarchar(25),
	@stExpDate nvarchar(50), -- [comment omitted]
	@cForceOnHandZero nchar(1),
	@stFromContId nvarchar(50),
	@stFromLoc nvarchar(25),	
	@stFromWhs nvarchar(25),
	@stInventorySts nvarchar(50),
	@stItem nvarchar(50),
	@stItemDesc nvarchar(100),
	@stLot nvarchar(25),
	@stManDate nvarchar(50), -- [comment omitted]
	@stQuantityUM nvarchar(25),
	@stRecContID nvarchar(25),
	@FromParentLogisticsUnit nvarchar(50),
	@ToParentLogisticsUnit nvarchar(50),
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
    @fromLocInvAttributeId numeric(9) = NULL,
    @toLocInvAttributeId numeric(9) = NULL,
	@isNegativeAvailableAllowed bit = false,
	@catchWeight numeric(14,5) = NULL,
	@catchWeightUM nvarchar(25) = NULL,
	@shipContNum numeric(9) = NULL)

AS
	SET NOCOUNT ON;

	-- [comment omitted]
	declare @cTransHistActive nvarchar(250);
	declare @dOverrodeVolumePerItem numeric(28,5);
	declare @dOverrodeWeightPerItem numeric(28,5);
	declare @dtExpDate datetime;
	declare @dtFromAgingDate datetime;
	declare @dtFromExpDate datetime;
	declare @dtFromManDate datetime;
	declare @dtFromRecDate datetime;
	declare @dtManDate datetime;
	declare @iError int;
	declare @stErrorMsg nvarchar(2000);
	declare @stFromInvSts nvarchar(50);
	declare @stFromItemColor nvarchar(25);
	declare @stFromItemDesc nvarchar(100);
	declare @stFromItemSize nvarchar(25);
	declare @stFromItemStyle nvarchar(25);
	declare @stFromToLoc nvarchar(2000);
	declare @stFromToWhs nvarchar(2000);
	declare @sernCount int;
	declare @stInternalLocUMs nvarchar(100);
	declare @fromIntLocInv numeric(9); -- [comment omitted]
		
	-- [comment omitted]
	if (@dQuantity is null
		or @dQuantity = 0.0
		or (@stFromLoc is null
			and @stToLoc is null)
		or @stItem is null)
	begin
		-- [comment omitted]
		-- [comment omitted]
		set @stErrorMsg = 
			N'<literal:1>' + dbo.RSCMfn_RtrvMsg(N'<literal:2>'); 
		set @stFromToLoc = isnull(@stFromLoc,N'<literal:3>') + N'<literal:4>' + 
						   isnull(@stToLoc,N'<literal:5>');
		set @stFromToWhs = isnull(@stFromWhs,N'<literal:6>') + N'<literal:7>' + 
						   isnull(@stToWhs,N'<literal:8>');
		exec ADT_LogAudit 
				N'<literal:9>',							-- [comment omitted]
				null,										-- [comment omitted]
				@stErrorMsg,								-- [comment omitted]
				N'<literal:10>', @stTransType,				-- [comment omitted]
				N'<literal:11>', @stItem,							-- [comment omitted]
				N'<literal:12>', @stCompany,					-- [comment omitted]
				N'<literal:13>', @stLot,							-- [comment omitted]
				N'<literal:14>', @stFromToLoc,			-- [comment omitted]
				N'<literal:15>', @stFromToWhs,		-- [comment omitted]
				N'<literal:16>', @dQuantity,					-- [comment omitted]
				N'<literal:17>', @stQuantityUm,				-- [comment omitted]
				N'<literal:18>', @stReferenceId,			-- [comment omitted]
				N'<literal:19>', @dReferenceLine,			-- [comment omitted]
				@stUserName,								-- [comment omitted]
				@stFromWhs;									-- [comment omitted]
		return;
	end; -- [comment omitted]
	
	-- [comment omitted]
	set @dtExpDate = dbo.DHfn_TransToSQLDate(@stExpDate);
	set @dtManDate = dbo.DHfn_TransToSQLDate(@stManDate);
	
	if(@fromLocInvAttributeId = 0)
		set @fromLocInvAttributeId = NULL;
		
	if(@toLocInvAttributeId = 0)
		set @toLocInvAttributeId = NULL;

	if(@argumentGroupId is null)
	BEGIN
		declare @serialNumTracking int;
		set @serialNumTracking=(SELECT ISNULL(SERIAL_NUM_TRACKING, 0) FROM ITEM 
								WHERE ITEM = @stItem 
								AND (COMPANY = @stCompany OR COMPANY IS NULL));



		IF((@stTransType=N'<literal:20>' OR @stTransType = N'<literal:21>' OR @stTransType=N'<literal:22>' OR @stTransType=N'<literal:23>' OR (@stTransType=N'<literal:24>' AND @cFromOnHandEffect=N'<literal:25>')) AND @serialNumTracking=7)			
		BEGIN	
					
			IF(@stTransType=N'<literal:26>' OR @stTransType=N'<literal:27>')
			BEGIN
				declare @locationClass nvarchar(25);
				set @locationClass =(SELECT LOCATION_CLASS FROM LOCATION WHERE LOCATION=@stToLoc AND WAREHOUSE=@stToWhs);

				-- [comment omitted]
				IF(@locationClass =N'<literal:28>')
				BEGIN
					RAISERROR(N'<literal:29>', 18, 1,@stTransType); 
					return -1;
				END
			END
			ELSE
			BEGIN
				RAISERROR(N'<literal:30>', 18, 1,@stTransType); 
				return -1;
			END
		END
	END
		
	-- [comment omitted]
	-- [comment omitted]
	if (@argumentGroupId is not null 
		and substring(@argumentGroupId,len(@argumentGroupId),1) <> N'<literal:31>'
	    and @cFromOnHandEffect = N'<literal:32>')	    
	begin
		
		exec @iError = INV_ValidateSerialNums @dQuantity,@stCompany,@stFromContId,@stFromLoc,@stFromWhs,@stItem,@stLot,@stRecContID,@stTransType,@argumentGroupId,@fromLocInvAttributeId;
		if (@iError <> 0) return @iError;

		exec @iError = INV_PickSerialNumbers @argumentGroupId,@stTransType,@stItem,@stCompany, @sernCount output;
		if (@iError <> 0) return @iError;
	end; -- [comment omitted]

		
	-- [comment omitted]
	if (@cFromOnHandEffect = N'<literal:33>' -- [comment omitted]
		or @cFromInTransEffect = N'<literal:34>' or @cFromInTransEffect = N'<literal:35>'
		or @cFromAllocEffect = N'<literal:36>' or @cFromAllocEffect = N'<literal:37>'
		or @cFromSuspEffect	= N'<literal:38>' or @cFromSuspEffect	= N'<literal:39>')
	begin
		exec @iError = INV_PickFromLocation
				@cForceOnHandZero, @cFromAllocEffect, @cFromInTransEffect, @cFromOnHandEffect, @cFromSuspEffect,@cToInTransEffect,@cToOnHandEffect, @cReversal,@dOverrodeVolumePerItem, @dOverrodeWeightPerItem, @dQuantity, @dReferenceLine, @dtExpDate, @dtManDate, @iInternalNum, @stCompany, @stEquipmentType, @stFromContId, @stFromLoc, @stFromWhs, @stInventorySts, @stItem, @stItemDesc, @stLot, @stQuantityUM, @stRecContID, @FromParentLogisticsUnit, @stReferenceID, @stReferenceType, @stTeam, @stTransType, @stUserDef1, @stUserDef2, @stUserDef3, @stUserDef4, @stUserDef5, @stUserDef6, @dUserDef7, @dUserDef8, @stUserName, @stWorkGroup, @stWorkType, @stWorkUnit,
				@argumentGroupId, @stToWhs, @fromLocInvAttributeId,@isNegativeAvailableAllowed, @catchWeight, @catchWeightUM,
				@dtFromAgingDate output, @dtFromExpDate output, @dtFromManDate output, @dtFromRecDate output, @stFromInvSts output, @stFromItemColor output, @stFromItemDesc output, @stFromItemSize output, @stFromItemStyle output,
				@cTransHistActive output, @stInternalLocUMs output, @fromIntLocInv output, @shipContNum;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	end; -- [comment omitted]
		
	-- [comment omitted]
	if (@cToOnHandEffect = N'<literal:40>' -- [comment omitted]
		or @cToInTransEffect = N'<literal:41>' or @cToInTransEffect = N'<literal:42>'
		or @cToAllocEffect = N'<literal:43>' or @cToAllocEffect = N'<literal:44>'
		or @cToSuspEffect = N'<literal:45>' or @cToSuspEffect = N'<literal:46>')
	begin
		exec @iError = INV_PutIntoLocation
				@cForceOnHandZero, @cReversal, @cToAllocEffect, @cToInTransEffect, @cToOnHandEffect, @cToSuspEffect, @dOverrodeVolumePerItem, @dOverrodeWeightPerItem, @dQuantity, @dReferenceLine, @dtExpDate, @dtManDate, @iInternalNum, @stCompany, @stEquipmentType, @stInventorySts, @stItem, @stItemDesc, @stLot, @stQuantityUM, @stRecContID, @ToParentLogisticsUnit, @stReferenceID, @stReferenceType, @stTeam, @stToContId, @stToLoc, @stToWhs, @stTransType, @stUserDef1, @stUserDef2, @stUserDef3, @stUserDef4, @stUserDef5, @stUserDef6, @dUserDef7, @dUserDef8, @stUserName, @stWorkGroup, @stWorkType, @stWorkUnit,
				@argumentGroupId,
				@dtFromAgingDate, @dtFromExpDate, @dtFromManDate, @dtFromRecDate, @stFromInvSts, @stFromItemColor, @stFromItemDesc, @stFromItemSize, @stFromItemStyle,
				@cTransHistActive, @stInternalLocUMs, @fromIntLocInv,@isNegativeAvailableAllowed, @catchWeight, @catchWeightUM, @shipContNum, @toLocInvAttributeId output;
		if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
	end; -- [comment omitted]

	-- [comment omitted]
	if (@argumentGroupId is not null
	    and (@cFromOnHandEffect <> N'<literal:47>' or @sernCount > 0)
	    and @cToOnHandEffect = N'<literal:48>')
	begin

		exec @iError = INV_PutSerialNumbers
			@argumentGroupId, @stToLoc, @stToWhs, @stItem, @stCompany, @stLot, @stToContId,@toLocInvAttributeId;
		if (@iError <> 0) return @iError;
	end; -- [comment omitted]
