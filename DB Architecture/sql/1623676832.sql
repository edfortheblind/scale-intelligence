-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_ItemsWhereAllocatedQtyNotEqualInTransitQtyDetails
as
begin
	select li.item, li.warehouse, li.company, 
	sum(case when l.location_class not in ('<literal:1>', '<literal:2>', '<literal:3>') then ISNULL(li.allocated_qty,0) else 0 end) as ALLOC, 
		  sum(li.in_transit_qty) as TRANSIT
	  from location_Inventory li with(nolock)
	  join location l on li.warehouse = l.warehouse and li.location = l.location
	 group by item, li.warehouse, company
	having 
	sum(case when l.location_class not in ('<literal:4>', '<literal:5>', '<literal:6>') then ISNULL(li.allocated_qty,0) else 0 end) 
	<> sum(ISNULL(li.in_transit_qty,0))
end