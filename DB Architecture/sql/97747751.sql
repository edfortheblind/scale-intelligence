-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

















-- [comment omitted]



CREATE PROCEDURE RPT_ContPackListWSernsDetails(
	@INTERNAL_CONTAINER_NUM numeric(9),
	@DOCUMENT_TYPE nvarchar(25))

AS
begin
	set nocount on;
	select 
		sc.container_type contType,
		sc.container_id contId,
		sc.item,
		sd.item_desc itemDesc,
		sd.item_size itemSize,
		sd.item_color itemColor,
		sd.item_style itemStyle,
		sc.lot,	
		sc.quantity qty,
		sc.quantity_UM qtyUM,
		sc.weight,
		sc.weight_UM weightUM,
		sc.user_def1 scd_user_def1,
		sc.user_def2 scd_user_def2,
		sc.user_def3 scd_user_def3,
		sc.user_def4 scd_user_def4,
		sc.user_def5 scd_user_def5,
		sc.user_def6 scd_user_def6,
		sc.user_def7 scd_user_def7,
		sc.user_def8 scd_user_def8,
		sd.customer_item custItem,
		sc.internal_container_num,
		sc.parent,
		dbo.RPTfn_GetShipContSernText(sc.internal_container_num) shipContSernText
	from
		shipping_container sc

		left outer join shipment_detail sd
		on	sc.internal_shipment_line_num = sd.internal_shipment_line_num

	where
		sc.tree_unit = (select tree_unit from shipping_container 
				where internal_container_num = @INTERNAL_CONTAINER_NUM)

	-- [comment omitted]
	-- [comment omitted]

	and
		(
              		sc.internal_container_num <> sc.tree_unit

                	or

                	sc.item is not null
        	)              

	-- [comment omitted]
	-- [comment omitted]

	;

end -- [comment omitted]






