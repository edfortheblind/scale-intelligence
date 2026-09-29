-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */



















CREATE VIEW METADATA_INSIGHT_INVENTORY_VIEW
AS
select 
	li.AGING_DATE,
	case when li.ALLOCATED_QTY is null then 0 else li.ALLOCATED_QTY end as ALLOCATED_QTY, 
	li.COMPANY, 
	li.DATE_TIME_STAMP as LOCATION_INVENTORY_DATE_TIME_STAMP, 
	li.EXPIRATION_DATE, 
	case when li.IN_TRANSIT_QTY is null then 0 else li.IN_TRANSIT_QTY end as IN_TRANSIT_QTY, 
	li.INTERNAL_LOCATION_INV, 
	li.INVENTORY_STS, 
	li.ITEM, 
	li.ITEM_COLOR, 
	li.ITEM_DESC, 
	li.ITEM_SIZE, 
	li.ITEM_STYLE, 
	li.LOC_INV_ATTRIBUTES_ID, 
	li.LOGISTICS_UNIT, 
	li.LOT, 
	li.MANUFACTURED_DATE, 
	case when li.ON_HAND_QTY is null then 0 else li.ON_HAND_QTY end as ON_HAND_QTY, 
	li.PARENT_LOGISTICS_UNIT, 
	li.PERMANENT, 
	li.PROCESS_STAMP as LOCATION_INVENTORY_PROCESS_STAMP, 
	li.QUANTITY_UM, 
	li.RECEIVED_DATE, 
	case when li.SUSPENSE_QTY is null then 0 else li.SUSPENSE_QTY end as SUSPENSE_QTY, 
	case when li.TOTAL_COST is null then 0 else li.TOTAL_COST end as TOTAL_COST, 
	case when li.TOTAL_VALUE is null then 0 else li.TOTAL_VALUE end as TOTAL_VALUE, 
	case when li.TOTAL_VOLUME is null then 0 else li.TOTAL_VOLUME end as TOTAL_VOLUME, 
	case when (ISNULL(cw.CATCH_WEIGHT, 0) + scc_cw.ContainerCatchWeight) != 0
     then (ISNULL(cw.CATCH_WEIGHT, 0) + scc_cw.ContainerCatchWeight) else isnull(li.TOTAL_WEIGHT, 0) end as TOTAL_WEIGHT,
	case when COALESCE(cw.WEIGHT_UM, scc_cw.ContainerWeightUM) is not null
     then COALESCE(cw.WEIGHT_UM, scc_cw.ContainerWeightUM) else li.WEIGHT_UM end as WEIGHT_UM,
	ISNULL(cw.CATCH_WEIGHT, 0) + scc_cw.ContainerCatchWeight as CATCH_WEIGHT,      
  	COALESCE(cw.WEIGHT_UM, scc_cw.ContainerWeightUM) as CATCH_WEIGHT_UM, 
	li.USER_DEF1 as LOCATION_INVENTORY_USER_DEF1, 
	li.USER_DEF2 as LOCATION_INVENTORY_USER_DEF2, 
	li.USER_DEF3 as LOCATION_INVENTORY_USER_DEF3, 
	li.USER_DEF4 as LOCATION_INVENTORY_USER_DEF4, 
	li.USER_DEF5 as LOCATION_INVENTORY_USER_DEF5, 
	li.USER_DEF6 as LOCATION_INVENTORY_USER_DEF6, 
	li.USER_DEF7 as LOCATION_INVENTORY_USER_DEF7, 
	li.USER_DEF8 as LOCATION_INVENTORY_USER_DEF8, 
	li.USER_STAMP as LOCATION_INVENTORY_USER_STAMP, 
	li.VOLUME_UM,
	lt.Frozen, 
	l.ACTIVE, 
	l.ALLOCATE_IN_TRANSIT, 
	l.ALLOCATION_ZONE, 
	l.ALLOW_WORK_SELECT_ON_SYS_DIR, 
	l.CHECK_DIG, 
	l.DATE_TIME_STAMP as LOCATION_DATE_TIME_STAMP, 
	l.DOCK_AREA_ANCHOR_CRITERIA, 
	l.DOCK_AREA_SELECTION_PRIORITY, 
	l.DOCK_LOCATION_TYPE, 
	l.INCOMING_PD_LOC, 
	l.LAST_CYCLE_COUNT_DATE, 
	l.LOCATING_ZONE, 
	l.LOCATION, 
	CASE WHEN exists(select N'<literal:1>' from location_unit_of_measure LUOM WHERE LUOM.INTERNAL_LOCATION_INV = li.INTERNAL_LOCATION_INV) then N'<literal:2>' else N'<literal:3>' end as OVERRIDES,
	l.LOCATION_TEMPLATE, 
	l.LOCATION_CLASS, 
	l.LOCATION_STS, 
	l.LOCATION_SUBCLASS, 
	l.TEMPLATE_FIELD1, 
	l.TEMPLATE_FIELD2, 
	l.TEMPLATE_FIELD3, 
	l.TEMPLATE_FIELD4, 
	l.TEMPLATE_FIELD5, 
	l.LOCATION_TYPE, 
	l.LOCKED_FOR_LOCATE, 
	l.MAX_LOTS, 
	l.MOVEMENT_CLS, 
	l.MULTI_ITEM, 
	l.NEXT_DOCK_AREA, 
	l.OBJECT_ID, 
	l.OUTGOING_PD_LOC, 
	l.PARENT_DOCK_AREA, 
	l.PICKING_SEQ, 
	l.PROCESS_STAMP as LOCATION_PROCESS_STAMP, 
	l.PUTAWAY_SEQ, 
	l.QTY_UM_LIST, 
	l.REAL_TIME_RPLN, 
	l.ROW_VERSION, 
	l.RPLN_EVALUATION, 
	l.STAGING_ROW_COUNT, 
	l.TRACK_CONTAINERS, 
	l.USER_DEF1 as LOCATION_USER_DEF1, 
	l.USER_DEF2 as LOCATION_USER_DEF2, 
	l.USER_DEF3 as LOCATION_USER_DEF3, 
	l.USER_DEF4 as LOCATION_USER_DEF4, 
	l.USER_DEF5 as LOCATION_USER_DEF5, 
	l.USER_DEF6 as LOCATION_USER_DEF6, 
	l.USER_DEF7 as LOCATION_USER_DEF7, 
	l.USER_DEF8 as LOCATION_USER_DEF8, 
	l.USER_STAMP as LOCATION_USER_STAMP, 
	l.VECTOR_COORDINATE, 
	l.VERIFICATION_METH, 
	l.warehouse as WAREHOUSE, 
	l.WORK_ZONE,
	CASE WHEN l.ALLOCATE_IN_TRANSIT = N'<literal:4>' THEN  (CASE WHEN (li.ON_HAND_QTY + li.IN_TRANSIT_QTY - (li.SUSPENSE_QTY + li.ALLOCATED_QTY)) >= 0 THEN (li.ON_HAND_QTY + li.IN_TRANSIT_QTY - (li.SUSPENSE_QTY + li.ALLOCATED_QTY)) ELSE 0 END)
	WHEN (li.ON_HAND_QTY - (li.SUSPENSE_QTY + li.ALLOCATED_QTY)) >= 0 THEN (li.ON_HAND_QTY - (li.SUSPENSE_QTY + li.ALLOCATED_QTY))
	ELSE 0 END AS AVAILABLEQTY_AV, 
	li.LOGISTICS_UNIT AS LP,
	case when li.Item is null then null else CONCAT(li.Item,li.Company) end as ItemCompany,
	snv.SERIAL_NUMBER,
	CASE WHEN li.logistics_unit is not null then 1 else 0 end as LP_COUNT,
	CASE WHEN it.CATCH_WEIGHT_REQD = N'<literal:5>' THEN N'<literal:6>' ELSE N'<literal:7>' END AS CATCH_WEIGHT_REQD
