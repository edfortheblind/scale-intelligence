/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16131	| MB	| 05/09/05	| Created.

	Returns a rowset used for the header of ReplenishmentPickList.rpt.
	
	Parameters:
		Replenishment_master 	The replenishment master type.
		Launch_Number	 	The Launch number to be used.


	Returns:
		1 Rowset with a row of summary information for
		the ReplenishmentMaster corresponding to that Launch Number.

*/
-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE RPT_ReplenPickListDetails(
	@REPLENISHMENT_MASTER nvarchar(25),
	@LAUNCH_NUM numeric(9))

AS
begin
	set nocount on;
	select 
		rr.from_loc,
		rr.to_loc,
		rr.item,
		rr.item_desc,
		rr.item_color,
		rr.item_size,
		rr.item_style,
		rr.lot,
		sum(rr.converted_alloc_qty) qty,
		rr.converted_qty_um qtyUm,
		sum(rr.allocated_qty) baseQty,
		rr.quantity_um baseQtyUm,
		rr.incoming_pd_loc,
		rr.outgoing_pd_loc,
		rr.user_def1,
		rr.user_def2,
		rr.user_def3,
		rr.user_def4,
		rr.user_def5,
		rr.user_def6,
		rr.user_def7,
		rr.user_def8
	from
		replenishment_request rr
	where
		rr.launch_num = @LAUNCH_NUM
		and 
		rr.replenishment_master = @REPLENISHMENT_MASTER
		and
		rr.work_created = N'I' -- work not created.
	group by
		rr.from_loc,
		rr.to_loc,
		rr.item,
		rr.item_desc,
		rr.item_color,
		rr.item_size,
		rr.item_style,
		rr.lot,
		rr.converted_qty_um,
		rr.quantity_um,
		rr.incoming_pd_loc,
		rr.outgoing_pd_loc,
		rr.user_def1,
		rr.user_def2,
		rr.user_def3,
		rr.user_def4,
		rr.user_def5,
		rr.user_def6,
		rr.user_def7,
		rr.user_def8
	order by
		rr.from_loc;



end -- RPT_ReplenPickListDetails



