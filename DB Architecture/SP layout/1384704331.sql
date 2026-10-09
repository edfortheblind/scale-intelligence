
/*

	Task	| By	| Date		| Modification Description

	--------------------------------------------------------------------

	182441 	| SSD	| 07/20/16	| Created 

*/

CREATE Procedure INV_MonitorTemplateFieldChartData

@filterCriteria nVarchar(MAX),
@culture nvarchar(10)    
AS
    Set NoCount ON
	DECLARE @warehouse as nVarchar(50);
	DECLARE @locatingZone as nVarchar(50);
	DECLARE @locationType as nVarchar(50);
	DECLARE @criteriaTempTable TABLE (
    filterName nVarchar(300),
    filterValue nVarchar(300))

   
 /*get the where clause value*/

  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)
  
  SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'WAREHOUSE'
  SELECT @locatingZone = filterValue from @criteriaTempTable WHERE filterName = N'LOCATING_ZONE'
  SELECT @locationType = filterValue from @criteriaTempTable WHERE filterName = N'LOCATION_TYPE'



  IF(@locatingZone =N'Unassigned')
  	SET @locatingZone = NULL;

  IF(@locationType =N'Unassigned')
  	SET @locationType = NULL;


  SELECT N'CHARTDATA_MonitorTemplateField' AS CHARTDATA_MonitorTemplateField,
  CATEGORY= CASE WHEN  TEMPLATE_FIELD1 IS NULL THEN dbo.RSCMfn_RtrvResource(N'UNASSIGNED',N'text',@culture) ELSE  TEMPLATE_FIELD1 END, 
  COUNT(distinct LOCATION) AS DATA, 
  DESCRIPTION = CASE WHEN TEMPLATE_FIELD1 IS NULL THEN N'' ELSE TEMPLATE_FIELD1 END,	
  N'LOCTEMPFIELDONE' AS XAXISTITLE, 
  N'LOCATIONS' AS YAXISTITLE, 
  -1 AS NextDrillDownLevel, 
  N'EMPTYLOCBYLOCTEMPFIELDONE' AS CHARTTITLE  FROM METADATA_INSIGHT_INVENTORY_VIEW
  where warehouse=@warehouse and LOCATION_STS=N'Empty' and active=N'Y'
  AND ((@locatingZone IS NULL AND LOCATING_ZONE IS NULL) OR LOCATING_ZONE =@locatingZone)   -- DRILL DOWN-1 CRITERIA
  AND ((@locationType IS NULL AND LOCATION_TYPE IS NULL) OR LOCATION_TYPE =@locationType)   -- DRILL DOWN-2 CRITERIA
  group by TEMPLATE_FIELD1
  ORDER BY DATA DESC;


  
/* SUMMARY TILES START */

DECLARE @TOTAL_LOCATIONS INT=0,@EMPTY_LOCATIONS INT=0,@PERCENT_EMPTY FLOAT=0.00,@FROZEN_EMPTY INT=0;

   SELECT  @TOTAL_LOCATIONS = (count(DISTINCT(LOCATION))) from METADATA_INSIGHT_INVENTORY_VIEW where warehouse=@warehouse AND ACTIVE=N'Y' AND ((@locatingZone IS NULL AND LOCATING_ZONE IS NULL) OR LOCATING_ZONE =@locatingZone) AND ((@locationType IS NULL AND LOCATION_TYPE IS NULL) OR LOCATION_TYPE =@locationType); 
   SELECT  @EMPTY_LOCATIONS = (count(DISTINCT(LOCATION))) from METADATA_INSIGHT_INVENTORY_VIEW where warehouse=@warehouse AND ACTIVE=N'Y' and LOCATION_STS=N'Empty' AND ((@locatingZone IS NULL AND LOCATING_ZONE IS NULL) OR LOCATING_ZONE =@locatingZone) AND ((@locationType IS NULL AND LOCATION_TYPE IS NULL) OR LOCATION_TYPE =@locationType);  
   SELECT  @PERCENT_EMPTY = case when @TOTAL_LOCATIONS<>0 then (CAST(@EMPTY_LOCATIONS AS FLOAT)/CAST(@TOTAL_LOCATIONS AS FLOAT)*100.00) else N'' end;
   SELECT  @FROZEN_EMPTY = (COUNT(DISTINCT(L.location))) from METADATA_INSIGHT_INVENTORY_VIEW L where L.warehouse=@warehouse AND ACTIVE=N'Y' AND L.LOCATION_STS=N'FROZEN' AND ((@locatingZone IS NULL AND L.LOCATING_ZONE IS NULL) OR L.LOCATING_ZONE =@locatingZone) AND ((@locationType IS NULL AND L.LOCATION_TYPE IS NULL) OR L.LOCATION_TYPE =@locationType) AND L.LOCATION NOT in (select distinct LI.LOCATION from LOCATION_INVENTORY LI);

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









	


