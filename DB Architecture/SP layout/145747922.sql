/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16128	| MB	| 05/31/05	| Created.
	46818	| NB	| 07/05/10	| Modified to mask null value for numeric fields. 
								| As Crystal Report was not able to dispaly it .
	84245	| NB	| 05/27/11	| Modified the join condition							

	Returns a rowset used for CycleCountList.rpt.
	
	Parameters:
		internalPlanNumber  The internal plan number.

	Returns:
		Rowset with a row for each internal plan number and summary information for
		that internal plan number.

*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;

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
		isnull(ccr.company, N'!') = isnull(li.company, N'!')
		and
		isnull(ccr.lot, N'!') = isnull(li.lot, N'!')
		and
		isnull(ccr.logistics_unit, N'!') = isnull(li.logistics_unit, N'!')
	where
		ccr.internal_plan_num = @INTERNAL_PLAN_NUM
		and
		ccr.condition = N'Open'
		and 

		-- when group number is 0, return all requests for this plan.
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

end -- RPT_CycleCountListDetails
