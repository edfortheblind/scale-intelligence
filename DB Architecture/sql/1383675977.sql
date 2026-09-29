-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_LocationsWithNonbaseUMCount
as
begin
	select count(li.item), '<literal:1>'
	from location_inventory li with(nolock), item_unit_of_measure ium with(nolock)   
	where li.item = ium.item and ium.sequence = 1 and li.quantity_um <> ium.quantity_um
end