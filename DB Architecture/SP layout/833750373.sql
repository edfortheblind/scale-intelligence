/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16139	| MB	| 04/11/05	| Created.

	Returns a rowset used for WOAssemblyInstructions.rpt.
	
	Parameters:
		internalWorkOrderNum	The Internal Work Order Number.

	Returns:
		Rowset with a row from work_order_header corresponding to that internalWorkOrderNum.

*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_WOAssmblyInstrsHeader(
	@INTERNAL_WORK_ORDER_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		WOH.Warehouse,
		WOH.Work_Order_Id,
		WOH.ITEM,
		WOH.ITEM_DESC,
		WOH.QTY_TO_BE_BUILT,
		WOH.QTY_UM,
		WOH.DUE_DATE,
		WOH.BUILD_INSTRUCTIONS,
		WOH.USER_DEF1 WOHDEF1,
		WOH.USER_DEF2 WOHDEF2,
		WOH.USER_DEF3 WOHDEF3,
		WOH.USER_DEF4 WOHDEF4,
		WOH.USER_DEF5 WOHDEF5,
		WOH.USER_DEF6 WOHDEF6,
		WOH.USER_DEF7 WOHDEF7,
		WOH.USER_DEF8 WOHDEF8
	from
		work_order_header WOH
	where
		WOH.internal_work_order_num = @INTERNAL_WORK_ORDER_NUM;




end -- RPT_WOAssmblyInstrsHeader



