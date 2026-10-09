/*
	Mod Number	| Programmer		| Date   	| Modification Description
	--------------------------------------------------------------------
	16851		| ??				| ??		| created
	21987		| BB				| 03/18/08	| Removed extra conditions in where clause.
	135689		| JY				| 02/17/14	| Modified the table of upload and added new filter.
	143196		| DN				| 02/28/14	| When InterfaceLinkId is 0, look at shipment_detail table

*/

CREATE PROCEDURE wm_RShipmentDetail03
	@InternalShipmentNum numeric(9),
	@InterfaceLinkID numeric(9)
AS
	if(@InterfaceLinkID = 0)
		SELECT * 
		FROM SHIPMENT_DETAIL
		WHERE internal_shipment_num = @InternalShipmentNum
		AND (RELATED_INTERNAL_LINE_NUM IS NULL
		OR RELATED_INTERNAL_LINE_NUM = 0)
	else
		SELECT * 
		FROM UPLOAD_ORDER_DETAIL
		WHERE INTERNAL_SHIPMENT_NUM = @InternalShipmentNum
		and INTERFACE_LINK_ID = @InterfaceLinkID

