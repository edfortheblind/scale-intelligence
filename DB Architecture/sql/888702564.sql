-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE PROCEDURE GetGenericImageData(@INTERNAL_NUM numeric(9), @WAREHOUSE NVARCHAR(50)= NULL)

AS
BEGIN

	set nocount on;
	declare @shipperImageData varbinary(max);
	declare @carrierImageData varbinary(max);
	declare @shipperSignDate datetime;
	declare @carrierSignDate datetime;

	SELECT @shipperImageData=IMAGE_DATA,@shipperSignDate=IMAGE_DATE_TIME_STAMP FROM GENERIC_IMAGE_DATA WHERE INTERNAL_NUM=@INTERNAL_NUM
		AND IMAGE_TYPE=N'<literal:1>';

	SELECT @carrierImageData=IMAGE_DATA,@carrierSignDate=IMAGE_DATE_TIME_STAMP FROM GENERIC_IMAGE_DATA WHERE INTERNAL_NUM=@INTERNAL_NUM
		AND IMAGE_TYPE=N'<literal:2>';

	SELECT @shipperImageData AS SHIPPER_SIGNATURE,
	convert(varchar, dbo.GetWarehouseDate(@WAREHOUSE,@shipperSignDate), 101) AS SHIPPER_SIGN_DATE, -- [comment omitted]
	@carrierImageData AS CARRIER_SIGNATURE,
	convert(varchar, dbo.GetWarehouseDate(@WAREHOUSE,@carrierSignDate), 101) AS CARRIER_SIGN_DATE; -- [comment omitted]

END