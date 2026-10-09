create procedure RPT_CSO_LocationsWithNonbaseUMDetails
as
begin
	select li.item, li.location, li.quantity_um as LocationInventoryUM, ium.quantity_um as ItemUnitOfMeasureUM 
	from location_inventory li with(nolock), item_unit_of_measure ium with(nolock)   
	where li.item = ium.item and ium.sequence = 1 and li.quantity_um <> ium.quantity_um
end