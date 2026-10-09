/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16812		| LJM			| 05/31/05	| created
*/


CREATE procedure WRK_UpdateWoDtlWorkCreated(
	@SourceKey numeric(9))
as
	update work_order_detail
	set work_created = N'Y'
	where internal_wrk_ord_line_num = @SourceKey



