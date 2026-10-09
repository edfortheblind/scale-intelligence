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
	--Variables
	
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

	--fetch default status from Inventory control values
	SELECT @defaultInventorySts = SYSTEM_CONFIG_DETAIL.SYSTEM_VALUE  
    FROM SYSTEM_CONFIG_DETAIL  
    WHERE SYS_KEY = N'40'  
    AND RECORD_TYPE = N'Inventory';

	
	
		SELECT @tempItem = (SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM)) > 1) THEN N'' ELSE min(LI.ITEM) END), 
		   @tempItemDesc =(SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM_DESC)) >1) THEN N'' ELSE min(LI.ITEM_DESC )END), 
		   @tempCompany= (SELECT CASE WHEN (COUNT(DISTINCT(LI.COMPANY)) >1) THEN N'' ELSE min(LI.COMPANY) END),		  
		   @tempFromLocation =(SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN N'' ELSE min(LI.LOCATION) END),
		   @tempLicensePlate =  (SELECT CASE WHEN COUNT(DISTINCT(LI.LOGISTICS_UNIT)) > 1 THEN N'' ELSE min(LI.LOGISTICS_UNIT) END), 
		   @tempParentLicensePlate = (SELECT CASE WHEN COUNT(DISTINCT(LI.PARENT_LOGISTICS_UNIT)) > 1 THEN N'' ELSE min(LI.PARENT_LOGISTICS_UNIT) END),
		   @tempLot = (SELECT CASE WHEN COUNT(DISTINCT(LI.LOT)) > 1 THEN N'' ELSE min(LI.LOT) END),
		   @tempQty= (SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN 0.0 
								ELSE (CASE WHEN (SUM(LI.ON_HAND_QTY-LI.ALLOCATED_QTY-LI.SUSPENSE_QTY) > 0 and COUNT(DISTINCT(LI.ITEM)) = 1) 
											THEN SUM(LI.ON_HAND_QTY-LI.ALLOCATED_QTY-LI.SUSPENSE_QTY) ELSE 0 END) END),
		   @tempQtyUM = (SELECT CASE WHEN COUNT(DISTINCT(LI.QUANTITY_UM)) > 1 THEN N'' ELSE min(LI.QUANTITY_UM) END),
		   @tempInventoryStatus = (SELECT CASE WHEN COUNT(DISTINCT(LI.INVENTORY_STS)) > 1 THEN N'' ELSE min(LI.INVENTORY_STS) END),
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
	--@ITEM is null when called from inventory insight and not null from lot insight
	select @expirationDate = Expiration_Date from lot where LOT = @tempLot;
	select @webThumbnailImage = WEB_THUMBNAIL_IMG from ITEM where ITEM=@tempItem and (@tempCompany is null or COMPANY = @tempCompany);
	
	SELECT TOP 1
	N'SCALAR' AS N'EntityType',	
	N'inventoryTransactions' AS N'EntityName', 		
	  @tempCompany  as  N'company',
	  @tempWarehouse  AS N'toWarehouse',
	  @tempItem   AS N'item',	
	@tempItemDesc AS N'itemDesc',	
	@tempQty AS N'quantity',
	@tempQtyUM AS N'quantityUM',
	0.0 AS N'totalQuantity',
	N'' AS N'totalQuantityUm',
	 @tempFromLocation  AS N'fromLocation',
	@tempToLocation AS N'toLocation',
	CASE WHEN len(@tempLicensePlate) > 0 THEN @tempLicensePlate ELSE N'' END AS N'logisticsUnit',
	CASE WHEN len(@tempParentLicensePlate) > 0 THEN @tempParentLicensePlate ELSE N'' END AS N'parentLogisticsUnit',
	 @tempLot  AS N'lot',
	case when len(@tempInventoryStatus) > 0 then @tempInventoryStatus else 
				 (case when len(@tempItem) > 0 then @defaultInventorySts else  @defaultInventorySts end) end AS N'inventoryStatus',
	N'' AS N'adjustmentType',
	@expirationDate As N'expirationDate',
	@defaultInventorySts as N'defaultInventoryStatus',
	@webThumbnailImage As N'WebThumbnailImage',
	@tempInventoryAttributesId as N'inventoryAttributesId',
	N'' as N'userDefinedField1',
	N'' as N'userDefinedField2',
	N'' as N'userDefinedField3',
	N'' as N'userDefinedField4',
	N'' as N'userDefinedField5',
	N'' as N'userDefinedField6',
	0.0 as N'userDefinedField7',
	0.0 as N'userDefinedField8'	
	