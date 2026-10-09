/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16132	| MB	| 05/19/05	| Created.
	5110    | AK    | 06/13/07  | Modified to use Shipment Header View.

	Returns a rowset used for Subreport - Totals in ShippingContainerList.rpt.
	
	Parameters:
		internalLoadNum	The internal Load number.


	Returns:
		Rowset with a row for each internalLoadNum and summary information for
		the subreport - Totals corresponding to that internalLoadNum.

*/


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



end -- RPT_ShipContListTotals




