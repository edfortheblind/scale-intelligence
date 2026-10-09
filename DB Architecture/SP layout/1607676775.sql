create procedure RPT_CSO_LocationsWhereAllocatedQtyNotEqualWorkQtyCount
as
begin
	select count(item), 'Locations where Allocated Qty <> Work Qty' from (
	select li.item, li.location, li.warehouse, li.company, li.lot, li.logistics_unit, sum(li.allocated_qty) as ALLOC, sum(wi.from_qty) as WKINS
	from (select item, warehouse, company, location, lot, logistics_unit, sum(allocated_qty) allocated_qty 
	from location_Inventory with(nolock)
	group by item, warehouse, company, location, lot, logistics_unit) li	
	left outer join 
	(select item, company, from_loc, lot, logistics_unit, sum(from_qty) from_qty, to_whs 
	from work_instruction with(nolock)
	where condition <> 'Closed' and instruction_type = 'Detail' 
	group by item, to_whs, company, from_loc, lot, logistics_unit) wi 
	on li.item = wi.item and isnull(li.company, 'Null') = isnull(wi.company, 'Null') and li.location = wi.from_loc and isnull(li.lot, 'Null') = isnull(wi.lot, 'Null') and isnull(li.logistics_unit, 'Null') = isnull(wi.logistics_unit, 'Null')
	where li.location not like '-%'
	and isnull(li.warehouse, 'NULL') = isnull(wi.to_whs, 'NULL') 
	group by li.item, li.warehouse, li.company, li.location, li.lot, li.logistics_unit
	having sum(ISNULL(li.allocated_qty,0)) <> sum(ISNULL(wi.from_qty,0)) and 
	li.location not in (select location from location with(nolock) where location_class in ('Shipping Dock', 'P&D', 'Work Order Build') and li.warehouse = location.warehouse)
	) SQLSelect
end