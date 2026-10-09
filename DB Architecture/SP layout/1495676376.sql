create procedure RPT_CSO_LocationsWithAllocatedQtyEqualZeroButWorkExistsDetails
as
begin
	select li.item, li.location, li.warehouse, wi.company, li.lot, li.logistics_unit, sum(li.allocated_qty) as LI_allocqty,
	sum(wi.from_qty) as WI_fromqty, wi.work_unit, wi.reference_id
	from location_inventory li with(nolock), work_instruction wi with(nolock)
	where li.allocated_qty = 0 
	and wi.work_type != 'Cycle Counting'
	and wi.instruction_type = 'Detail'
	and wi.condition != 'Closed' 
	and wi.item = li.item
	and wi.from_loc = li.location
	and wi.from_whs = li.warehouse 
	and wi.from_qty > 0
	and isnull(wi.company, 'Null') = isnull(li.company, 'Null')
	and isnull(wi.lot, 'Null') = isnull(li.lot, 'Null')
	and isnull(wi.logistics_unit, 'Null') = isnull(li.logistics_unit, 'Null')
	group by li.item, li.location, li.warehouse, wi.company, li.lot, li.logistics_unit, wi.work_unit, wi.reference_id
end