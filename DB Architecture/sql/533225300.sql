-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










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
			   
  	    -- [comment omitted]
		if (@lastClosedContainerCountNum is not null)
		BEGIN
			set @carrierChangeRestricted = 1

			If (@ContainerCountNum = 0 and @ContainerCountTotal = 0 and @lastClosedContainerCountNum < @lastClosedContainerCountTotal)
			BEGIN
				set @ContainerCountNum = @lastClosedContainerCountNum + 1
				set @ContainerCountTotal = @lastClosedContainerCountTotal;
			END
		END

       -- [comment omitted]
	   SELECT 
		   N'<literal:1>' AS N'<literal:2>',
		   N'<literal:3>' AS N'<literal:4>', 
		   SHIPPING_CONTAINER.INTERNAL_CONTAINER_NUM AS N'<literal:5>', 
		   SHIPPING_CONTAINER.COMPANY AS N'<literal:6>',
		   SHIPPING_CONTAINER.warehouse AS N'<literal:7>',
		   SHIPPING_CONTAINER.CONTAINER_ID AS N'<literal:8>' ,
		   SHIPPING_CONTAINER.WEIGHT AS N'<literal:9>',
		   SHIPPING_CONTAINER.CONTAINER_TYPE AS N'<literal:10>',
		   SHIPPING_CONTAINER.LENGTH AS N'<literal:11>',
		   SHIPPING_CONTAINER.WIDTH AS N'<literal:12>',
		   SHIPPING_CONTAINER.HEIGHT AS N'<literal:13>',
		   SHIPPING_CONTAINER.NMFC_CODE AS N'<literal:14>',
		   SHIPPING_CONTAINER.TRACKING_NUMBER AS N'<literal:15>',
		   SHIPPING_CONTAINER.status,
		   SHIPPING_CONTAINER.USER_DEF1 AS N'<literal:16>',
		   SHIPPING_CONTAINER.USER_DEF2 AS N'<literal:17>',
		   SHIPPING_CONTAINER.USER_DEF3 AS N'<literal:18>',
		   SHIPPING_CONTAINER.USER_DEF4 AS N'<literal:19>',
		   SHIPPING_CONTAINER.USER_DEF5 AS N'<literal:20>',
		   SHIPPING_CONTAINER.USER_DEF6 AS N'<literal:21>',
		   ISNULL(SHIPPING_CONTAINER.USER_DEF7, 0) AS N'<literal:22>',
		   ISNULL(SHIPPING_CONTAINER.USER_DEF8, 0) AS N'<literal:23>'
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
		   ISNULL(SHIPPING_CONTAINER.USER_DEF7, 0) as N'<literal:24>',
		   ISNULL(SHIPPING_CONTAINER.USER_DEF8, 0) as N'<literal:25>'
	   FROM SHIPPING_CONTAINER
	   WHERE SHIPPING_CONTAINER.INTERNAL_CONTAINER_NUM = @internalContainerNum) SHIPPING_CONTAINER ON 1=1  ;

	   
	   -- [comment omitted]
	   SELECT 
		   N'<literal:26>' AS N'<literal:27>',
		   N'<literal:28>' AS N'<literal:29>', 
		   SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM AS N'<literal:30>', 
		   SHIPMENT_HEADER.CARRIER AS N'<literal:31>' ,
		   SHIPMENT_HEADER.CARRIER_SERVICE AS N'<literal:32>'
	   FROM (SELECT 1 AS A) A
	   LEFT JOIN (
	   SELECT
		   SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM, 
		   SHIPMENT_HEADER.CARRIER,
		   SHIPMENT_HEADER.CARRIER_SERVICE
	   FROM SHIPMENT_HEADER WHERE SHIPMENT_HEADER.INTERNAL_SHIPMENT_NUM = @intShipNum) SHIPMENT_HEADER ON 1=1 ;

		SELECT 
			N'<literal:33>' AS N'<literal:34>',
			N'<literal:35>' AS N'<literal:36>', 
			@ContainerCountNum AS N'<literal:37>', 
			@ContainerCountTotal AS N'<literal:38>',
			@carrierChangeRestricted AS N'<literal:39>',
			dbo.RSCMfn_RtrvResource(N'<literal:40>', N'<literal:41>', @culture) as N'<literal:42>',
			dbo.RSCMfn_RtrvResource(N'<literal:43>', N'<literal:44>', @culture) as N'<literal:45>',
			dbo.RSCMfn_RtrvResource(N'<literal:46>', N'<literal:47>', @culture) as N'<literal:48>',
			dbo.RSCMfn_RtrvResource(N'<literal:49>', N'<literal:50>', @culture) as N'<literal:51>';
	   