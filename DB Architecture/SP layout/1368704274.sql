
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	182441 	| SDS	| 07/21/16	| Created
	
	    
*/
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
	

 /*get the where clause value*/
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)


  SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'WAREHOUSE'
  SELECT @locatingZone = filterValue from @criteriaTempTable WHERE filterName = N'LOCATING_ZONE'
  
 IF(@locatingZone =N'unassigned')
	SET @locatingZone = NULL;
 	
  SELECT N'CHARTDATA_MonitorLocationType' AS CHARTDATA_MonitorLocationType,
  CATEGORY= CASE WHEN LOCATION_TYPE IS NULL THEN dbo.RSCMfn_RtrvResource(N'UNASSIGNED',N'text',@culture) ELSE LOCATION_TYPE END, 
  COUNT(distinct LOCATION) AS DATA, 
  DESCRIPTION = CASE WHEN LOCATION_TYPE IS NULL THEN N'' ELSE LOCATION_TYPE END,
  N'LOCATIONTYPE' AS XAXISTITLE, 
  N'LOCATIONS' AS YAXISTITLE, 
  2 AS NextDrillDownLevel, 
  N'EMPTYLOCBYLOCTYPE' AS CHARTTITLE from METADATA_INSIGHT_INVENTORY_VIEW 
  where warehouse=@warehouse and location_sts=N'Empty' and active=N'Y'
  and ((@locatingZone IS NULL AND LOCATING_ZONE IS NULL) OR LOCATING_ZONE=@locatingZone)
  GROUP BY LOCATION_TYPE
  ORDER BY DATA DESC;
		 		 
	

/* SUMMARY TILES START */
DECLARE @TOTAL_LOCATIONS INT=0,@EMPTY_LOCATIONS INT=0,@PERCENT_EMPTY FLOAT=0.00,@FROZEN_EMPTY INT=0;
   
 SELECT  @TOTAL_LOCATIONS = (sum (loc.cnt)), @EMPTY_LOCATIONS = SUM(CASE WHEN loc.locationSTS =N'Empty' THEN cnt ELSE 0 END)
from ( SELECT count (distinct (LOCATION)) as cnt, LOCATION_STS as locationSTS, Count(DISTINCT LOCATION) as locCount FROM METADATA_INSIGHT_INVENTORY_VIEW WHERE WAREHOUSE=@warehouse  AND ACTIVE=N'Y' AND ((@locatingZone IS NULL AND LOCATING_ZONE IS NULL) OR LOCATING_ZONE =@locatingZone)
GROUp by Location, LOCATION_STS) loc;
SELECT  @PERCENT_EMPTY = case when @TOTAL_LOCATIONS<>0 then (CAST(@EMPTY_LOCATIONS AS FLOAT)/CAST(@TOTAL_LOCATIONS AS FLOAT)*100.00) else 0.00 end;
SELECT  @FROZEN_EMPTY = (COUNT(DISTINCT(L.location))) from METADATA_INSIGHT_INVENTORY_VIEW L WHERE L.WAREHOUSE=@warehouse AND L.ACTIVE=N'Y' and L.LOCATION_STS=N'FROZEN' AND L.LOCATION NOT in (select distinct LI.LOCATION from LOCATION_INVENTORY LI);

 
 SELECT TOP 1 N'SUMMARYTILE_TOTAL_LOCATIONS' AS SUMMARYTILE_TOTAL_LOCATIONS,  @TOTAL_LOCATIONS AS TOTAL_LOCATIONS;
 SELECT TOP 1 N'SUMMARYTILE_EMPTY_LOCATIONS' AS SUMMARYTILE_EMPTY_LOCATIONS,  @EMPTY_LOCATIONS AS EMPTY_LOCATIONS;
 SELECT TOP 1 N'SUMMARYTILE_PERCENT_EMPTY' AS SUMMARYTILE_PERCENT_EMPTY,  @PERCENT_EMPTY AS PERCENT_EMPTY;
 SELECT TOP 1 N'SUMMARYTILE_FROZEN_EMPTY' AS SUMMARYTILE_FROZEN_EMPTY,  @FROZEN_EMPTY AS FROZEN_EMPTY;

/* SUMMARY TILES ENDS */

If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)

