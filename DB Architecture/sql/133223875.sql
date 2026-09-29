-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE Procedure LBR_MonitorLaborIndicatorTiles
	@filterCriteria NVARCHAR(MAX),
	@indicatorTileName NVARCHAR(100),
	@cautionCriteria NVARCHAR(MAX),
	@warningCriteria NVARCHAR(MAX),
	@culture NVARCHAR(10)
AS
	DECLARE @criteriaTempTable TABLE (filterName nVarchar(300), filterValue nVarchar(300));
	DECLARE @warehouse as nVarchar(50);
	DECLARE @browserOffset as INT;

	INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)	
   
	SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'
	SELECT @browserOffset = filterValue from @criteriaTempTable WHERE filterName = N'<literal:2>'

	
	DECLARE @CurrentBrowserDateWithTime DATETIME;
	SET @CurrentBrowserDateWithTime=DATEADD(mi,-(@browserOffset),GETUTCDATE())          -- [comment omitted]

	DECLARE @CurrentBrowserDate DATETIME;
    SET @CurrentBrowserDate= DATEADD(d,DATEDIFF(d,0,@CurrentBrowserDateWithTime),0)     -- [comment omitted]

	DECLARE @CurrentBrowserMidNightInUTC DATETIME;
    SET @CurrentBrowserMidNightInUTC= DATEADD(mi,(@browserOffset),@CurrentBrowserDate)    -- [comment omitted]
  


	/* [comment omitted] */
	IF(@indicatorTileName = N'<literal:3>')
		BEGIN
			SELECT TOP 1 
				N'<literal:4>' AS INDICATORTILE_COMPLETED_LASTHOUR,
				COUNT(INTERNAL_DETAIL_NUM) AS COMPLETED_LASTHOUR,
				(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(INTERNAL_DETAIL_NUM))) as N'<literal:5>' ,
				(SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(INTERNAL_DETAIL_NUM))) as N'<literal:6>' 
			FROM 
				LABOR_MANAGEMENT_DETAIL 
			WHERE 
				WAREHOUSE=@warehouse 
				AND END_DATE_TIME  > DATEADD(HOUR, -1, GETUTCDATE())
				AND ACTIVITY_TYPE IS NOT NULL
				AND ACTIVITY_TYPE NOT IN (N'<literal:7>', N'<literal:8>', N'<literal:9>', N'<literal:10>');		
		END

		/* [comment omitted] */
	ELSE IF(@indicatorTileName = N'<literal:11>')
		BEGIN
			SELECT TOP 1 
				N'<literal:12>'AS  INDICATORTILE_USERSCOMPLETEDLASTHOUR,
				COUNT(DISTINCT USER_NAME) AS USERSCOMPLETEDLASTHOUR,
				(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT USER_NAME))) as N'<literal:13>' ,
				(SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT USER_NAME))) as N'<literal:14>' 
			FROM 
				LABOR_MANAGEMENT_DETAIL 
			WHERE 
				WAREHOUSE=@warehouse 
				AND END_DATE_TIME  > DATEADD(HOUR, -1, GETUTCDATE())
				AND USER_NAME IS NOT NULL
				AND ACTIVITY_TYPE NOT IN (N'<literal:15>', N'<literal:16>', N'<literal:17>', N'<literal:18>');		
		END  

		/* [comment omitted] */
	ELSE IF(@indicatorTileName = N'<literal:19>')
		BEGIN
			SELECT TOP 1 
				N'<literal:20>'AS  INDICATORTILE_WORKUNITS_CLOSED_TODAY,
				COUNT(INTERNAL_INSTRUCTION_NUM) AS WORKUNITS_CLOSED_TODAY,
				(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(INTERNAL_INSTRUCTION_NUM))) as N'<literal:21>' ,
				 (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(INTERNAL_INSTRUCTION_NUM))) as N'<literal:22>' 
			FROM 
				WORK_INSTRUCTION_VIEW
			WHERE 
				INSTRUCTION_TYPE = N'<literal:23>'
				AND END_DATE_TIME >= @CurrentBrowserMidNightInUTC
				AND CONDITION = N'<literal:24>'
				AND (FROM_WHS = @warehouse OR TO_WHS = @warehouse);		
		END