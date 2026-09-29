-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */











CREATE PROCEDURE WRK_MonitorCustomerShipToChartData
@filterCriteria NVARCHAR(MAX),
@culture NVARCHAR(10)
        
AS
    SET NOCOUNT ON
	DECLARE @warehouse as NVARCHAR(50);
	DECLARE @customerCat1 as NVARCHAR(50);
	DECLARE @customer as NVARCHAR(50);	
  
	DECLARE @criteriaTempTable TABLE (
   filterName NVARCHAR(300),
   filterValue NVARCHAR(300))

 /* [comment omitted] */
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)

  SELECT @warehouse = filterValue FROM @criteriaTempTable WHERE filterName = N'<literal:1>'
  SELECT @customerCat1 = filterValue from @criteriaTempTable WHERE filterName = N'<literal:2>'
  SELECT @customer = filterValue from @criteriaTempTable WHERE filterName = N'<literal:3>'
  DECLARE @Unassign NVARCHAR(2000);
  SET @Unassign=  dbo.RSCMfn_RtrvResource(N'<literal:4>',N'<literal:5>',@culture)

   IF(@customerCat1 = @Unassign)
	SET @customerCat1 = NULL;

   IF(@customer = @Unassign)
	SET @customer = NULL;

/* [comment omitted] */

SELECT N'<literal:6>' AS CHARTDATA_MonitorCustomerCategory, 
CATEGORY = CASE WHEN  WI_SH.SHIP_TO_NAME IS NULL THEN @Unassign ELSE  WI_SH.SHIP_TO_NAME END,
COUNT(DISTINCT WI_SH.WORK_UNIT) AS N'<literal:7>' ,
DESCRIPTION = CASE WHEN  WI_SH.SHIP_TO_NAME IS NULL THEN @Unassign ELSE WI_SH.SHIP_TO_NAME END,
N'<literal:8>' AS XAXISTITLE, 
N'<literal:9>' AS YAXISTITLE, 
3 AS NextDrillDownLevel, 
N'<literal:10>' AS CHARTTITLE
FROM 
(
SELECT DISTINCT sh.SHIP_TO_NAME as N'<literal:11>',WI.WORK_UNIT AS N'<literal:12>',WI.INTERNAL_NUM AS N'<literal:13>'
FROM WORK_INSTRUCTION WI
INNER JOIN SHIPMENT_HEADER SH ON WI.INTERNAL_NUM=SH.INTERNAL_SHIPMENT_NUM
 WHERE WI.INTERNAL_NUM_TYPE  IN (N'<literal:14>',N'<literal:15>') AND WI.condition <> N'<literal:16>' AND (WI.FROM_WHS =@warehouse or WI.TO_WHS = @warehouse)-- [comment omitted]
AND ((@customerCat1 IS NULL AND SH.CUSTOMER_CATEGORY1 IS NULL) OR SH.CUSTOMER_CATEGORY1 =@customerCat1)   -- [comment omitted]
 AND ((@customer IS NULL AND SH.CUSTOMER_NAME IS NULL) OR SH.CUSTOMER_NAME =@customer)   -- [comment omitted]
 ) WI_SH
GROUP BY WI_SH.SHIP_TO_NAME 
ORDER BY DATA DESC

/* [comment omitted] */

/* [comment omitted] */


DECLARE @TOTAL_WORKUNIT INT=0,@TOTAL_INTERNAL_INSTRUCTION_NUM INT=0,@TOTAL_ESTIMATED_TIME NUMERIC(9,0)=0, @OPEN_INTERNAL_INSTRUCTION_NUM INT, @INPROCESS_INTERNAL_INSTRUCTION_NUM INT, @CLOSED_INTERNAL_INSTRUCTION_NUM INT;

