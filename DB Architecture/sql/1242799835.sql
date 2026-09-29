-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure WRK_UpdateRecWorkCreated(
	@SourceKey numeric(9))
as
	update locating_request
	set work_created = N'<literal:1>'
	where internal_loc_req_num = @SourceKey



