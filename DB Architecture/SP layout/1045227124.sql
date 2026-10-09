
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	180401	| RS	| 07/05/16	| Created.
	181041	| RS	| 07/05/16	| Get warehouse from header, not from detail
	191074	| DN	| 01/23/17	| Updated parameter types
*/


CREATE PROCEDURE MetaTrans_GetTransferShipmentDetail(
@InternalShipmentLineNum numeric(9), @culture nvarchar(10))

AS
	SET NOCOUNT ON;				

	SELECT N'SCALAR' AS N'EntityType',
	N'Shipment' AS N'EntityName',
	SH.SHIPMENT_ID AS N'ShipmentId',
	SH.INTERNAL_SHIPMENT_NUM AS N'InternalShipmentNum',
	SH.CUSTOMER AS N'Customer',
	SH.CARRIER AS N'Carrier',
	SH.CARRIER_SERVICE AS N'CarrierService',
	SH.LEADING_STS AS N'LeadingSts',
	SH.TRAILING_STS AS N'TrailingSts',
	SH.WAREHOUSE AS N'Warehouse',
	SD.COMPANY AS N'Company',
	SD.INTERNAL_SHIPMENT_LINE_NUM AS N'InternalLineNum',
	N'' AS N'DestinationShipmentId',
	SD.ERP_ORDER_LINE_NUM AS N'ErpOrderLineNum',
	SD.STATUS1 AS N'Status1',
	SD.ITEM AS N'Item',
	SD.ITEM_DESC AS N'ItemDesc',
	SD.REQUESTED_QTY AS N'RequestedQty',
	SD.QUANTITY_UM AS N'QuantityUm'	
	FROM SHIPMENT_HEADER SH inner join SHIPMENT_DETAIL SD
	ON SH.INTERNAL_SHIPMENT_NUM = SD.INTERNAL_SHIPMENT_NUM
	WHERE SD.INTERNAL_SHIPMENT_LINE_NUM = @InternalShipmentLineNum;