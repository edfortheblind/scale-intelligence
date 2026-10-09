-- =============================================
-- Author:		Jimmy Red
-- Create date: 09-24-2008
-- Description:	Today's Completed Shipments for Performance Management Chart
-- =============================================


CREATE PROCEDURE [dbo].[PM_FUTURE_SHIPPING]
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
SELECT TOP 9 
SUM(CASE WHEN SH.TRAILING_STS >= 650 THEN 1 ELSE 0 END) AS COMPLETED,
SUM(CASE WHEN SH.TRAILING_STS >= 650 THEN 0 ELSE 1 END) AS INCOMPLETE,
RIGHT(''0'' + CAST(DATEPART(mm, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + ''/'' + 
RIGHT(''0'' + CAST(DATEPART(dd, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + ''/'' + 
CAST(DATEPART(yy, SH.PLANNED_SHIP_DATE) AS VARCHAR) 
as PlannedShipDate 
--CONVERT(DateTime, FLOOR(CONVERT( Float, SH.PLANNED_SHIP_DATE  )))  AS PlannedShipDate
FROM SHIPMENT_DETAIL AS SD 
INNER JOIN SHIPMENT_HEADER AS SH ON SD.INTERNAL_SHIPMENT_NUM = SH.INTERNAL_SHIPMENT_NUM 
WHERE SH.PLANNED_SHIP_DATE >= DATEADD(dd,DATEDIFF(dd,0,GETDATE()),0)  
GROUP BY 
RIGHT(''0'' + CAST(DATEPART(mm, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + ''/'' + 
RIGHT(''0'' + CAST(DATEPART(dd, SH.PLANNED_SHIP_DATE) AS VARCHAR), 2) + ''/'' + 
CAST(DATEPART(yy, SH.PLANNED_SHIP_DATE) AS VARCHAR) 
ORDER BY PlannedShipDate'

exec dbo.sp_executesql @sql

END