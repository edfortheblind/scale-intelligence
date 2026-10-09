/*  
Mod Number  | Programmer| Date     | Modification Description  
--------------------------------------------------------------------  
31635  | MK    | 01/25/2024 | Created.  

Parameters  
@waveNum is shipment allocation request launch num  
@direction is Transaction history direction can be a from or to record  
 
*/  
  
  
CREATE PROCEDURE HIST_LocationInvForCancelledWave(  
@waveNum numeric(9),  
@direction nvarchar(25)
)  
AS   
BEGIN  
if @direction = N'To'   
Begin  
  
 Select LI.Warehouse, LI.Company,LI.Item,LI.Location ,LI.Lot,Sum(AR.Allocated_Qty) as Allocated_Qty_Sum, LI.Allocated_Qty, AR.Quantity_Um,AR.Shipment_Id  
  ,LI.On_Hand_Qty,LI.Allocated_Qty as BEFORE_ALLOCATED_QTY,LI.Allocated_Qty,LI.In_Transit_Qty as BEFORE_IN_TRANSIT_QTY,LI.In_Transit_Qty,LI.Suspense_Qty,  
  LI.EXPIRATION_DATE,LI.Inventory_Sts,LI.LOGISTICS_UNIT,LI.LOC_INV_ATTRIBUTES_ID  
 FROM  
    Location_Inventory LI, Shipment_Alloc_Request AR  
 Where  
    (@WAVENUM <> 0 AND AR.LAUNCH_NUM = @WAVENUM )   
    AND AR.Inventory_Tracking = N'Y' AND AR.To_Whs = LI.Warehouse AND AR.To_Loc = LI.Location AND AR.Item = LI.Item  
    AND (( AR.Lot is null AND LI.Lot is null )  OR ( AR.Lot = LI.Lot ) )   
    AND (( AR.TO_LOC_INV_ATTRIBUTES_ID is null  AND  LI.LOC_INV_ATTRIBUTES_ID is null  ) OR ( AR.TO_LOC_INV_ATTRIBUTES_ID = LI.LOC_INV_ATTRIBUTES_ID  ))  
    AND (( AR.Company is null AND LI.Company is null )  OR ( AR.Company = LI.Company ) )   
 Group By  
    LI.Warehouse,LI.Location,LI.Item,AR.Quantity_Um,AR.Shipment_Id,LI.Lot,LI.LOC_INV_ATTRIBUTES_ID, LI.Company,LI.On_Hand_Qty, LI.Allocated_Qty ,  
  LI.In_Transit_Qty, LI.Suspense_Qty,LI.LOGISTICS_UNIT,LI.EXPIRATION_DATE,LI.Inventory_Sts ;  
END   
 ELSE   
Begin  
 
 Select LI.Warehouse, LI.Company,LI.Item,LI.Location ,LI.Lot,Sum(AR.Allocated_Qty)  as Allocated_Qty_Sum,LI.Allocated_Qty, AR.Quantity_Um,AR.Shipment_Id  
  ,LI.On_Hand_Qty,LI.Allocated_Qty  as BEFORE_ALLOCATED_QTY,LI.Allocated_Qty,LI.In_Transit_Qty as BEFORE_IN_TRANSIT_QTY,LI.In_Transit_Qty,LI.Suspense_Qty,  
  LI.EXPIRATION_DATE,LI.Inventory_Sts,LI.LOGISTICS_UNIT,LI.LOC_INV_ATTRIBUTES_ID  
 FROM  
    Location_Inventory LI, Shipment_Alloc_Request AR  
 Where  
    (@WAVENUM <> 0 AND AR.LAUNCH_NUM = @WAVENUM )   
    AND AR.Inventory_Tracking = N'Y' AND AR.From_Whs = LI.Warehouse AND AR.From_Loc = LI.Location AND AR.Item = LI.Item  
    AND (( AR.Lot is null AND LI.Lot is null )  OR ( AR.Lot = LI.Lot ) ) AND (( AR.Company is null AND LI.Company is null )  OR ( AR.Company = LI.Company ) )   
    AND (( AR.FROM_LOC_INV_ATTRIBUTES_ID is null  AND  LI.LOC_INV_ATTRIBUTES_ID is null  ) OR ( AR.FROM_LOC_INV_ATTRIBUTES_ID = LI.LOC_INV_ATTRIBUTES_ID  ))  
    AND (( AR.logistics_unit is null AND LI.logistics_unit is null )  OR ( AR.logistics_unit = LI.logistics_unit ) )  
    AND LI.Allocated_Qty > 0  
 Group By  
    LI.Warehouse,LI.Location,LI.Item,AR.Quantity_Um,AR.Shipment_Id,LI.Lot,LI.Company,LI.LOC_INV_ATTRIBUTES_ID, LI.On_Hand_Qty, LI.Allocated_Qty ,  
  LI.In_Transit_Qty, LI.Suspense_Qty,LI.LOGISTICS_UNIT,LI.EXPIRATION_DATE,LI.Inventory_Sts ;  
END  
END
  