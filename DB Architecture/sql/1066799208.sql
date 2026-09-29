-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */











CREATE PROCEDURE WRK_MonitorCustomerWorkTypeChartData
@filterCriteria NVARCHAR(MAX),
@culture NVARCHAR(10)
        
AS
    SET NOCOUNT ON
	DECLARE @warehouse as NVARCHAR(50);
	DECLARE @customerCat1 as NVARCHAR(50);
	DECLARE @customer as NVARCHAR(50);
	DECLARE @shipTo as NVARCHAR(50);	
	DECLARE @workGroup as NVARCHAR(25);
  
	DECLARE @criteriaTempTable TABLE (
   filterName NVARCHAR(300),
   filterValue NVARCHAR(300))

 /* [comment omitted] */
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)

  SELECT @warehouse = filterValue FROM @criteriaTempTable WHERE filterName = N'<literal:1>'
  SELECT @customerCat1 = filterValue from @criteriaTempTable WHERE filterName = N'<literal:2>'
  SELECT @customer = filterValue from @criteriaTempTable WHERE filterName = N'<literal:3>'
  SELECT @shipTo = filterValue from @criteriaTempTable WHERE filterName = N'<literal:4>'
  SELECT @workGroup = filterValue from @criteriaTempTable WHERE filterName = N'<literal:5>'
  DECLARE @Unassign NVARCHAR(2000);
  SET @Unassign=  dbo.RSCMfn_RtrvResource(N'<literal:6>',N'<literal:7>',@culture)

   IF(@customerCat1 = @Unassign)
	SET @customerCat1 = NULL;

  IF(@customer = @Unassign)
	SET @customer = NULL;

  IF(@shipTo = @Unassign)
	SET @shipTo = NULL;

  IF(@workGroup = @Unassign)
	SET @workGroup = NULL; 


/* [comment omitted] */

SELECT N'<literal:8>' AS CHARTDATA_MonitorCustomerCategory, 
CATEGORY = CASE WHEN  WI_SH.WORK_TYPE IS NULL THEN @Unassign ELSE  WI_SH.WORK_TYPE END,
COUNT(WI_SH.WORK_UNIT) AS N'<literal:9>',
DESCRIPTION = CASE WHEN  WI_SH.WORK_TYPE IS NULL THEN @Unassign ELSE WI_SH.WORK_TYPE END,
N'<literal:10>' AS XAXISTITLE, 
N'<literal:11>' AS YAXISTITLE, 
-1 AS NextDrillDownLevel,    -- [comment omitted]
N'<literal:12>' AS CHARTTITLE
FROM 
(
SELECT DISTINCT WI.WORK_TYPE as N'<literal:13>',WI.WORK_UNIT AS N'<literal:14>',WI.INTERNAL_NUM AS N'<literal:15>'
FROM WORK_INSTRUCTION WI
INNER JOIN SHIPMENT_HEADER SH ON WI.INTERNAL_NUM=SH.INTERNAL_SHIPMENT_NUM
 WHERE WI.INTERNAL_NUM_TYPE  IN (N'<literal:16>',N'<literal:17>')  AND WI.condition <> N'<literal:18>' AND (WI.FROM_WHS = @warehouse or WI.TO_WHS = @warehouse)
 AND ((@customerCat1 IS NULL AND SH.CUSTOMER_CATEGORY1 IS NULL) OR SH.CUSTOMER_CATEGORY1 =@customerCat1)   -- [comment omitted]
 AND ((@customer IS NULL AND SH.CUSTOMER_NAME IS NULL) OR SH.CUSTOMER_NAME =@customer)   -- [comment omitted]
 AND ((@shipTo IS NULL AND SH.SHIP_TO_NAME IS NULL) OR SH.SHIP_TO_NAME =@shipTo)   -- [comment omitted]
 AND ((@workGroup IS NULL AND WI.WORK_GROUP IS NULL) OR WI.WORK_GROUP =@workGroup)
 ) WI_SH
GROUP BY WI_SH.WORK_TYPE  
ORDER BY DATA DESC

/* [comment omitted] */

/* [comment omitted] */


DECLARE @TOTAL_WORKUNIT INT=0,@TOTAL_INTERNAL_INSTRUCTION_NUM INT=0,@TOTAL_ESTIMATED_TIME NUMERIC(9,0)=0, @OPEN_INTERNAL_INSTRUCTION_NUM INT, @INPROCESS_INTERNAL_INSTRUCTION_NUM INT, @CLOSED_INTERNAL_INSTRUCTION_NUM INT;

