---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	179834	| NRJ	| 06/17/16	| Created
	180058	| RJR	| 06/29/16	| Added culture parameter.
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE MetaTrans_GetConsolidateShipment(
@internalShipmentNum numeric(9), @culture nvarchar(10))

AS
	SET NOCOUNT ON;

SELECT N'SCALAR' AS N'EntityType',
	N'ShipmentHeaderView' AS N'EntityName',
	SHIPMENT_HEADER_VIEW.INTERNAL_SHIPMENT_NUM AS N'InternalShipmentNum', 
	SHIPMENT_HEADER_VIEW.SHIPMENT_ID AS N'ShipmentId',
	SHIPMENT_HEADER_VIEW.CARRIER AS N'Carrier',
	SHIPMENT_HEADER_VIEW.CARRIER_SERVICE AS N'CarrierService',
	SHIPMENT_HEADER_VIEW.FREIGHT_TERMS AS N'FreightTermsDescription',	
	SHIPMENT_HEADER_VIEW.COMPANY AS N'Company' ,
	SHIPMENT_HEADER_VIEW.Warehouse AS N'Warehouse' ,
	SHIPMENT_HEADER_VIEW.SCHEDULED_SHIP_DATE AS N'ScheduledShipDate' ,
	SHIPMENT_HEADER_VIEW.CUSTOMER AS N'Customer',
	SHIPMENT_HEADER_VIEW.CUSTOMER_NAME AS N'CustomerName',
	SHIPMENT_HEADER_VIEW.SHIP_TO AS N'ShipTo',
	SHIPMENT_HEADER_VIEW.SHIP_TO_NAME AS N'ShipToName',
	SHIPMENT_HEADER_VIEW.SHIP_TO_ADDRESS1 AS N'ShipToAddress1',
	SHIPMENT_HEADER_VIEW.SHIP_TO_ADDRESS2 AS N'ShipToAddress2',
	SHIPMENT_HEADER_VIEW.SHIP_TO_ADDRESS3 AS N'ShipToAddress3',
	SHIPMENT_HEADER_VIEW.SHIP_TO_CITY AS N'ShipToCity',
	SHIPMENT_HEADER_VIEW.SHIP_TO_STATE AS N'ShipToState',
	SHIPMENT_HEADER_VIEW.SHIP_TO_POSTAL_CODE AS N'ShipToPostalCode',
	SHIPMENT_HEADER_VIEW.SHIP_TO_COUNTRY AS N'ShipToCountry',
	SHIPMENT_HEADER_VIEW.TOTAL_LINES AS N'TotalLines',
	SHIPMENT_HEADER_VIEW.TOTAL_VOLUME AS N'TotalVolume',
	SHIPMENT_HEADER_VIEW.TOTAL_WEIGHT AS N'TotalWeight',
	SHIPMENT_HEADER_VIEW.WEIGHT_UM AS N'WeightUm',
	SHIPMENT_HEADER_VIEW.VOLUME_UM AS N'VolumeUm',
	SHIPMENT_HEADER_VIEW.TRAILING_STS AS N'TrailingStatus'
FROM SHIPMENT_HEADER_VIEW 
WHERE SHIPMENT_HEADER_VIEW.INTERNAL_SHIPMENT_NUM =@internalShipmentNum