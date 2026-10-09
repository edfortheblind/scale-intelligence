-- =============================================
-- Author:		Jimmy Red
-- Create date: 09-24-2008
-- Description:	Today's Completed Shipments for Performance Management Chart
-- =============================================


CREATE PROCEDURE [dbo].[PM_TODAY_SHIPPING_COMPLETED]
	-- Add the parameters for the stored procedure here
(
	@DATE_FROM datetime,
	@DATE_TO datetime,
	@DATE_RANGE_COLUMN nvarchar(50),
	@GROUP_BY_COLUMN nvarchar(50),
	@SELECT_COLUMN nvarchar(50),
	@TABLE_NAME nvarchar(50),
	@WAREHOUSE nvarchar(25) = NULL
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DECLARE @sql nvarchar(max);
	DECLARE @dataType nvarchar(20);

	SELECT @dataType = DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
	WHERE 
	TABLE_NAME = @Table_Name
	AND 
	COLUMN_NAME = @SELECT_COLUMN;  

SET @sql = '
SELECT COUNT(ERP_ORDER) AS ERP_ORDER, LEFT(ALLOCATION_RULE, 3) + '' '' + CARRIER_TYPE AS CARRIER_TYPE, MAX(GETDATE()) AS TRAILING_STS_DATE
FROM (
		SELECT SD.ERP_ORDER, MAX(ISNULL(LEFT(SD.ALLOCATION_RULE, 3), '''')) AS ALLOCATION_RULE, 
		MAX(CASE WHEN SH.CARRIER_TYPE = ''Parcel'' THEN ''Parcel'' ELSE ''LTL'' END) AS CARRIER_TYPE
		FROM SHIPMENT_HEADER AS SH
		LEFT OUTER JOIN SHIPMENT_DETAIL AS SD ON SH.INTERNAL_SHIPMENT_NUM = SD.INTERNAL_SHIPMENT_NUM 
		WHERE SH.TRAILING_STS > 401 
		AND SH.TRAILING_STS_DATE > DATEADD(dd,DATEDIFF(dd,0,GETDATE()),0)  
		GROUP BY SD.ERP_ORDER	
	) AS D 
WHERE LEN(ALLOCATION_RULE) > 1 
GROUP BY  LEFT(ALLOCATION_RULE, 3) + '' '' + CARRIER_TYPE
ORDER BY CARRIER_TYPE'

exec dbo.sp_executesql @sql

END