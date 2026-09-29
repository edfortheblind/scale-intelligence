-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_LocationsWithAllocatedQtyEqualZeroButWorkExistsDetails
as
begin
	select li.item, li.location, li.warehouse, wi.company, li.lot, li.logistics_unit, sum(li.allocated_qty) as LI_allocqty,
	sum(wi.from_qty) as WI_fromqty, wi.work_unit, wi.reference_id
	from location_inventory li with(nolock), work_instruction wi with(nolock)
	where li.allocated_qty = 0 
	and wi.work_type != '<literal:1>'
	and wi.instruction_type = '<literal:2>'
	and wi.condition != '<literal:3>' 
	and wi.item = li.item
	and wi.from_loc = li.location
	and wi.from_whs = li.warehouse 
	and wi.from_qty > 0
	and isnull(wi.company, '<literal:4>') = isnull(li.company, '<literal:5>')
	and isnull(wi.lot, '<literal:6>') = isnull(li.lot, '<literal:7>')
	and isnull(wi.logistics_unit, '<literal:8>') = isnull(li.logistics_unit, '<literal:9>')
	group by li.item, li.location, li.warehouse, wi.company, li.lot, li.logistics_unit, wi.work_unit, wi.reference_id
end