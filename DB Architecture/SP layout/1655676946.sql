create procedure RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusDetails
as
begin
	select item, location, inventory_sts, on_hand_qty, allocated_qty, in_transit_qty, permanent
	from location_inventory with(nolock)
	where (inventory_sts is null and ((permanent = 'N' and location not in (select location from location with(nolock) where location_class in ('Shipping Dock') and location_inventory.warehouse = location.warehouse)) 
									 or (location in (select location from location with(nolock) where location_class in ('Shipping Dock') and location_inventory.warehouse = location.warehouse) and (on_hand_qty > 0 or in_transit_qty > 0)) or 
									 (permanent = 'Y' and (on_hand_qty > 0 or in_transit_qty > 0)))) 
		  or inventory_sts not in
			  (select identifier from generic_config_detail with(nolock) where record_type = 'INVSTATUS')
	order by location
end