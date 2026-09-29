-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











CREATE Procedure WRK_MonitorWorkTypeChartData
@filterCriteria nVarchar(MAX),
@culture nvarchar(10)
        
AS
    Set NoCount ON
	DECLARE @warehouse as nVarchar(50);
	DECLARE @workGroup as nVarchar(50);
	DECLARE @criteriaTempTable TABLE (
   filterName nVarchar(300),
   filterValue nVarchar(300))


 /* [comment omitted] */
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)


  SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'
  SELECT @workGroup = filterValue from @criteriaTempTable WHERE filterName = N'<literal:2>'

  IF(@workGroup =N'<literal:3>')
	SET @workGroup = NULL;
 	
  SELECT N'<literal:4>' AS CHARTDATA_MonitorWorkType, CATEGORY = CASE WHEN  WORK_INSTRUCTION.WORK_TYPE IS NULL THEN dbo.RSCMfn_RtrvResource(N'<literal:5>',N'<literal:6>',@culture) ELSE  WORK_INSTRUCTION.WORK_TYPE END,
												COUNT(DISTINCT WORK_INSTRUCTION.WORK_UNIT) AS DATA, 
												DESCRIPTION = CASE WHEN  WORK_INSTRUCTION.WORK_TYPE IS NULL THEN NULL ELSE  WORK_TYPE.DESCRIPTION END,
												N'<literal:7>' AS XAXISTITLE, N'<literal:8>' AS YAXISTITLE, 2 AS NextDrillDownLevel, N'<literal:9>' AS CHARTTITLE FROM WORK_INSTRUCTION LEFT OUTER JOIN WORK_TYPE ON WORK_TYPE.WORK_TYPE = WORK_INSTRUCTION.WORK_TYPE
  WHERE (WORK_INSTRUCTION.FROM_WHS =@warehouse OR WORK_INSTRUCTION.TO_WHS=@warehouse )
   AND ((@workGroup IS NULL AND WORK_INSTRUCTION.WORK_GROUP IS NULL) OR WORK_INSTRUCTION.WORK_GROUP =@workGroup) 
   AND WORK_INSTRUCTION.CONDITION != N'<literal:10>' AND WORK_INSTRUCTION.INSTRUCTION_TYPE =N'<literal:11>' GROUP BY WORK_INSTRUCTION.WORK_TYPE, WORk_TYPE.DESCRIPTION
   ORDER BY DATA DESC

   



   /* [comment omitted] */

 DECLARE @TOTAL_WORKUNIT INT=0,@TOTAL_INTERNAL_INSTRUCTION_NUM INT=0,@TOTAL_ESTIMATED_TIME NUMERIC(9,0)=0, @OPEN_INTERNAL_INSTRUCTION_NUM INT, @INPROCESS_INTERNAL_INSTRUCTION_NUM INT, @CLOSED_INTERNAL_INSTRUCTION_NUM INT;

   SELECT  @TOTAL_WORKUNIT = SUM(WORK.WORK_UNIT_COUNT),
		   @TOTAL_INTERNAL_INSTRUCTION_NUM =SUM(WORK.INSTRUCTION_NUMS_COUNT) ,
		   @TOTAL_ESTIMATED_TIME =ISNULL(SUM(WORK.ESTIMATED_TIMES), 0) , 
		   @OPEN_INTERNAL_INSTRUCTION_NUM = SUM(CASE WHEN WORK.CONDITION = N'<literal:12>' THEN WORK.INSTRUCTION_NUMS_COUNT ELSE 0 END), 
		   @INPROCESS_INTERNAL_INSTRUCTION_NUM = SUM(CASE WHEN WORK.CONDITION = N'<literal:13>' THEN WORK.INSTRUCTION_NUMS_COUNT ELSE 0 END)
	FROM(
		SELECT COUNT(DISTINCT WORK_UNIT) AS WORK_UNIT_COUNT, COUNT(INTERNAL_INSTRUCTION_NUM) AS INSTRUCTION_NUMS_COUNT, ISNULL(SUM(ESTIMATED_TIME), 0) AS ESTIMATED_TIMES, CONDITION FROM WORK_INSTRUCTION WHERE
			INSTRUCTION_TYPE =  N'<literal:14>'  AND WORK_INSTRUCTION.CONDITION != N'<literal:15>' AND (FROM_WHS =@WAREHOUSE OR TO_WHS=@warehouse  ) AND  ((@workGroup IS NULL AND WORK_GROUP IS NULL) OR WORK_GROUP =@workGroup)  GROUP BY CONDITION
			)WORK

	SELECT @CLOSED_INTERNAL_INSTRUCTION_NUM = COUNT(INTERNAL_INSTRUCTION_NUM)
	FROM WORK_INSTRUCTION_VIEW
		 WHERE  INSTRUCTION_TYPE =  N'<literal:16>'  AND (FROM_WHS =@warehouse OR TO_WHS=@warehouse ) AND
		 ((@workGroup IS NULL AND WORK_GROUP IS NULL) OR WORK_GROUP =@workGroup)	  
		  AND CONDITION =N'<literal:17>'
		  AND  DATE_TIME_STAMP >=DATEADD(HOUR, -1, GETUTCDATE())

   
   SELECT top 1 N'<literal:18>' AS N'<literal:19>', @TOTAL_WORKUNIT AS N'<literal:20>';
   SELECT top 1 N'<literal:21>' AS N'<literal:22>', @TOTAL_INTERNAL_INSTRUCTION_NUM AS N'<literal:23>';
   SELECT top 1 N'<literal:24>' AS N'<literal:25>', @TOTAL_ESTIMATED_TIME AS N'<literal:26>';
   SELECT top 1 N'<literal:27>' AS N'<literal:28>', @OPEN_INTERNAL_INSTRUCTION_NUM AS N'<literal:29>' ;	
   SELECT top 1 N'<literal:30>' AS N'<literal:31>', @INPROCESS_INTERNAL_INSTRUCTION_NUM AS N'<literal:32>' ;
   SELECT top 1 N'<literal:33>' AS N'<literal:34>',  @CLOSED_INTERNAL_INSTRUCTION_NUM AS N'<literal:35>' ;
   
   /* [comment omitted] */       

    If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)