-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */






CREATE Procedure INV_MonitorLocationTypeChartData
@filterCriteria nVarchar(MAX),
@culture nvarchar(10)
        
AS
    Set NoCount ON
	DECLARE @warehouse as nVarchar(50);
	DECLARE @locatingZone as nVarchar(50);
	DECLARE @criteriaTempTable TABLE (
    filterName nVarchar(300),
    filterValue nVarchar(300))
	

 /* [comment omitted] */
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)


  SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'
  SELECT @locatingZone = filterValue from @criteriaTempTable WHERE filterName = N'<literal:2>'
  
 IF(@locatingZone =N'<literal:3>')
	SET @locatingZone = NULL;
 	
  SELECT N'<literal:4>' AS CHARTDATA_MonitorLocationType,
  CATEGORY= CASE WHEN LOCATION_TYPE IS NULL THEN dbo.RSCMfn_RtrvResource(N'<literal:5>',N'<literal:6>',@culture) ELSE LOCATION_TYPE END, 
  COUNT(distinct LOCATION) AS DATA, 
  DESCRIPTION = CASE WHEN LOCATION_TYPE IS NULL THEN N'<literal:7>' ELSE LOCATION_TYPE END,
  N'<literal:8>' AS XAXISTITLE, 
  N'<literal:9>' AS YAXISTITLE, 
  2 AS NextDrillDownLevel, 
  N'<literal:10>' AS CHARTTITLE from METADATA_INSIGHT_INVENTORY_VIEW 
  where warehouse=@warehouse and location_sts=N'<literal:11>' and active=N'<literal:12>'
  and ((@locatingZone IS NULL AND LOCATING_ZONE IS NULL) OR LOCATING_ZONE=@locatingZone)
  GROUP BY LOCATION_TYPE
  ORDER BY DATA DESC;
		 		 
	

/* [comment omitted] */
DECLARE @TOTAL_LOCATIONS INT=0,@EMPTY_LOCATIONS INT=0,@PERCENT_EMPTY FLOAT=0.00,@FROZEN_EMPTY INT=0;
   
 SELECT  @TOTAL_LOCATIONS = (sum (loc.cnt)), @EMPTY_LOCATIONS = SUM(CASE WHEN loc.locationSTS =N'<literal:13>' THEN cnt ELSE 0 END)
from ( SELECT count (distinct (LOCATION)) as cnt, LOCATION_STS as locationSTS, Count(DISTINCT LOCATION) as locCount FROM METADATA_INSIGHT_INVENTORY_VIEW WHERE WAREHOUSE=@warehouse  AND ACTIVE=N'<literal:14>' AND ((@locatingZone IS NULL AND LOCATING_ZONE IS NULL) OR LOCATING_ZONE =@locatingZone)
GROUp by Location, LOCATION_STS) loc;
SELECT  @PERCENT_EMPTY = case when @TOTAL_LOCATIONS<>0 then (CAST(@EMPTY_LOCATIONS AS FLOAT)/CAST(@TOTAL_LOCATIONS AS FLOAT)*100.00) else 0.00 end;
SELECT  @FROZEN_EMPTY = (COUNT(DISTINCT(L.location))) from METADATA_INSIGHT_INVENTORY_VIEW L WHERE L.WAREHOUSE=@warehouse AND L.ACTIVE=N'<literal:15>' and L.LOCATION_STS=N'<literal:16>' AND L.LOCATION NOT in (select distinct LI.LOCATION from LOCATION_INVENTORY LI);

 
 SELECT TOP 1 N'<literal:17>' AS SUMMARYTILE_TOTAL_LOCATIONS,  @TOTAL_LOCATIONS AS TOTAL_LOCATIONS;
 SELECT TOP 1 N'<literal:18>' AS SUMMARYTILE_EMPTY_LOCATIONS,  @EMPTY_LOCATIONS AS EMPTY_LOCATIONS;
 SELECT TOP 1 N'<literal:19>' AS SUMMARYTILE_PERCENT_EMPTY,  @PERCENT_EMPTY AS PERCENT_EMPTY;
 SELECT TOP 1 N'<literal:20>' AS SUMMARYTILE_FROZEN_EMPTY,  @FROZEN_EMPTY AS FROZEN_EMPTY;

/* [comment omitted] */

If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)

