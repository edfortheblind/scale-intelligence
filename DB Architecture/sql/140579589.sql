-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
CREATE VIEW [dbo].[VIEWER_PACKAGE] AS
select distinct sd.ERP_ORDER as DocNumber, sd.item, sd.REQUESTED_QTY, sd.total_qty, sd.erp_order as TCN, sh.ACTUAL_SHIP_DATE_TIME, 
		case when sh.carrier != '<literal:1>' THEN sl.PRO_NUM_ALPHA ELSE sc2.TRACKING_NUMBER end as Track_ProNumber, sl.carrier, INTERNAL_LOAD_NUM, BOL_NUM_ALPHA, 
		-- [comment omitted]
		-- [comment omitted]
		sc2.MANIFEST_ID, 
		sc2.MANIFEST_CARR_SERVICE_SYMBOL,
		-- [comment omitted]
			sc2.MANIFEST_STATE, INTERFACED_DATE
from	AR_SHIPMENT_HEADER sh inner join 
		AR_SHIPMENT_DETAIL sd on sh.INTERNAL_SHIPMENT_NUM = sd.INTERNAL_SHIPMENT_NUM inner join AR_SHIPPING_LOAD sl on sh.SHIPPING_LOAD_NUM = sl.INTERNAL_LOAD_NUM 
		left outer join ar_shipping_container sc1 on sd.INTERNAL_SHIPMENT_LINE_NUM = sc1.INTERNAL_SHIPMENT_LINE_NUM inner join AR_SHIPPING_CONTAINER sc2 on sc1.PARENT_CONTAINER_ID = sc2.container_id