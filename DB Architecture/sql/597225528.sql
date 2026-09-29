-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE MetaTrans_GetInventory(
@InternalLocationInv numeric(9)=null,
@culture nvarchar(10))
AS
BEGIN
       SET NOCOUNT ON;

	   if (@InternalLocationInv is null)
			set @InternalLocationInv=0
	   
SELECT TOP 1
	N'<literal:1>' AS N'<literal:2>',	
	N'<literal:3>' AS N'<literal:4>', 	
	Inv.INTERNAL_LOCATION_INV AS N'<literal:5>', 		
	Inv.COMPANY AS N'<literal:6>', 	
	Inv.WAREHOUSE AS N'<literal:7>', 
	Inv.LOCATION_TEMPLATE AS N'<literal:8>', 	
	Inv.LOCATION AS N'<literal:9>',
	Inv.LOGISTICS_UNIT AS N'<literal:10>',
	Inv.PARENT_LOGISTICS_UNIT AS N'<literal:11>',
	Inv.INVENTORY_STS AS N'<literal:12>',
	Convert(BIT, (case when Inv.PERMANENT = N'<literal:13>' then 1 else 0 end)) AS N'<literal:14>',		
	Inv.ITEM AS N'<literal:15>', 
	Inv.ITEM_DESC AS N'<literal:16>', 
	Inv.LOT AS N'<literal:17>',					
	Inv.AVAILABLEQTY_AV AS N'<literal:18>',
	Inv.ON_HAND_QTY AS N'<literal:19>',
	Inv.IN_TRANSIT_QTY AS N'<literal:20>',
	Inv.ALLOCATED_QTY AS N'<literal:21>',
	Inv.SUSPENSE_QTY AS N'<literal:22>',
	Inv.QUANTITY_UM AS N'<literal:23>',
	Inv.AGING_DATE AS N'<literal:24>',
	Inv.EXPIRATION_DATE AS N'<literal:25>',
	Inv.MANUFACTURED_DATE AS N'<literal:26>',
	Inv.RECEIVED_DATE AS N'<literal:27>',
	Inv.TOTAL_COST AS N'<literal:28>',
	Inv.TOTAL_VOLUME AS N'<literal:29>',
	Inv.TOTAL_WEIGHT AS N'<literal:30>',
	Inv.WEIGHT_UM AS N'<literal:31>', 
    Inv.VOLUME_UM AS N'<literal:32>',
    Inv.ALLOCATION_ZONE AS N'<literal:33>',
    Inv.LOCATING_ZONE AS N'<literal:34>',
    Inv.WORK_ZONE AS N'<literal:35>',
    Inv.LOCATION_INVENTORY_USER_STAMP AS N'<literal:36>',
    Inv.LOCATION_INVENTORY_PROCESS_STAMP AS N'<literal:37>',
    Inv.LOCATION_INVENTORY_DATE_TIME_STAMP AS N'<literal:38>',
    Inv.LOCATION_INVENTORY_USER_DEF1 AS N'<literal:39>',
    Inv.LOCATION_INVENTORY_USER_DEF2 AS N'<literal:40>',
    Inv.LOCATION_INVENTORY_USER_DEF3 AS N'<literal:41>',
    Inv.LOCATION_INVENTORY_USER_DEF4 AS N'<literal:42>',
    Inv.LOCATION_INVENTORY_USER_DEF5 AS N'<literal:43>',
    Inv.LOCATION_INVENTORY_USER_DEF6 AS N'<literal:44>',
    Inv.LOCATION_INVENTORY_USER_DEF7 AS N'<literal:45>',
    Inv.LOCATION_INVENTORY_USER_DEF8 AS N'<literal:46>'
FROM METADATA_INSIGHT_INVENTORY_VIEW Inv
WHERE Inv.INTERNAL_LOCATION_INV = @InternalLocationInv;

SELECT TOP 1
	N'<literal:47>' AS N'<literal:48>',	
	N'<literal:49>' AS N'<literal:50>', 	
	LocInv.LOC_INV_ATTRIBUTE1 AS N'<literal:51>',
	LocInv.LOC_INV_ATTRIBUTE2  AS N'<literal:52>',
	LocInv.LOC_INV_ATTRIBUTE3  AS N'<literal:53>',
	LocInv.LOC_INV_ATTRIBUTE4  AS N'<literal:54>',
	LocInv.LOC_INV_ATTRIBUTE5  AS N'<literal:55>',
	LocInv.LOC_INV_ATTRIBUTE6  AS N'<literal:56>',
	LocInv.LOC_INV_ATTRIBUTE7  AS N'<literal:57>',
	LocInv.LOC_INV_ATTRIBUTE8  AS N'<literal:58>',
	LocInv.LOC_INV_ATTRIBUTE9  AS N'<literal:59>',
	LocInv.LOC_INV_ATTRIBUTE10  AS N'<literal:60>',
	LocInv.LOC_INV_ATTRIBUTE11  AS N'<literal:61>',
	LocInv.LOC_INV_ATTRIBUTE12  AS N'<literal:62>',
	LocInv.LOC_INV_ATTRIBUTE13  AS N'<literal:63>',
	LocInv.LOC_INV_ATTRIBUTE14  AS N'<literal:64>',
	LocInv.LOC_INV_ATTRIBUTE15  AS N'<literal:65>',
	LocInv.LOC_INV_ATTRIBUTE16  AS N'<literal:66>',
	LocInv.LOC_INV_ATTRIBUTE17  AS N'<literal:67>',
	LocInv.LOC_INV_ATTRIBUTE18  AS N'<literal:68>',
	LocInv.LOC_INV_ATTRIBUTE19  AS N'<literal:69>',
	LocInv.LOC_INV_ATTRIBUTE20  AS N'<literal:70>'
	FROM  LOCATION_INVENTORY_ATTRIBUTES_VIEW LocInv
	WHERE INTERNAL_LOCATION_INV=@InternalLocationInv;					
END



