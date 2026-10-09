/*        
 Mod Number | Programmer | Date     | Modification Description        
 --------------------------------------------------------------------        
 179448	    | MJ         | 06/20/16 | Created   
 179449		| MJ		 | 06/27/16	| Modified to fetch values based on parameter passed. Handled scenario for LicensePlate and Lot.	  
 180058		| RJR		 | 06/29/16	| Added culture parameter.
 179450		| MJ		 | 07/06/16	| Modified EntityName and parameters
 179453		| MJ		 | 07/13/16	| Modified TotalQuantity to pass.
 181643		| AU		 | 07/20/16	| Added User Defined Fields
 197893		| MJ		 | 07/20/16	| Passing resource information in entity.
 184186		| MJ		 | 08/08/16	| Added QuantityUM not configured validation message.
 179451		| MJ		 | 08/23/16	| Added LotNotExists validation message
 182406		| MJ		 | 08/31/16	| Removed Warehouse from nothing is passed criteria as its now default has value.	
 182285		| NRJ		 | 09/07/16 | Added ParentLicensePlate to the query for validation purpose. 
 185993		| MJ		 | 09/08/16	| Corrected Entity parameter to camel case.
 185002		| MJ		 | 09/18/16	| Removed Resource Msg.
 188375		| NRJ		 | 10/26/16	| Calculated quantity info.
 187355		| MJ		 | 05/22/17	| Added support for inventory attributes.
 197407		| SO		 | 05/25/17	| Added support for lot expiration date and webThumbnailImage.
*/		

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


	--fetch default status from Inventory control values
	SELECT @defaultInventorySts = SYSTEM_CONFIG_DETAIL.SYSTEM_VALUE  
    FROM SYSTEM_CONFIG_DETAIL  
    WHERE SYS_KEY = N'40'  
    AND RECORD_TYPE = N'Inventory';
		 

	--handle null,undefined and N'' values.
	IF(@Item = N'null' or @item = N'undefined' or @item = N'') SET @Item =  null;
	IF(@Company = N'null' or @Company = N'undefined' or @Company = N'') SET @Company =  null;
	IF(@Warehouse = N'null' or @Warehouse = N'undefined' or @Warehouse = N'') SET @Warehouse =  null;
	IF(@Location = N'null' or @Location = N'undefined' or @Location = N'') SET @Location =  null;
	IF(@LicensePlate = N'null' or @LicensePlate = N'undefined' or @LicensePlate = N'') SET @LicensePlate =  null;
	IF(@Lot = N'null' or @Lot = N'undefined' or @lot = N'') SET @Lot =  null;
	IF(@InventoryStatus = N'null' or @InventoryStatus = N'undefined' or @InventoryStatus = N'') SET @InventoryStatus =  null;
	IF(@InventoryAttributesId = 0 ) SET @InventoryAttributesId =  null;

	--if nothing is passed 
	if(@Item is null and @Company is null and @Location is null and @LicensePlate is null and @Lot is null and @InventoryStatus is null)
	set @InternalLocationInv = 0;

	--Identify LP flow
		if(@Item is null and @Company is null and @Location is null and @LicensePlate is not null and @Lot is null and @InventoryStatus is null)
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
			and Location NOT IN ( SELECT LOCATION FROM LOCATION WHERE LOCATION_CLASS IN (N'Shipping Dock',N'Receiving Pre-Check In',N'Receiving Dock') AND WAREHOUSE = @Warehouse)
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
					LI.Location NOT IN ( SELECT LOCATION FROM LOCATION WHERE LOCATION_CLASS IN (N'Receiving Pre-Check In',N'Receiving Dock') AND WAREHOUSE = @Warehouse)
				) 
			)

	select @expirationDate = Expiration_Date from lot where LOT = @tempLot;
	select @webThumbnailImage = WEB_THUMBNAIL_IMG from ITEM where ITEM=@tempItem and (@tempCompany is null or COMPANY = @tempCompany);
	
	SELECT TOP 1
	N'SCALAR' AS N'EntityType',	
	N'inventoryTransactions' AS N'EntityName', 		
	CASE WHEN LEN(@Company) > 0 THEN @Company ELSE @tempCompany  END AS N'company',
	CASE WHEN LEN(@Warehouse)>0 THEN @Warehouse ELSE @tempWarehouse END AS N'toWarehouse',
	CASE WHEN LEN(@Item)> 0 THEN @Item ELSE @tempItem  END AS N'item',	
	@tempItemDesc AS N'itemDesc',	
	@tempQty AS N'quantity',
	@tempQtyUM AS N'quantityUM',
	0.0 AS N'totalQuantity',
	N'' AS N'totalQuantityUm',
	CASE WHEN len(@location) > 0 THEN @Location ELSE @tempLocation  END AS N'toLocation',
	CASE WHEN len(@LicensePlate) > 0 THEN @LicensePlate ELSE @tempLicensePlate END AS N'logisticsUnit',
	CASE WHEN len(@tempParentLicensePlate) > 0 THEN @tempParentLicensePlate ELSE N'' END AS N'parentLogisticsUnit',
	CASE WHEN len(@Lot) > 0 THEN @Lot ELSE @tempLot END AS N'lot',
	case when len(@tempInventoryStatus) > 0 then @tempInventoryStatus else @defaultInventorySts end AS N'inventoryStatus',
	N'' AS N'adjustmentType',
	@defaultInventorySts as N'defaultInventoryStatus',
	@tempInventoryAttributesId as N'inventoryAttributesId',
	@expirationDate As N'expirationDate',
	@webThumbnailImage As N'WebThumbnailImage',
	N'' as N'userDefinedField1',
	N'' as N'userDefinedField2',
	N'' as N'userDefinedField3',
	N'' as N'userDefinedField4',
	N'' as N'userDefinedField5',
	N'' as N'userDefinedField6',
	0.0 as N'userDefinedField7',
	0.0 as N'userDefinedField8'	,
	0.0   as N'catchWeight',
	N'' as N'catchWeightUM'
	