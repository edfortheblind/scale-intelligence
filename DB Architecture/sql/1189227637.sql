-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */




CREATE PROCEDURE MetaTrans_ShipmentSelection(
@internalShipmentNum  numeric(9), 
@culture nvarchar(200))
AS
       SET NOCOUNT ON;

       -- [comment omitted]
       SELECT 
       N'<literal:1>' AS EntityType,
       N'<literal:2>' AS EntityName, 
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

	   

	   