from
	LOCATION l
	left outer join LOCATION_INVENTORY li 
	on l.LOCATION = li.LOCATION and l.warehouse = li.warehouse
	left outer join SERIAL_NUMBER_VIEW snv on  snv.LOC_INV_NUM = li.INTERNAL_LOCATION_INV
	left outer join ITEM it on it.ITEM = li.ITEM and (it.COMPANY = li.COMPANY OR (it.COMPANY IS NULL AND li.COMPANY IS NULL))
	left outer join LOT lt on (li.lot = lt.lot and li.item =lt.item and (li.company=lt.company OR (li.company is null and lt.company is null)) and li.warehouse=lt.warehouse)
	-- [comment omitted]
    OUTER APPLY (SELECT TOP 1 cwi.CATCH_WEIGHT, cwi.WEIGHT_UM FROM CATCH_WEIGHT_INFORMATION cwi WHERE cwi.INTERNAL_LOCATION_INV = li.INTERNAL_LOCATION_INV) cw
    -- [comment omitted]
    OUTER APPLY (
        SELECT ISNULL(SUM(scci.CATCH_WEIGHT), 0) AS ContainerCatchWeight, MIN(scci.WEIGHT_UM) AS ContainerWeightUM
        FROM SHIPPING_CONTAINER_CATCH_WEIGHT_INFORMATION scci
        WHERE scci.INTERNAL_LOCATION_INV = li.INTERNAL_LOCATION_INV
    ) scc_cw
Where 
	(CASE WHEN li.PERMANENT IS NULL THEN l.Location_Sts ELSE N'<literal:8>' END) = N'<literal:9>'
	AND
	l.LOCATION_CLASS <> N'<literal:10>';




