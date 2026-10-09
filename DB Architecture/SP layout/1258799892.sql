/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16812		| LJM			| 05/31/05	| created
*/


CREATE procedure WRK_UpdateReplenWorkCreated(
	@SourceKey numeric(9))
as
	update replenishment_request
	set work_created = N'Y'
	where internal_rpln_req_num = @SourceKey



