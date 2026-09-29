-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE LBR_MonitorLaborUsersChartData
	@filterCriteria NVARCHAR(MAX),
	@culture NVARCHAR(10) 
AS

	SET NOCOUNT ON

	DECLARE @warehouse as nVarchar(50);
	DECLARE @laborGroup as nVarchar(25);
	DECLARE @workType as nVarchar(25);

	DECLARE @criteriaTempTable TABLE (filterName nVarchar(300), filterValue nVarchar(300));
    
	INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)
   
	SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'
	SELECT @laborGroup = filterValue from @criteriaTempTable WHERE filterName = N'<literal:2>'
	SELECT @workType = filterValue from @criteriaTempTable WHERE filterName = N'<literal:3>'
	DECLARE @Unassign NVARCHAR(2000);
	SET @Unassign=  dbo.RSCMfn_RtrvResource(N'<literal:4>',N'<literal:5>',@culture)

	/* [comment omitted] */ 
	SELECT 
		N'<literal:6>' AS CHARTDATA_DATASOURCE, 
		CATEGORY = CASE WHEN  WI.USER_ASSIGNED IS NULL THEN @Unassign ELSE  WI.USER_ASSIGNED END,
		SUM(COALESCE(WI.ESTIMATED_TIME, 0)) as DATA,
		DESCRIPTION = CASE WHEN  WI.USER_ASSIGNED IS NULL THEN @Unassign ELSE WI.USER_ASSIGNED END,
		N'<literal:7>' AS XAXISTITLE, 
		N'<literal:8>' AS YAXISTITLE, 
		-1 AS NextDrillDownLevel, 
		N'<literal:9>' AS CHARTTITLE
	FROM LABOR_GROUP LG 
		LEFT OUTER JOIN WORK_TYPE WT ON LG.OBJECT_ID = WT.LABOR_GROUP_ID
		LEFT OUTER JOIN WORK_INSTRUCTION WI ON WI.WORK_TYPE = WT.WORK_TYPE AND WI.INSTRUCTION_TYPE = N'<literal:10>'
	WHERE 
		LG.LABOR_GROUP = @laborGroup
		AND WT.WORK_TYPE = @workType
		AND WI.INTERNAL_INSTRUCTION_NUM IS NOT NULL 
		AND (WI.FROM_WHS = @warehouse OR WI.TO_WHS = @warehouse)
		AND WI.CONDITION <> N'<literal:11>'
	GROUP BY WI.USER_ASSIGNED
	ORDER BY DATA DESC;
	/* [comment omitted] */ 


	/* [comment omitted] */

	/* [comment omitted] */
	SELECT 
		TOP 1 N'<literal:12>' AS SUMMARYTILE_TOTAL_ESTIMATEDTIME,
		SUM(COALESCE(WI.ESTIMATED_TIME, 0)) AS TOTAL_ESTIMATEDTIME 
	FROM LABOR_GROUP LG 
		LEFT OUTER JOIN WORK_TYPE WT ON LG.OBJECT_ID = WT.LABOR_GROUP_ID
		LEFT OUTER JOIN WORK_INSTRUCTION WI ON WI.WORK_TYPE = WT.WORK_TYPE AND WI.INSTRUCTION_TYPE = N'<literal:13>'
	WHERE 
		LG.LABOR_GROUP = @laborGroup
		AND WT.WORK_TYPE = @workType
		AND WI.INTERNAL_INSTRUCTION_NUM IS NOT NULL 
		AND (WI.FROM_WHS = @warehouse OR WI.TO_WHS = @warehouse)
		AND WI.CONDITION <> N'<literal:14>';

	/* [comment omitted] */
	SELECT 
		TOP 1 N'<literal:15>' AS SUMMARYTILE_WORK_LASTHOUR,
		COUNT(WIV.INTERNAL_INSTRUCTION_NUM) AS WORK_LASTHOUR
	FROM LABOR_GROUP LG 
		LEFT OUTER JOIN WORK_TYPE WT ON LG.OBJECT_ID = WT.LABOR_GROUP_ID
		LEFT OUTER JOIN WORK_INSTRUCTION_VIEW WIV ON WIV.WORK_TYPE = WT.WORK_TYPE
	WHERE 
		LG.LABOR_GROUP = @laborGroup
		AND WIV.WORK_TYPE = @workType
		AND WIV.INTERNAL_INSTRUCTION_NUM IS NOT NULL
		AND WIV.END_DATE_TIME > DATEADD(HOUR, -1, GETUTCDATE())
		AND WIV.INSTRUCTION_TYPE = N'<literal:16>'
		AND (WIV.FROM_WHS = @warehouse OR WIV.TO_WHS = @warehouse)
		AND WIV.CONDITION = N'<literal:17>';


	/* [comment omitted] */

	SELECT 
		TOP 1 N'<literal:18>' AS SUMMARYTILE_USERS_LASTHOUR,
		COUNT(DISTINCT WIV.COMPLETED_BY_USER) AS USERS_LASTHOUR
	FROM LABOR_GROUP LG 
		LEFT OUTER JOIN WORK_TYPE WT ON LG.OBJECT_ID = WT.LABOR_GROUP_ID
		LEFT OUTER JOIN WORK_INSTRUCTION_VIEW WIV ON WIV.WORK_TYPE = WT.WORK_TYPE
	WHERE  
		LG.LABOR_GROUP = @laborGroup
		AND WIV.WORK_TYPE = @workType
		AND WIV.INTERNAL_INSTRUCTION_NUM IS NOT NULL
		AND WIV.END_DATE_TIME > DATEADD(HOUR, -1, GETUTCDATE())
		AND WIV.INSTRUCTION_TYPE = N'<literal:19>'
		AND (WIV.FROM_WHS = @warehouse OR WIV.TO_WHS = @warehouse)
		AND WIV.CONDITION = N'<literal:20>';

	/* [comment omitted] */
