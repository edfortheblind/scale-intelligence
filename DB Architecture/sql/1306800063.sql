-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure WRK_UpdateWoPutawayWorkCreated(
	@SourceKey numeric(9))
as
	update work_order_putaway_unit
	set work_created = N'<literal:1>'
	where internal_putaway_num = @SourceKey



