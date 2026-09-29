-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure WRK_UpdateAllocWorkCreated(
	@SourceKey numeric(9))
as
	update shipment_alloc_request
	set work_created = N'<literal:1>'
	where internal_ship_alloc_num = @SourceKey



