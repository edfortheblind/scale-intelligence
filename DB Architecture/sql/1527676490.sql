-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_LocationsWithAllocatedQtyButNoWorkExistsDetails
as
begin
	select item, company, warehouse, location, lot, logistics_unit, allocated_qty
	from location_inventory li with(nolock)
	where allocated_qty <> 0
	and not exists (select '<literal:1>' from work_instruction wi with(nolock)
	where wi.item = li.item
	and isnull(wi.company, '<literal:2>') = isnull(li.company, '<literal:3>')
	and wi.from_whs = li.warehouse
	and wi.from_loc = li.location
	and isnull(wi.lot, '<literal:4>') = isnull(li.lot, '<literal:5>')
	and condition != '<literal:6>'
	and instruction_type = '<literal:7>')
	and li.location not like '<literal:8>'
	and li.location not in (select location from location with(nolock) where location_class in ('<literal:9>', '<literal:10>', '<literal:11>') and li.warehouse = location.warehouse)
end