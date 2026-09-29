-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










CREATE PROCEDURE RCPT_MonitorReceiptsTypesChartData
@filterCriteria NVARCHAR(MAX),
@culture NVARCHAR(10) 
AS
Set NoCount ON
	DECLARE @warehouse as nVarchar(50);
	DECLARE @Date_Category nvarchar(50);
	DECLARE @RECT_VALUE numeric(20,10);
	DECLARE @TOTAL_RECEIPTS numeric(9,0);
	DECLARE @TOTAL_REC_LINES numeric(9,0);

	DECLARE @criteriaTempTable TABLE (
    filterName nVarchar(300),
    filterValue nVarchar(300))
    
   INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)
   
   SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'
   SELECT @Date_Category = filterValue from @criteriaTempTable WHERE filterName = N'<literal:2>'

    DECLARE @wareHouseDate DATETIME;
   SELECT @wareHouseDate= dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE());

    /* [comment omitted] */ 
SELECT N'<literal:3>' AS CHARTDATA_DATASOURCE_TYPE, 
       CATEGORY = RECEIPT_ID_TYPE,
	   COUNT(Distinct INTERNAL_RECEIPT_NUM) AS DATA,
       DESCRIPTION = N'<literal:4>',
       N'<literal:5>' AS XAXISTITLE, 
       N'<literal:6>' AS YAXISTITLE, 
       2 AS NextDrillDownLevel, 
       N'<literal:7>' AS CHARTTITLE
       FROM METADATA_INSIGHT_RECEIPT_VIEW  where warehouse=@warehouse AND CLOSE_DATE IS NULL  
	   
	   AND  CASE 
       WHEN @Date_Category = N'<literal:8>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'<literal:9>'  
	        
       WHEN @Date_Category =N'<literal:10>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'<literal:11>'

       WHEN @Date_Category = N'<literal:12>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'<literal:13>' 
	         
       WHEN @Date_Category =N'<literal:14>' AND ( CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) >= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 0)
                                       AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) <= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 6)) THEN N'<literal:15>'

       WHEN @Date_Category = N'<literal:16>' AND (DATEPART(MM,RECEIPT_HEADER_RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
                                         AND DATEPART(yy, RECEIPT_HEADER_RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'<literal:17>' 
							        
       WHEN @Date_Category =N'<literal:18>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'<literal:19>'
       
	   ELSE N'<literal:20>'
       END =N'<literal:21>'
       GROUP BY RECEIPT_ID_TYPE
	/* [comment omitted] */ 
	/* [comment omitted] */	

/* [comment omitted] */	 
SELECT 
@TOTAL_RECEIPTS=COUNT(Distinct INTERNAL_RECEIPT_NUM),
@TOTAL_REC_LINES=count(DISTINCT  INTERNAL_RECEIPT_LINE_NUM)
FROM METADATA_INSIGHT_RECEIPT_VIEW where warehouse=@warehouse  AND CLOSE_DATE IS NULL 
AND    CASE 
       WHEN @Date_Category = N'<literal:22>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'<literal:23>'  
	        
       WHEN @Date_Category =N'<literal:24>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'<literal:25>'

       WHEN @Date_Category = N'<literal:26>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'<literal:27>' 
	         
         WHEN @Date_Category =N'<literal:28>' AND ( CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) >= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 0)
                                       AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) <= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 6)) THEN N'<literal:29>'

       WHEN @Date_Category = N'<literal:30>' AND (DATEPART(MM,RECEIPT_HEADER_RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
                                         AND DATEPART(yy, RECEIPT_HEADER_RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'<literal:31>' 
							        
       WHEN @Date_Category =N'<literal:32>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'<literal:33>'
       
	   ELSE N'<literal:34>'
       END =N'<literal:35>'

SET @RECT_VALUE=(SELECT SUM(TOTAL_VALUE)from RECEIPT_HEADER where warehouse=@warehouse  AND CLOSE_DATE IS NULL 
 AND (CASE 
       WHEN @Date_Category = N'<literal:36>' AND CONVERT(DATE,RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'<literal:37>'  
	        
       WHEN @Date_Category =N'<literal:38>' AND CONVERT(DATE,RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'<literal:39>'

       WHEN @Date_Category = N'<literal:40>' AND CONVERT(DATE,RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'<literal:41>' 
	         
       WHEN @Date_Category =N'<literal:42>' AND ( CONVERT(DATE,RECEIPT_DATE) >= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 0)
                                       AND CONVERT(DATE,RECEIPT_DATE) <= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 6)) THEN N'<literal:43>'

       WHEN @Date_Category = N'<literal:44>' AND (DATEPART(MM,RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
                                         AND DATEPART(yy, RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'<literal:45>' 
							        
       WHEN @Date_Category =N'<literal:46>' AND CONVERT(DATE,RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'<literal:47>'
       
	   ELSE N'<literal:48>'
       END =N'<literal:49>'))

SELECT 
TOP 1 N'<literal:50>' AS SUMMARYTILE_TOTAL_RECEIPTS,
@TOTAL_RECEIPTS AS TOTAL_RECEIPTS; 


SELECT 
TOP 1 N'<literal:51>' AS SUMMARYTILE_TOTAL_REC_LINES, 
@TOTAL_REC_LINES AS TOTAL_REC_LINES; 


SELECT 
TOP 1 N'<literal:52>' AS SUMMARYTILE_TOTAL_REC_VALUE, 
@RECT_VALUE AS TOTAL_REC_VALUE; 

/* [comment omitted] */
