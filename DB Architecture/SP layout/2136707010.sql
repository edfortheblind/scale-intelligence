/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	09487	| SP	| 01/03/06	| Created.
	18821	| SP	| 03/03/06	| Return the first Customer PO number found within the tree of containers.

	Parameters:
		INTERNAL_CONTAINER_NUM  The internal container number.
	Returns:
		Rowset used for the header of Container Contents label. Contains Shipment ID from Shipment_header, 		Customer PO from Shipment_Detail and selected Container information from Shipping_Container.

*/


CREATE PROCEDURE LBL_ContainerContentsHeader(
	@INTERNAL_CONTAINER_NUM numeric(9))

AS
begin
	set nocount on;
select
	sh.SHIPMENT_ID,
	sd.CUSTOMER_PO,
	sc.INTERNAL_CONTAINER_NUM, 
	sc.CONTAINER_ID, 
	sc.CONTAINER_TYPE, 
	sc.CONTAINER_COUNT_NUMBER, 
	sc.CONTAINER_COUNT_TOTAL, 
	sc.LOCATION, 
	sc.TRACKING_NUMBER, 
	sc.USER_DEF1, 
	sc.USER_DEF2, 
	sc.USER_DEF3, 
	sc.USER_DEF4, 
	sc.USER_DEF5, 
	sc.USER_DEF6, 
	sc.USER_DEF7, 
	sc.USER_DEF8
from
	shipping_container sc

	inner join shipment_header sh
	on
		sh.internal_shipment_num = sc.internal_shipment_num

	left outer join (
		select top 1
			innerSd.customer_po
		from
			shipping_container items

		left outer join shipment_detail innerSd
		on
			items.internal_shipment_line_num = innerSd.internal_shipment_line_num

		where
			items.tree_unit = @INTERNAL_CONTAINER_NUM
			and
			items.internal_shipment_line_num is not null
	) sd on 1=1

where
	sc.internal_container_num = @INTERNAL_CONTAINER_NUM;

end -- LBL_ContainerContentsHeader




