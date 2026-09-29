-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_InventoryRecordsWithEmptyOrNullInventoryStatusCount
as
begin
	select count(item), '<literal:1>' 
	from location_inventory with(nolock)
	where (inventory_sts is null and ((permanent = '<literal:2>' and location not in (select location from location with(nolock) where location_class in ('<literal:3>') and location_inventory.warehouse = location.warehouse)) 
									 or (location in (select location from location with(nolock) where location_class in ('<literal:4>') and location_inventory.warehouse = location.warehouse) and (on_hand_qty > 0 or in_transit_qty > 0)) or 
									 (permanent = '<literal:5>' and (on_hand_qty > 0 or in_transit_qty > 0)))) 
		  or inventory_sts not in
			  (select identifier from generic_config_detail with(nolock) where record_type = '<literal:6>')
end