/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	179439	| DP	| 06/23/16	| Created
	180058	| RJR	| 06/29/16	| Added culture parameter.
	179441	| DP	| 07/01/16	| Modified so that it returns empty row if no row exists
	181999	| DP	| 07/08/16	| Modified SP name according to naming convention
	182090  | SP    | 07/15/16  | Support X of Y calculation and CarrierChangeRestricted
	179443  | SP    | 07/21/16  | Return resource messages for confirmation dialogs
*/

CREATE PROCEDURE MetaTrans_GetCloseContainer(
	@internalContainerNum numeric(9) = 0, 
	@culture nvarchar(10))

AS
	   SET NOCOUNT ON;
	   DECLARE @intShipNum numeric(9);
	   DECLARE @warehouse nvarchar(25);
	   DECLARE @ContainerCountNum numeric(9);
	   DECLARE @ContainerCountTotal numeric(9);
	   DECLARE @lastClosedContainerCountNum numeric(9);
	   DECLARE @lastClosedContainerCountTotal numeric(9);
	   DECLARE @carrierChangeRestricted bit = 0

	   SELECT
		   @intShipNum = SHIPPING_CONTAINER.INTERNAL_SHIPMENT_NUM,
		   @warehouse = SHIPPING_CONTAINER.WAREHOUSE,
		   @ContainerCountNum = isnull(SHIPPING_CONTAINER.CONTAINER_COUNT_NUMBER, 0),
		   @ContainerCountTotal = isnull(SHIPPING_CONTAINER.CONTAINER_COUNT_TOTAL, 0)
	   FROM SHIPPING_CONTAINER WHERE SHIPPING_CONTAINER.INTERNAL_CONTAINER_NUM = @internalContainerNum ;

	   SELECT TOP 1
			@lastClosedContainerCountNum = container_count_number, @lastClosedContainerCountTotal = container_count_total 
		FROM SHIPPING_CONTAINER 
		WHERE INTERNAL_SHIPMENT_NUM = @intShipNum 
			AND STATUS > 401 
		ORDER BY DATE_TIME_STAMP DESC
			   
  	    --Get Container Count Number and Container Count Total based on condition
		if (@lastClosedContainerCountNum is not null)
		BEGIN
			set @carrierChangeRestricted = 1

			If (@ContainerCountNum = 0 and @ContainerCountTotal = 0 and @lastClosedContainerCountNum < @lastClosedContainerCountTotal)
			BEGIN
				set @ContainerCountNum = @lastClosedContainerCountNum + 1
				set @ContainerCountTotal = @lastClosedContainerCountTotal;
			END
		END

       --company and warehouse are required to check on access
	   SELECT 
		   N'SCALAR' AS N'EntityType',
		   N'ShippingContainer' AS N'EntityName', 
		   SHIPPING_CONTAINER.INTERNAL_CONTAINER_NUM AS N'InternalContainerNum', 
		   SHIPPING_CONTAINER.COMPANY AS N'Company',
		   SHIPPING_CONTAINER.warehouse AS N'Warehouse',
		   SHIPPING_CONTAINER.CONTAINER_ID AS N'ContainerId' ,
		   SHIPPING_CONTAINER.WEIGHT AS N'Weight',
		   SHIPPING_CONTAINER.CONTAINER_TYPE AS N'ContainerType',
		   SHIPPING_CONTAINER.LENGTH AS N'Length',
		   SHIPPING_CONTAINER.WIDTH AS N'Width',
		   SHIPPING_CONTAINER.HEIGHT AS N'Height',
		   SHIPPING_CONTAINER.NMFC_CODE AS N'NMFCCode',
		   SHIPPING_CONTAINER.TRACKING_NUMBER AS N'Trackingnumber',
		   SHIPPING_CONTAINER.status,
		   SHIPPING_CONTAINER.USER_DEF1 AS N'UserDef1',
		   SHIPPING_CONTAINER.USER_DEF2 AS N'UserDef2',
		   SHIPPING_CONTAINER.USER_DEF3 AS N'UserDef3',
		   SHIPPING_CONTAINER.USER_DEF4 AS N'UserDef4',
		   SHIPPING_CONTAINER.USER_DEF5 AS N'UserDef5',
		   SHIPPING_CONTAINER.USER_DEF6 AS N'UserDef6',
		   ISNULL(SHIPPING_CONTAINER.USER_DEF7, 0) AS N'UserDef7',
		   ISNULL(SHIPPING_CONTAINER.USER_DEF8, 0) AS N'UserDef8'
	   FROM (SELECT 1 AS A) A
	   LEFT JOIN (
	   SELECT
		   SHIPPING_CONTAINER.INTERNAL_CONTAINER_NUM, 
		   SHIPPING_CONTAINER.COMPANY,
		   SHIPPING_CONTAINER.warehouse,
		   SHIPPING_CONTAINER.CONTAINER_ID,
		   SHIPPING_CONTAINER.WEIGHT,
		   SHIPPING_CONTAINER.CONTAINER_TYPE,
		   SHIPPING_CONTAINER.LENGTH,
		   SHIPPING_CONTAINER.WIDTH,
		   SHIPPING_CONTAINER.HEIGHT,
		   SHIPPING_CONTAINER.NMFC_CODE,
		   SHIPPING_CONTAINER.TRACKING_NUMBER,
		   SHIPPING_CONTAINER.status,
		   SHIPPING_CONTAINER.USER_DEF1,
		   SHIPPING_CONTAINER.USER_DEF2,
		   SHIPPING_CONTAINER.USER_DEF3,
		   SHIPPING_CONTAINER.USER_DEF4,
		   SHIPPING_CONTAINER.USER_DEF5,
		   SHIPPING_CONTAINER.USER_DEF6,
		   ISNULL(SHIPPING_CONTAINER.USER_DEF7, 0) as N'USER_DEF7',
		   ISNULL(SHIPPING_CONTAINER.USER_DEF8, 0) as N'USER_DEF8'
	   FROM SHIPPING_CONTAINER
	   WHERE SHIPPING_CONTAINER.INTERNAL_CONTAINER_NUM = @internalContainerNum) SHIPPING_CONTAINER ON 1=1  ;

	   
	   --Get Carrier and CarrierService values
	   SELECT 
		   N'SCALAR' AS N'EntityType',
		   N'ShipmentHeader' AS N'EntityName', 
		   SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM AS N'InternalShipmentNum', 
		   SHIPMENT_HEADER.CARRIER AS N'Carrier' ,
		   SHIPMENT_HEADER.CARRIER_SERVICE AS N'CarrierService'
	   FROM (SELECT 1 AS A) A
	   LEFT JOIN (
	   SELECT
		   SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM, 
		   SHIPMENT_HEADER.CARRIER,
		   SHIPMENT_HEADER.CARRIER_SERVICE
	   FROM SHIPMENT_HEADER WHERE SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM = @intShipNum) SHIPMENT_HEADER ON 1=1 ;

		SELECT 
			N'SCALAR' AS N'EntityType',
			N'ShippingContainerView' AS N'EntityName', 
			@ContainerCountNum AS N'ContainerCountNum', 
			@ContainerCountTotal AS N'ContainerCountTotal',
			@carrierChangeRestricted AS N'CarrierChangeRestricted',
			dbo.RSCMfn_RtrvResource(N'MSG_ZEROWEIGHTVER', N'Msg', @culture) as N'MSG_ZEROWEIGHTVER',
			dbo.RSCMfn_RtrvResource(N'MSG_WEIGHTTOLERANCEVER', N'Msg', @culture) as N'MSG_WEIGHTTOLERANCEVER',
			dbo.RSCMfn_RtrvResource(N'MSG_CHGTRACKINGNUMVER', N'Msg', @culture) as N'MSG_CHGTRACKINGNUMVER',
			dbo.RSCMfn_RtrvResource(N'MSG_OVERRIDEVAS01', N'Msg', @culture) as N'MSG_OVERRIDEVAS01';
	   