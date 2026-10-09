
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	177912	| RS	| 05/23/16	| Created.
	178691	| RS	| 05/26/16	| Called another stored procedure which gives a complete list of companies and warehouse in order to determine security access.
	178776	| RS	| 05/29/16	| Removed last entity and combined that with Shipment enitty.
	180058	| RJR	| 06/29/16	| Added culture parameter.
	191074	| DN	| 01/23/17	| Updated parameter types
*/


CREATE PROCEDURE MetaTrans_GetTransferShipment(
@internalShipmentNum numeric(9), @culture nvarchar(10))

AS
	SET NOCOUNT ON;				

	Execute GET_SHIPMENT_SECURITY_INFO @internalShipmentNum;
	
	SELECT N'SCALAR' AS N'EntityType',
	N'Shipment' AS N'EntityName',	
	SL.SCHEDULED_SHIP_DATE AS N'ScheduledShipDate',		
	SL.TOTAL_CONTAINERS AS N'TotalContainers',
	SL.TOTAL_SHIPMENTS AS N'TotalShipments',
	SL.TOTAL_WEIGHT AS N'TotalWeight',
	SL.WEIGHT_UM AS N'WeightUm',
	SL.TOTAL_VOLUME AS N'TotalVolume',
	SL.VOLUME_UM AS N'VolumeUm',
	SL.LEADING_STS AS N'LoadLeadingSts',	
	SL.TRAILING_STS AS N'LoadTrailingSts',
	SH.SHIPMENT_ID AS N'ShipmentId',
	SH.COMPANY AS N'Company',
	SH.CARRIER AS N'Carrier',
	SH.CARRIER_SERVICE AS N'CarrierService',
	SH.LEADING_STS AS N'HdrLeadingSts',
	SH.TRAILING_STS AS N'HdrTrailingSts',
	SH.warehouse AS Warehouse,
	SH.INTERNAL_SHIPMENT_NUM AS N'InternalShipmentNum',
	N'' AS N'DestinationLoadNumber',
	SH.SHIPPING_LOAD_NUM AS N'ShippingLoad'
	FROM  SHIPMENT_HEADER SH left outer join SHIPPING_LOAD_VIEW SL
	ON SH.SHIPPING_LOAD_NUM = SL.INTERNAL_LOAD_NUM
	WHERE SH.INTERNAL_SHIPMENT_NUM =  @internalShipmentNum;		 	