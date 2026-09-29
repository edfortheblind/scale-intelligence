-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_ShipDockOnHandandAllocatedQtyNotEqualShippingQtyCount
as
begin
	select count(li.location), '<literal:1>' 
	from location_inventory li with(nolock) left outer join 
	(select sum(quantity) SQTY, item, company, to_loc, to_whs, lot, logistics_unit from work_instruction_view with(nolock)
	where instruction_type = '<literal:2>' and internal_num_type = '<literal:3>'
	and condition = '<literal:4>' and internal_num in 
	(select internal_shipment_num from shipment_header with(nolock) where leading_sts < 900)
	group by item, to_whs, company, to_loc, lot, logistics_unit)TOT
	on li.item = tot.item and isNull(li.company, '<literal:5>') = isNull(tot.company, '<literal:6>')
	and li.warehouse = tot.to_whs and li.location = tot.to_loc and isnull(li.lot, '<literal:7>') = isnull(tot.lot, '<literal:8>') 
	and isnull(li.logistics_unit, '<literal:9>') = isnull(tot.logistics_unit, '<literal:10>')
	where li.on_hand_qty <> tot.sqty
	and li.location in (select location from location with(nolock) where location_class in ('<literal:11>') and li.warehouse = tot.to_whs)
end