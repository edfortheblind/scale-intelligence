-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure WRK_UpdateReplenWorkCreated(
	@SourceKey numeric(9))
as
	update replenishment_request
	set work_created = N'<literal:1>'
	where internal_rpln_req_num = @SourceKey



