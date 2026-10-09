

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


	--fetch default status from Inventory control values
	SELECT @defaultInventorySts = SYSTEM_CONFIG_DETAIL.SYSTEM_VALUE  
    FROM SYSTEM_CONFIG_DETAIL  
    WHERE SYS_KEY = N'40'  
    AND RECORD_TYPE = N'Inventory';

	

	--if nothing is passed 
	IF(@InternalLocationInv is null and @LicensePlate is null)
		set @InternalLocationInv = 0;

	--Identify LP flow
	IF(@InternalLocationInv is null and @LicensePlate is not null)
	BEGIN
			 set @LPFlow = 1;
	END
    --for LP flow fetch first location of LP when single item is available
	if (@LPFlow = 1)
	BEGIN
		select @InternalLocationInv  = case when count(distinct(Item)) > 1 then -1 else min(INTERNAL_LOCATION_INV) end   
		from LOCATION_INVENTORY
		where (LOGISTICS_UNIT= @LicensePlate or PARENT_LOGISTICS_UNIT = @LicensePlate)
			and WAREHOUSE = @Warehouse
	END	
	
	
	SELECT @tempItem = (SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM)) > 1) THEN N'' ELSE min(LI.ITEM) END), 
			@tempItemDesc =(SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM_DESC)) >1) THEN N'' ELSE min(LI.ITEM_DESC )END), 
			@tempCompany= (SELECT CASE WHEN (COUNT(DISTINCT(LI.COMPANY)) >1) THEN N'' ELSE min(LI.COMPANY) END),		  
			@tempLocation =(SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN N'' ELSE min(LI.LOCATION) END),
			@tempLicensePlate =  (SELECT CASE WHEN COUNT(DISTINCT(LI.LOGISTICS_UNIT)) > 1 THEN N'' ELSE min(LI.LOGISTICS_UNIT) END),
			@tempParentLicensePlate = (SELECT CASE WHEN COUNT(DISTINCT(LI.PARENT_LOGISTICS_UNIT)) > 1 THEN N'' ELSE min(LI.PARENT_LOGISTICS_UNIT) END),
			@tempLot = (SELECT CASE WHEN COUNT(DISTINCT(LI.LOT)) > 1 THEN N'' ELSE min(LI.LOT) END),
			@tempQty= (SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN 0.0 
								ELSE (CASE WHEN (SUM(LI.ON_HAND_QTY-LI.ALLOCATED_QTY-LI.SUSPENSE_QTY) > 0 and COUNT(DISTINCT(LI.ITEM)) = 1) 
											THEN SUM(LI.ON_HAND_QTY-LI.ALLOCATED_QTY-LI.SUSPENSE_QTY) ELSE 0 END) END),
			@tempQtyUM = (SELECT CASE WHEN COUNT(DISTINCT(LI.QUANTITY_UM)) > 1 THEN N'' ELSE min(LI.QUANTITY_UM) END),
			@tempInventoryStatus = (SELECT CASE WHEN COUNT(DISTINCT(LI.INVENTORY_STS)) > 1 THEN N'' ELSE min(LI.INVENTORY_STS) END) ,
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
				
--@ITEM WILL BE NULL FROM INVENTORY INSIGHT AND NEVER BE NULL FROM LOT INSIGHT
	select @expirationDate = Expiration_Date from lot where LOT = @tempLot;
	select @webThumbnailImage = WEB_THUMBNAIL_IMG from ITEM where ITEM = @tempItem and (@tempCompany is null or COMPANY = @tempCompany);

	
	SELECT TOP 1
	N'SCALAR' AS N'EntityType',	
	N'inventoryStatusChange' AS N'EntityName', 		
	@tempCompany   AS N'Company',
    @tempWarehouse AS N'Warehouse',
	@tempItem      AS N'Item',	
	@tempLocation  AS N'ToLocation',
	@tempLicensePlate AS N'LogisticsUnit',
	@tempParentLicensePlate  AS N'ParentLogisticsUnit',
	@tempLot AS N'Lot',
	case when len(@tempInventoryStatus) > 0 then @tempInventoryStatus else @defaultInventorySts end AS N'InventoryStatus',
	N'' AS N'AdjustmentType',
	@tempItemDesc AS N'ItemDesc',
	@defaultInventorySts as N'DefaultInventoryStatus',
	@tempInventoryAttributesId as N'InventoryAttributesId',
	@expirationDate As N'ExpirationDate',
	@webThumbnailImage As N'WebThumbnailImage',
	N'' as N'AllLocations',
	N'' as N'UserDefinedField1',
	N'' as N'UserDefinedField2',
	N'' as N'UserDefinedField3',
	N'' as N'UserDefinedField4',
	N'' as N'UserDefinedField5',
	N'' as N'UserDefinedField6',
	0.0 as N'UserDefinedField7',
	0.0 as N'UserDefinedField8'	
	