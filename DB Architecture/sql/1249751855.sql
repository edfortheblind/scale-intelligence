-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






-- [comment omitted]

CREATE PROCEDURE SCI_LOCATION_SNAPSHOT
AS
BEGIN
SET NOCOUNT ON;
select l.location, l.warehouse, l.locating_zone, l.work_zone, l.allocation_zone, l.multi_item, l.track_containers, l.movement_cls, l.location_class,   l.location_type, l.template_field1, l.template_field2, l.template_field3, l.template_field4, l.template_field5, CASE WHEN l.last_cycle_count_date > N'<literal:1>' THEN N'<literal:2>' ELSE l.last_cycle_count_date END as last_cycle_count_date, li.item, li.company, li.item_desc, li.permanent, li.lot, li.item_size, li.item_color, li.item_style, ISNULL(li.on_hand_qty,0) on_hand_qty,   ISNULL(li.in_transit_qty,0) in_transit_qty, li.parent_logistics_unit, li.logistics_unit,   ISNULL(li.total_weight,0)/ CASE ISNULL(on_hand_qty,0) WHEN 0 THEN 1 ELSE on_hand_qty END total_weight, ISNULL(li.total_volume,0)/ CASE ISNULL(on_hand_qty,0) WHEN 0 THEN 1 ELSE on_hand_qty END total_volume,   ISNULL(li.total_value,0)/ CASE ISNULL(on_hand_qty,0) WHEN 0 THEN 1 ELSE on_hand_qty END total_value,   ISNULL(li.total_cost,0)/ CASE ISNULL(on_hand_qty,0) WHEN 0 THEN 1 ELSE on_hand_qty END total_cost, CASE WHEN li.expiration_date > N'<literal:3>' THEN N'<literal:4>' ELSE li.expiration_date END as expiration_date, li.inventory_sts,i.item_class, i.item_category1,   i.item_category2, i.item_category3, i.item_category4, i.item_category5, i.item_category6, i.item_category7, i.item_category8, i.item_category9,   i.item_category10, i.department, i.division, i.nmfc_code, i.country_of_origin, i.packing_class, li.quantity_um, li.weight_um, GETUTCDATE() SNAPSHOT_DATE, CAST(null as nvarchar(100)) user_dimension01, CAST(null as nvarchar(100)) user_dimension02, CAST(null as nvarchar(100)) user_dimension03, CAST(null as nvarchar(100)) user_dimension04, CAST(null as nvarchar(100)) user_dimension05, CAST(null as nvarchar(100)) user_dimension06, CAST(null as nvarchar(100)) user_dimension07, CAST(null as nvarchar(100)) user_dimension08, CAST(null as nvarchar(100)) user_dimension09, CAST(null as nvarchar(100)) user_dimension10,  CAST(null as numeric(28,5)) user_fact1, CAST(null as numeric(28,5)) user_fact2, CAST(null as numeric(28,5)) user_fact3, CAST(null as numeric(28,5)) user_fact4, CAST(null as numeric(28,5)) user_fact5,   l.location_sts from location l    left outer join location_inventory li     on l.location = li.location     and l.warehouse = li.warehouse    left outer join item i    on li.item = i.item and ISNULL(li.company,N'<literal:5>') = ISNULL(i.company,N'<literal:6>') where l.location_class = N'<literal:7>'
END
;
