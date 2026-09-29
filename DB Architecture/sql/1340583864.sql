-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

























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
	

	
	select @nextUri = N'<literal:1>';
	select @loopNextFlow = N'<literal:2>';
	select @SHORTPICK_Handler = case when (@workExecutionMode = N'<literal:3>') then N'<literal:4>' else null end;
	select @SHORTENTIREQUANTITY_Handler = case when (@workExecutionMode = N'<literal:5>') then N'<literal:6>' else null end;
	select @WM_SPLITCONTAINER_Handler=N'<literal:7>';
	select @COUNTEMPTY_Handler=N'<literal:8>';
	select @PARTIALPICK_Handler = case when (@workExecutionMode = N'<literal:9>') then N'<literal:10>' else null end;
	select @SHORTPUTAWAY_Handler = case when (@workExecutionMode = N'<literal:11>') then N'<literal:12>' else null end;
	select @OVERPICK_Handler = case when (@workExecutionMode = N'<literal:13>') then N'<literal:14>' else null end;
	select @recieptPutawayWork = case when(@internalNumType = N'<literal:15>' AND  @workExecutionMode = N'<literal:16>') then N'<literal:17>' else N'<literal:18>' end;
	select @invTransferPutawayWork = case when(@internalNumType = N'<literal:19>' AND  @workExecutionMode = N'<literal:20>') then N'<literal:21>' else N'<literal:22>' end;
	select @replenishmentPutawayWork = case when(@internalNumType = N'<literal:23>' AND  @workExecutionMode = N'<literal:24>') then N'<literal:25>' else N'<literal:26>' end;
	select @orderPutawayWork = case when(@internalNumType = N'<literal:27>' AND  @workExecutionMode = N'<literal:28>') then N'<literal:29>' else N'<literal:30>' end;
	select @PASS_Handler = case when (@internalNumType = N'<literal:31>') then N'<literal:32>' else null end;
	select @locationVerificationMethod = VERIFICATION_METH, @logisticsUnitTracked =  case when (TRACK_CONTAINERS = N'<literal:33>') then N'<literal:34>' else N'<literal:35>' end,
	
		   @multiItemLocation = case when (MULTI_ITEM = N'<literal:36>') then N'<literal:37>' else N'<literal:38>' end 
			From location where location = @location and warehouse=@Warehouse;
	if @location = @toLocation 
		set  @toLocationTracksLP = @logisticsUnitTracked
	else
		select  @toLocationTracksLP = case when (TRACK_CONTAINERS = N'<literal:39>') then N'<literal:40>' else N'<literal:41>' end From location where location = @toLocation
	Select @runSecurity = ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:42>' ) then N'<literal:43>' else N'<literal:44>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=1),N'<literal:45>')
	Select @bypassSecurity = ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:46>' ) then N'<literal:47>' else N'<literal:48>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=32),N'<literal:49>') 
	Select @skipSecurity = ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:50>' ) then N'<literal:51>' else N'<literal:52>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=21),N'<literal:53>') 
	Select @passSecurity= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:54>' ) then N'<literal:55>' else N'<literal:56>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=22),N'<literal:57>')
	Select @partialPick= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:58>' ) then N'<literal:59>' else N'<literal:60>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=23),N'<literal:61>')  
	Select @shortPick= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:62>' ) then N'<literal:63>' else N'<literal:64>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=24),N'<literal:65>') 
	Select @shortEntirePick= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:66>' ) then N'<literal:67>' else N'<literal:68>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=33),N'<literal:69>')
	Select @fullSecurity= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:70>' ) then N'<literal:71>' else N'<literal:72>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=25),N'<literal:73>')
	Select @overPick= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:74>' ) then N'<literal:75>' else N'<literal:76>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=26),N'<literal:77>')
	Select @addItemSecurity= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:78>' ) then N'<literal:79>' else N'<literal:80>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=27),N'<literal:81>') 
	Select @overridePutaway= ISNULL((select case when (@runSecurity =N'<literal:82>' and (CheckPointValue is null or CheckPointValue = N'<literal:83>') ) then N'<literal:84>' else N'<literal:85>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=28),N'<literal:86>')  
	Select @enableLocate= ISNULL((select case when (@runSecurity =N'<literal:87>' and (CheckPointValue is null or CheckPointValue = N'<literal:88>') ) then N'<literal:89>' else N'<literal:90>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=29),N'<literal:91>')  
	Select @overridePick= ISNULL((select case when (@runSecurity =N'<literal:92>' and (CheckPointValue is null or CheckPointValue = N'<literal:93>') ) then N'<literal:94>' else N'<literal:95>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=30),N'<literal:96>')
	Select @splitContainer= ISNULL((select case when (@runSecurity =N'<literal:97>' and (CheckPointValue is null or CheckPointValue = N'<literal:98>') ) then N'<literal:99>' else N'<literal:100>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=31),N'<literal:101>')
	Select @shortPutaway= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:102>' ) then N'<literal:103>' else N'<literal:104>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=34),N'<literal:105>')
	Select @viewPicks= ISNULL((select case when (CheckPointValue is null or CheckPointValue = N'<literal:106>' ) then N'<literal:107>' else N'<literal:108>' end  from SECfn_GetSecurityCheckPoint(@securityFormId,@user) where checkpointId=35),N'<literal:109>')	

	select @shipContPut = (case when (SHIP_CONT_PUT = N'<literal:110>') then N'<literal:111>' else N'<literal:112>' end)  from work_profile_detail where WORK_PROFILE = @workProfileName

	select top 1 @runSecurity as N'<literal:113>', @skipSecurity as N'<literal:114>',@passSecurity as N'<literal:115>', @addItemSecurity as N'<literal:116>', @shortPick as ShortPick,@shortEntirePick as ShortEntirePick,@fullSecurity as FullSecurity,@logisticsUnitTracked as LogisticsUnitTracked, 
	N'<literal:117>' as N'<literal:118>',
	@SHORTPICK_Handler as SHORTPICK_Handler,@COUNTEMPTY_Handler as COUNTEMPTY_Handler,@SHORTENTIREQUANTITY_Handler as SHORTENTIREQUANTITY_Handler,@WM_SPLITCONTAINER_Handler as WM_SPLITCONTAINER_Handler, @PARTIALPICK_Handler as PARTIALPICK_Handler,@SHORTPUTAWAY_Handler as SHORTPUTAWAY_Handler,@PASS_Handler as PASS_Handler,@OVERPICK_Handler as OVERPICK_Handler,@multiItemLocation as N'<literal:119>', @nextUri as NextUri, @loopNextFlow as LoopNextFlow,
	N'<literal:120>' as N'<literal:121>', N'<literal:122>' as N'<literal:123>', @overridePutaway as N'<literal:124>',
	@shipContPut as ShipContPut, @bypassSecurity as N'<literal:125>',* 
	from 
	(
		select 
		INTERNAL_WORK_SPEC_NUM as INTERNAL_WORK_SPEC_NUM, 
		case when (ITEM_VERIFY = N'<literal:126>') then N'<literal:127>' else N'<literal:128>' end as ItemVerify,
		-- [comment omitted]
		case when (LOCATION_VERIFY_METH = N'<literal:129>') then N'<literal:130>' else N'<literal:131>' end as LocationVerify,
		case when (LOCATION_VERIFY_METH = N'<literal:132>') then N'<literal:133>' else N'<literal:134>' end as CheckDigitVerify,
		case when (@overridePutaway = N'<literal:135>') then case when (LOCATION_VERIFY_METH = N'<literal:136>') then N'<literal:137>' else N'<literal:138>' end		else N'<literal:139>' end as OverridePutawayCheckDigit,
		case when (@overridePutaway = N'<literal:140>') then case when (LOCATION_VERIFY_METH = N'<literal:141>') then N'<literal:142>' else N'<literal:143>' end		else N'<literal:144>' end as OverridePutawayNoCheckDigit,
		case when (@enableLocate = N'<literal:145>')    then case when (LOCATION_VERIFY_METH = N'<literal:146>' or LOCATION_VERIFY_METH = N'<literal:147>') then N'<literal:148>' else N'<literal:149>' end		else N'<literal:150>' end as EnableLocate,
		case when (QUANTITY_VERIFY = N'<literal:151>') then N'<literal:152>' else N'<literal:153>' end as QuantityVerify,
		case when (QUANTITY_VERIFY = N'<literal:154>' AND @shipContPut = N'<literal:155>') then N'<literal:156>' else N'<literal:157>' end as EnterQuantity,
		case when (SHIP_CONT_VER_METH = N'<literal:158>') then N'<literal:159>' else N'<literal:160>' end as ShippingContainerVerify,
		case when (SHIP_CONT_VER_METH = N'<literal:161>') then N'<literal:162>' else N'<literal:163>' end as ShippingContainerOverride,
		case when (SHIP_CONT_VER_METH = N'<literal:164>') then N'<literal:165>' else N'<literal:166>' end as ShippingContainerSpotVerify,
		case when ((LOGISTICS_UNIT_VERIFY = N'<literal:167>' AND @recieptPutawayWork = N'<literal:168>')OR(PUTAWAY_WITH_LU = N'<literal:169>' AND @logisticsUnitTracked = N'<literal:170>' AND @recieptPutawayWork = N'<literal:171>')) then N'<literal:172>' else N'<literal:173>' end as LogisticUnitVerify,
		case when (LOT_VERIFY = N'<literal:174>') then N'<literal:175>' else N'<literal:176>' end as LotVerify,
		case when (((PUTAWAY_WITH_LU = N'<literal:177>' OR PUTAWAY_WITH_LU = N'<literal:178>') OR @toLocationTracksLP = N'<literal:179>' )AND QUANTITY_VERIFY = N'<literal:180>') then N'<literal:181>' else N'<literal:182>' end as AllowPartialReceiptPick,
		case 
			when (@logisticsUnitTracked = N'<literal:183>' AND (@invTransferPutawayWork = N'<literal:184>' OR @replenishmentPutawayWork = N'<literal:185>')) then N'<literal:186>' -- [comment omitted]
			when (@logisticsUnitTracked = N'<literal:187>' AND PUTAWAY_WITH_LU <> N'<literal:188>' AND 
				(@recieptPutawayWork = N'<literal:189>' OR @orderPutawayWork = N'<literal:190>')) then N'<literal:191>'
			else N'<literal:192>' end as ShowLogisticUnit,
		case when ((PUTAWAY_WITH_LU = N'<literal:193>' OR PUTAWAY_WITH_LU = N'<literal:194>') AND @logisticsUnitTracked = N'<literal:195>' AND @recieptPutawayWork = N'<literal:196>') then N'<literal:197>' else N'<literal:198>' end as LogisticUnitOverride,
		
		MAXIMUM_PICKUP_QTY as MaxPickupQty,
		case when (QUANTITY_VERIFY = N'<literal:199>') then N'<literal:200>' else @partialPick end as PartialPick,
		case when (ALLOW_OVERPICK = N'<literal:201>' AND (QUANTITY_VERIFY = N'<literal:202>')) then @overPick else N'<literal:203>' end as OverPick,
		@overridePick as OverridePick,
		@splitContainer as SplitContainer,
		@shortPutaway as ShortPutaway,
		@viewPicks as ViewPicks,
		CYCLE_COUNT_TYPE as CycleCountType
		from WORK_SPECIAL_HANDLING where INTERNAL_WORK_SPEC_NUM =@internalWorkSpecialHanding
		union
		select 0 as INTERNAL_WORK_SPEC_NUM ,
		N'<literal:204>' as ItemVerify,
		case when (@locationVerificationMethod = N'<literal:205>') then N'<literal:206>' else N'<literal:207>' end as LocationVerify,
		case when (@locationVerificationMethod = N'<literal:208>') then N'<literal:209>' else N'<literal:210>' end as CheckDigitVerify,
		case when (@overridePutaway = N'<literal:211>') then case when (@locationVerificationMethod = N'<literal:212>') then N'<literal:213>' else N'<literal:214>' end		else N'<literal:215>' end as OverridePutawayCheckDigit,
		case when (@overridePutaway = N'<literal:216>') then case when (@locationVerificationMethod = N'<literal:217>') then N'<literal:218>' else N'<literal:219>' end		else N'<literal:220>' end as OverridePutawayNoCheckDigit,
		N'<literal:221>' as EnableLocate,
		N'<literal:222>' as QuantityVerify,
		N'<literal:223>' as EnterQuantity,
		N'<literal:224>' as ShippingContainerVerify,
		N'<literal:225>' as ShippingContainerOverride,
		N'<literal:226>' as ShippingContainerSpotVerify,
		N'<literal:227>' as LogisticUnitVerify,
		N'<literal:228>' as LotVerify,
		N'<literal:229>' as AllowPartialReceiptPick,
		N'<literal:230>' as ShowLogisticUnit,
		N'<literal:231>' as LogisticUnitOverride,
		N'<literal:232>' as MaxPickupQty,
		@partialPick as PartialPick,
		@overPick as OverPick,
		@overridePick as OverridePick,
		@shortPutaway as ShortPutaway,
		@viewPicks as ViewPicks,
		@splitContainer as SplitContainer,
		N'<literal:233>' as CycleCountType

	) WSH order by INTERNAL_WORK_SPEC_NUM desc;
