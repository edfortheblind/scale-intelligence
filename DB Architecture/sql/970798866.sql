-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











CREATE Procedure WRK_MonitorAssignedUserChartData
@filterCriteria nVarchar(MAX),

@culture nvarchar(10)
        
AS
    Set NoCount ON
	DECLARE @warehouse as nVarchar(50);
	DECLARE @workGroup as nVarchar(50);
	DECLARE @workType as nVarchar(50);
	DECLARE @criteriaTempTable TABLE (
   filterName nVarchar(300),
   filterValue nVarchar(300))

 /* [comment omitted] */
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)


  SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'
  SELECT @workGroup = filterValue from @criteriaTempTable WHERE filterName = N'<literal:2>'
  SELECT @workType = filterValue from @criteriaTempTable WHERE filterName =N'<literal:3>'

  IF(@workGroup =N'<literal:4>')
	SET @workGroup = NULL;
  IF(@workType =N'<literal:5>')
	SET @workType = NULL;
	
  SELECT N'<literal:6>' AS CHARTDATA_MonitorAssignedUser, CATEGORY = CASE 
																					WHEN  USER_ASSIGNED IS NULL THEN dbo.RSCMfn_RtrvResource(N'<literal:7>',N'<literal:8>',@culture) ELSE  USER_ASSIGNED 
																				END, COUNT(DISTINCT WORK_UNIT) AS DATA  ,NULL AS DESCRIPTION , N'<literal:9>' AS XAXISTITLE, 
																				N'<literal:10>' AS YAXISTITLE, -1 AS NextDrillDownLevel, N'<literal:11>' AS CHARTTITLE FROM WORK_INSTRUCTION
  WHERE (FROM_WHS =@warehouse OR TO_WHS=@warehouse) 
  AND ((@workGroup IS NULL AND WORK_GROUP IS NULL) OR WORK_GROUP =@workGroup) 
   AND ((@workType IS NULL AND WORK_TYPE IS NULL) OR WORK_TYPE = @workType)
   AND CONDITION != N'<literal:12>' AND INSTRUCTION_TYPE =N'<literal:13>' GROUP BY USER_ASSIGNED
   ORDER BY DATA DESC

  /* [comment omitted] */

 DECLARE @TOTAL_WORKUNIT INT=0,@TOTAL_INTERNAL_INSTRUCTION_NUM INT=0,@TOTAL_ESTIMATED_TIME NUMERIC(9,0)=0, @OPEN_INTERNAL_INSTRUCTION_NUM INT, @INPROCESS_INTERNAL_INSTRUCTION_NUM INT, @CLOSED_INTERNAL_INSTRUCTION_NUM INT;

   SELECT  @TOTAL_WORKUNIT = SUM(WORK.WORK_UNIT_COUNT),
		   @TOTAL_INTERNAL_INSTRUCTION_NUM =SUM(WORK.INSTRUCTION_NUMS_COUNT) ,
		   @TOTAL_ESTIMATED_TIME =ISNULL(SUM(WORK.ESTIMATED_TIMES), 0), 
		   @OPEN_INTERNAL_INSTRUCTION_NUM = SUM(CASE WHEN WORK.CONDITION = N'<literal:14>' THEN WORK.INSTRUCTION_NUMS_COUNT ELSE 0 END), 
		   @INPROCESS_INTERNAL_INSTRUCTION_NUM = SUM(CASE WHEN WORK.CONDITION = N'<literal:15>' THEN WORK.INSTRUCTION_NUMS_COUNT ELSE 0 END)
	FROM(
		SELECT COUNT(DISTINCT WORK_UNIT) AS WORK_UNIT_COUNT, COUNT(INTERNAL_INSTRUCTION_NUM) AS INSTRUCTION_NUMS_COUNT, ISNULL(SUM(ESTIMATED_TIME), 0) AS ESTIMATED_TIMES, CONDITION FROM WORK_INSTRUCTION
		 WHERE  INSTRUCTION_TYPE =  N'<literal:16>'  AND  CONDITION != N'<literal:17>' AND (FROM_WHS =@warehouse OR TO_WHS=@warehouse)
		  AND ((@workGroup IS NULL AND WORK_GROUP IS NULL) OR WORK_GROUP =@workGroup) 
		  AND ((@workType IS NULL AND WORK_TYPE IS NULL) OR WORK_TYPE = @workType) GROUP BY CONDITION
  )WORK


  SELECT @CLOSED_INTERNAL_INSTRUCTION_NUM = COUNT(INTERNAL_INSTRUCTION_NUM)
	FROM WORK_INSTRUCTION_VIEW
		 WHERE  INSTRUCTION_TYPE =  N'<literal:18>'  AND (FROM_WHS =@warehouse OR TO_WHS=@warehouse)
		  AND ((@workGroup IS NULL AND WORK_GROUP IS NULL) OR WORK_GROUP =@workGroup) 
		  AND ((@workType IS NULL AND WORK_TYPE IS NULL) OR WORK_TYPE = @workType)
		  AND CONDITION =N'<literal:19>'
		  AND  DATE_TIME_STAMP >=DATEADD(HOUR, -1, GETUTCDATE()) 
   
   SELECT top 1 N'<literal:20>' AS N'<literal:21>', @TOTAL_WORKUNIT AS N'<literal:22>';
   SELECT top 1 N'<literal:23>' AS N'<literal:24>', @TOTAL_INTERNAL_INSTRUCTION_NUM AS N'<literal:25>';
   SELECT top 1 N'<literal:26>' AS N'<literal:27>', @TOTAL_ESTIMATED_TIME AS N'<literal:28>';
   SELECT top 1 N'<literal:29>' AS N'<literal:30>', @OPEN_INTERNAL_INSTRUCTION_NUM AS N'<literal:31>' ;	
   SELECT top 1 N'<literal:32>' AS N'<literal:33>', @INPROCESS_INTERNAL_INSTRUCTION_NUM AS N'<literal:34>' ;
   SELECT top 1 N'<literal:35>' AS N'<literal:36>',  @CLOSED_INTERNAL_INSTRUCTION_NUM AS N'<literal:37>' ;
   
   /* [comment omitted] */                    
If @@ERROR <> 0 GoTo ErrorHandler
Set NoCount OFF
Return(0)
  
ErrorHandler:
    Return(@@ERROR)

	

