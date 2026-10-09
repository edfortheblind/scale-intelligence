create procedure RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusCount
as
begin
	select count(item), 'Inventory Records with Empty or Null Inventory Status' 
	from location_inventory with(nolock)
	where (inventory_sts is null and ((permanent = 'N' and location not in (select location from location with(nolock) where location_class in ('Shipping Dock') and location_inventory.warehouse = location.warehouse)) 
									 or (location in (select location from location with(nolock) where location_class in ('Shipping Dock') and location_inventory.warehouse = location.warehouse) and (on_hand_qty > 0 or in_transit_qty > 0)) or 
									 (permanent = 'Y' and (on_hand_qty > 0 or in_transit_qty > 0)))) 
		  or inventory_sts not in
			  (select identifier from generic_config_detail with(nolock) where record_type = 'INVSTATUS')
end