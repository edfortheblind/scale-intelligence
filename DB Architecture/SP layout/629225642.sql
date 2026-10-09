/*        
 Mod Number     | Programmer | Date       | Modification Description        
 --------------------------------------------------------------------        
 260958		    | DV         | 11/11/2020 | Created
 185010			| AC		 | 11/26/2020 | Modified SP to return records selected on Inventory insight.
 264952			| SK	     | 03/19/2021 | Added @allLocation parameter.
 260710			| AC		 | 04/08/2021 | Modified to fetch details by passsing internal location inventory.

*/

CREATE PROCEDURE MetaTrans_GetInventoryCompanyTransfer (
@InternalLocationInv numeric(9) = null,
@LicensePlate nvarchar(50) = null,
@Warehouse nvarchar(25) = null,
@culture nvarchar(10))
	
AS
	SET NOCOUNT ON;				
	DECLARE @defaultInventorySts nvarchar(50);
	DECLARE @tempLicensePlate nvarchar(50);
	DECLARE @tempParentLicensePlate nvarchar(50);
	DECLARE @tempCompany nvarchar(25);
	DECLARE @tempWarehouse nvarchar(25);
	DECLARE @tempItem nvarchar(50);
	DECLARE @tempItemDesc nvarchar(100);
	DECLARE @tempFromLocation nvarchar(25);	
	DECLARE @tempInventoryStatus nvarchar(50);
	DECLARE @tempLot nvarchar(25);
	DECLARE @tempToLocation nvarchar(25);	
	DECLARE @tempInventoryAttributesId numeric(9);
	DECLARE @webThumbnailImage nvarchar(200);
	DECLARE @allLocations bit = 0;
	DECLARE @LPFlow bit = 0;
	DECLARE @tempUserDef1 nvarchar(25);
	DECLARE @tempUserDef2 nvarchar(25);
	DECLARE @tempUserDef3 nvarchar(25);
	DECLARE @tempUserDef4 nvarchar(25);
	DECLARE @tempUserDef5 nvarchar(25);
	DECLARE @tempUserDef6 nvarchar(25);
	DECLARE @tempUserDef7 numeric(19,5);
	DECLARE @tempUserDef8 numeric(19,5);

	--Identify LP flow
		if(@LicensePlate is not null and @InternalLocationInv is null)
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
		   @tempFromLocation =(SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN N'' ELSE min(LI.LOCATION) END),
		   @tempLicensePlate =  (SELECT CASE WHEN COUNT(DISTINCT(LI.LOGISTICS_UNIT)) > 1 THEN N'' ELSE min(LI.LOGISTICS_UNIT) END), 
		   @tempParentLicensePlate = (SELECT CASE WHEN COUNT(DISTINCT(LI.PARENT_LOGISTICS_UNIT)) > 1 THEN N'' ELSE min(LI.PARENT_LOGISTICS_UNIT) END),
		   @tempLot = (SELECT CASE WHEN COUNT(DISTINCT(LI.LOT)) > 1 THEN N'' ELSE min(LI.LOT) END),
		   @tempInventoryStatus = (SELECT CASE WHEN COUNT(DISTINCT(LI.INVENTORY_STS)) > 1 THEN N'' ELSE min(LI.INVENTORY_STS) END),
		   @tempInventoryAttributesId = (SELECT CASE WHEN (COUNT(INTERNAL_LOCATION_INV) >1) THEN NULL ELSE min(LI.LOC_INV_ATTRIBUTES_ID) END),
		   @tempUserDef1 = (SELECT CASE WHEN (COUNT(USER_DEF1) >1) THEN N'' ELSE min(LI.USER_DEF1) END),
		   @tempUserDef2 = (SELECT CASE WHEN (COUNT(USER_DEF2) >1) THEN N'' ELSE min(LI.USER_DEF2) END),
		   @tempUserDef3 = (SELECT CASE WHEN (COUNT(USER_DEF3) >1) THEN N'' ELSE min(LI.USER_DEF3) END),
		   @tempUserDef4 = (SELECT CASE WHEN (COUNT(USER_DEF4) >1) THEN N'' ELSE min(LI.USER_DEF4) END),
		   @tempUserDef5 = (SELECT CASE WHEN (COUNT(USER_DEF5) >1) THEN N'' ELSE min(LI.USER_DEF5) END),
		   @tempUserDef6 = (SELECT CASE WHEN (COUNT(USER_DEF6) >1) THEN N'' ELSE min(LI.USER_DEF6) END),
		   @tempUserDef7 = (SELECT CASE WHEN (COUNT(USER_DEF7) >1) THEN N'' ELSE min(LI.USER_DEF7) END),
		   @tempUserDef8 = (SELECT CASE WHEN (COUNT(USER_DEF8) >1) THEN N'' ELSE min(LI.USER_DEF8) END)

	FROM LOCATION_INVENTORY LI
	WHERE	(INTERNAL_LOCATION_INV = @InternalLocationInv)

	select @webThumbnailImage = WEB_THUMBNAIL_IMG from ITEM where ITEM=@tempItem and (@tempCompany is null or COMPANY = @tempCompany);

	SELECT TOP 1
	N'SCALAR' AS N'EntityType',	
	N'LocationInventory' AS N'EntityName', 		
	@tempCompany  AS N'Company',
	@tempWarehouse AS N'FromWhs',
	@tempItem AS N'Item',	
	@tempItemDesc AS N'ItemDesc',
	@tempFromLocation AS N'FromLoc',
	@tempToLocation AS N'toLocation',
	@tempLicensePlate AS N'LicensePlate',
	@tempParentLicensePlate  AS N'parentLogisticsUnit',
	@tempLot AS N'lot',
	@tempInventoryStatus AS N'InvStatus',
	N'' AS N'adjustmentType',
	@defaultInventorySts as N'defaultInventoryStatus',
	@webThumbnailImage As N'WebThumbnailImage',
	@allLocations AS N'allLocations',
	@tempInventoryAttributesId as N'inventoryAttributesId',
	@tempUserDef1 as N'userDefinedField1',
	@tempUserDef2 as N'userDefinedField2',
	@tempUserDef3 as N'userDefinedField3',
	@tempUserDef4 as N'userDefinedField4',
	@tempUserDef5 as N'userDefinedField5',
	@tempUserDef6 as N'userDefinedField6',
	@tempUserDef7 as N'userDefinedField7',
	@tempUserDef8 as N'userDefinedField8'	

	



