-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_NoInventoryRecordButWorkExistsForFromLocationDetails
as
begin
	select isnull(from_whs,'<literal:1>') from_whs, isnull(from_loc,'<literal:2>') from_loc, item, isnull(company,'<literal:3>') company, isnull(lot,'<literal:4>') lot, sum(from_qty) sum_from_qty, sum(to_qty) sum_to_qty
	from work_instruction where instruction_type = '<literal:5>' and condition != '<literal:6>' and from_qty > 0
	and internal_instruction_num not in(
	   select wi.internal_instruction_num from work_instruction wi, location_inventory li where li.item = wi.item
	   and isnull(wi.company, '<literal:7>') = isnull(li.company, '<literal:8>') 
	   and isnull(wi.lot, '<literal:9>') = isnull(li.lot, '<literal:10>') 
	   and li.warehouse = wi.from_whs
	   and li.location = wi.from_loc)
	group by item, company, from_whs, from_loc, lot
	order by from_whs, item, company, from_loc
end