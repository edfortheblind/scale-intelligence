-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure WRK_UpdateWoDtlWorkCreated(
	@SourceKey numeric(9))
as
	update work_order_detail
	set work_created = N'<literal:1>'
	where internal_wrk_ord_line_num = @SourceKey



