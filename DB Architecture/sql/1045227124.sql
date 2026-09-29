-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */








CREATE PROCEDURE MetaTrans_GetTransferShipmentDetail(
@InternalShipmentLineNum numeric(9), @culture nvarchar(10))

AS
	SET NOCOUNT ON;				

	SELECT N'<literal:1>' AS N'<literal:2>',
	N'<literal:3>' AS N'<literal:4>',
	SH.SHIPMENT_ID AS N'<literal:5>',
	SH.INTERNAL_SHIPMENT_NUM AS N'<literal:6>',
	SH.CUSTOMER AS N'<literal:7>',
	SH.CARRIER AS N'<literal:8>',
	SH.CARRIER_SERVICE AS N'<literal:9>',
	SH.LEADING_STS AS N'<literal:10>',
	SH.TRAILING_STS AS N'<literal:11>',
	SH.WAREHOUSE AS N'<literal:12>',
	SD.COMPANY AS N'<literal:13>',
	SD.INTERNAL_SHIPMENT_LINE_NUM AS N'<literal:14>',
	N'<literal:15>' AS N'<literal:16>',
	SD.ERP_ORDER_LINE_NUM AS N'<literal:17>',
	SD.STATUS1 AS N'<literal:18>',
	SD.ITEM AS N'<literal:19>',
	SD.ITEM_DESC AS N'<literal:20>',
	SD.REQUESTED_QTY AS N'<literal:21>',
	SD.QUANTITY_UM AS N'<literal:22>'	
	FROM SHIPMENT_HEADER SH inner join SHIPMENT_DETAIL SD
	ON SH.INTERNAL_SHIPMENT_NUM = SD.INTERNAL_SHIPMENT_NUM
	WHERE SD.INTERNAL_SHIPMENT_LINE_NUM = @InternalShipmentLineNum;