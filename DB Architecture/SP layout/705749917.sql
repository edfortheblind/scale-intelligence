/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE RPT_ShipPackListWCompsCompsForSSRS(
	@INTERNAL_SHIPMENT_LINE_NUM numeric(9))

AS
begin
	set nocount on;

	-- Use associated WorkOrderDetail components.
	select
		sd.internal_shipment_line_num,
		wod.item wod_item,
		wod.company wod_company,
		case 
			when (wod.orig_total_qty_needed) > 0
			then (wod.qty_needed_per_item * sd.total_qty)
			else 0
		end wod_comp_qty,
		wod.quantity_um wod_quantity_um,
		wod.item_desc wod_item_desc			
	from
		shipment_detail sd

		inner join work_order_detail wod
		on
			wod.internal_work_order_num = sd.internal_work_order_num

	where
		sd.internal_shipment_line_num = @INTERNAL_SHIPMENT_LINE_NUM
		and
		sd.internal_work_order_num > 0

	union all

	-- Use BillOfMaterials for details without corresponding WorkOrders.
	select
		sd.internal_shipment_line_num,
		bomd.item wod_item,
		bomd.company wod_company,
		bomd.qty_needed_per_item * sd.total_qty wod_comp_qty,
		bomd.quantity_um wod_quantity_um,
		bomd.item_desc wod_item_desc			
	from
		shipment_detail sd

		inner join bill_of_materials_header bomh
		on
			bomh.item = sd.item
			and
			isnull(bomh.company, N'!') = isnull(sd.company, N'!')
			and 
			bomh.revision_num = (select max(bom.revision_num) 
					from bill_of_materials_header bom
					where bom.item = sd.item
						and isnull(bom.company, N'!') = isnull(sd.company, N'!'))
						
		inner join bill_of_materials_detail bomd
		on
			bomh.internal_bom_header_num = bomd.internal_bom_header_num

	where
		sd.internal_shipment_line_num = @INTERNAL_SHIPMENT_LINE_NUM
		and
		isnull(sd.internal_work_order_num,0) <= 0

end -- RPT_ShipPackListWCompsComps