-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_NoInventoryRecordButWorkExistsForFromLocationCount
as
begin
	select count(from_whs), '<literal:1>' from (
	select isnull(from_whs,'<literal:2>') from_whs, isnull(from_loc,'<literal:3>') from_loc, item, isnull(company,'<literal:4>') company, isnull(lot,'<literal:5>') lot, sum(from_qty) sum_from_qty, sum(to_qty) sum_to_qty
	from work_instruction where instruction_type = '<literal:6>' and condition != '<literal:7>' and from_qty > 0
	and internal_instruction_num not in(
	   select wi.internal_instruction_num from work_instruction wi, location_inventory li where li.item = wi.item
	   and isnull(wi.company, '<literal:8>') = isnull(li.company, '<literal:9>') 
	   and isnull(wi.lot, '<literal:10>') = isnull(li.lot, '<literal:11>') 
	   and li.warehouse = wi.from_whs
	   and li.location = wi.from_loc)
	group by item, company, from_whs, from_loc, lot) SQLSelect
end