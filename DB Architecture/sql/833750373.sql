-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */













-- [comment omitted]


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




end -- [comment omitted]



