-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
create procedure RPT_CSO_NoInventoryRecordButWorkExistsForToLocationCount
as
begin
	select count(to_whs), '<literal:1>' from (
	select work_type, isnull(to_whs,'<literal:2>') to_whs, isnull(to_loc,'<literal:3>') to_loc, item, isnull(company,'<literal:4>') company, isnull(lot,'<literal:5>') lot, sum(from_qty) sum_from_qty, sum(to_qty) sum_to_qty
	from work_instruction where instruction_type = '<literal:6>'
	and work_type != '<literal:7>' 
	and to_qty + from_qty > 0
	and internal_instruction_num not in(
	   select wi.internal_instruction_num from work_instruction wi, location_inventory li where li.item = wi.item
	   and isnull(wi.company, '<literal:8>') = isnull(li.company, '<literal:9>') 
	   and isnull(wi.lot, '<literal:10>') = isnull(li.lot, '<literal:11>') 
	   and li.warehouse = wi.to_whs
	   and li.location = wi.to_loc)
	group by work_type, item, company, to_whs, to_loc, lot) SQLSelect
end