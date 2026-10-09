/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	231236     | MJ				| 22/05/19	| Created.
	233570     | MDL			| 04/01/19	| Modifed for WSH.
	233046     | KSS            | 04/25/19  | Modified for Partial Pick
	233733     | KSS            | 05/02/19  | Modified for ShortPick
	233741     | MMM            | 07/22/19  | Handled Location and Work special handling verify configurations
	237569     | MMM            | 09/06/19  | Removed the JSON format as it is converted to JSON object in web api
	239919	   | HN				| 10/14/19  | Modified for Full security
	245766	   | HN				| 02/06/20  | Modified for LogisticsUnitTracked location
	245731	   | HN				| 02/18/20  | Added logic for custom action handler 
	246525	   | LMN			| 04/20/20	| Added logic for over pick action handler
	248527	   | SO				| 04/15/20	| Modified for multiItemLocation - fixed script error
	254606	   | SO				| 07/31/20	| Modified to get security for add item during cycle count work execution.	
	257144	   | SKT			| 09/07/20	| Modified condition which returns Container Spot Verification active or not.
	255074	   | PS				| 09/09/20	| Modified to get overpick handler.	
	257147	   | SKT			| 11/04/20	| Modified to add OutboundWorkExecution SRC nextUri and loopNextFlow values
	267415	   | VV				| 06/01/21	| Modified to prioritize work special handling location and check digit verify over Locations verify method
	3611       | VM                         | 07/10/21      | Modified for Override Putaway
	10269      | TR                         |05/18/22       |Modified for Override Pick
   23372	   |NB             | 04/13/22   | Added PassHandler
   30407	   | SBR			| 04/29/24	| Added flag DisplayItemDetails to hide item details when multiple items are being fetched.
   39890       |TR             |07/29/24    |Added Entire Short Pick 
*/

CREATE PROCEDURE [dbo].[SRC_WorkConfiguratorModel](
	@workProfileName nvarchar(25),
	@user nvarchar(30),
	@internalWorkSpecialHanding int,
	@location nvarchar(25),
	@internalNumType nvarchar(25),
	@workExecutionMode nvarchar(25),
	@toLocation nvarchar(25),
	@Warehouse nvarchar(25))
