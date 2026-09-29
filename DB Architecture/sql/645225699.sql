-- DOCUMENTATION ONLY: literals/comments removed; do not execute.


CREATE PROCEDURE MetaTrans_GetInventoryStatusChange
(
@LicensePlate nvarchar(50) = null,
@InternalLocationInv numeric(9) = null,
@Warehouse nvarchar(25) = null,
@culture nvarchar(10),
@Item nvarchar(50) = null,
@Company nvarchar(25) = null,
@Lot nvarchar(25) = null,
@InventoryStatus nvarchar(50) = null
)
AS
	SET NOCOUNT ON;

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
	IF(@InternalLocationInv is null and @LicensePlate is null)
		set @InternalLocationInv = 0;

	-- [comment omitted]
	IF(@InternalLocationInv is null and @LicensePlate is not null)
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
	END	
	
	
	SELECT @tempItem = (SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM)) > 1) THEN N'<literal:3>' ELSE min(LI.ITEM) END), 
			@tempItemDesc =(SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM_DESC)) >1) THEN N'<literal:4>' ELSE min(LI.ITEM_DESC )END), 
			@tempCompany= (SELECT CASE WHEN (COUNT(DISTINCT(LI.COMPANY)) >1) THEN N'<literal:5>' ELSE min(LI.COMPANY) END),		  
			@tempLocation =(SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN N'<literal:6>' ELSE min(LI.LOCATION) END),
			@tempLicensePlate =  (SELECT CASE WHEN COUNT(DISTINCT(LI.LOGISTICS_UNIT)) > 1 THEN N'<literal:7>' ELSE min(LI.LOGISTICS_UNIT) END),
			@tempParentLicensePlate = (SELECT CASE WHEN COUNT(DISTINCT(LI.PARENT_LOGISTICS_UNIT)) > 1 THEN N'<literal:8>' ELSE min(LI.PARENT_LOGISTICS_UNIT) END),
			@tempLot = (SELECT CASE WHEN COUNT(DISTINCT(LI.LOT)) > 1 THEN N'<literal:9>' ELSE min(LI.LOT) END),
			@tempQty= (SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN 0.0 
								ELSE (CASE WHEN (SUM(LI.ON_HAND_QTY-LI.ALLOCATED_QTY-LI.SUSPENSE_QTY) > 0 and COUNT(DISTINCT(LI.ITEM)) = 1) 
											THEN SUM(LI.ON_HAND_QTY-LI.ALLOCATED_QTY-LI.SUSPENSE_QTY) ELSE 0 END) END),
			@tempQtyUM = (SELECT CASE WHEN COUNT(DISTINCT(LI.QUANTITY_UM)) > 1 THEN N'<literal:10>' ELSE min(LI.QUANTITY_UM) END),
			@tempInventoryStatus = (SELECT CASE WHEN COUNT(DISTINCT(LI.INVENTORY_STS)) > 1 THEN N'<literal:11>' ELSE min(LI.INVENTORY_STS) END) ,
			@tempInventoryAttributesId = (SELECT CASE WHEN (COUNT(INTERNAL_LOCATION_INV) >1) THEN NULL ELSE min(LI.LOC_INV_ATTRIBUTES_ID) END)
	FROM LOCATION_INVENTORY LI
	WHERE INTERNAL_LOCATION_INV = @InternalLocationInv			
		OR (@InternalLocationInv = 0 and (@Item IS NULL OR LI.ITEM = @Item) and 
					(@Company IS NULL or LI.COMPANY = @Company) and
					(@Lot is null or LI.LOT = @Lot) and
					(@InventoryStatus is null or LI.INVENTORY_STS = @InventoryStatus) and 
					(@LicensePlate is null or LI.LOGISTICS_UNIT = @LicensePlate or
					LI.PARENT_LOGISTICS_UNIT = @LicensePlate) and
					(@Warehouse is null or LI.WAREHOUSE = @Warehouse))
				
-- [comment omitted]
	select @expirationDate = Expiration_Date from lot where LOT = @tempLot;
	select @webThumbnailImage = WEB_THUMBNAIL_IMG from ITEM where ITEM = @tempItem and (@tempCompany is null or COMPANY = @tempCompany);

	
	SELECT TOP 1
	N'<literal:12>' AS N'<literal:13>',	
	N'<literal:14>' AS N'<literal:15>', 		
	@tempCompany   AS N'<literal:16>',
    @tempWarehouse AS N'<literal:17>',
	@tempItem      AS N'<literal:18>',	
	@tempLocation  AS N'<literal:19>',
	@tempLicensePlate AS N'<literal:20>',
	@tempParentLicensePlate  AS N'<literal:21>',
	@tempLot AS N'<literal:22>',
	case when len(@tempInventoryStatus) > 0 then @tempInventoryStatus else @defaultInventorySts end AS N'<literal:23>',
	N'<literal:24>' AS N'<literal:25>',
	@tempItemDesc AS N'<literal:26>',
	@defaultInventorySts as N'<literal:27>',
	@tempInventoryAttributesId as N'<literal:28>',
	@expirationDate As N'<literal:29>',
	@webThumbnailImage As N'<literal:30>',
	N'<literal:31>' as N'<literal:32>',
	N'<literal:33>' as N'<literal:34>',
	N'<literal:35>' as N'<literal:36>',
	N'<literal:37>' as N'<literal:38>',
	N'<literal:39>' as N'<literal:40>',
	N'<literal:41>' as N'<literal:42>',
	N'<literal:43>' as N'<literal:44>',
	0.0 as N'<literal:45>',
	0.0 as N'<literal:46>'	
	