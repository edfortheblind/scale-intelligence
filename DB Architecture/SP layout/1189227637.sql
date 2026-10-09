/*
	Mod Number	| Programmer	| Date   	| Modification Description
	-------------------------------------------------------------------- 
	187261		| KSS			| 02/19/17	| created
*/
CREATE PROCEDURE MetaTrans_ShipmentSelection(
@internalShipmentNum  numeric(9), 
@culture nvarchar(200))
AS
       SET NOCOUNT ON;

       --company and warehouse are required to check on access
       SELECT 
       N'SCALAR' AS EntityType,
       N'ShipmentHeader' AS EntityName, 
       SHIPMENTHEADER.INTERNAL_SHIPMENT_NUM AS InternalShipmentNum,
	   SHIPMENTHEADER.SHIPMENT_ID AS ShipmentId, 
       SHIPMENTHEADER.warehouse AS Warehouse,
       SHIPMENTHEADER.COMPANY AS Company ,
	   SHIPMENTHEADER.SCHEDULED_SHIP_DATE AS ScheduledShipDate,
	   SHIPMENTHEADER.TRAILING_STS AS TrailingStatus,
	   SHIPMENTHEADER.LEADING_STS AS LeadingStatus,
	   SHIPMENTHEADER.CARRIER AS Carrier ,
	   SHIPMENTHEADER.CARRIER_SERVICE AS CarrierService ,
	   SHIPMENTHEADER.SHIP_TO AS ShipTo ,
	   SHIPMENTHEADER.SHIP_TO_NAME AS ShipToName 
	   FROM SHIPMENT_HEADER  SHIPMENTHEADER, SHIPMENT_HEADER SHWITHSAMEID WHERE 
	   SHWITHSAMEID.INTERNAL_SHIPMENT_NUM= @internalShipmentNum AND
	   SHIPMENTHEADER.SHIPMENT_ID=SHWITHSAMEID.SHIPMENT_ID AND SHIPMENTHEADER.WAREHOUSE = SHWITHSAMEID.WAREHOUSE  ;

	   

	   