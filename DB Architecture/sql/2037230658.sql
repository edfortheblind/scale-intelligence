-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE RCPT_MonitorReceiptsPoChartData
@filterCriteria NVARCHAR(MAX),
@culture NVARCHAR(10) 
AS
Set NoCount ON
	DECLARE @warehouse as nVarchar(50);
	DECLARE @receiptType as nVarchar(50);
	DECLARE @Date_Category nvarchar(50);
	DECLARE @vendor as nVarchar(50);
	DECLARE @RECT_VALUE numeric(20,10);
	DECLARE @TotalVALUE numeric(20,10);
	DECLARE @TotalLineNo numeric(20,10);
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
   SELECT @vendor = filterValue from @criteriaTempTable WHERE filterName = N'<literal:4>'
  
   DECLARE @wareHouseDate DATETIME;
   SELECT @wareHouseDate= dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE());


   IF(@vendor =N'<literal:5>')
	SET @vendor = null;

	/* [comment omitted] */ 


	Declare @category nvarchar(max);
	Declare @data int;
	 
SELECT @category = CASE WHEN PURCHASE_ORDER_ID IS NULL 
		                  THEN dbo.RSCMfn_RtrvResource(N'<literal:6>',N'<literal:7>',@culture) 
						  ELSE (PURCHASE_ORDER_ID) END, 
		@data =   isnull(count(Distinct INTERNAL_RECEIPT_NUM), 0)	  
  from METADATA_INSIGHT_RECEIPT_VIEW
  WHERE warehouse=@warehouse AND CLOSE_DATE IS NULL
		AND RECEIPT_ID_TYPE=@receiptType
		AND ((@vendor is null AND SOURCE_NAME is null )OR SOURCE_NAME=@vendor) AND 
  CASE 
       WHEN @Date_Category = N'<literal:8>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'<literal:9>'  
	        
       WHEN @Date_Category =N'<literal:10>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'<literal:11>'

       WHEN @Date_Category = N'<literal:12>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'<literal:13>' 
	         
       WHEN @Date_Category =N'<literal:14>' AND (DATEPART(WK,RECEIPT_HEADER_RECEIPT_DATE) = (DATEPART(WK,@wareHouseDate)) 
                                      AND DATEPART(yy, RECEIPT_HEADER_RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'<literal:15>'

       WHEN @Date_Category = N'<literal:16>' AND (DATEPART(MM,RECEIPT_HEADER_RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
                                         AND DATEPART(yy, RECEIPT_HEADER_RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'<literal:17>' 
							        
       WHEN @Date_Category =N'<literal:18>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'<literal:19>'
        
	   ELSE N'<literal:20>'
       END =N'<literal:21>'	    
	   GROUP BY PURCHASE_ORDER_ID

SELECT N'<literal:22>' AS CHARTDATA_DATASOURCE_TYPE, 
       CATEGORY = ISNULL(@category, dbo.RSCMfn_RtrvResource(N'<literal:23>',N'<literal:24>',@culture)),	
	   DATA = ISNULL(@data,0),
       DESCRIPTION = N'<literal:25>',
	   N'<literal:26>' AS XAXISTITLE, 
	   N'<literal:27>' AS YAXISTITLE,       
       -1 AS NextDrillDownLevel, 
       N'<literal:28>' AS CHARTTITLE


	/* [comment omitted] */ 

	/* [comment omitted] */


	/* [comment omitted] */
SELECT 
@TOTAL_RECEIPTS=COUNT(Distinct INTERNAL_RECEIPT_NUM),
@TOTAL_REC_LINES=count(DISTINCT  INTERNAL_RECEIPT_LINE_NUM)
FROM METADATA_INSIGHT_RECEIPT_VIEW 
where warehouse=@warehouse AND CLOSE_DATE IS NULL 
AND RECEIPT_ID_TYPE=@receiptType
AND ((@vendor is null AND SOURCE_NAME is null )OR SOURCE_NAME=@vendor)
AND (  CASE 
       WHEN @Date_Category = N'<literal:29>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'<literal:30>'  
	        
       WHEN @Date_Category =N'<literal:31>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'<literal:32>'

       WHEN @Date_Category = N'<literal:33>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'<literal:34>' 
	         
       WHEN @Date_Category =N'<literal:35>' AND ( CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) >= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 0)
                                       AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) <= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 6)) THEN N'<literal:36>'

       WHEN @Date_Category = N'<literal:37>' AND (DATEPART(MM,RECEIPT_HEADER_RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
                                         AND DATEPART(yy, RECEIPT_HEADER_RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'<literal:38>' 
							        
       WHEN @Date_Category =N'<literal:39>' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'<literal:40>'
       
	   ELSE N'<literal:41>'
       END =N'<literal:42>')

/* [comment omitted] */
SELECT @RECT_VALUE = SUM(TOTAL_VALUE)
FROM RECEIPT_HEADER 		
		WHERE warehouse=@warehouse AND CLOSE_DATE IS NULL
		AND RECEIPT_ID_TYPE=@receiptType
		AND ((@vendor is null AND SOURCE_NAME is null ) OR SOURCE_NAME=@vendor)
 	   	AND CASE 
       WHEN @Date_Category = N'<literal:43>' AND CONVERT(DATE,RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'<literal:44>'  
	        
       WHEN @Date_Category =N'<literal:45>' AND CONVERT(DATE,RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'<literal:46>'

       WHEN @Date_Category = N'<literal:47>' AND CONVERT(DATE,RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'<literal:48>' 
	         
       WHEN @Date_Category =N'<literal:49>' AND (DATEPART(WK,RECEIPT_DATE) = (DATEPART(WK,@wareHouseDate)) 
                                      AND DATEPART(yy, RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'<literal:50>'

       WHEN @Date_Category = N'<literal:51>' AND (DATEPART(MM,RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
                                         AND DATEPART(yy, RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'<literal:52>' 
							        
       WHEN @Date_Category =N'<literal:53>' AND CONVERT(DATE,RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'<literal:54>'
        
	   ELSE N'<literal:55>'
       END =N'<literal:56>'



SELECT TOP 1 N'<literal:57>' AS SUMMARYTILE_TOTAL_RECEIPTS, @TOTAL_RECEIPTS AS TOTAL_RECEIPTS;
SELECT TOP 1 N'<literal:58>' AS SUMMARYTILE_TOTAL_RECEIPTS, @TOTAL_REC_LINES AS TOTAL_REC_LINES;
SELECT TOP 1 N'<literal:59>' AS SUMMARYTILE_TOTAL_REC_VALUE,  @RECT_VALUE AS TOTAL_REC_VALUE; 


	 /* [comment omitted] */

