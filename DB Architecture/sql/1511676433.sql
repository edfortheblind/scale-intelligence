-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_LocationsWithAllocatedQtyEqualZeroButWorkExistsCount
as
begin
	select count(item), '<literal:1>' from (
	select li.item, li.location, li.warehouse, wi.company, li.lot, li.logistics_unit, sum(li.allocated_qty) as LI_allocqty,
	sum(wi.from_qty) as WI_fromqty, wi.work_unit, wi.reference_id
	from location_inventory li with(nolock), work_instruction wi with(nolock)
	where li.allocated_qty = 0 
	and wi.work_type != '<literal:2>'
	and wi.instruction_type = '<literal:3>'
	and wi.condition != '<literal:4>' 
	and wi.item = li.item
	and wi.from_loc = li.location
	and wi.from_whs = li.warehouse 
	and wi.from_qty > 0
	and isnull(wi.company, '<literal:5>') = isnull(li.company, '<literal:6>')
	and isnull(wi.lot, '<literal:7>') = isnull(li.lot, '<literal:8>')
	and isnull(wi.logistics_unit, '<literal:9>') = isnull(li.logistics_unit, '<literal:10>')
	group by li.item, li.location, li.warehouse, wi.company, li.lot, li.logistics_unit, wi.work_unit, wi.reference_id) SQLSelect
end