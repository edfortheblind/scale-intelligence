create procedure RPT_CSO_NoInventoryRecordButWorkExistsForFromLocationDetails
as
begin
	select isnull(from_whs,'Null') from_whs, isnull(from_loc,'Null') from_loc, item, isnull(company,'Null') company, isnull(lot,'Null') lot, sum(from_qty) sum_from_qty, sum(to_qty) sum_to_qty
	from work_instruction where instruction_type = 'Detail' and condition != 'Closed' and from_qty > 0
	and internal_instruction_num not in(
	   select wi.internal_instruction_num from work_instruction wi, location_inventory li where li.item = wi.item
	   and isnull(wi.company, '!') = isnull(li.company, '!') 
	   and isnull(wi.lot, '!') = isnull(li.lot, '!') 
	   and li.warehouse = wi.from_whs
	   and li.location = wi.from_loc)
	group by item, company, from_whs, from_loc, lot
	order by from_whs, item, company, from_loc
end