/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	180315		| AH			| 07/15/16	| created
	191074		| DN			| 01/23/17	| Updated parameter types
*/
CREATE PROCEDURE MetaTrans_SplitShipment
(
@internalShipmentNum numeric(9) ,  
@culture nvarchar(10)
)
AS
       SET NOCOUNT ON;

       --company and warehouse are required to check on access
       SELECT 
       N'SCALAR' AS N'EntityType',
       N'ShipmentHeader' AS N'EntityName', 
       SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM AS N'InternalShipmentNum', 
       SHIPMENT_HEADER.SHIPMENT_ID AS N'ShipmentId',
       SHIPMENT_HEADER.CUSTOMER AS N'Customer',
       SHIPMENT_HEADER.COMPANY AS N'Company' ,
       SHIPMENT_HEADER.Warehouse AS N'Warehouse' 
       FROM SHIPMENT_HEADER WHERE SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM = @internalShipmentNum ;


	   SELECT 
       N'SCALAR' AS N'EntityType',
	   N'ShipmentDetail' AS N'EntityName',
	   SHIPMENT_DETAIL.ERP_ORDER AS N'ERPOrder',
	   SHIPMENT_DETAIL.ERP_ORDER_LINE_NUM AS N'OrderLineNumber',
	   SHIPMENT_DETAIL.ITEM AS N'Item',
	   SHIPMENT_DETAIL.ITEM_DESC AS N'Description',
	   SHIPMENT_DETAIL.CUSTOMER_PO AS N'CustomerPO',
	   SHIPMENT_DETAIL.QUANTITY_AT_STS1 AS N'Quantity',
	   SHIPMENT_DETAIL.QUANTITY_UM AS N'QuantityUM'
	   from SHIPMENT_DETAIL where SHIPMENT_DETAIL.INTERNAL_SHIPMENT_NUM = @internalShipmentNum ;


