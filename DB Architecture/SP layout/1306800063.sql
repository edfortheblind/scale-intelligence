/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16812		| LJM			| 05/31/05	| created
*/


CREATE procedure WRK_UpdateWoPutawayWorkCreated(
	@SourceKey numeric(9))
as
	update work_order_putaway_unit
	set work_created = N'Y'
	where internal_putaway_num = @SourceKey



