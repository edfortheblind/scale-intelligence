-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_LocationsWithInTransitQtyButNoWorkExistsDetails
as
begin
	select item, company, warehouse, location, lot, logistics_unit, in_transit_qty
	from location_inventory li with(nolock)
	where in_transit_qty <> 0
	and not exists (select '<literal:1>' from work_instruction wi with(nolock)
	where wi.item = li.item
	and isnull(wi.company, '<literal:2>') = isnull(li.company, '<literal:3>')
	and wi.to_whs = li.warehouse
	and wi.to_loc = li.location
	and isnull(wi.lot, '<literal:4>') = isnull(li.lot, '<literal:5>')
	and condition != '<literal:6>'
	and instruction_type = '<literal:7>')
	and li.location not like '<literal:8>'
end