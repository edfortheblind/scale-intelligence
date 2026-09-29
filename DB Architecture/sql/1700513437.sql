-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















CREATE VIEW METADATA_INSIGHT_INVENTORY_AGGREGATE_VIEW
AS   
select     
 min(li.AGING_DATE) as AGING_DATE,     
 sum(case when li.ALLOCATED_QTY is null then 0 else li.ALLOCATED_QTY end) as ALLOCATED_QTY,     
 li.COMPANY,     
 min(li.DATE_TIME_STAMP) as LOCATION_INVENTORY_DATE_TIME_STAMP,     
 min(li.EXPIRATION_DATE) as EXPIRATION_DATE,     
 sum(case when li.IN_TRANSIT_QTY is null then 0 else li.IN_TRANSIT_QTY end) as IN_TRANSIT_QTY,     
 case when count(distinct li.INTERNAL_LOCATION_INV) > 1 then -1 else min(li.INTERNAL_LOCATION_INV) end as INTERNAL_LOCATION_INV,     
 case when count(distinct li.INVENTORY_STS) > 1 then N'<literal:1>' else min(li.INVENTORY_STS) end as INVENTORY_STS,     
 li.ITEM,     
 min(li.ITEM_COLOR) as ITEM_COLOR,     
 min(li.ITEM_DESC) as ITEM_DESC,     
 min(li.ITEM_SIZE) as ITEM_SIZE,     
 min(li.ITEM_STYLE) as ITEM_STYLE,     
 case when count(distinct li.LOC_INV_ATTRIBUTES_ID) > 1 then -1 else min(li.LOC_INV_ATTRIBUTES_ID) end as LOC_INV_ATTRIBUTES_ID,     
 case when count(distinct li.LOGISTICS_UNIT) > 1 then N'<literal:2>' else min(li.LOGISTICS_UNIT) end as LOGISTICS_UNIT,     
 li.LOT,    
 lt.FROZEN,     
 min(li.MANUFACTURED_DATE) as MANUFACTURED_DATE,     
 sum(case when li.ON_HAND_QTY is null then 0 else li.ON_HAND_QTY end) as ON_HAND_QTY,     
 case when count(distinct li.PARENT_LOGISTICS_UNIT) > 1 then N'<literal:3>' else min(li.PARENT_LOGISTICS_UNIT) end as PARENT_LOGISTICS_UNIT,     
 li.PERMANENT,     
 min(li.PROCESS_STAMP) as LOCATION_INVENTORY_PROCESS_STAMP,     
 min(li.QUANTITY_UM) as QUANTITY_UM,     
 min(li.RECEIVED_DATE) as RECEIVED_DATE,     
 sum(case when li.SUSPENSE_QTY is null then 0 else li.SUSPENSE_QTY end) as SUSPENSE_QTY,     
 sum(case when li.TOTAL_COST is null then 0 else li.TOTAL_COST end) as TOTAL_COST,     
 sum(case when li.TOTAL_VALUE is null then 0 else li.TOTAL_VALUE end) as TOTAL_VALUE,     
 sum(case when li.TOTAL_VOLUME is null then 0 else li.TOTAL_VOLUME end) as TOTAL_VOLUME,     
 sum(case when li.TOTAL_WEIGHT is null then 0 else li.TOTAL_WEIGHT end) as TOTAL_WEIGHT,     
 sum(ISNULL(cw.CATCH_WEIGHT, 0) + scc_cw.ContainerCatchWeight) as CATCH_WEIGHT,    
 min(COALESCE(cw.WEIGHT_UM, scc_cw.ContainerWeightUM)) as CATCH_WEIGHT_UM,    
 min(li.USER_DEF1) as LOCATION_INVENTORY_USER_DEF1,     
 min(li.USER_DEF2) as LOCATION_INVENTORY_USER_DEF2,     
 min(li.USER_DEF3) as LOCATION_INVENTORY_USER_DEF3,     
 min(li.USER_DEF4) as LOCATION_INVENTORY_USER_DEF4,     
 min(li.USER_DEF5) as LOCATION_INVENTORY_USER_DEF5,     
 min(li.USER_DEF6) as LOCATION_INVENTORY_USER_DEF6,     
 min(li.USER_DEF7) as LOCATION_INVENTORY_USER_DEF7,     
 min(li.USER_DEF8) as LOCATION_INVENTORY_USER_DEF8,     
 min(li.USER_STAMP) as LOCATION_INVENTORY_USER_STAMP,     
 min(li.VOLUME_UM) as VOLUME_UM,     
 min(li.WEIGHT_UM) as WEIGHT_UM,     
 min(l.ACTIVE) as ACTIVE,     
 min(l.ALLOCATE_IN_TRANSIT) as ALLOCATE_IN_TRANSIT,     
 l.ALLOCATION_ZONE,     
 min(l.ALLOW_WORK_SELECT_ON_SYS_DIR) as ALLOW_WORK_SELECT_ON_SYS_DIR,     
 min(l.CHECK_DIG) as CHECK_DIG,     
 min(l.DATE_TIME_STAMP) as LOCATION_DATE_TIME_STAMP,     
 min(l.DOCK_AREA_ANCHOR_CRITERIA) as DOCK_AREA_ANCHOR_CRITERIA,     
 min(l.DOCK_AREA_SELECTION_PRIORITY) as DOCK_AREA_SELECTION_PRIORITY,     
 min(l.DOCK_LOCATION_TYPE) as DOCK_LOCATION_TYPE,     
 min(l.INCOMING_PD_LOC) as INCOMING_PD_LOC,     
 min(l.LAST_CYCLE_COUNT_DATE) as LAST_CYCLE_COUNT_DATE,     
 l.LOCATING_ZONE,     
 l.LOCATION,     
 case when max(li.INTERNAL_LOCATION_INV) > 0 then ( case when (select count(*) from location_unit_of_measure where INTERNAL_LOCATION_INV = max(li.INTERNAL_LOCATION_INV)) > 0 then N'<literal:4>' else N'<literal:5>' end ) else N'<literal:6>' end as OVERRIDES,    
 min(l.LOCATION_TEMPLATE) as LOCATION_TEMPLATE,     
 l.LOCATION_CLASS,     
 min(l.LOCATION_STS) as LOCATION_STS,     
 min(l.LOCATION_SUBCLASS) as LOCATION_SUBCLASS,     
 l.TEMPLATE_FIELD1,     
 l.TEMPLATE_FIELD2,     
 l.TEMPLATE_FIELD3,     
 l.TEMPLATE_FIELD4,     
 l.TEMPLATE_FIELD5,     
 l.LOCATION_TYPE,     
 min(l.LOCKED_FOR_LOCATE) as LOCKED_FOR_LOCATE,     
 min(l.MAX_LOTS) as MAX_LOTS,     
 l.MOVEMENT_CLS,     
 l.MULTI_ITEM,     
 min(l.NEXT_DOCK_AREA) as NEXT_DOCK_AREA,     
 l.OBJECT_ID,     
 min(l.OUTGOING_PD_LOC) as OUTGOING_PD_LOC,     
 min(l.PARENT_DOCK_AREA) as PARENT_DOCK_AREA,     
 min(l.PICKING_SEQ) as PICKING_SEQ,     
 min(l.PROCESS_STAMP) as LOCATION_PROCESS_STAMP,     
 min(l.PUTAWAY_SEQ) as PUTAWAY_SEQ,     
 min(l.QTY_UM_LIST) as QTY_UM_LIST,     
 min(l.REAL_TIME_RPLN) as REAL_TIME_RPLN,     
 min(l.ROW_VERSION) as ROW_VERSION,     
 min(l.RPLN_EVALUATION) as RPLN_EVALUATION,     
 min(l.STAGING_ROW_COUNT) as STAGING_ROW_COUNT,     
 min(l.TRACK_CONTAINERS) as TRACK_CONTAINERS,     
 min(l.USER_DEF1) as LOCATION_USER_DEF1,     
 min(l.USER_DEF2) as LOCATION_USER_DEF2,     
 min(l.USER_DEF3) as LOCATION_USER_DEF3,     
 min(l.USER_DEF4) as LOCATION_USER_DEF4,     
 min(l.USER_DEF5) as LOCATION_USER_DEF5,     
 min(l.USER_DEF6) as LOCATION_USER_DEF6,     
 min(l.USER_DEF7) as LOCATION_USER_DEF7,     
 min(l.USER_DEF8) as LOCATION_USER_DEF8,     
 min(l.USER_STAMP) as LOCATION_USER_STAMP,     
 min(l.VECTOR_COORDINATE) as VECTOR_COORDINATE,     
 min(l.VERIFICATION_METH) as VERIFICATION_METH,     
 l.warehouse as WAREHOUSE,     
 l.WORK_ZONE,    
 CASE WHEN min(l.ALLOCATE_IN_TRANSIT) = N'<literal:7>' THEN (CASE WHEN sum(li.ON_HAND_QTY + li.IN_TRANSIT_QTY - (li.SUSPENSE_QTY + li.ALLOCATED_QTY)) >= 0 THEN sum(li.ON_HAND_QTY + li.IN_TRANSIT_QTY - (li.SUSPENSE_QTY + li.ALLOCATED_QTY)) ELSE 0 END)    
 WHEN sum(li.ON_HAND_QTY - (li.SUSPENSE_QTY + li.ALLOCATED_QTY)) >= 0 THEN sum(li.ON_HAND_QTY - (li.SUSPENSE_QTY + li.ALLOCATED_QTY))    
 ELSE 0 END AS AVAILABLEQTY_AV,    
 max(CASE WHEN it.CATCH_WEIGHT_REQD = N'<literal:8>' THEN N'<literal:9>' ELSE N'<literal:10>' END) AS CATCH_WEIGHT_REQD, 
 count(distinct li.logistics_unit) as LP,    
 count(distinct li.logistics_unit) as LP_COUNT,     
 N'<literal:11>' as SERIAL_NUMBER ,    
 CONCAT(li.Item,li.Company) as ItemCompany      
