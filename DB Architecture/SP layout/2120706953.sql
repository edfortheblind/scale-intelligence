/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	09487	| SP	| 01/03/06	| Created.
	9693	| RAB	| 10/29/07	| Changed LOCATION to ORIGINAL_PICK_LOC.

	Parameters:
		INTERNAL_CONTAINER_NUM  The internal container number.
	Returns:
		Rowset used for the details of Container Contents label. 
		Contains ERP Order Line number and Item description from Shipment_Detail 
		and selected Container fields from Shipping_Container.

*/


CREATE PROCEDURE LBL_ContainerContentsDetails(
	@INTERNAL_CONTAINER_NUM numeric(9))

AS
begin
	set nocount on;

--loose container details
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

--full case detail
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

end -- LBL_ContainerContentsDetails




