/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16812		| LJM			| 05/31/05	| created
	18150		| VK			| 11/30/05	| update shipment_alloc_Requests work created flag */


CREATE procedure WRK_UpdateShipContWorkCreated(
	@SourceKey numeric(9))
as
	update shipping_container
	set work_created = N'Y'
	where internal_container_num = @SourceKey;
	
	update shipment_alloc_request
	set work_created = N'Y'
	where internal_ship_alloc_num in (
	select internal_ship_alloc_num from shipping_container
	where internal_container_num = @SourceKey);




