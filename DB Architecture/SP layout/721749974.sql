/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	16135	| SWB	| 04/14/05	| Created.
	63387	| DSK	| 01/19/10	| Modified to filter the BOM component items

	Returns a rowset used for the details of ShipPackListWComps.rpt.
	
	Parameters:
		INTERNAL_SHIPMENT_NUM	The internal shipment number.
		DOCUMENT_TYPE	        The document type which will get printed.


	Returns:
		Rowset with rows for each internal shipment number and summary information for
		the shipment corresponding to that internal shipment number.

*/

-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;

CREATE PROCEDURE RPT_ShipPackListWCompsDetails(
	@INTERNAL_SHIPMENT_NUM numeric(9),
	@DOCUMENT_TYPE nvarchar(25))

AS
begin
	set nocount on;
	select 
		internal_shipment_line_num,		
		erp_order_line_num,
		item,
		requested_qty,
		total_qty,
		case
			when (requested_qty - total_qty) <= 0
			then 0 
			else (requested_qty - total_qty)
		end as back_ordered_quantity,
		quantity_UM,
		item_desc,
		(item_weight * total_qty) detail_weight,
		weight_UM,
		item_net_price,
		(item_net_price * total_qty) detail_price,
		dbo.RPTfn_GetCommentText(@INTERNAL_SHIPMENT_NUM, internal_shipment_line_num, 
			N'SHIPMENT', @DOCUMENT_TYPE) dtl_comments,		
		erp_order,
		item_size,
		item_color,
		item_style,
		lot,
		user_def1 sd_user_def1,
		user_def2 sd_user_def2,
		user_def3 sd_user_def3,
		user_def4 sd_user_def4,
		user_def5 sd_user_def5,
		user_def6 sd_user_def6,
		user_def7 sd_user_def7,
		user_def8 sd_user_def8
	from
		shipment_detail 
	where
		internal_shipment_num = @INTERNAL_SHIPMENT_NUM
		and (related_internal_line_num in 
						(select internal_shipment_line_num 
						from shipment_detail
						where related_internal_line_num = 0 
						and internal_shipment_num = @INTERNAL_SHIPMENT_NUM  )
			  or related_internal_line_num = 0)
	order by
		pick_loc,
		item 	

end -- RPT_ShipPackListWCompsDetails

