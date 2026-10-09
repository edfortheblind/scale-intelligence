/*        
 Mod Number | Programmer | Date     | Modification Description        
 --------------------------------------------------------------------        
163205      | MHM       | 05/24/16	| Created   
180058		| RJR		| 06/29/16	| Added culture parameter.	  
191074		| DN		| 01/23/17	| Updated parameter types
*/  

CREATE PROCEDURE MetaTrans_DockLocationTransfer
(
@internalContainerNum numeric(9), @culture nvarchar(10)
)
AS
	SET NOCOUNT ON;

	SELECT TOP 1
	N'SCALAR' AS N'EntityType',	
	N'ShippingContainer' AS N'EntityName', 	
	SHIPPING_CONTAINER.INTERNAL_CONTAINER_NUM AS N'InternalContainerNum', 		
	SHIPPING_CONTAINER.CONTAINER_ID AS N'ContainerId' ,
	SHIPPING_CONTAINER.COMPANY AS N'Company',
	SHIPPING_CONTAINER.WAREHOUSE AS N'Warehouse' ,
	(SELECT top 1 Location FROM SHIPPING_CONTAINER 
	WHERE SHIPPING_CONTAINER.INTERNAL_SHIPMENT_LINE_NUM > 0 AND
	(SHIPPING_CONTAINER.INTERNAL_CONTAINER_NUM = @internalContainerNum
	OR SHIPPING_CONTAINER.PARENT = @internalContainerNum
	OR SHIPPING_CONTAINER.TREE_UNIT = @internalContainerNum)) AS N'FromDockLocation',	
	(select top 1 WI.TO_LOC
	FROM WORK_INSTRUCTION WI
	WHERE WI.TREE_UNIT = @internalContainerNum
	AND WI.INSTRUCTION_TYPE = N'Detail'
	AND WI.INTERNAL_NUM_TYPE IN (N'Shipment', N'Dock Management')
	and WI.CONDITION != N'Closed') AS N'ToDockLocation'
	FROM SHIPPING_CONTAINER where INTERNAL_CONTAINER_NUM=@internalContainerNum

	--company and warehouse are required to check on access
	SELECT 
	N'SCALAR' AS N'EntityType',	
	N'ShipmentHeader' AS N'EntityName', 
	SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM AS N'InternalShipmentNum', 
	SHIPMENT_HEADER.SHIPMENT_ID AS N'ShipmentId',
	SHIPMENT_HEADER.CARRIER AS N'Carrier',
	SHIPMENT_HEADER.CARRIER_SERVICE AS N'CarrierService',
	SHIPMENT_HEADER.COMPANY AS N'Company',
	SHIPMENT_HEADER.Warehouse AS N'Warehouse' ,
	SHIPMENT_HEADER.SHIP_TO AS N'ShipTo',
	SHIPMENT_HEADER.SHIP_TO_NAME AS N'ShipToName',
	SHIPMENT_HEADER.SHIP_TO_ADDRESS1 AS N'ShipToAddress1',
	SHIPMENT_HEADER.SHIP_TO_ADDRESS2 AS N'ShipToAddress2',
	SHIPMENT_HEADER.SHIP_TO_ADDRESS3 AS N'ShipToAddress3',
	SHIPMENT_HEADER.SHIP_TO_CITY AS N'ShipToCity',
	SHIPMENT_HEADER.SHIP_TO_STATE AS N'ShipToState',
	SHIPMENT_HEADER.SHIP_TO_COUNTRY AS N'ShipToCountry',
	SHIPMENT_HEADER.SHIP_TO_POSTAL_CODE AS N'ShipToPostalCode',
	SHIPMENT_HEADER.SHIP_TO_PHONE_NUM AS N'ShipToPhoneNum',
	SHIPMENT_HEADER.SHIP_TO_FAX_NUM AS N'ShipToFaxNum' ,
	SHIPMENT_HEADER.SHIP_TO_ATTENTION_TO AS N'ShipToAttentionTo',
	SHIPMENT_HEADER.SHIP_TO_EMAIL_ADDRESS AS N'ShipToEmailAddress' ,
	SHIPMENT_HEADER.SCHEDULED_SHIP_DATE AS N'ScheduledShipDate'
	FROM SHIPMENT_HEADER WHERE SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM = (select INTERNAL_SHIPMENT_NUM from SHIPPING_CONTAINER where INTERNAL_CONTAINER_NUM=@internalContainerNum) ;