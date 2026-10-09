create procedure RPT_CSO_LocationsWithInTransitQtyButNoWorkExistsDetails
as
begin
	select item, company, warehouse, location, lot, logistics_unit, in_transit_qty
	from location_inventory li with(nolock)
	where in_transit_qty <> 0
	and not exists (select 'X' from work_instruction wi with(nolock)
	where wi.item = li.item
	and isnull(wi.company, 'Null') = isnull(li.company, 'Null')
	and wi.to_whs = li.warehouse
	and wi.to_loc = li.location
	and isnull(wi.lot, 'Null') = isnull(li.lot, 'Null')
	and condition != 'Closed'
	and instruction_type = 'Detail')
	and li.location not like '-%'
end