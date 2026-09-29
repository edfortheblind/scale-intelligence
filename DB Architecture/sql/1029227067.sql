-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */










CREATE PROCEDURE MetaTrans_GetTransferShipment(
@internalShipmentNum numeric(9), @culture nvarchar(10))

AS
	SET NOCOUNT ON;				

	Execute GET_SHIPMENT_SECURITY_INFO @internalShipmentNum;
	
	SELECT N'<literal:1>' AS N'<literal:2>',
	N'<literal:3>' AS N'<literal:4>',	
	SL.SCHEDULED_SHIP_DATE AS N'<literal:5>',		
	SL.TOTAL_CONTAINERS AS N'<literal:6>',
	SL.TOTAL_SHIPMENTS AS N'<literal:7>',
	SL.TOTAL_WEIGHT AS N'<literal:8>',
	SL.WEIGHT_UM AS N'<literal:9>',
	SL.TOTAL_VOLUME AS N'<literal:10>',
	SL.VOLUME_UM AS N'<literal:11>',
	SL.LEADING_STS AS N'<literal:12>',	
	SL.TRAILING_STS AS N'<literal:13>',
	SH.SHIPMENT_ID AS N'<literal:14>',
	SH.COMPANY AS N'<literal:15>',
	SH.CARRIER AS N'<literal:16>',
	SH.CARRIER_SERVICE AS N'<literal:17>',
	SH.LEADING_STS AS N'<literal:18>',
	SH.TRAILING_STS AS N'<literal:19>',
	SH.warehouse AS Warehouse,
	SH.INTERNAL_SHIPMENT_NUM AS N'<literal:20>',
	N'<literal:21>' AS N'<literal:22>',
	SH.SHIPPING_LOAD_NUM AS N'<literal:23>'
	FROM  SHIPMENT_HEADER SH left outer join SHIPPING_LOAD_VIEW SL
	ON SH.SHIPPING_LOAD_NUM = SL.INTERNAL_LOAD_NUM
	WHERE SH.INTERNAL_SHIPMENT_NUM =  @internalShipmentNum;		 	