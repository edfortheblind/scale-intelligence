/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16140	| MB	| 04/21/05	| Created.

	Returns a rowset used for WOComponentPickList.rpt.
	
	Parameters:
		internalWorkOrderNum	The internal Work Order number.


	Returns:
		Rowset with a row for each internalWorkOrderNum and summary information for
		the Component PickList corresponding to that internalWorkOrderNum.

*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_WOComponentPickListDetails(
	@INTERNAL_WORK_ORDER_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		FROM_LOCATION,
		ITEM,
		ITEM_DESC,
		TOTAL_CONVERTED_QTY_NEEDED,
		CONVERTED_UM,
		USER_DEF1 DTLDEF1,
		USER_DEF2 DTLDEF2,
		USER_DEF3 DTLDEF3,
		USER_DEF4 DTLDEF4,
		USER_DEF5 DTLDEF5,
		USER_DEF6 DTLDEF6,
		USER_DEF7 DTLDEF7,
		USER_DEF8 DTLDEF8
	from
		work_order_detail
	where
		internal_work_order_num = @INTERNAL_WORK_ORDER_NUM
		and
		ALLOCATED = N'Y'
	order by
		from_location;



end -- RPT_WOComponentPickListDetails



