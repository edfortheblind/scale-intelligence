create procedure RPT_CSO_LocationsWithInTransitQtyEqualZeroButWorkExistsDetails
as
begin
	select li.warehouse, li.location, li.item, isnull(wi.company,'Null') company, isnull(li.lot,'Null') lot, isnull(li.logistics_unit,'Null') logistics_unit, sum(li.in_transit_qty) sum_in_transit_qty, sum(wi.from_qty) sum_from_qty, wi.work_unit, wi.reference_id
	from location_inventory li with(nolock), work_instruction wi with(nolock)
	where li.in_transit_qty = 0 
	and wi.internal_num_type != 'Cycle Count'
	and wi.instruction_type = 'Detail'
	and wi.condition != 'Closed' 
	and wi.item = li.item
	and wi.to_whs = li.warehouse
	and wi.to_loc = li.location
	and wi.to_qty > 0
	and isnull(wi.company, 'Null') = isnull(li.company, 'Null')
	and isnull(wi.lot, 'Null') = isnull(li.lot, 'Null')
	and isnull(wi.logistics_unit, 'Null') = isnull(li.logistics_unit, 'Null')
	group by li.item, li.location, li.warehouse, wi.company, li.lot, li.logistics_unit, wi.work_unit, wi.reference_id
end