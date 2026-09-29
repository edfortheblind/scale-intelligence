-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

create procedure RPT_CSO_LocationsWhereInTransitQtyNotEqualWorkQtyDetails
as
begin
	select wi.item as WI_item, wi.company as WI_company, wi.to_loc as WI_toLoc, wi.lot as WI_lot, wi.logistics_unit as WI_logistics_unit, wi.qty as WI_qty,
	li.in_transit as LI_inTransit, li.warehouse as LI_warehouse, li.on_hand as LI_onHand
	 from  
	 (select item, company, lot, logistics_unit, sum(from_qty + to_qty) as qty, to_loc, from_whs
	 from work_instruction with(nolock)
	 where  condition <> '<literal:1>' 
	 and instruction_type = '<literal:2>' 
	 and from_loc <> to_loc
	group by item, company, lot, logistics_unit, to_loc, from_whs) wi, 
	 (select item, warehouse, company, lot, logistics_unit, sum(on_hand_qty) as on_hand, sum(in_transit_qty) as in_transit, location 
	 from location_inventory with(nolock)
	group by item, warehouse, company, lot, logistics_unit, location) li 
	where wi.item = li.item 
	and wi.to_loc = li.location 
	and wi.from_whs = li.warehouse
	and isnull(wi.company, '<literal:3>') = isnull(li.company, '<literal:4>')
	and wi.qty <> li.in_transit
	and isnull(wi.lot, '<literal:5>') = isnull(li.lot, '<literal:6>')
	and isnull(wi.logistics_unit, '<literal:7>') = isnull(li.logistics_unit, '<literal:8>')
	and li.location not in (select location from location with(nolock) where location_class in ('<literal:9>') and wi.from_whs = li.warehouse)
end