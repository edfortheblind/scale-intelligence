/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16812		| LJM			| 05/31/05	| created
*/


CREATE procedure WRK_UpdateRecWorkCreated(
	@SourceKey numeric(9))
as
	update locating_request
	set work_created = N'Y'
	where internal_loc_req_num = @SourceKey