SELECT  @TOTAL_WORKUNIT = SUM(WORK.WORK_UNIT_COUNT),
		   @TOTAL_INTERNAL_INSTRUCTION_NUM =SUM(WORK.INSTRUCTION_NUMS_COUNT) ,
		   @TOTAL_ESTIMATED_TIME =ISNULL(SUM(WORK.ESTIMATED_TIMES), 0) , 
		   @OPEN_INTERNAL_INSTRUCTION_NUM = SUM(CASE WHEN WORK.CONDITION = N'<literal:19>' THEN WORK.INSTRUCTION_NUMS_COUNT ELSE 0 END), 
		   @INPROCESS_INTERNAL_INSTRUCTION_NUM = SUM(CASE WHEN WORK.CONDITION = N'<literal:20>' THEN WORK.INSTRUCTION_NUMS_COUNT ELSE 0 END)		   
FROM(
SELECT COUNT(DISTINCT WI.WORK_UNIT) AS WORK_UNIT_COUNT,COUNT(INTERNAL_INSTRUCTION_NUM) AS INSTRUCTION_NUMS_COUNT,ISNULL(SUM(WI.ESTIMATED_TIME), 0) AS ESTIMATED_TIMES,WI.CONDITION 
FROM WORK_INSTRUCTION WI INNER JOIN SHIPMENT_HEADER SH ON WI.INTERNAL_NUM=SH.INTERNAL_SHIPMENT_NUM
WHERE WI.INTERNAL_NUM_TYPE  IN (N'<literal:21>',N'<literal:22>') AND WI.condition <> N'<literal:23>' AND (WI.FROM_WHS =@warehouse or WI.TO_WHS = @warehouse)
AND ((@customerCat1 IS NULL AND SH.CUSTOMER_CATEGORY1 IS NULL) OR SH.CUSTOMER_CATEGORY1 =@customerCat1)   -- [comment omitted]
AND ((@customer IS NULL AND SH.CUSTOMER_NAME IS NULL) OR SH.CUSTOMER_NAME =@customer)    -- [comment omitted]
AND ((@shipTo IS NULL AND SH.SHIP_TO_NAME IS NULL) OR SH.SHIP_TO_NAME =@shipTo)    -- [comment omitted]
AND ((@workGroup IS NULL AND WI.WORK_GROUP IS NULL) OR WI.WORK_GROUP =@workGroup)
GROUP BY CONDITION
)WORK

SELECT @CLOSED_INTERNAL_INSTRUCTION_NUM = COUNT(INTERNAL_INSTRUCTION_NUM)
	FROM WORK_INSTRUCTION_VIEW WI INNER JOIN SHIPMENT_HEADER SH ON WI.INTERNAL_NUM=SH.INTERNAL_SHIPMENT_NUM
    WHERE WI.INTERNAL_NUM_TYPE  IN (N'<literal:24>',N'<literal:25>') AND  (WI.FROM_WHS =@warehouse or WI.TO_WHS = @warehouse)  -- [comment omitted]
	AND ((@customerCat1 IS NULL AND SH.CUSTOMER_CATEGORY1 IS NULL) OR SH.CUSTOMER_CATEGORY1 =@customerCat1)   -- [comment omitted]
	AND ((@customer IS NULL AND SH.CUSTOMER_NAME IS NULL) OR SH.CUSTOMER_NAME =@customer)    -- [comment omitted]
	AND ((@shipTo IS NULL AND SH.SHIP_TO_NAME IS NULL) OR SH.SHIP_TO_NAME =@shipTo)          -- [comment omitted]
    AND ((@workGroup IS NULL AND WI.WORK_GROUP IS NULL) OR WI.WORK_GROUP =@workGroup)
    AND WI.CONDITION =N'<literal:26>'
	AND  WI.DATE_TIME_STAMP >=DATEADD(HOUR, -1, GETUTCDATE()) GROUP BY CONDITION
 
 SELECT TOP 1 N'<literal:27>' AS N'<literal:28>', @TOTAL_WORKUNIT AS N'<literal:29>';
 SELECT TOP 1 N'<literal:30>' AS N'<literal:31>', @TOTAL_INTERNAL_INSTRUCTION_NUM AS N'<literal:32>';
 SELECT TOP 1 N'<literal:33>' AS N'<literal:34>', @TOTAL_ESTIMATED_TIME AS N'<literal:35>';
 SELECT TOP 1 N'<literal:36>' AS N'<literal:37>', @OPEN_INTERNAL_INSTRUCTION_NUM AS N'<literal:38>' ;	
 SELECT TOP 1 N'<literal:39>' AS N'<literal:40>', @INPROCESS_INTERNAL_INSTRUCTION_NUM AS N'<literal:41>' ;
 SELECT TOP 1 N'<literal:42>' AS N'<literal:43>',  @CLOSED_INTERNAL_INSTRUCTION_NUM AS N'<literal:44>' ;

/* [comment omitted] */
   
                 
 IF @@ERROR <> 0 GOTO ERRORHANDLER
 SET NOCOUNT OFF
 RETURN(0)
  
ERRORHANDLER:
    RETURN(@@ERROR)
