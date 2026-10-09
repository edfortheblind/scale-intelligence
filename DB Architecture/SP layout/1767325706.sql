/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	248725		| AC			| 05/15/20	| Added InterfaceRecordId as an parameter.

*/

CREATE PROCEDURE wm_RUploadOrderHeader01
	@InternalShipmentNum numeric(9),
	@TrailingSts numeric(3),
	@InterfaceRecordId numeric(9)
AS
	SELECT *	FROM Upload_order_header
	 WHERE INTERNAL_SHIPMENT_NUM = @InternalShipmentNum and Trailing_Sts =@TrailingSts and INTERFACE_RECORD_ID = @InterfaceRecordId;
