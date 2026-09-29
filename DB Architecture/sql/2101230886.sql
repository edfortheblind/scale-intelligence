-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

















-- [comment omitted]



CREATE PROCEDURE RPT_AllocationPickListDetails(
	@INTERNAL_SHIPMENT_NUM numeric(9),
	@DOCUMENT_TYPE nvarchar(25))

AS
begin
	set nocount on;
	select 
		erp_order_line_num,
		from_loc,
		item,
		requested_qty,
		allocated_qty,
		case
			when (requested_qty - allocated_qty) <= 0
			then 0 
			else (requested_qty - allocated_qty)
		end as back_ordered_quantity,
		quantity_UM,
		item_desc,
		(item_weight * allocated_qty) detail_weight,
		weight_UM,
		item_net_price,
		(item_net_price * allocated_qty) detail_price,
		dbo.RPTfn_GetCommentText(@INTERNAL_SHIPMENT_NUM, internal_shipment_line_num, 
			N'<literal:1>', @DOCUMENT_TYPE) dtl_comments,		
		erp_order,
		item_size,
		item_color,
		item_style,
		lot,
		user_def1 sar_user_def1,
		user_def2 sar_user_def2,
		user_def3 sar_user_def3,
		user_def4 sar_user_def4,
		user_def5 sar_user_def5,
		user_def6 sar_user_def6,
		user_def7 sar_user_def7,
		user_def8 sar_user_def8

	from
		shipment_alloc_request 
	where
		internal_shipment_num = @INTERNAL_SHIPMENT_NUM
	order by
		from_loc,
		item 	

end -- [comment omitted]






