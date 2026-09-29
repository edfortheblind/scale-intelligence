-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_ShipDockOnHandandAllocatedQtyNotEqualShippingQtyDetails
as
begin
	select li.location, li.item, li.lot, li.logistics_unit, li.on_hand_qty, li.allocated_qty, tot.sqty as sqty, li.company, li.warehouse
	from location_inventory li with(nolock) left outer join 
	(select sum(quantity) SQTY, item, company, to_loc, to_whs, lot, logistics_unit from work_instruction_view with(nolock)
	where instruction_type = '<literal:1>' and internal_num_type = '<literal:2>'
	and condition = '<literal:3>' and internal_num in 
	(select internal_shipment_num from shipment_header with(nolock) where leading_sts < 900)
	group by item, to_whs, company, to_loc, lot, logistics_unit)TOT
	on li.item = tot.item and isNull(li.company, '<literal:4>') = isNull(tot.company, '<literal:5>')
	and li.warehouse = tot.to_whs and li.location = tot.to_loc and isnull(li.lot, '<literal:6>') = isnull(tot.lot, '<literal:7>') 
	and isnull(li.logistics_unit, '<literal:8>') = isnull(tot.logistics_unit, '<literal:9>')
	where li.on_hand_qty <> tot.sqty
	and li.location in (select location from location with(nolock) where location_class in ('<literal:10>') and li.warehouse = tot.to_whs)
end