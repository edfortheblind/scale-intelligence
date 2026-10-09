create procedure RPT_CSO_LocationsWithNegativeInventoryValueCount
as
begin
	select count(location), 'Locations with a Negative Inventory Value' 
	from location_inventory with(nolock)
	where on_hand_qty < 0
	or allocated_qty < 0
	or in_transit_qty < 0
	or suspense_qty < 0
end