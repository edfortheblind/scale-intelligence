-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













-- [comment omitted]


CREATE PROCEDURE RPT_WOAssmblyInstrsDetails(
	@INTERNAL_WORK_ORDER_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		WOD.BUILD_LEVEL,
		WOD.BUILD_SEQUENCE,
		WOD.ITEM,
		WOD.ITEM_DESC,
		WOD.Qty_Needed_Per_Item,
		WOD.Converted_Um,
		WOD.Total_Converted_Qty_Needed,
		WOD.USER_DEF1 WODDEF1,
		WOD.USER_DEF2 WODDEF2,
		WOD.USER_DEF3 WODDEF3,
		WOD.USER_DEF4 WODDEF4,
		WOD.USER_DEF5 WODDEF5,
		WOD.USER_DEF6 WODDEF6,
		WOD.USER_DEF7 WODDEF7,
		WOD.USER_DEF8 WODDEF8

	from
		work_order_detail WOD
	where
		internal_work_order_num = @INTERNAL_WORK_ORDER_NUM
	order by
		build_level,
		build_sequence;





end -- [comment omitted]



