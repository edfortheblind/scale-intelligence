-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */


















CREATE PROCEDURE RPT_ShipmentPackListDetailsForSSRS(
	@INTERNAL_SHIPMENT_NUM numeric(9),
	@DOCUMENT_TYPE nvarchar(25))

AS
begin
	set nocount on;
with cte  (container_type,container_id,item,lot,quantity,quantity_UM ,weight,weight_UM ,user_def1 ,user_def2 ,user_def3 ,user_def4 ,user_def5 ,	user_def6 ,	user_def7 ,	user_def8 ,
		internal_container_num,internal_shipment_line_num,parent,level,tree)
as
(select container_type,
		container_id,
		item,
		lot,
		quantity,
		quantity_UM ,
		weight,
		weight_UM ,
		user_def1 ,
		user_def2 ,
		user_def3 ,
		user_def4 ,
		user_def5 ,
		user_def6 ,
		user_def7 ,
		user_def8 ,
		internal_container_num,
		internal_shipment_line_num,
		parent,0 as level ,CAST(internal_container_num AS VARCHAR(128)) AS tree from shipping_container sca where internal_shipment_num = @INTERNAL_SHIPMENT_NUM
		and parent is null
union all 
select sc.container_type,sc.container_id,sc.item,
		sc.lot,
		sc.quantity,
		sc.quantity_UM ,
		sc.weight,
		sc.weight_UM ,
		sc.user_def1 ,
		sc.user_def2 ,
		sc.user_def3 ,
		sc.user_def4 ,
		sc.user_def5 ,
		sc.user_def6 ,
		sc.user_def7 ,
		sc.user_def8 ,
		sc.internal_container_num,
		sc.internal_shipment_line_num,
		sc.parent,
		cte.level + 1,CAST(cte.tree + N'<literal:1>' + CAST(sc.internal_container_num AS VARCHAR) AS VARCHAR(128)) from cte join shipping_container sc on sc.parent=cte.internal_container_num)
select cte.container_type contType,
		cte.container_id contId,
		cte.item,
		sd.item_desc itemDesc,
		sd.item_size itemSize,
		sd.item_color itemColor,
		sd.item_style itemStyle,
		cte.lot,
		cte.quantity qty,
		cte.quantity_UM qtyUM,
		cte.weight,
		cte.weight_UM weightUM,
		cte.user_def1 scd_user_def1,
		cte.user_def2 scd_user_def2,
		cte.user_def3 scd_user_def3,
		cte.user_def4 scd_user_def4,
		cte.user_def5 scd_user_def5,
		cte.user_def6 scd_user_def6,
		cte.user_def7 scd_user_def7,
		cte.user_def8 scd_user_def8,
		sd.customer_item custItem,
		cte.internal_container_num,
		cte.parent, cte.level,cte.tree from cte left outer join Shipment_Detail sd on cte.internal_shipment_line_num = sd.internal_shipment_line_num
		order by tree
	;
end -- [comment omitted]

