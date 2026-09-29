-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

















-- [comment omitted]

CREATE PROCEDURE RPT_CycleCountListDetails(
	@INTERNAL_PLAN_NUM numeric(9),
	@GROUP_NUMBER numeric(9))

AS
begin
	set nocount on;
	select 
		ccr.location,
		ccr.item,
		ccr.item_desc,
		ccr.company,
		ccr.lot,
		li.on_hand_qty,
		li.quantity_um,
		ccr.USER_DEF1 DTL_USER_DEF1,
		ccr.USER_DEF2 DTL_USER_DEF2,
		ccr.USER_DEF3 DTL_USER_DEF3,
		ccr.USER_DEF4 DTL_USER_DEF4,
		ccr.USER_DEF5 DTL_USER_DEF5,
		ccr.USER_DEF6 DTL_USER_DEF6,
		isnull(ccr.USER_DEF7,0) DTL_USER_DEF7,
		isnull(ccr.USER_DEF8,0) DTL_USER_DEF8,
		ccr.internal_plan_num as ccPlan,
		case 
			when @GROUP_NUMBER > 0 
			then @GROUP_NUMBER
			else ccr.GROUP_NUMBER
		end groupNum

	from
		CYCLE_COUNT_REQUEST ccr
		left outer join location_inventory li
	on
		ccr.location = li.location
		and
		ccr.warehouse = li.warehouse
		and
		ccr.item = li.item
		and
		isnull(ccr.company, N'<literal:1>') = isnull(li.company, N'<literal:2>')
		and
		isnull(ccr.lot, N'<literal:3>') = isnull(li.lot, N'<literal:4>')
		and
		isnull(ccr.logistics_unit, N'<literal:5>') = isnull(li.logistics_unit, N'<literal:6>')
	where
		ccr.internal_plan_num = @INTERNAL_PLAN_NUM
		and
		ccr.condition = N'<literal:7>'
		and 

		-- [comment omitted]
		ccr.GROUP_NUMBER = 
		case 
			when @GROUP_NUMBER > 0 
			then @GROUP_NUMBER
			else ccr.GROUP_NUMBER
		end
	order by
			ccr.location,
			ccr.item,
			ccr.company,
			ccr.lot;

end -- [comment omitted]
