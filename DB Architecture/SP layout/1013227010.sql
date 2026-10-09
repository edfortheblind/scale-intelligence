---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	163369	| DN	| 07/10/15	| Created
	180058	| RJR	| 06/29/16	| Added culture parameter.
	191074	| DN	| 01/23/17	| Updated parameter types
*/
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





CREATE PROCEDURE MetaTrans_GetTransferContainer(
@internalContainerNum numeric(9), @culture nvarchar(10))

AS
	SET NOCOUNT ON;

	--company and warehouse are required to check on access
	SELECT N'SCALAR' AS N'EntityType',
	N'ShippingContainer' AS N'EntityName', 
	SC.INTERNAL_CONTAINER_NUM AS N'InternalContainerNumber',
	SC.COMPANY AS N'Company',
	SC.CONTAINER_ID AS N'ContainerId',
	SC.CONTAINER_TYPE AS N'ContainerType',
	(SELECT STATUS_NAME FROM FUNCTIONAL_AREA_STATUS_FLOW WHERE status = SC.STATUS AND FUNCTIONAL_AREA=N'Outbound') AS StatusName,
	SC.VOLUME as Volume,
	SC.VOLUME_UM AS VolumeUm,
	SC.warehouse AS Warehouse,
	SC.WEIGHT as Weight,
	SC.WEIGHT_UM AS WeightUm
	FROM SHIPPING_CONTAINER SC WHERE INTERNAL_CONTAINER_NUM=@internalContainerNum AND CONTAINER_TYPE <> N'-';


	SELECT N'SCALAR' AS N'EntityType',
	N'ShipmentHeader' AS N'EntityName', 
	SH.CARRIER AS N'Carrier',
	SH.CARRIER_SERVICE AS N'CarrierService',
	SH.COMPANY AS N'Company',
	SH.LEADING_STS AS N'LeadingSts',
	SH.INTERNAL_SHIPMENT_NUM AS N'InternalShipmentNum',
	SH.SHIPMENT_ID AS N'ShipmentId',
	SH.TRAILING_STS AS N'TrailingSts',
	SH.Warehouse AS N'Warehouse'
	FROM SHIPMENT_HEADER SH
	WHERE INTERNAL_SHIPMENT_NUM IN (SELECT INTERNAL_SHIPMENT_NUM FROM SHIPPING_CONTAINER WHERE INTERNAL_CONTAINER_NUM=@internalContainerNum
	 AND CONTAINER_TYPE <> N'-');

	SELECT N'SCALAR' AS N'EntityType',
	N'DestinationShipmentHeader' AS N'EntityName', 
	N'' AS N'ShipmentId';