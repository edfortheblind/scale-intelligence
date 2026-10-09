/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16812		| LJM			| 05/31/05	| created
*/


CREATE procedure WRK_UpdateCCWorkCreated(
	@SourceKey numeric(9))
as
	update cycle_count_request
	set work_created = N'Y'
	where internal_count_num = @SourceKey



