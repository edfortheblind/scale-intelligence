-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */
















-- [comment omitted]


CREATE PROCEDURE RPT_OrderPickListDetails(
	@PARENT_INSTR numeric(9),
	@DOCUMENT_TYPE nvarchar(25))

AS
begin
	set nocount on;
	select 
		wi.from_loc,
		wi.item,
		wi.item_desc,
		wi.converted_qty,
		wi.converted_qty_um,
		wi.quantity,
		wi.quantity_um,
		wi.erp_order,
		wi.erp_order_line_num,
		wi.reference_id,
		wi.incoming_pd_loc,
		wi.outgoing_pd_loc,
		wi.lot,
		dbo.RPTfn_GetCommentText(wi.internal_num, wi.internal_line_num, N'<literal:1>', @DOCUMENT_TYPE) dtl_comments,
		sd.customer_po,		
		sd.item_size,
		sd.item_color,
		sd.item_style,
		sd.user_def1,
		sd.user_def2,
		sd.user_def3,
		sd.user_def4,
		sd.user_def5,
		sd.user_def6,
		sd.user_def7,
		sd.user_def8

	from
		work_instruction_view wi inner join
		shipment_detail sd
		on     wi.INTERNAL_LINE_NUM = sd.INTERNAL_SHIPMENT_LINE_NUM
	where
		instruction_type = N'<literal:2>'
	and     
		parent_instr = @PARENT_INSTR

	order by
		wi.sequence,
		wi.from_loc,
		wi.item 
end -- [comment omitted]


