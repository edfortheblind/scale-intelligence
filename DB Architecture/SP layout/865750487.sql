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


CREATE PROCEDURE RPT_WOComponentPickListHeader(
	@INTERNAL_WORK_ORDER_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		WAREHOUSE,
		WORK_ORDER_ID,
		ITEM,
		ITEM_DESC,
		QTY_TO_BE_BUILT,
		QTY_UM,
		BUILD_LOCATION,
		USER_DEF1 HDRDEF1,
		USER_DEF2 HDRDEF2,
		USER_DEF3 HDRDEF3,	
		USER_DEF4 HDRDEF4,
		USER_DEF5 HDRDEF5,
		USER_DEF6 HDRDEF6,
		USER_DEF7 HDRDEF7,
		USER_DEF8 HDRDEF8
		
	from
		work_order_header
	where
		internal_work_order_num = @INTERNAL_WORK_ORDER_NUM;





end -- RPT_WOComponentPickListHeader



