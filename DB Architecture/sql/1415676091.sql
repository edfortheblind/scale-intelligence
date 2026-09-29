-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_LocationsWithNegativeInventoryValueCount
as
begin
	select count(location), '<literal:1>' 
	from location_inventory with(nolock)
	where on_hand_qty < 0
	or allocated_qty < 0
	or in_transit_qty < 0
	or suspense_qty < 0
end