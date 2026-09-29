-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */






CREATE PROCEDURE INV_MonitorLocationChartData
@filterCriteria NVARCHAR(MAX),
@culture NVARCHAR(10) 
AS
Set NoCount ON
	DECLARE @warehouse as nVarchar(80);
	DECLARE @criteriaTempTable TABLE (
	filterName nVarchar(300),
	filterValue nVarchar(300))

   
 /* [comment omitted] */
	INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)

	SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'
	

  SELECT N'<literal:2>' AS CHARTDATA_MonitorInventory,											
  CATEGORY= CASE WHEN LOCATING_ZONE IS NULL THEN dbo.RSCMfn_RtrvResource(N'<literal:3>',N'<literal:4>',@culture) ELSE LOCATING_ZONE END, 
  COUNT(distinct LOCATION) AS DATA,
  DESCRIPTION = CASE WHEN LOCATING_ZONE IS NULL THEN NULL ELSE N'<literal:5>' END,	
  N'<literal:6>' AS XAXISTITLE, 
  N'<literal:7>' AS YAXISTITLE, 
  1 AS NextDrillDownLevel, 
  N'<literal:8>' AS CHARTTITLE  from METADATA_INSIGHT_INVENTORY_VIEW 
  where warehouse=@warehouse and location_sts=N'<literal:9>' AND ACTIVE=N'<literal:10>'
  group by (LOCATING_ZONE)
  ORDER BY DATA desc;
 
  
/* [comment omitted] */
   DECLARE @TOTAL_LOCATIONS INT=0,@EMPTY_LOCATIONS INT=0,@PERCENT_EMPTY FLOAT=0.00,@FROZEN_EMPTY INT=0;

   SELECT  @TOTAL_LOCATIONS = (sum (loc.cnt)), @EMPTY_LOCATIONS = SUM(CASE WHEN loc.locationSTS =N'<literal:11>' THEN cnt ELSE 0 END)
from ( SELECT count (distinct (LOCATION)) as cnt, LOCATION_STS as locationSTS, Count(DISTINCT LOCATION) as locCount FROM METADATA_INSIGHT_INVENTORY_VIEW WHERE WAREHOUSE=@warehouse  AND ACTIVE=N'<literal:12>'
GROUp by Location, LOCATION_STS) loc;
SELECT  @PERCENT_EMPTY = case when @TOTAL_LOCATIONS<>0 then (CAST(@EMPTY_LOCATIONS AS FLOAT)/CAST(@TOTAL_LOCATIONS AS FLOAT)*100.00) else 0.00 end;
SELECT  @FROZEN_EMPTY = (COUNT(DISTINCT(L.location))) from METADATA_INSIGHT_INVENTORY_VIEW L WHERE L.WAREHOUSE=@warehouse AND L.ACTIVE=N'<literal:13>' and L.LOCATION_STS=N'<literal:14>'	AND L.LOCATION NOT in (select distinct LI.LOCATION from LOCATION_INVENTORY LI);


 SELECT TOP 1 N'<literal:15>' AS SUMMARYTILE_TOTAL_LOCATIONS,  @TOTAL_LOCATIONS AS TOTAL_LOCATIONS;
 SELECT TOP 1 N'<literal:16>' AS SUMMARYTILE_EMPTY_LOCATIONS,  @EMPTY_LOCATIONS AS EMPTY_LOCATIONS;
 SELECT TOP 1 N'<literal:17>' AS SUMMARYTILE_PERCENT_EMPTY, @PERCENT_EMPTY AS PERCENT_EMPTY;
 SELECT TOP 1 N'<literal:18>' AS SUMMARYTILE_FROZEN_EMPTY,  @FROZEN_EMPTY AS FROZEN_EMPTY;

/* [comment omitted] */

If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)
	