-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_LocationsWhereAllocatedQtyNotEqualWorkQtyCount
as
begin
	select count(item), '<literal:1>' from (
	select li.item, li.location, li.warehouse, li.company, li.lot, li.logistics_unit, sum(li.allocated_qty) as ALLOC, sum(wi.from_qty) as WKINS
	from (select item, warehouse, company, location, lot, logistics_unit, sum(allocated_qty) allocated_qty 
	from location_Inventory with(nolock)
	group by item, warehouse, company, location, lot, logistics_unit) li	
	left outer join 
	(select item, company, from_loc, lot, logistics_unit, sum(from_qty) from_qty, to_whs 
	from work_instruction with(nolock)
	where condition <> '<literal:2>' and instruction_type = '<literal:3>' 
	group by item, to_whs, company, from_loc, lot, logistics_unit) wi 
	on li.item = wi.item and isnull(li.company, '<literal:4>') = isnull(wi.company, '<literal:5>') and li.location = wi.from_loc and isnull(li.lot, '<literal:6>') = isnull(wi.lot, '<literal:7>') and isnull(li.logistics_unit, '<literal:8>') = isnull(wi.logistics_unit, '<literal:9>')
	where li.location not like '<literal:10>'
	and isnull(li.warehouse, '<literal:11>') = isnull(wi.to_whs, '<literal:12>') 
	group by li.item, li.warehouse, li.company, li.location, li.lot, li.logistics_unit
	having sum(ISNULL(li.allocated_qty,0)) <> sum(ISNULL(wi.from_qty,0)) and 
	li.location not in (select location from location with(nolock) where location_class in ('<literal:13>', '<literal:14>', '<literal:15>') and li.warehouse = location.warehouse)
	) SQLSelect
end