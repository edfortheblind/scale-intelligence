-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















-- [comment omitted]


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
		ALLOCATED = N'<literal:1>'
	order by
		from_location;



end -- [comment omitted]



