-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure WRK_UpdateInventoryWorkCreated(
	@SourceKey numeric(9))
as
	update inv_mgmt_work_data
	set work_created = N'<literal:1>'
	where internal_inv_mgt_req_num = @SourceKey



