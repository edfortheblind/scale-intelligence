/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16812		| LJM			| 05/31/05	| created
*/


CREATE procedure WRK_UpdateAllocWorkCreated(
	@SourceKey numeric(9))
as
	update shipment_alloc_request
	set work_created = N'Y'
	where internal_ship_alloc_num = @SourceKey



