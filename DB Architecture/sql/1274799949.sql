-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE procedure WRK_UpdateShipContWorkCreated(
	@SourceKey numeric(9))
as
	update shipping_container
	set work_created = N'<literal:1>'
	where internal_container_num = @SourceKey;
	
	update shipment_alloc_request
	set work_created = N'<literal:2>'
	where internal_ship_alloc_num in (
	select internal_ship_alloc_num from shipping_container
	where internal_container_num = @SourceKey);




