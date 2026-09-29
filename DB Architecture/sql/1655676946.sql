-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusDetails
as
begin
	select item, location, inventory_sts, on_hand_qty, allocated_qty, in_transit_qty, permanent
	from location_inventory with(nolock)
	where (inventory_sts is null and ((permanent = '<literal:1>' and location not in (select location from location with(nolock) where location_class in ('<literal:2>') and location_inventory.warehouse = location.warehouse)) 
									 or (location in (select location from location with(nolock) where location_class in ('<literal:3>') and location_inventory.warehouse = location.warehouse) and (on_hand_qty > 0 or in_transit_qty > 0)) or 
									 (permanent = '<literal:4>' and (on_hand_qty > 0 or in_transit_qty > 0)))) 
		  or inventory_sts not in
			  (select identifier from generic_config_detail with(nolock) where record_type = '<literal:5>')
	order by location
end