-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE MetaTrans_SplitShipment
(
@internalShipmentNum numeric(9) ,  
@culture nvarchar(10)
)
AS
       SET NOCOUNT ON;

       -- [comment omitted]
       SELECT 
       N'<literal:1>' AS N'<literal:2>',
       N'<literal:3>' AS N'<literal:4>', 
       SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM AS N'<literal:5>', 
       SHIPMENT_HEADER.SHIPMENT_ID AS N'<literal:6>',
       SHIPMENT_HEADER.CUSTOMER AS N'<literal:7>',
       SHIPMENT_HEADER.COMPANY AS N'<literal:8>' ,
       SHIPMENT_HEADER.Warehouse AS N'<literal:9>' 
       FROM SHIPMENT_HEADER WHERE SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM = @internalShipmentNum ;


	   SELECT 
       N'<literal:10>' AS N'<literal:11>',
	   N'<literal:12>' AS N'<literal:13>',
	   SHIPMENT_DETAIL.ERP_ORDER AS N'<literal:14>',
	   SHIPMENT_DETAIL.ERP_ORDER_LINE_NUM AS N'<literal:15>',
	   SHIPMENT_DETAIL.ITEM AS N'<literal:16>',
	   SHIPMENT_DETAIL.ITEM_DESC AS N'<literal:17>',
	   SHIPMENT_DETAIL.CUSTOMER_PO AS N'<literal:18>',
	   SHIPMENT_DETAIL.QUANTITY_AT_STS1 AS N'<literal:19>',
	   SHIPMENT_DETAIL.QUANTITY_UM AS N'<literal:20>'
	   from SHIPMENT_DETAIL where SHIPMENT_DETAIL.INTERNAL_SHIPMENT_NUM = @internalShipmentNum ;


