-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_LocationsWithInTransitQtyEqualZeroButWorkExistsCount
as
begin
	select count(item), '<literal:1>' from (
	select li.warehouse, li.location, li.item, isnull(wi.company,'<literal:2>') company, isnull(li.lot,'<literal:3>') lot, isnull(li.logistics_unit,'<literal:4>') logistics_unit, sum(li.in_transit_qty) sum_in_transit_qty, sum(wi.from_qty) sum_from_qty, wi.work_unit, wi.reference_id
	from location_inventory li with(nolock), work_instruction wi with(nolock)
	where li.in_transit_qty = 0 
	and wi.internal_num_type != '<literal:5>'
	and wi.instruction_type = '<literal:6>'
	and wi.condition != '<literal:7>' 
	and wi.item = li.item
	and wi.to_whs = li.warehouse
	and wi.to_loc = li.location
	and wi.to_qty > 0
	and isnull(wi.company, '<literal:8>') = isnull(li.company, '<literal:9>')
	and isnull(wi.lot, '<literal:10>') = isnull(li.lot, '<literal:11>')
	and isnull(wi.logistics_unit, '<literal:12>') = isnull(li.logistics_unit, '<literal:13>')
	group by li.item, li.location, li.warehouse, wi.company, li.lot, li.logistics_unit, wi.work_unit, wi.reference_id) SQLSelect
end