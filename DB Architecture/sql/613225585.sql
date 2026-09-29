-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */


















		

CREATE PROCEDURE MetaTrans_GetInventoryAdjustment
(
@Item nvarchar(50) = null,
@Company nvarchar(25) = null,
@Warehouse nvarchar(25) = null,
@Location nvarchar(25) = null,
@ItemDesc nvarchar(100) = null,
@LicensePlate nvarchar(50) = null,
@Lot nvarchar(25) = null,
@InventoryStatus nvarchar(50) = null,
@InventoryAttributesId numeric(9) = null,
@culture nvarchar(10)
)
AS
	SET NOCOUNT ON;
	Declare @InternalLocationInv numeric(9) = -1;
	DECLARE @defaultInventorySts nvarchar(50);
	DECLARE @tempLicensePlate nvarchar(50);
	DECLARE @tempParentLicensePlate nvarchar(50);
	DECLARE @tempCompany nvarchar(25);
	DECLARE @tempWarehouse nvarchar(25);
	DECLARE @tempItem nvarchar(50);
	DECLARE @tempItemDesc nvarchar(100);
	DECLARE @tempQty numeric(19,5);
	DECLARE @tempQtyUM nvarchar(25);
	DECLARE @tempLocation nvarchar(25);	
	DECLARE @tempInventoryStatus nvarchar(50);
	DECLARE @tempLot nvarchar(25);
	DECLARE @tempInventoryAttributesId numeric(9);
	DECLARE @LPFlow bit = 0;
	DECLARE @expirationDate datetime;
	DECLARE @webThumbnailImage nvarchar(200);


	-- [comment omitted]
	SELECT @defaultInventorySts = SYSTEM_CONFIG_DETAIL.SYSTEM_VALUE  
    FROM SYSTEM_CONFIG_DETAIL  
    WHERE SYS_KEY = N'<literal:1>'  
    AND RECORD_TYPE = N'<literal:2>';
		 

	-- [comment omitted]
	IF(@Item = N'<literal:3>' or @item = N'<literal:4>' or @item = N'<literal:5>') SET @Item =  null;
	IF(@Company = N'<literal:6>' or @Company = N'<literal:7>' or @Company = N'<literal:8>') SET @Company =  null;
	IF(@Warehouse = N'<literal:9>' or @Warehouse = N'<literal:10>' or @Warehouse = N'<literal:11>') SET @Warehouse =  null;
	IF(@Location = N'<literal:12>' or @Location = N'<literal:13>' or @Location = N'<literal:14>') SET @Location =  null;
	IF(@LicensePlate = N'<literal:15>' or @LicensePlate = N'<literal:16>' or @LicensePlate = N'<literal:17>') SET @LicensePlate =  null;
	IF(@Lot = N'<literal:18>' or @Lot = N'<literal:19>' or @lot = N'<literal:20>') SET @Lot =  null;
	IF(@InventoryStatus = N'<literal:21>' or @InventoryStatus = N'<literal:22>' or @InventoryStatus = N'<literal:23>') SET @InventoryStatus =  null;
	IF(@InventoryAttributesId = 0 ) SET @InventoryAttributesId =  null;

	-- [comment omitted]
	if(@Item is null and @Company is null and @Location is null and @LicensePlate is null and @Lot is null and @InventoryStatus is null)
	set @InternalLocationInv = 0;

	-- [comment omitted]
		if(@Item is null and @Company is null and @Location is null and @LicensePlate is not null and @Lot is null and @InventoryStatus is null)
	BEGIN
			 set @LPFlow = 1;
	END
    -- [comment omitted]
	if (@LPFlow = 1)
	BEGIN
		select @InternalLocationInv  = case when count(distinct(Item)) > 1 then -1 else min(INTERNAL_LOCATION_INV) end   
		from LOCATION_INVENTORY
		where (LOGISTICS_UNIT= @LicensePlate or PARENT_LOGISTICS_UNIT = @LicensePlate)
			and WAREHOUSE = @Warehouse
			and Location NOT IN ( SELECT LOCATION FROM LOCATION WHERE LOCATION_CLASS IN (N'<literal:24>',N'<literal:25>',N'<literal:26>') AND WAREHOUSE = @Warehouse)
	END	
	
	SELECT @tempItem = (SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM)) > 1) THEN N'<literal:27>' ELSE min(LI.ITEM) END), 
		   @tempItemDesc =(SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM_DESC)) >1) THEN N'<literal:28>' ELSE min(LI.ITEM_DESC )END), 
		   @tempCompany= (SELECT CASE WHEN (COUNT(DISTINCT(LI.COMPANY)) >1) THEN N'<literal:29>' ELSE min(LI.COMPANY) END),		  
		   @tempLocation =(SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN N'<literal:30>' ELSE min(LI.LOCATION) END),
		   @tempLicensePlate =  (SELECT CASE WHEN COUNT(DISTINCT(LI.LOGISTICS_UNIT)) > 1 THEN N'<literal:31>' ELSE min(LI.LOGISTICS_UNIT) END),
		   @tempParentLicensePlate = (SELECT CASE WHEN COUNT(DISTINCT(LI.PARENT_LOGISTICS_UNIT)) > 1 THEN N'<literal:32>' ELSE min(LI.PARENT_LOGISTICS_UNIT) END),
		   @tempLot = (SELECT CASE WHEN COUNT(DISTINCT(LI.LOT)) > 1 THEN N'<literal:33>' ELSE min(LI.LOT) END),
		   @tempQty= (SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN 0.0 
								ELSE (CASE WHEN (SUM(LI.ON_HAND_QTY-LI.ALLOCATED_QTY-LI.SUSPENSE_QTY) > 0 and COUNT(DISTINCT(LI.ITEM)) = 1) 
											THEN SUM(LI.ON_HAND_QTY-LI.ALLOCATED_QTY-LI.SUSPENSE_QTY) ELSE 0 END) END),
		   @tempQtyUM = (SELECT CASE WHEN COUNT(DISTINCT(LI.QUANTITY_UM)) > 1 THEN N'<literal:34>' ELSE min(LI.QUANTITY_UM) END),
		   @tempInventoryStatus = (SELECT CASE WHEN COUNT(DISTINCT(LI.INVENTORY_STS)) > 1 THEN N'<literal:35>' ELSE min(LI.INVENTORY_STS) END) ,
		   @tempInventoryAttributesId = (SELECT CASE WHEN (COUNT(INTERNAL_LOCATION_INV) >1) THEN NULL ELSE min(LI.LOC_INV_ATTRIBUTES_ID) END)
	FROM LOCATION_INVENTORY LI
	WHERE	(INTERNAL_LOCATION_INV = @InternalLocationInv)
		OR
			(	@InternalLocationInv <= 0 and 
				(	(@item is null or  LI.ITEM = @Item) and 
					(@Company IS NULL or LI.COMPANY = @Company) and
					(@Warehouse is null or  LI.WAREHOUSE = @Warehouse) and							
					(@Location is null or  LI.LOCATION = @Location) and
					(@LicensePlate is null or ((LI.LOGISTICS_UNIT = @LicensePlate or LI.PARENT_LOGISTICS_UNIT = @LicensePlate) and LI.ON_HAND_QTY > 0)) and
					(@lot is null or LI.LOT = @Lot) and
					(@InventoryStatus is null or LI.INVENTORY_STS = @InventoryStatus) AND 
					(ISNULL(LI.LOC_INV_ATTRIBUTES_ID,0) = ISNULL(@InventoryAttributesId, 0)) and
					LI.Location NOT IN ( SELECT LOCATION FROM LOCATION WHERE LOCATION_CLASS IN (N'<literal:36>',N'<literal:37>') AND WAREHOUSE = @Warehouse)
				) 
			)

	select @expirationDate = Expiration_Date from lot where LOT = @tempLot;
	select @webThumbnailImage = WEB_THUMBNAIL_IMG from ITEM where ITEM=@tempItem and (@tempCompany is null or COMPANY = @tempCompany);
	
	SELECT TOP 1
	N'<literal:38>' AS N'<literal:39>',	
	N'<literal:40>' AS N'<literal:41>', 		
	CASE WHEN LEN(@Company) > 0 THEN @Company ELSE @tempCompany  END AS N'<literal:42>',
	CASE WHEN LEN(@Warehouse)>0 THEN @Warehouse ELSE @tempWarehouse END AS N'<literal:43>',
	CASE WHEN LEN(@Item)> 0 THEN @Item ELSE @tempItem  END AS N'<literal:44>',	
	@tempItemDesc AS N'<literal:45>',	
	@tempQty AS N'<literal:46>',
	@tempQtyUM AS N'<literal:47>',
	0.0 AS N'<literal:48>',
	N'<literal:49>' AS N'<literal:50>',
	CASE WHEN len(@location) > 0 THEN @Location ELSE @tempLocation  END AS N'<literal:51>',
	CASE WHEN len(@LicensePlate) > 0 THEN @LicensePlate ELSE @tempLicensePlate END AS N'<literal:52>',
	CASE WHEN len(@tempParentLicensePlate) > 0 THEN @tempParentLicensePlate ELSE N'<literal:53>' END AS N'<literal:54>',
	CASE WHEN len(@Lot) > 0 THEN @Lot ELSE @tempLot END AS N'<literal:55>',
	case when len(@tempInventoryStatus) > 0 then @tempInventoryStatus else @defaultInventorySts end AS N'<literal:56>',
	N'<literal:57>' AS N'<literal:58>',
	@defaultInventorySts as N'<literal:59>',
	@tempInventoryAttributesId as N'<literal:60>',
	@expirationDate As N'<literal:61>',
	@webThumbnailImage As N'<literal:62>',
	N'<literal:63>' as N'<literal:64>',
	N'<literal:65>' as N'<literal:66>',
	N'<literal:67>' as N'<literal:68>',
	N'<literal:69>' as N'<literal:70>',
	N'<literal:71>' as N'<literal:72>',
	N'<literal:73>' as N'<literal:74>',
	0.0 as N'<literal:75>',
	0.0 as N'<literal:76>'	,
	0.0   as N'<literal:77>',
	N'<literal:78>' as N'<literal:79>'
	