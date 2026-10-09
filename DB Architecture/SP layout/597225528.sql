/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	186628	| SSD	| 10/22/16	| Created 
	191074	| DN	| 01/23/17	| Updated parameter types
*/

CREATE PROCEDURE MetaTrans_GetInventory(
@InternalLocationInv numeric(9)=null,
@culture nvarchar(10))
AS
BEGIN
       SET NOCOUNT ON;

	   if (@InternalLocationInv is null)
			set @InternalLocationInv=0
	   
SELECT TOP 1
	N'SCALAR' AS N'EntityType',	
	N'inventory' AS N'EntityName', 	
	Inv.INTERNAL_LOCATION_INV AS N'InternalLocationInv', 		
	Inv.COMPANY AS N'Company', 	
	Inv.WAREHOUSE AS N'Warehouse', 
	Inv.LOCATION_TEMPLATE AS N'LocationTemplate', 	
	Inv.LOCATION AS N'Location',
	Inv.LOGISTICS_UNIT AS N'LogisticsUnit',
	Inv.PARENT_LOGISTICS_UNIT AS N'ParentLogisticsUnit',
	Inv.INVENTORY_STS AS N'InventorySts',
	Convert(BIT, (case when Inv.PERMANENT = N'Y' then 1 else 0 end)) AS N'Permanent',		
	Inv.ITEM AS N'Item', 
	Inv.ITEM_DESC AS N'ItemDesc', 
	Inv.LOT AS N'Lot',					
	Inv.AVAILABLEQTY_AV AS N'AvailableQty',
	Inv.ON_HAND_QTY AS N'OnHandQty',
	Inv.IN_TRANSIT_QTY AS N'InTransitQty',
	Inv.ALLOCATED_QTY AS N'AllocatedQty',
	Inv.SUSPENSE_QTY AS N'SuspenseQty',
	Inv.QUANTITY_UM AS N'QuantityUm',
	Inv.AGING_DATE AS N'AgingDate',
	Inv.EXPIRATION_DATE AS N'ExpirationDate',
	Inv.MANUFACTURED_DATE AS N'ManufacturedDate',
	Inv.RECEIVED_DATE AS N'ReceivedDate',
	Inv.TOTAL_COST AS N'TotalCost',
	Inv.TOTAL_VOLUME AS N'TotalVolume',
	Inv.TOTAL_WEIGHT AS N'TotalWeight',
	Inv.WEIGHT_UM AS N'WeightUm', 
    Inv.VOLUME_UM AS N'VolumeUm',
    Inv.ALLOCATION_ZONE AS N'AllocationZone',
    Inv.LOCATING_ZONE AS N'LocatingZone',
    Inv.WORK_ZONE AS N'WorkZone',
    Inv.LOCATION_INVENTORY_USER_STAMP AS N'UserStamp',
    Inv.LOCATION_INVENTORY_PROCESS_STAMP AS N'ProcessStamp',
    Inv.LOCATION_INVENTORY_DATE_TIME_STAMP AS N'DateTimeStamp',
    Inv.LOCATION_INVENTORY_USER_DEF1 AS N'UserDef1',
    Inv.LOCATION_INVENTORY_USER_DEF2 AS N'UserDef2',
    Inv.LOCATION_INVENTORY_USER_DEF3 AS N'UserDef3',
    Inv.LOCATION_INVENTORY_USER_DEF4 AS N'UserDef4',
    Inv.LOCATION_INVENTORY_USER_DEF5 AS N'UserDef5',
    Inv.LOCATION_INVENTORY_USER_DEF6 AS N'UserDef6',
    Inv.LOCATION_INVENTORY_USER_DEF7 AS N'UserDef7',
    Inv.LOCATION_INVENTORY_USER_DEF8 AS N'UserDef8'
FROM METADATA_INSIGHT_INVENTORY_VIEW Inv
WHERE Inv.INTERNAL_LOCATION_INV = @InternalLocationInv;

SELECT TOP 1
	N'SCALAR' AS N'EntityType',	
	N'inventoryAttributes' AS N'EntityName', 	
	LocInv.LOC_INV_ATTRIBUTE1 AS N'InvAttr1',
	LocInv.LOC_INV_ATTRIBUTE2  AS N'InvAttr2',
	LocInv.LOC_INV_ATTRIBUTE3  AS N'InvAttr3',
	LocInv.LOC_INV_ATTRIBUTE4  AS N'InvAttr4',
	LocInv.LOC_INV_ATTRIBUTE5  AS N'InvAttr5',
	LocInv.LOC_INV_ATTRIBUTE6  AS N'InvAttr6',
	LocInv.LOC_INV_ATTRIBUTE7  AS N'InvAttr7',
	LocInv.LOC_INV_ATTRIBUTE8  AS N'InvAttr8',
	LocInv.LOC_INV_ATTRIBUTE9  AS N'InvAttr9',
	LocInv.LOC_INV_ATTRIBUTE10  AS N'InvAttr10',
	LocInv.LOC_INV_ATTRIBUTE11  AS N'InvAttr11',
	LocInv.LOC_INV_ATTRIBUTE12  AS N'InvAttr12',
	LocInv.LOC_INV_ATTRIBUTE13  AS N'InvAttr13',
	LocInv.LOC_INV_ATTRIBUTE14  AS N'InvAttr14',
	LocInv.LOC_INV_ATTRIBUTE15  AS N'InvAttr15',
	LocInv.LOC_INV_ATTRIBUTE16  AS N'InvAttr16',
	LocInv.LOC_INV_ATTRIBUTE17  AS N'InvAttr17',
	LocInv.LOC_INV_ATTRIBUTE18  AS N'InvAttr18',
	LocInv.LOC_INV_ATTRIBUTE19  AS N'InvAttr19',
	LocInv.LOC_INV_ATTRIBUTE20  AS N'InvAttr20'
	FROM  LOCATION_INVENTORY_ATTRIBUTES_VIEW LocInv
	WHERE INTERNAL_LOCATION_INV=@InternalLocationInv;					
END



