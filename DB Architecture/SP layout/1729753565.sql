/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	182443	| SSD	| 07/26/16	| Created
	216453	| MJ	| 12/11/17	| Modified to make db compatible with Azure SQL.
	219206	| MHM	| 02/16/18	| Modified Date to UTCDate.
*/

CREATE Procedure SHP_MonitorShipmentIndicatorTile
@filterCriteria NVARCHAR(MAX),
@indicatorTileName NVARCHAR(100),
@cautionCriteria NVARCHAR(MAX),
@warningCriteria NVARCHAR(MAX),
@culture NVARCHAR(10)
AS
Set NoCount ON
	DECLARE @warehouse as nVarchar(50);
	DECLARE @criteriaTempTable TABLE 
	(
    filterName nVarchar(300),
    filterValue nVarchar(300)
	)


 /*get the where clause value*/
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)
  SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'WAREHOUSE'

   DECLARE @wareHouseDate DATETIME;
   SELECT @wareHouseDate= dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE());

DECLARE @cautionValue as NUMERIC(9);
DECLARE @warningValue as NUMERIC(9);

	IF(@indicatorTileName = N'MNU_SHIPMENT_MONITORING_CUSTIndicatorTile0')
	Begin
		SELECT TOP 1 N'INDICATORTILE_LOADS_PENDING_CONFIRM'AS  INDICATORTILE_LOADS_PENDING_CONFIRM,
		count(INTERNAL_LOAD_NUM) AS LOADS_PENDING_CONFIRM,
	    (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT INTERNAL_LOAD_NUM))) as N'CAUTION' ,
	    (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT INTERNAL_LOAD_NUM))) as N'WARNING'
	   from SHIPPING_LOAD_VIEW where TRAILING_STS >= 700 and TRAILING_STS <=800 and warehouse=@warehouse
	END
	ELSE
	IF(@indicatorTileName = N'MNU_SHIPMENT_MONITORING_CUSTIndicatorTile1')
	Begin
		SELECT TOP 1 N'INDICATORTILE_FUTURE_LOADS'AS  INDICATORTILE_FUTURE_LOADS,
		count(INTERNAL_LOAD_NUM) AS FUTURE_LOADS,
		(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT INTERNAL_LOAD_NUM))) as  N'CAUTION' ,
	    (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT INTERNAL_LOAD_NUM))) as N'WARNING' 
	   from SHIPPING_LOAD_VIEW where SCHEDULED_SHIP_DATE> (SELECT CONVERT(DATE,@wareHouseDate)) and warehouse=@warehouse and TRAILING_STS > 201 and TRAILING_STS <900 
	END
	ELSE
	IF(@indicatorTileName = N'MNU_SHIPMENT_MONITORING_CUSTIndicatorTile2')
	Begin
		SELECT TOP 1 N'INDICATORTILE_SHIPMENTS_TO_ROUTE'AS  INDICATORTILE_SHIPMENTS_TO_ROUTE,
		count(distinct(INTERNAL_SHIPMENT_NUM)) AS SHIPMENTS_TO_ROUTE,
		(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT INTERNAL_SHIPMENT_NUM))) as N'CAUTION' ,
	    (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT INTERNAL_SHIPMENT_NUM))) as N'WARNING'
	   from Metadata_Insight_Shipment_View where SHIPMENT_HEADER_CARRIER is null and warehouse=@warehouse and SHIPMENT_HEADER_TRAILING_STS <900 
	END

