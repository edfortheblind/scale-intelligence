/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	31306	| AU	| 02/13/2024| Created.
	35021	| AU	| 02/13/2024| Added Warehouse param to handle Warehouse date for Reports.

	This SP will populate the Signature Image data and Warehouse date for SSRS reports based on Internal Num

*/


CREATE PROCEDURE GetGenericImageData(@INTERNAL_NUM numeric(9), @WAREHOUSE NVARCHAR(50)= NULL)

AS
BEGIN

	set nocount on;
	declare @shipperImageData varbinary(max);
	declare @carrierImageData varbinary(max);
	declare @shipperSignDate datetime;
	declare @carrierSignDate datetime;

	SELECT @shipperImageData=IMAGE_DATA,@shipperSignDate=IMAGE_DATE_TIME_STAMP FROM GENERIC_IMAGE_DATA WHERE INTERNAL_NUM=@INTERNAL_NUM
		AND IMAGE_TYPE=N'ShippingLoad_ShipperSign';

	SELECT @carrierImageData=IMAGE_DATA,@carrierSignDate=IMAGE_DATE_TIME_STAMP FROM GENERIC_IMAGE_DATA WHERE INTERNAL_NUM=@INTERNAL_NUM
		AND IMAGE_TYPE=N'ShippingLoad_CarrierSign';

	SELECT @shipperImageData AS SHIPPER_SIGNATURE,
	convert(varchar, dbo.GetWarehouseDate(@WAREHOUSE,@shipperSignDate), 101) AS SHIPPER_SIGN_DATE, --Get Warehouse Date in MM/DD/YYYY
	@carrierImageData AS CARRIER_SIGNATURE,
	convert(varchar, dbo.GetWarehouseDate(@WAREHOUSE,@carrierSignDate), 101) AS CARRIER_SIGN_DATE; --Get Warehouse Date in MM/DD/YYYY

END