-- =============================================
-- Author:		Jimmy
-- Create date: 09/25/2008
-- Description:	Quantity shipped out of each building
-- =============================================
CREATE PROCEDURE PM_TODAY_SHIPPING_QUANTITY 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DECLARE @sql nvarchar(max);

SET @sql = '
SELECT SUM(TOTAL_QTY) AS TOTAL_QTY, LEFT(ALLOCATION_RULE, 3) + '' '' + CARRIER_TYPE AS CARRIER_TYPE, MAX(GETDATE()) AS TRAILING_STS_DATE
FROM (
		SELECT SD.ERP_ORDER, SUM(SD.TOTAL_QTY) AS TOTAL_QTY, MAX(ISNULL(LEFT(SD.ALLOCATION_RULE, 3), '''')) AS ALLOCATION_RULE, 
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