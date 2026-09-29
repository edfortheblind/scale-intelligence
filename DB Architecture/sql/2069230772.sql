-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE RCPT_MonitorReceiptsVendorNamesChartData
@filterCriteria NVARCHAR(MAX),
@culture NVARCHAR(10) 
AS
Set NoCount ON
	DECLARE @warehouse as nVarchar(50);
	DECLARE @receiptType as nVarchar(50);
	DECLARE @Date_Category nvarchar(50);
	DECLARE @RECT_VALUE numeric(20,10);
	DECLARE @RecType nvarchar(50);
	DECLARE @TOTAL_RECEIPTS numeric(9,0);
	DECLARE @TOTAL_REC_LINES numeric(9,0);
	DECLARE @criteriaTempTable TABLE (
    filterName nVarchar(300),
    filterValue nVarchar(300))
    
   INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)
   
   SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'
   SELECT @Date_Category = filterValue from @criteriaTempTable WHERE filterName = N'<literal:2>'
   SELECT @receiptType = filterValue from @criteriaTempTable WHERE filterName = N'<literal:3>'
  
   DECLARE @wareHouseDate DATETIME;
   SELECT @wareHouseDate= dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE());
   
   /* [comment omitted] */ 
   SELECT N'<literal:4>' AS CHARTDATA_DATASOURCE_TYPE, 
    CATEGORY = CASE WHEN (SOURCE_NAME) IS NULL 
	                THEN dbo.RSCMfn_RtrvResource(N'<literal:5>',N'<literal:6>',@culture)
	  ELSE (SOURCE_NAME) END,
      COUNT(DISTINCT(INTERNAL_RECEIPT_NUM)) AS DATA,       
       DESCRIPTION = N'<literal:7>',
       N'<literal:8>' AS XAXISTITLE, 
       N'<literal:9>' AS YAXISTITLE, 
       3 AS NextDrillDownLevel, 
       N'<literal:10>' AS CHARTTITLE
       FROM METADATA_INSIGHT_RECEIPT_VIEW  where warehouse=@warehouse AND CLOSE_DATE IS NULL  	  
	   AND RECEIPT_ID_TYPE=@receiptType
	   AND(CASE 
       WHEN @Date_Category = N'<literal:11>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'<literal:12>'  
	        
       WHEN @Date_Category =N'<literal:13>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'<literal:14>'

       WHEN @Date_Category = N'<literal:15>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'<literal:16>' 
	         
       WHEN @Date_Category =N'<literal:17>' AND ( CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) >= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 0)
                                       AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) <= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 6)) THEN N'<literal:18>'

       WHEN @Date_Category = N'<literal:19>' AND (DATEPART(MM,RECEIPT_HEADER_RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
                                         AND DATEPART(yy, RECEIPT_HEADER_RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'<literal:20>' 
							        
       WHEN @Date_Category =N'<literal:21>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'<literal:22>'
       
	   ELSE N'<literal:23>'
       END =N'<literal:24>')
       GROUP BY SOURCE_NAME

    /* [comment omitted] */ 
   
   /* [comment omitted] */

/* [comment omitted] */
SELECT 
@TOTAL_RECEIPTS=COUNT(Distinct INTERNAL_RECEIPT_NUM),
@TOTAL_REC_LINES=count(DISTINCT  INTERNAL_RECEIPT_LINE_NUM)
-- [comment omitted]
-- [comment omitted]
FROM METADATA_INSIGHT_RECEIPT_VIEW 
where warehouse=@warehouse AND CLOSE_DATE IS NULL 
AND RECEIPT_ID_TYPE=@receiptType

AND (  CASE 
       WHEN @Date_Category = N'<literal:25>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'<literal:26>'  
	        
       WHEN @Date_Category =N'<literal:27>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'<literal:28>'

       WHEN @Date_Category = N'<literal:29>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'<literal:30>' 
	         
       WHEN @Date_Category =N'<literal:31>' AND ( CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) >= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 0)
                                       AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) <= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 6)) THEN N'<literal:32>'

       WHEN @Date_Category = N'<literal:33>' AND (DATEPART(MM,RECEIPT_HEADER_RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
                                         AND DATEPART(yy, RECEIPT_HEADER_RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'<literal:34>' 
							        
       WHEN @Date_Category =N'<literal:35>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'<literal:36>'
       
	   ELSE N'<literal:37>'
       END =N'<literal:38>')

/* [comment omitted] */
SET @RECT_VALUE=(SELECT SUM(TOTAL_VALUE) from RECEIPT_HEADER where warehouse=@warehouse AND CLOSE_DATE IS NULL
AND RECEIPT_ID_TYPE=@receiptType
 AND ( CASE 
       WHEN @Date_Category = N'<literal:39>' AND CONVERT(DATE,RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'<literal:40>'  
	        
       WHEN @Date_Category =N'<literal:41>' AND CONVERT(DATE,RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'<literal:42>'

       WHEN @Date_Category = N'<literal:43>' AND CONVERT(DATE,RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'<literal:44>' 
	         
      WHEN @Date_Category =N'<literal:45>' AND ( CONVERT(DATE,RECEIPT_DATE) >= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 0)
                                       AND CONVERT(DATE,RECEIPT_DATE) <= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 6)) THEN N'<literal:46>'

       WHEN @Date_Category = N'<literal:47>' AND (DATEPART(MM,RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
									     AND DATEPART(yy, RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'<literal:48>' 
							        
       WHEN @Date_Category =N'<literal:49>' AND CONVERT(DATE,RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'<literal:50>'
       
	   ELSE N'<literal:51>'
       END =N'<literal:52>'))



SELECT
TOP 1 N'<literal:53>' AS SUMMARYTILE_TOTAL_RECEIPTS,
@TOTAL_RECEIPTS  AS TOTAL_RECEIPTS 

SELECT 
TOP 1 N'<literal:54>' AS SUMMARYTILE_TOTAL_REC_LINES,
@TOTAL_REC_LINES AS TOTAL_REC_LINES 

SELECT 
TOP 1 N'<literal:55>' AS SUMMARYTILE_TOTAL_REC_VALUE, 
@RECT_VALUE AS TOTAL_REC_VALUE; 
   
   /* [comment omitted] */
   
   /* [comment omitted] */
