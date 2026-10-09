



CREATE PROCEDURE [dbo].[TRAV_LBL_ContainerContentsDetails](
	@INTERNAL_CONTAINER_NUM numeric(9))

AS
begin

	set nocount on;
--loose container details
	select
		sd.ERP_ORDER_LINE_NUM,
		sd.ITEM_DESC,
		sc.INTERNAL_CONTAINER_NUM, 
CASE WHEN LEN(sc.ITEM) = 13 THEN LEFT(sc.ITEM, 4) + '-' + RIGHT(LEFT(sc.ITEM, 6), 2) + '-' + RIGHT(LEFT(sc.ITEM, 9), 3) + '-' + RIGHT(sc.ITEM, 4) 
ELSE CASE WHEN sc.ITEM IS NULL THEN '' ELSE sc.ITEM END END as ITEM,
		sc.QUANTITY, 
		sc.ORIGINAL_PICK_LOC,
		sd.item_class -- added 03/10/2010 by Jimmy
		, SC.QUANTITY_UM,
ROW_NUMBER() OVER (ORDER BY 	sc.original_pick_loc, 
	SC.ITEM, 
	sc.internal_container_num ASC)  AS PICK_NO 
		
	from
		shipping_container sc

		inner join shipment_detail sd
		on
			sd.internal_shipment_line_num = sc.internal_shipment_line_num
	where
		sc.parent = @INTERNAL_CONTAINER_NUM

union all

--full case detail
	select
		sd.ERP_ORDER_LINE_NUM,
		sd.ITEM_DESC,
		sc.INTERNAL_CONTAINER_NUM, 
CASE WHEN LEN(sc.ITEM) = 13 THEN LEFT(sc.ITEM, 4) + '-' + RIGHT(LEFT(sc.ITEM, 6), 2) + '-' + RIGHT(LEFT(sc.ITEM, 9), 3) + '-' + RIGHT(sc.ITEM, 4) 
ELSE CASE WHEN sc.ITEM IS NULL THEN '' ELSE sc.ITEM END END as ITEM,
		sc.QUANTITY, 
		sc.ORIGINAL_PICK_LOC,
		sd.item_class -- added 03/10/2010 by Jimmy
		, SC.QUANTITY_UM,
ROW_NUMBER() OVER (ORDER BY 	sc.original_pick_loc, 
	SC.ITEM, 
	sc.internal_container_num ASC)  AS PICK_NO 
		
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
	sc.original_pick_loc ASC, 
	ITEM ASC, 
	sc.internal_container_num ASC 


end -- LBL_ContainerContentsDetails