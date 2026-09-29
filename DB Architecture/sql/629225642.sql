-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









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

	-- [comment omitted]
		if(@LicensePlate is not null and @InternalLocationInv is null)
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
			and Location NOT IN ( SELECT LOCATION FROM LOCATION WHERE LOCATION_CLASS IN (N'<literal:1>',N'<literal:2>',N'<literal:3>') AND WAREHOUSE = @Warehouse)
	END	

	SELECT @tempItem = (SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM)) > 1) THEN N'<literal:4>' ELSE min(LI.ITEM) END), 
		   @tempItemDesc =(SELECT CASE WHEN (COUNT(DISTINCT(LI.ITEM_DESC)) >1) THEN N'<literal:5>' ELSE min(LI.ITEM_DESC )END), 
		   @tempCompany= (SELECT CASE WHEN (COUNT(DISTINCT(LI.COMPANY)) >1) THEN N'<literal:6>' ELSE min(LI.COMPANY) END),		  
		   @tempFromLocation =(SELECT CASE WHEN( COUNT(DISTINCT(LI.LOCATION)) > 1) THEN N'<literal:7>' ELSE min(LI.LOCATION) END),
		   @tempLicensePlate =  (SELECT CASE WHEN COUNT(DISTINCT(LI.LOGISTICS_UNIT)) > 1 THEN N'<literal:8>' ELSE min(LI.LOGISTICS_UNIT) END), 
		   @tempParentLicensePlate = (SELECT CASE WHEN COUNT(DISTINCT(LI.PARENT_LOGISTICS_UNIT)) > 1 THEN N'<literal:9>' ELSE min(LI.PARENT_LOGISTICS_UNIT) END),
		   @tempLot = (SELECT CASE WHEN COUNT(DISTINCT(LI.LOT)) > 1 THEN N'<literal:10>' ELSE min(LI.LOT) END),
		   @tempInventoryStatus = (SELECT CASE WHEN COUNT(DISTINCT(LI.INVENTORY_STS)) > 1 THEN N'<literal:11>' ELSE min(LI.INVENTORY_STS) END),
		   @tempInventoryAttributesId = (SELECT CASE WHEN (COUNT(INTERNAL_LOCATION_INV) >1) THEN NULL ELSE min(LI.LOC_INV_ATTRIBUTES_ID) END),
		   @tempUserDef1 = (SELECT CASE WHEN (COUNT(USER_DEF1) >1) THEN N'<literal:12>' ELSE min(LI.USER_DEF1) END),
		   @tempUserDef2 = (SELECT CASE WHEN (COUNT(USER_DEF2) >1) THEN N'<literal:13>' ELSE min(LI.USER_DEF2) END),
		   @tempUserDef3 = (SELECT CASE WHEN (COUNT(USER_DEF3) >1) THEN N'<literal:14>' ELSE min(LI.USER_DEF3) END),
		   @tempUserDef4 = (SELECT CASE WHEN (COUNT(USER_DEF4) >1) THEN N'<literal:15>' ELSE min(LI.USER_DEF4) END),
		   @tempUserDef5 = (SELECT CASE WHEN (COUNT(USER_DEF5) >1) THEN N'<literal:16>' ELSE min(LI.USER_DEF5) END),
		   @tempUserDef6 = (SELECT CASE WHEN (COUNT(USER_DEF6) >1) THEN N'<literal:17>' ELSE min(LI.USER_DEF6) END),
		   @tempUserDef7 = (SELECT CASE WHEN (COUNT(USER_DEF7) >1) THEN N'<literal:18>' ELSE min(LI.USER_DEF7) END),
		   @tempUserDef8 = (SELECT CASE WHEN (COUNT(USER_DEF8) >1) THEN N'<literal:19>' ELSE min(LI.USER_DEF8) END)

	FROM LOCATION_INVENTORY LI
	WHERE	(INTERNAL_LOCATION_INV = @InternalLocationInv)

	select @webThumbnailImage = WEB_THUMBNAIL_IMG from ITEM where ITEM=@tempItem and (@tempCompany is null or COMPANY = @tempCompany);

	SELECT TOP 1
	N'<literal:20>' AS N'<literal:21>',	
	N'<literal:22>' AS N'<literal:23>', 		
	@tempCompany  AS N'<literal:24>',
	@tempWarehouse AS N'<literal:25>',
	@tempItem AS N'<literal:26>',	
	@tempItemDesc AS N'<literal:27>',
	@tempFromLocation AS N'<literal:28>',
	@tempToLocation AS N'<literal:29>',
	@tempLicensePlate AS N'<literal:30>',
	@tempParentLicensePlate  AS N'<literal:31>',
	@tempLot AS N'<literal:32>',
	@tempInventoryStatus AS N'<literal:33>',
	N'<literal:34>' AS N'<literal:35>',
	@defaultInventorySts as N'<literal:36>',
	@webThumbnailImage As N'<literal:37>',
	@allLocations AS N'<literal:38>',
	@tempInventoryAttributesId as N'<literal:39>',
	@tempUserDef1 as N'<literal:40>',
	@tempUserDef2 as N'<literal:41>',
	@tempUserDef3 as N'<literal:42>',
	@tempUserDef4 as N'<literal:43>',
	@tempUserDef5 as N'<literal:44>',
	@tempUserDef6 as N'<literal:45>',
	@tempUserDef7 as N'<literal:46>',
	@tempUserDef8 as N'<literal:47>'	

	



