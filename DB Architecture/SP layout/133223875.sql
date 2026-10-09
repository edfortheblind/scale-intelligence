/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	204237	| MMM	| 07/04/17	| Created
	216453	| MJ	| 12/11/17	| Modified to make db compatible with Azure SQL.
	219206	| MHM	| 02/16/18	| Modified Date to UTCDate.    
*/

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
   
	SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'warehouse'
	SELECT @browserOffset = filterValue from @criteriaTempTable WHERE filterName = N'TIMEZONE_OFFSET'

	
	DECLARE @CurrentBrowserDateWithTime DATETIME;
	SET @CurrentBrowserDateWithTime=DATEADD(mi,-(@browserOffset),GETUTCDATE())          -- get the current browser date and time.

	DECLARE @CurrentBrowserDate DATETIME;
    SET @CurrentBrowserDate= DATEADD(d,DATEDIFF(d,0,@CurrentBrowserDateWithTime),0)     --set the browser hr ,min and sec to 0;

	DECLARE @CurrentBrowserMidNightInUTC DATETIME;
    SET @CurrentBrowserMidNightInUTC= DATEADD(mi,(@browserOffset),@CurrentBrowserDate)    -- UTC time for clinet midnight day
  


	/* Indicator Tile 1 - Labor activity completed in last 1 hour, redirects to Labor Activity Insight */
	IF(@indicatorTileName = N'MNU_LABOR_MONITORINGIndicatorTile0')
		BEGIN
			SELECT TOP 1 
				N'INDICATORTILE_COMPLETED_LASTHOUR' AS INDICATORTILE_COMPLETED_LASTHOUR,
				COUNT(INTERNAL_DETAIL_NUM) AS COMPLETED_LASTHOUR,
				(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(INTERNAL_DETAIL_NUM))) as N'CAUTION' ,
				(SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(INTERNAL_DETAIL_NUM))) as N'WARNING' 
			FROM 
				LABOR_MANAGEMENT_DETAIL 
			WHERE 
				WAREHOUSE=@warehouse 
				AND END_DATE_TIME  > DATEADD(HOUR, -1, GETUTCDATE())
				AND ACTIVITY_TYPE IS NOT NULL
				AND ACTIVITY_TYPE NOT IN (N'SCREENENTRY', N'SCREENEXIT', N'SIGNON', N'SIGNOFF');		
		END

		/* Indicator Tile 2 - Distinct users who completed Labor activity in last 1 hour, redirects to Labor Activity Insight */
	ELSE IF(@indicatorTileName = N'MNU_LABOR_MONITORINGIndicatorTile1')
		BEGIN
			SELECT TOP 1 
				N'INDICATORTILE_USERSCOMPLETEDLASTHOUR'AS  INDICATORTILE_USERSCOMPLETEDLASTHOUR,
				COUNT(DISTINCT USER_NAME) AS USERSCOMPLETEDLASTHOUR,
				(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT USER_NAME))) as N'CAUTION' ,
				(SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT USER_NAME))) as N'WARNING' 
			FROM 
				LABOR_MANAGEMENT_DETAIL 
			WHERE 
				WAREHOUSE=@warehouse 
				AND END_DATE_TIME  > DATEADD(HOUR, -1, GETUTCDATE())
				AND USER_NAME IS NOT NULL
				AND ACTIVITY_TYPE NOT IN (N'SCREENENTRY', N'SCREENEXIT', N'SIGNON', N'SIGNOFF');		
		END  

		/* Indicator Tile 3 - Work units closed today, redirects to Work Insight */
	ELSE IF(@indicatorTileName = N'MNU_LABOR_MONITORINGIndicatorTile2')
		BEGIN
			SELECT TOP 1 
				N'INDICATORTILE_WORKUNITS_CLOSED_TODAY'AS  INDICATORTILE_WORKUNITS_CLOSED_TODAY,
				COUNT(INTERNAL_INSTRUCTION_NUM) AS WORKUNITS_CLOSED_TODAY,
				(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(INTERNAL_INSTRUCTION_NUM))) as N'CAUTION' ,
				 (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(INTERNAL_INSTRUCTION_NUM))) as N'WARNING' 
			FROM 
				WORK_INSTRUCTION_VIEW
			WHERE 
				INSTRUCTION_TYPE = N'Header'
				AND END_DATE_TIME >= @CurrentBrowserMidNightInUTC
				AND CONDITION = N'Closed'
				AND (FROM_WHS = @warehouse OR TO_WHS = @warehouse);		
		END