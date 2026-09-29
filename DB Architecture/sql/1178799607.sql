-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure WRK_UpdateCCWorkCreated(
	@SourceKey numeric(9))
as
	update cycle_count_request
	set work_created = N'<literal:1>'
	where internal_count_num = @SourceKey



