/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	182444	| AU	| 08/09/16	| Created
	208696	| MHM	| 09/13/17	| Added CLOSE_DATE check.
	219206	| MHM   | 02/27/18  | Modified for warehouse offset.
	219623	| NRJ	| 02/23/18	| Modified such that totals will be calculated based on the filter criteria.
    
*/

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
   
   SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'warehouse'

   DECLARE @wareHouseDate DATETIME;
   SELECT @wareHouseDate= dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE());


/*temp table to COUNT*/
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

   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'Past due',@PAST_COUNT);
   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'Today',@TODAY_COUNT);
   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'Tomorrow',@TOM_COUNT);
   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'This week',@WEEK_COUNT);
   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'This month',@MON_COUNT);
   INSERT into @CATEGORY_COUNT(CATEGORY_NAME,VALUE)values(N'Future',@FUTURE_COUNT);
/*temp table to COUNT */

 /* CHART START  COLUMN1*/ 
	SELECT N'CHARTDATA_DATASOURCE' AS CHARTDATA_DATASOURCE, 
	CATEGORY_NAME as CATEGORY,
	VALUE as DATA,
	DESCRIPTION = N'DESCRIPTION',
	N'RECEIPTDATE' AS XAXISTITLE, 
	N'RECEIPTS' AS YAXISTITLE, 
	1 AS NextDrillDownLevel, 
	N'RECBYRECDATE' AS CHARTTITLE
	FROM @CATEGORY_COUNT 
  /* CHART END  COLUMN1*/ 


/* SUMMARY TILES START */

Declare @totalReceipts numeric;
Declare @totalRecLines numeric;
Declare @totalRecValue numeric;

SELECT @totalReceipts= COUNT(INTERNAL_RECEIPT_NUM),
       @totalRecLines= SUM(TOTAL_LINES), 
       @totalRecValue= SUM(TOTAL_VALUE)
	   FROM RECEIPT_HEADER WHERE WAREHOUSE = @warehouse AND CLOSE_DATE IS NULL;


/* TILE 1*/
SELECT 
TOP 1 N'SUMMARYTILE_TOTAL_RECEIPTS' AS SUMMARYTILE_TOTAL_RECEIPTS,
       @totalReceipts AS TOTAL_RECEIPTS; 

/* TILE 2*/
SELECT 
TOP 1 N'SUMMARYTILE_TOTAL_REC_LINES' AS SUMMARYTILE_TOTAL_REC_LINES,
     @totalRecLines AS TOTAL_REC_LINES;


/* TILE 3*/
SELECT 
TOP 1 N'SUMMARYTILE_TOTAL_REC_VALUE' AS SUMMARYTILE_TOTAL_REC_VALUE, 
@totalRecValue AS TOTAL_REC_VALUE; 
 


/* SUMMARY TILES END */
