-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_LocationsWithNegativeInventoryValueDetails
as
begin
	select location, item, isnull(company, '<literal:1>'), on_hand_qty, allocated_qty, in_transit_qty, suspense_qty	
	from location_inventory with(nolock)
	where on_hand_qty < 0
	or allocated_qty < 0
	or in_transit_qty < 0
	or suspense_qty < 0
	order by location, item
end