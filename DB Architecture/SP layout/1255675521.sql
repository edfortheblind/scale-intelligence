create procedure RPT_CSO_ShipDockOnHandandAllocatedQtyNotEqualShippingQtyCount
as
begin
	select count(li.location), 'Ship Dock On Hand and Allocated Qty <> Shipping Qty' 
	from location_inventory li with(nolock) left outer join 
	(select sum(quantity) SQTY, item, company, to_loc, to_whs, lot, logistics_unit from work_instruction_view with(nolock)
	where instruction_type = 'Detail' and internal_num_type = 'Shipment'
	and condition = 'Closed' and internal_num in 
	(select internal_shipment_num from shipment_header with(nolock) where leading_sts < 900)
	group by item, to_whs, company, to_loc, lot, logistics_unit)TOT
	on li.item = tot.item and isNull(li.company, 'Null') = isNull(tot.company, 'Null')
	and li.warehouse = tot.to_whs and li.location = tot.to_loc and isnull(li.lot, 'Null') = isnull(tot.lot, 'Null') 
	and isnull(li.logistics_unit, 'Null') = isnull(tot.logistics_unit, 'Null')
	where li.on_hand_qty <> tot.sqty
	and li.location in (select location from location with(nolock) where location_class in ('Shipping Dock') and li.warehouse = tot.to_whs)
end