create procedure RPT_CSO_NoInventoryRecordButWorkExistsForToLocationCount
as
begin
	select count(to_whs), 'No inventory record but work exists for To location' from (
	select work_type, isnull(to_whs,'Null') to_whs, isnull(to_loc,'Null') to_loc, item, isnull(company,'Null') company, isnull(lot,'Null') lot, sum(from_qty) sum_from_qty, sum(to_qty) sum_to_qty
	from work_instruction where instruction_type = 'Detail'
	and work_type != 'Cycle Counting' 
	and to_qty + from_qty > 0
	and internal_instruction_num not in(
	   select wi.internal_instruction_num from work_instruction wi, location_inventory li where li.item = wi.item
	   and isnull(wi.company, '!') = isnull(li.company, '!') 
	   and isnull(wi.lot, '!') = isnull(li.lot, '!') 
	   and li.warehouse = wi.to_whs
	   and li.location = wi.to_loc)
	group by work_type, item, company, to_whs, to_loc, lot) SQLSelect
end