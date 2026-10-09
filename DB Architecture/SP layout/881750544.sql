/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16140	| MB	| 04/21/05	| Created.

	Returns a rowset used for WOPutawayList.rpt.
	
	Parameters:
		internalPutawayNum	The internal Putaway number.


	Returns:
		Rowset with a row for each internalPutawayNum and summary information for
		the WorkOrder PutawayList corresponding to that internalPutawayNum.

*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_WOPutawayList(
	@INTERNAL_PUTAWAY_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		PUT.PUTAWAY_UNIT_ID,
		PUT.LOCATION,
		PUT.QUANTITY,
		PUT.QUANTITY_UM,
		HDR.WAREHOUSE,
		HDR.ITEM,
		HDR.ITEM_DESC,
		HDR.WORK_ORDER_ID,
		HDR.BUILD_LOCATION,
		PUT.USER_DEF1 PUTDEF1,
		PUT.USER_DEF2 PUTDEF2,
		PUT.USER_DEF3 PUTDEF3,
		PUT.USER_DEF4 PUTDEF4,
		PUT.USER_DEF5 PUTDEF5,
		PUT.USER_DEF6 PUTDEF6,
		PUT.USER_DEF7 PUTDEF7,
		PUT.USER_DEF8 PUTDEF8,
		HDR.USER_DEF1 HDRDEF1,
		HDR.USER_DEF2 HDRDEF2,
		HDR.USER_DEF3 HDRDEF3,
		HDR.USER_DEF4 HDRDEF4,
		HDR.USER_DEF5 HDRDEF5,
		HDR.USER_DEF6 HDRDEF6,
		HDR.USER_DEF7 HDRDEF7,
		HDR.USER_DEF8 HDRDEF8
		
		
	from
		work_order_putaway_unit put,
		work_order_header hdr
	where
		put.internal_putaway_num = @INTERNAL_PUTAWAY_NUM
		and
		put.internal_work_order_num = hdr.internal_work_order_num;



end -- RPT_WOPutawayList



