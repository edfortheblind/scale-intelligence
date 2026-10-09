/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	57769	| SP	| 09/07/09	| Created.
	
	Returns a rowset used for detail subreport section of VasActivityList.rpt
	
	Parameters:
		INTERNAL_SHIPMENT_NUM	The internal shipment number.
	
	Returns:
		Rowset with a row for each Shipping_Cont_Vas_Activity linked to the given INTERNAL_SHIPMENT_NUM
*/

CREATE PROCEDURE RPT_ShipContVasActivityList(
	@INTERNAL_SHIPMENT_NUM numeric(9))
AS
begin
	set nocount on;
	select 	
		cont.INTERNAL_CONTAINER_NUM internal_container_num,
		cont.CONTAINER_ID container_id,
		vas.NAME vas_activity,
		scv.INSTRUCTIONS instructions,
		scv.USER_STAMP user_stamp,
		scv.DATE_TIME_STAMP date_time_stamp,
		scv.COMPLETED completed,
		scv.user_def1 user_def1,
		scv.user_def2 user_def2,
		scv.user_def3 user_def3,
		scv.user_def4 user_def4,
		scv.user_def5 user_def5,
		scv.user_def6 user_def6,
		scv.user_def7 user_def7,
		scv.user_def8 user_def8
	from
		SHIPPING_CONT_VAS_ACTIVITY scv
		inner join VAS_ACTIVITY vas on scv.VAS_ACTIVITY_ID=vas.OBJECT_ID
		inner join SHIPPING_CONTAINER cont on scv.INTERNAL_CONTAINER_NUM=cont.INTERNAL_CONTAINER_NUM
			and cont.INTERNAL_SHIPMENT_NUM = @INTERNAL_SHIPMENT_NUM
			and cont.CONTAINER_TYPE <> N'-'
	
end -- RPT_ShipContVasActivityList

