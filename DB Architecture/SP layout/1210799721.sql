/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	18856		| RLG			| 04/03/06	| created
*/


CREATE procedure WRK_UpdateInventoryWorkCreated(
	@SourceKey numeric(9))
as
	update inv_mgmt_work_data
	set work_created = N'Y'
	where internal_inv_mgt_req_num = @SourceKey