AS
	SET NOCOUNT ON;

	declare @securityFormId decimal(9,0) = 60010;
	declare @passSecurity nvarchar(20);
	declare @bypassSecurity nvarchar(20);
	declare @skipSecurity nvarchar(20);
	declare @runSecurity nvarchar(20);
	declare @fullSecurity nvarchar(20);
	declare @partialPick nvarchar(20);
	declare @shortPick nvarchar(20);
	declare @shortPutaway nvarchar(20);
	declare @shortEntirePick nvarchar(20);
	declare @locationVerificationMethod nvarchar(25);
	declare @logisticsUnitTracked nvarchar(25);
	declare @recieptPutawayWork nvarchar(25);
	declare @toLocationTracksLP nvarchar(25);
	declare @SHORTPICK_Handler nvarchar(25);
	declare @SHORTENTIREQUANTITY_Handler nvarchar(30);
	declare @COUNTEMPTY_Handler nvarchar(25); 
	declare @PARTIALPICK_Handler nvarchar(25);
	declare @SHORTPUTAWAY_Handler nvarchar(25);
	declare @PASS_Handler nvarchar(25);
	declare @OVERPICK_Handler nvarchar(25);
	declare @WM_SPLITCONTAINER_Handler nvarchar(25);
	declare @overPick nvarchar(20);
	declare @multiItemLocation nvarchar(10);
	declare @addItemSecurity nvarchar(20); 
	declare @nextUri nvarchar(100);
	declare @loopNextFlow nvarchar(25);
	declare @overridePutaway nvarchar(25);
	declare @enableLocate nvarchar(25);
	Declare @shipContPut nvarchar(10);
	declare @invTransferPutawayWork nvarchar(10);
	declare @replenishmentPutawayWork nvarchar(10);
	declare @orderPutawayWork nvarchar(10);
	declare @overridePick nvarchar(10);
	declare @splitContainer nvarchar(10);
	declare @viewPicks nvarchar(20);
	

	
	select @nextUri = N'/outbound/scaleapi/WorkExecutionApi/Execute';
	select @loopNextFlow = N'WorkUnitEntry';
	select @SHORTPICK_Handler = case when (@workExecutionMode = N'0') then N'ShortPickHandler' else null end;
	select @SHORTENTIREQUANTITY_Handler = case when (@workExecutionMode = N'0') then N'ShortEntirePickHandler' else null end;
	select @WM_SPLITCONTAINER_Handler=N'SplitContainerHandler';
	select @COUNTEMPTY_Handler=N'CountEmptyHandler';
	select @PARTIALPICK_Handler = case when (@workExecutionMode = N'0') then N'PartialPickHandler' else null end;
	select @SHORTPUTAWAY_Handler = case when (@workExecutionMode = N'1') then N'ShortPutawayHandler' else null end;
	select @OVERPICK_Handler = case when (@workExecutionMode = N'0') then N'OverPickHandler' else null end;
	select @recieptPutawayWork = case when(@internalNumType = N'RECEIPT' AND  @workExecutionMode = N'1') then N'true' else N'false' end;
	select @invTransferPutawayWork = case when(@internalNumType = N'Inventory Transfer' AND  @workExecutionMode = N'1') then N'true' else N'false' end;
	select @replenishmentPutawayWork = case when(@internalNumType = N'Replenishment' AND  @workExecutionMode = N'1') then N'true' else N'false' end;
	select @orderPutawayWork = case when(@internalNumType = N'Work Order Putaway' AND  @workExecutionMode = N'1') then N'true' else N'false' end;
	select @PASS_Handler = case when (@internalNumType = N'RECEIPT') then N'PassHandler' else null end;
	select @locationVerificationMethod = VERIFICATION_METH, @logisticsUnitTracked =  case when (TRACK_CONTAINERS = N'Y') then N'true' else N'false' end,
	
		   @multiItemLocation = case when (MULTI_ITEM = N'Y') then N'true' else N'false' end 
			From location where location = @location and warehouse=@Warehouse;
	if @location = @toLocation 
		set  @toLocationTracksLP = @logisticsUnitTracked
	else
		select  @toLocationTracksLP = case when (TRACK_CONTAINERS = N'Y') then N'true' else N'false' end From location where location = @toLocation
	Select @runSecurity = ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=1),N'true')
	Select @bypassSecurity = ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=32),N'true') 
	Select @skipSecurity = ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=21),N'true') 
	Select @passSecurity= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=22),N'true')
	Select @partialPick= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=23),N'true')  
	Select @shortPick= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=24),N'true') 
	Select @shortEntirePick= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=33),N'true')
	Select @fullSecurity= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=25),N'true')
	Select @overPick= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=26),N'true')
	Select @addItemSecurity= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=27),N'true') 
	Select @overridePutaway= ISNULL((select case when (@runSecurity =N'true' and (CheckPointValue is null or CheckPointValue = N'Y') ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=28),N'true')  
	Select @enableLocate= ISNULL((select case when (@runSecurity =N'true' and (CheckPointValue is null or CheckPointValue = N'Y') ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=29),N'true')  
	Select @overridePick= ISNULL((select case when (@runSecurity =N'true' and (CheckPointValue is null or CheckPointValue = N'Y') ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=30),N'true')
	Select @splitContainer= ISNULL((select case when (@runSecurity =N'true' and (CheckPointValue is null or CheckPointValue = N'Y') ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=31),N'true')
	Select @shortPutaway= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=34),N'true')
	Select @viewPicks= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'Y' ) then N'true' else N'false' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=35),N'true')	

	select @shipContPut = (case when (SHIP_CONT_PUT = N'Y') then N'true' else N'false' end)  from work_profile_detail where WORK_PROFILE = @workProfileName

	select top 1 @runSecurity as N'RunSecurity', @skipSecurity as N'SkipSecurity',@passSecurity as N'PassSecurity', @addItemSecurity as N'AddItemSecurity', @shortPick as ShortPick,@shortEntirePick as ShortEntirePick,@fullSecurity as FullSecurity,@logisticsUnitTracked as LogisticsUnitTracked, 
	N'false' as N'DisplayItemDetails',
	@SHORTPICK_Handler as SHORTPICK_Handler,@COUNTEMPTY_Handler as COUNTEMPTY_Handler,@SHORTENTIREQUANTITY_Handler as SHORTENTIREQUANTITY_Handler,@WM_SPLITCONTAINER_Handler as WM_SPLITCONTAINER_Handler, @PARTIALPICK_Handler as PARTIALPICK_Handler,@SHORTPUTAWAY_Handler as SHORTPUTAWAY_Handler,@PASS_Handler as PASS_Handler,@OVERPICK_Handler as OVERPICK_Handler,@multiItemLocation as N'MultiItemLocation', @nextUri as NextUri, @loopNextFlow as LoopNextFlow,
	N'false' as N'LocationOverrideVisible', N'true' as N'LocationVisible', @overridePutaway as N'OverridePutawaySecurity',
	@shipContPut as ShipContPut, @bypassSecurity as N'BypassSecurity',* 
	from 
	(
		select 
		INTERNAL_WORK_SPEC_NUM as INTERNAL_WORK_SPEC_NUM, 
		case when (ITEM_VERIFY = N'Y') then N'true' else N'false' end as ItemVerify,
		-- Work special handling config takes priority over location verify configuration 
		case when (LOCATION_VERIFY_METH = N'Location') then N'true' else N'false' end as LocationVerify,
		case when (LOCATION_VERIFY_METH = N'Check Digit') then N'true' else N'false' end as CheckDigitVerify,
		case when (@overridePutaway = N'true') then case when (LOCATION_VERIFY_METH = N'Check Digit') then N'true' else N'false' end		else N'false' end as OverridePutawayCheckDigit,
		case when (@overridePutaway = N'true') then case when (LOCATION_VERIFY_METH = N'Check Digit') then N'false' else N'true' end		else N'false' end as OverridePutawayNoCheckDigit,
		case when (@enableLocate = N'true')    then case when (LOCATION_VERIFY_METH = N'Check Digit' or LOCATION_VERIFY_METH = N'Location') then N'true' else N'false' end		else N'false' end as EnableLocate,
		case when (QUANTITY_VERIFY = N'Y') then N'true' else N'false' end as QuantityVerify,
		case when (QUANTITY_VERIFY = N'N' AND @shipContPut = N'true') then N'true' else N'false' end as EnterQuantity,
		case when (SHIP_CONT_VER_METH = N'2') then N'true' else N'false' end as ShippingContainerVerify,
		case when (SHIP_CONT_VER_METH = N'3') then N'true' else N'false' end as ShippingContainerOverride,
		case when (SHIP_CONT_VER_METH = N'4') then N'true' else N'false' end as ShippingContainerSpotVerify,
		case when ((LOGISTICS_UNIT_VERIFY = N'Y' AND @recieptPutawayWork = N'false')OR(PUTAWAY_WITH_LU = N'1' AND @logisticsUnitTracked = N'true' AND @recieptPutawayWork = N'true')) then N'true' else N'false' end as LogisticUnitVerify,
		case when (LOT_VERIFY = N'Y') then N'true' else N'false' end as LotVerify,
		case when (((PUTAWAY_WITH_LU = N'2' OR PUTAWAY_WITH_LU = N'3') OR @toLocationTracksLP = N'false' )AND QUANTITY_VERIFY = N'N') then N'true' else N'false' end as AllowPartialReceiptPick,
		case 
			when (@logisticsUnitTracked = N'true' AND (@invTransferPutawayWork = N'true' OR @replenishmentPutawayWork = N'true')) then N'true' --in case of inventory and replishment putaway, we need to show existing LP regardless.
			when (@logisticsUnitTracked = N'true' AND PUTAWAY_WITH_LU <> N'3' AND 
				(@recieptPutawayWork = N'true' OR @orderPutawayWork = N'true')) then N'true'
			else N'false' end as ShowLogisticUnit,
		case when ((PUTAWAY_WITH_LU = N'2' OR PUTAWAY_WITH_LU = N'3') AND @logisticsUnitTracked = N'true' AND @recieptPutawayWork = N'true') then N'true' else N'false' end as LogisticUnitOverride,
		
		MAXIMUM_PICKUP_QTY as MaxPickupQty,
		case when (QUANTITY_VERIFY = N'Y') then N'false' else @partialPick end as PartialPick,
		case when (ALLOW_OVERPICK = N'Y' AND (QUANTITY_VERIFY = N'N')) then @overPick else N'false' end as OverPick,
		@overridePick as OverridePick,
		@splitContainer as SplitContainer,
		@shortPutaway as ShortPutaway,
		@viewPicks as ViewPicks,
		CYCLE_COUNT_TYPE as CycleCountType
		from WORK_SPECIAL_HANDLING where INTERNAL_WORK_SPEC_NUM =@internalWorkSpecialHanding
		union
		select 0 as INTERNAL_WORK_SPEC_NUM ,
		N'false' as ItemVerify,
		case when (@locationVerificationMethod = N'Location Name') then N'true' else N'false' end as LocationVerify,
		case when (@locationVerificationMethod = N'Check Digit') then N'true' else N'false' end as CheckDigitVerify,
		case when (@overridePutaway = N'true') then case when (@locationVerificationMethod = N'Check Digit') then N'true' else N'false' end		else N'false' end as OverridePutawayCheckDigit,
		case when (@overridePutaway = N'true') then case when (@locationVerificationMethod = N'Check Digit') then N'false' else N'true' end		else N'false' end as OverridePutawayNoCheckDigit,
		N'false' as EnableLocate,
		N'false' as QuantityVerify,
		N'false' as EnterQuantity,
		N'false' as ShippingContainerVerify,
		N'false' as ShippingContainerOverride,
		N'false' as ShippingContainerSpotVerify,
		N'false' as LogisticUnitVerify,
		N'false' as LotVerify,
		N'false' as AllowPartialReceiptPick,
		N'false' as ShowLogisticUnit,
		N'false' as LogisticUnitOverride,
		N'0' as MaxPickupQty,
		@partialPick as PartialPick,
		@overPick as OverPick,
		@overridePick as OverridePick,
		@shortPutaway as ShortPutaway,
		@viewPicks as ViewPicks,
		@splitContainer as SplitContainer,
		N'2' as CycleCountType

	) WSH order by INTERNAL_WORK_SPEC_NUM desc;
