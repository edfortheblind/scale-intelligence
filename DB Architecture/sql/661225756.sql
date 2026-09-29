-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE PROCEDURE MetaTrans_GetInventoryTransfer
(
@InternalLocationInv numeric(9) = 0,
@culture nvarchar(10),
@Item nvarchar(50) = null,
@Company nvarchar(25) = null,
@Lot nvarchar(25) = null,
@InventoryStatus nvarchar(50) = null,
@Warehouse nvarchar(25) = null,
@LicensePlate nvarchar(50) = null
)
AS
	SET NOCOUNT ON;
	-- [comment omitted]
	
	DECLARE @defaultInventorySts nvarchar(50);
	DECLARE @tempLicensePlate nvarchar(50);
	DECLARE @tempParentLicensePlate nvarchar(50);
	DECLARE @tempCompany nvarchar(25);
	DECLARE @tempWarehouse nvarchar(25);
	DECLARE @tempItem nvarchar(50);
	DECLARE @tempItemDesc nvarchar(100);
	DECLARE @tempQty numeric(19,5);
	DECLARE @tempQtyUM nvarchar(25);
	DECLARE @tempFromLocation nvarchar(25);	
	DECLARE @tempInventoryStatus nvarchar(50);
	DECLARE @tempLot nvarchar(25);
	DECLARE @expirationDate datetime;
	DECLARE @tempToLocation nvarchar(25);	
	DECLARE @tempInventoryAttributesId numeric(9);
	DECLARE @webThumbnailImage nvarchar(200);

	-- [comment omitted]
	SELECT @defaultInventorySts = SYSTEM_CONFIG_DETAIL.SYSTEM_VALUE  
    FROM SYSTEM_CONFIG_DETAIL  
    WHERE SYS_KEY = N'<literal:1>'  
    AND RECORD_TYPE = N'<literal:2>';

	
	
		SELECT @tempItem = (SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM)) > 1) THEN N'<literal:3>' ELSE min(LI.ITEM) END), 
		   @tempItemDesc =(SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM_DESC)) >1) THEN N'<literal:4>' ELSE min(LI.ITEM_DESC )END), 
		   @tempCompany= (SELECT CASE WHEN (COUNT(DISTINCT(LI.COMPANY)) >1) THEN N'<literal:5>' ELSE min(LI.COMPANY) END),		  
		   @tempFromLocation =(SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN N'<literal:6>' ELSE min(LI.LOCATION) END),
		   @tempLicensePlate =  (SELECT CASE WHEN COUNT(DISTINCT(LI.LOGISTICS_UNIT)) > 1 THEN N'<literal:7>' ELSE min(LI.LOGISTICS_UNIT) END), 
		   @tempParentLicensePlate = (SELECT CASE WHEN COUNT(DISTINCT(LI.PARENT_LOGISTICS_UNIT)) > 1 THEN N'<literal:8>' ELSE min(LI.PARENT_LOGISTICS_UNIT) END),
		   @tempLot = (SELECT CASE WHEN COUNT(DISTINCT(LI.LOT)) > 1 THEN N'<literal:9>' ELSE min(LI.LOT) END),
		   @tempQty= (SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN 0.0 
								ELSE (CASE WHEN (SUM(LI.ON_HAND_QTY-LI.ALLOCATED_QTY-LI.SUSPENSE_QTY) > 0 and COUNT(DISTINCT(LI.ITEM)) = 1) 
											THEN SUM(LI.ON_HAND_QTY-LI.ALLOCATED_QTY-LI.SUSPENSE_QTY) ELSE 0 END) END),
		   @tempQtyUM = (SELECT CASE WHEN COUNT(DISTINCT(LI.QUANTITY_UM)) > 1 THEN N'<literal:10>' ELSE min(LI.QUANTITY_UM) END),
		   @tempInventoryStatus = (SELECT CASE WHEN COUNT(DISTINCT(LI.INVENTORY_STS)) > 1 THEN N'<literal:11>' ELSE min(LI.INVENTORY_STS) END),
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
	select @webThumbnailImage = WEB_THUMBNAIL_IMG from ITEM where ITEM=@tempItem and (@tempCompany is null or COMPANY = @tempCompany);
	
	SELECT TOP 1
	N'<literal:12>' AS N'<literal:13>',	
	N'<literal:14>' AS N'<literal:15>', 		
	  @tempCompany  as  N'<literal:16>',
	  @tempWarehouse  AS N'<literal:17>',
	  @tempItem   AS N'<literal:18>',	
	@tempItemDesc AS N'<literal:19>',	
	@tempQty AS N'<literal:20>',
	@tempQtyUM AS N'<literal:21>',
	0.0 AS N'<literal:22>',
	N'<literal:23>' AS N'<literal:24>',
	 @tempFromLocation  AS N'<literal:25>',
	@tempToLocation AS N'<literal:26>',
	CASE WHEN len(@tempLicensePlate) > 0 THEN @tempLicensePlate ELSE N'<literal:27>' END AS N'<literal:28>',
	CASE WHEN len(@tempParentLicensePlate) > 0 THEN @tempParentLicensePlate ELSE N'<literal:29>' END AS N'<literal:30>',
	 @tempLot  AS N'<literal:31>',
	case when len(@tempInventoryStatus) > 0 then @tempInventoryStatus else 
				 (case when len(@tempItem) > 0 then @defaultInventorySts else  @defaultInventorySts end) end AS N'<literal:32>',
	N'<literal:33>' AS N'<literal:34>',
	@expirationDate As N'<literal:35>',
	@defaultInventorySts as N'<literal:36>',
	@webThumbnailImage As N'<literal:37>',
	@tempInventoryAttributesId as N'<literal:38>',
	N'<literal:39>' as N'<literal:40>',
	N'<literal:41>' as N'<literal:42>',
	N'<literal:43>' as N'<literal:44>',
	N'<literal:45>' as N'<literal:46>',
	N'<literal:47>' as N'<literal:48>',
	N'<literal:49>' as N'<literal:50>',
	0.0 as N'<literal:51>',
	0.0 as N'<literal:52>'	
	