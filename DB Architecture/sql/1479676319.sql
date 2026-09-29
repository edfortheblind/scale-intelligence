-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_LocationsWithInTransitQtyButNoWorkExistsCount
as
begin
	select count(item), '<literal:1>' 
	from location_inventory li with(nolock)
	where in_transit_qty <> 0
	and not exists (select '<literal:2>' from work_instruction wi with(nolock)
	where wi.item = li.item
	and isnull(wi.company, '<literal:3>') = isnull(li.company, '<literal:4>')
	and wi.to_whs = li.warehouse
	and wi.to_loc = li.location
	and isnull(wi.lot, '<literal:5>') = isnull(li.lot, '<literal:6>')
	and condition != '<literal:7>'
	and instruction_type = '<literal:8>')
	and li.location not like '<literal:9>'
end