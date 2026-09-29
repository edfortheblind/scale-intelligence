-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















CREATE PROCEDURE LBL_ContainerContentsDetails(
	@INTERNAL_CONTAINER_NUM numeric(9))

AS
begin
	set nocount on;

-- [comment omitted]
	select
		sd.ERP_ORDER_LINE_NUM,
		sd.ITEM_DESC,
		sc.INTERNAL_CONTAINER_NUM, 
		sc.ITEM, 
		sc.QUANTITY, 
		sc.ORIGINAL_PICK_LOC
		
	from
		shipping_container sc

		inner join shipment_detail sd
		on
			sd.internal_shipment_line_num = sc.internal_shipment_line_num
	where
		sc.parent = @INTERNAL_CONTAINER_NUM

union all

-- [comment omitted]
	select
		sd.ERP_ORDER_LINE_NUM,
		sd.ITEM_DESC,
		sc.INTERNAL_CONTAINER_NUM, 
		sc.ITEM, 
		sc.QUANTITY, 
		sc.ORIGINAL_PICK_LOC
		
	from
		shipping_container sc

		inner join shipment_detail sd
		on
			sd.internal_shipment_line_num = sc.internal_shipment_line_num
	where
		sc.internal_container_num = @INTERNAL_CONTAINER_NUM
		and 
		sc.item is not null
		and
		sc.container_id is not null

order by
	sc.original_pick_loc, 
	sc.item, 
	sc.internal_container_num;

end -- [comment omitted]