SELECT  @TOTAL_WORKUNIT = SUM(WORK.WORK_UNIT_COUNT),
		   @TOTAL_INTERNAL_INSTRUCTION_NUM =SUM(WORK.INSTRUCTION_NUMS_COUNT) ,
		   @TOTAL_ESTIMATED_TIME =ISNULL(SUM(WORK.ESTIMATED_TIMES), 0) , 
		   @OPEN_INTERNAL_INSTRUCTION_NUM = SUM(CASE WHEN WORK.CONDITION = N'<literal:17>' THEN WORK.INSTRUCTION_NUMS_COUNT ELSE 0 END), 
		   @INPROCESS_INTERNAL_INSTRUCTION_NUM = SUM(CASE WHEN WORK.CONDITION = N'<literal:18>' THEN WORK.INSTRUCTION_NUMS_COUNT ELSE 0 END)		   
FROM(
SELECT COUNT(DISTINCT WI.WORK_UNIT) AS WORK_UNIT_COUNT,COUNT(INTERNAL_INSTRUCTION_NUM) AS INSTRUCTION_NUMS_COUNT,ISNULL(SUM(WI.ESTIMATED_TIME), 0) AS ESTIMATED_TIMES,WI.CONDITION 
FROM WORK_INSTRUCTION WI INNER JOIN SHIPMENT_HEADER SH ON WI.INTERNAL_NUM=SH.INTERNAL_SHIPMENT_NUM
WHERE WI.INTERNAL_NUM_TYPE  IN (N'<literal:19>',N'<literal:20>') AND WI.CONDITION <> N'<literal:21>' AND (WI.FROM_WHS =@warehouse or WI.TO_WHS = @warehouse)   -- [comment omitted]
AND ((@customerCat1 IS NULL AND SH.CUSTOMER_CATEGORY1 IS NULL) OR SH.CUSTOMER_CATEGORY1 =@customerCat1)   -- [comment omitted]
AND ((@customer IS NULL AND SH.CUSTOMER_NAME IS NULL) OR SH.CUSTOMER_NAME =@customer)    -- [comment omitted]
GROUP BY CONDITION
)WORK

SELECT @CLOSED_INTERNAL_INSTRUCTION_NUM = COUNT(INTERNAL_INSTRUCTION_NUM)
	FROM WORK_INSTRUCTION_VIEW WI INNER JOIN SHIPMENT_HEADER SH ON WI.INTERNAL_NUM=SH.INTERNAL_SHIPMENT_NUM
    WHERE WI.INTERNAL_NUM_TYPE  IN (N'<literal:22>',N'<literal:23>') AND (WI.FROM_WHS =@warehouse or WI.TO_WHS = @warehouse)  -- [comment omitted]
	AND ((@customerCat1 IS NULL AND SH.CUSTOMER_CATEGORY1 IS NULL) OR SH.CUSTOMER_CATEGORY1 =@customerCat1)   -- [comment omitted]
	AND ((@customer IS NULL AND SH.CUSTOMER_NAME IS NULL) OR SH.CUSTOMER_NAME =@customer)    -- [comment omitted]
    AND WI.CONDITION =N'<literal:24>'
	AND  WI.DATE_TIME_STAMP >=DATEADD(HOUR, -1, GETUTCDATE()) GROUP BY CONDITION
 
 SELECT TOP 1 N'<literal:25>' AS N'<literal:26>', @TOTAL_WORKUNIT AS N'<literal:27>';
 SELECT TOP 1 N'<literal:28>' AS N'<literal:29>', @TOTAL_INTERNAL_INSTRUCTION_NUM AS N'<literal:30>';
 SELECT TOP 1 N'<literal:31>' AS N'<literal:32>', @TOTAL_ESTIMATED_TIME AS N'<literal:33>';
 SELECT TOP 1 N'<literal:34>' AS N'<literal:35>', @OPEN_INTERNAL_INSTRUCTION_NUM AS N'<literal:36>' ;	
 SELECT TOP 1 N'<literal:37>' AS N'<literal:38>', @INPROCESS_INTERNAL_INSTRUCTION_NUM AS N'<literal:39>' ;
 SELECT TOP 1 N'<literal:40>' AS N'<literal:41>',  @CLOSED_INTERNAL_INSTRUCTION_NUM AS N'<literal:42>' ;

/* [comment omitted] */
   
                 
 IF @@ERROR <> 0 GOTO ERRORHANDLER
 SET NOCOUNT OFF
 RETURN(0)
  
ERRORHANDLER:
    RETURN(@@ERROR)
