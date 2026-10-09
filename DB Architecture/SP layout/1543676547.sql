create procedure RPT_CSO_LocationsWithAllocatedQtyButNoWorkExistsCount
as
begin
	select count(item), 'Locations with Allocated Qty but No Work exists' 
	from location_inventory li with(nolock)
	where allocated_qty <> 0
	and not exists (select 'X' from work_instruction wi with(nolock)
	where wi.item = li.item
	and isnull(wi.company, 'Null') = isnull(li.company, 'Null')
	and wi.from_whs = li.warehouse
	and wi.from_loc = li.location
	and isnull(wi.lot, 'Null') = isnull(li.lot, 'Null')
	and condition != 'Closed'
	and instruction_type = 'Detail')
	and li.location not like '-%'
	and li.location not in (select location from location with(nolock) where location_class in ('Shipping Dock', 'P&D', 'Work Order Build') and li.warehouse = location.warehouse)
end