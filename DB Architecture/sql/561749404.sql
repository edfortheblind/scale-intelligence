-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */


















CREATE PROCEDURE RPT_ShipContListTotals(
	@INTERNAL_LOAD_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		sum(shv.total_containers) serviceIndex,
		shv.carrier,
		shv.carrier_service,
		sum(shv.total_freight_charge) carrServTotal,
		sum(shv.total_weight) carrWeight
	from
		shipment_header_view shv
	where
		shv.shipping_load_num = @INTERNAL_LOAD_NUM
	group by
		shv.carrier,
		shv.carrier_service
	order by
		shv.carrier_service;



end -- [comment omitted]




