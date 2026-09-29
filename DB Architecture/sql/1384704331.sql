-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */









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

   
 /* [comment omitted] */

  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)
  
  SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'
  SELECT @locatingZone = filterValue from @criteriaTempTable WHERE filterName = N'<literal:2>'
  SELECT @locationType = filterValue from @criteriaTempTable WHERE filterName = N'<literal:3>'



  IF(@locatingZone =N'<literal:4>')
  	SET @locatingZone = NULL;

  IF(@locationType =N'<literal:5>')
  	SET @locationType = NULL;


  SELECT N'<literal:6>' AS CHARTDATA_MonitorTemplateField,
  CATEGORY= CASE WHEN  TEMPLATE_FIELD1 IS NULL THEN dbo.RSCMfn_RtrvResource(N'<literal:7>',N'<literal:8>',@culture) ELSE  TEMPLATE_FIELD1 END, 
  COUNT(distinct LOCATION) AS DATA, 
  DESCRIPTION = CASE WHEN TEMPLATE_FIELD1 IS NULL THEN N'<literal:9>' ELSE TEMPLATE_FIELD1 END,	
  N'<literal:10>' AS XAXISTITLE, 
  N'<literal:11>' AS YAXISTITLE, 
  -1 AS NextDrillDownLevel, 
  N'<literal:12>' AS CHARTTITLE  FROM METADATA_INSIGHT_INVENTORY_VIEW
  where warehouse=@warehouse and LOCATION_STS=N'<literal:13>' and active=N'<literal:14>'
  AND ((@locatingZone IS NULL AND LOCATING_ZONE IS NULL) OR LOCATING_ZONE =@locatingZone)   -- [comment omitted]
  AND ((@locationType IS NULL AND LOCATION_TYPE IS NULL) OR LOCATION_TYPE =@locationType)   -- [comment omitted]
  group by TEMPLATE_FIELD1
  ORDER BY DATA DESC;


  
/* [comment omitted] */

DECLARE @TOTAL_LOCATIONS INT=0,@EMPTY_LOCATIONS INT=0,@PERCENT_EMPTY FLOAT=0.00,@FROZEN_EMPTY INT=0;

   SELECT  @TOTAL_LOCATIONS = (count(DISTINCT(LOCATION))) from METADATA_INSIGHT_INVENTORY_VIEW where warehouse=@warehouse AND ACTIVE=N'<literal:15>' AND ((@locatingZone IS NULL AND LOCATING_ZONE IS NULL) OR LOCATING_ZONE =@locatingZone) AND ((@locationType IS NULL AND LOCATION_TYPE IS NULL) OR LOCATION_TYPE =@locationType); 
   SELECT  @EMPTY_LOCATIONS = (count(DISTINCT(LOCATION))) from METADATA_INSIGHT_INVENTORY_VIEW where warehouse=@warehouse AND ACTIVE=N'<literal:16>' and LOCATION_STS=N'<literal:17>' AND ((@locatingZone IS NULL AND LOCATING_ZONE IS NULL) OR LOCATING_ZONE =@locatingZone) AND ((@locationType IS NULL AND LOCATION_TYPE IS NULL) OR LOCATION_TYPE =@locationType);  
   SELECT  @PERCENT_EMPTY = case when @TOTAL_LOCATIONS<>0 then (CAST(@EMPTY_LOCATIONS AS FLOAT)/CAST(@TOTAL_LOCATIONS AS FLOAT)*100.00) else N'<literal:18>' end;
   SELECT  @FROZEN_EMPTY = (COUNT(DISTINCT(L.location))) from METADATA_INSIGHT_INVENTORY_VIEW L where L.warehouse=@warehouse AND ACTIVE=N'<literal:19>' AND L.LOCATION_STS=N'<literal:20>' AND ((@locatingZone IS NULL AND L.LOCATING_ZONE IS NULL) OR L.LOCATING_ZONE =@locatingZone) AND ((@locationType IS NULL AND L.LOCATION_TYPE IS NULL) OR L.LOCATION_TYPE =@locationType) AND L.LOCATION NOT in (select distinct LI.LOCATION from LOCATION_INVENTORY LI);

 SELECT TOP 1 N'<literal:21>' AS SUMMARYTILE_TOTAL_LOCATIONS,  @TOTAL_LOCATIONS AS TOTAL_LOCATIONS;
 SELECT TOP 1 N'<literal:22>' AS SUMMARYTILE_EMPTY_LOCATIONS,  @EMPTY_LOCATIONS AS EMPTY_LOCATIONS;
 SELECT TOP 1 N'<literal:23>' AS SUMMARYTILE_PERCENT_EMPTY,  @PERCENT_EMPTY AS PERCENT_EMPTY;
 SELECT TOP 1 N'<literal:24>' AS SUMMARYTILE_FROZEN_EMPTY,  @FROZEN_EMPTY AS FROZEN_EMPTY;


/* [comment omitted] */

If @@ERROR <> 0 GoTo ErrorHandler

    Set NoCount OFF

    Return(0)

  

ErrorHandler:

    Return(@@ERROR)









	