from    
 LOCATION l    
 left outer join LOCATION_INVENTORY li     
 on l.LOCATION = li.LOCATION and l.warehouse = li.warehouse 
 left outer join ITEM it
 on li.ITEM = it.ITEM and (li.COMPANY = it.COMPANY OR (li.COMPANY IS NULL AND it.COMPANY IS NULL))  
 left outer join LOT lt on (li.lot = lt.lot and li.item =lt.item and (li.company=lt.company OR (li.company is null and lt.company is null)) and li.warehouse=lt.warehouse)    
 OUTER APPLY (SELECT TOP 1 cwi.CATCH_WEIGHT, cwi.WEIGHT_UM FROM CATCH_WEIGHT_INFORMATION cwi WHERE cwi.INTERNAL_LOCATION_INV = li.INTERNAL_LOCATION_INV) cw    
 OUTER APPLY (
     SELECT ISNULL(SUM(scci.CATCH_WEIGHT), 0) AS ContainerCatchWeight, MIN(scci.WEIGHT_UM) AS ContainerWeightUM
     FROM SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION scci
     WHERE scci.INTERNAL_LOCATION_INV = li.INTERNAL_LOCATION_INV
 ) scc_cw
Where     
 (CASE WHEN li.PERMANENT IS NULL THEN l.Location_Sts ELSE N'<literal:12>' END) in (N'<literal:13>',N'<literal:14>')    
 AND    
 l.LOCATION_CLASS <> N'<literal:15>'    
group by     
 l.location,     
 l.template_field1,     
 l.template_field2,     
 l.template_field3,     
 l.template_field4,     
 l.template_field5,     
 l.movement_cls,     
 l.multi_item,     
 l.object_id,     
 l.location_type,     
 l.locating_zone,     
 l.allocation_zone,     
 l.work_zone,     
 l.location_class,     
 l.warehouse,     
 li.item,     
 li.company,     
 li.warehouse,     
 li.location,     
 li.lot,    
 lt.Frozen,     
 li.permanent; 
 