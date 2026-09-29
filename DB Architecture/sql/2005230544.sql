-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE PROCEDURE RCPT_MonitorReceiptsDatesChartData
@filterCriteria NVARCHAR(MAX),
@culture NVARCHAR(10) 
AS

Set NoCount ON
	DECLARE @warehouse as nVarchar(50);
	DECLARE @criteriaTempTable TABLE (
   filterName nVarchar(300),
   filterValue nVarchar(300))
    
   INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)
   
   SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'

   DECLARE @wareHouseDate DATETIME;
   SELECT @wareHouseDate= dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE());


/* [comment omitted] */
	DECLARE @CATEGORY_COUNT table(CATEGORY_NAME nvarchar(20),VALUE numeric(10));
	DECLARE @PAST_COUNT numeric(10);
	DECLARE @TODAY_COUNT numeric(10);
	DECLARE @TOM_COUNT numeric(10);
	DECLARE @WEEK_COUNT numeric(10);
	DECLARE @MON_COUNT numeric(10);
	DECLARE @FUTURE_COUNT numeric(10);
		  
   SET @PAST_COUNT=(SELECT COUNT(RECEIPT_DATE) from RECEIPT_HEADER WHERE CONVERT(DATE,RECEIPT_DATE) < (SELECT CONVERT(DATE,@wareHouseDate)) AND warehouse=@warehouse  AND CLOSE_DATE IS NULL );
   SET @TODAY_COUNT=(SELECT COUNT(RECEIPT_DATE) from RECEIPT_HEADER WHERE CONVERT(DATE,RECEIPT_DATE) = (SELECT CONVERT(DATE,@wareHouseDate)) AND warehouse=@warehouse  AND CLOSE_DATE IS NULL);
   SET @TOM_COUNT=(SELECT COUNT(RECEIPT_DATE) from RECEIPT_HEADER WHERE CONVERT(DATE,RECEIPT_DATE) = (SELECT CONVERT(DATE,@wareHouseDate+1)) AND warehouse=@warehouse  AND CLOSE_DATE IS NULL);
   
   SET @WEEK_COUNT=(SELECT COUNT(RECEIPT_DATE) from RECEIPT_HEADER WHERE (DATEPART(WK,RECEIPT_DATE) = (DATEPART(WK,@wareHouseDate)) 
                    AND DATEPART(yy, RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))
					AND warehouse=@warehouse  AND CLOSE_DATE IS NULL);
   SET @MON_COUNT=(SELECT COUNT(RECEIPT_DATE) from RECEIPT_HEADER WHERE (DATEPART(MM,RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
                    AND DATEPART(yy, RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))
					AND warehouse=@warehouse  AND CLOSE_DATE IS NULL);
   SET @FUTURE_COUNT=(SELECT COUNT(RECEIPT_DATE) from RECEIPT_HEADER WHERE CONVERT(DATE,RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate))                   
				   AND warehouse=@warehouse  AND CLOSE_DATE IS NULL);

   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'<literal:2>',@PAST_COUNT);
   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'<literal:3>',@TODAY_COUNT);
   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'<literal:4>',@TOM_COUNT);
   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'<literal:5>',@WEEK_COUNT);
   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'<literal:6>',@MON_COUNT);
   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'<literal:7>',@FUTURE_COUNT);
/* [comment omitted] */

 /* [comment omitted] */ 
	SELECT N'<literal:8>' AS CHARTDATA_DATASOURCE, 
	CATEGORY_NAME as CATEGORY,
	VALUE as DATA,
	DESCRIPTION = N'<literal:9>',
	N'<literal:10>' AS XAXISTITLE, 
	N'<literal:11>' AS YAXISTITLE, 
	1 AS NextDrillDownLevel, 
	N'<literal:12>' AS CHARTTITLE
	FROM @CATEGORY_COUNT 
  /* [comment omitted] */ 


/* [comment omitted] */

Declare @totalReceipts numeric;
Declare @totalRecLines numeric;
Declare @totalRecValue numeric;

SELECT @totalReceipts= COUNT(INTERNAL_RECEIPT_NUM),
       @totalRecLines= SUM(TOTAL_LINES), 
       @totalRecValue= SUM(TOTAL_VALUE)
	   FROM RECEIPT_HEADER WHERE WAREHOUSE = @warehouse AND CLOSE_DATE IS NULL;


/* [comment omitted] */
SELECT 
TOP 1 N'<literal:13>' AS SUMMARYTILE_TOTAL_RECEIPTS,
       @totalReceipts AS TOTAL_RECEIPTS; 

/* [comment omitted] */
SELECT 
TOP 1 N'<literal:14>' AS SUMMARYTILE_TOTAL_REC_LINES,
     @totalRecLines AS TOTAL_REC_LINES;


/* [comment omitted] */
SELECT 
TOP 1 N'<literal:15>' AS SUMMARYTILE_TOTAL_REC_VALUE, 
@totalRecValue AS TOTAL_REC_VALUE; 
 


/* [comment omitted] */
