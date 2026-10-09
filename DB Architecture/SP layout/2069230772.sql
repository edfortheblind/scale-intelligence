/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	182444	| AU	| 08/09/16	| Created
	208696	| MHM	| 08/09/16	| Added CLOSE_DATE check.
	213090  | MHM   | 09/18/17  | Modified to display the correct data.
    219206	| MHM	| 02/16/18	| Modified Date to UTCDate.    
*/
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
   
   SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'warehouse'
   SELECT @Date_Category = filterValue from @criteriaTempTable WHERE filterName = N'receipt_date'
   SELECT @receiptType = filterValue from @criteriaTempTable WHERE filterName = N'receipt_type'
  
   DECLARE @wareHouseDate DATETIME;
   SELECT @wareHouseDate= dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE());
   
   /* CHART START COLUMN*/ 
   SELECT N'CHARTDATA_DATASOURCE_TYPE' AS CHARTDATA_DATASOURCE_TYPE, 
    CATEGORY = CASE WHEN (SOURCE_NAME) IS NULL 
	                THEN dbo.RSCMfn_RtrvResource(N'UNASSIGNED',N'text',@culture)
	  ELSE (SOURCE_NAME) END,
      COUNT(DISTINCT(INTERNAL_RECEIPT_NUM)) AS DATA,       
       DESCRIPTION = N'DESCRIPTION',
       N'VENDORNAME' AS XAXISTITLE, 
       N'RECEIPTS' AS YAXISTITLE, 
       3 AS NextDrillDownLevel, 
       N'RECBYVENDORNAME' AS CHARTTITLE
       FROM METADATA_INSIGHT_RECEIPT_VIEW  where warehouse=@warehouse AND CLOSE_DATE IS NULL  	  
	   AND RECEIPT_ID_TYPE=@receiptType
	   AND(CASE 
       WHEN @Date_Category = N'Today' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'True'  
	        
       WHEN @Date_Category =N'Tomorrow' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'True'

       WHEN @Date_Category = N'Past due' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'True' 
	         
       WHEN @Date_Category =N'This week' AND ( CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) >= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 0)
                                       AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) <= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 6)) THEN N'True'

       WHEN @Date_Category = N'This month' AND (DATEPART(MM,RECEIPT_HEADER_RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
                                         AND DATEPART(yy, RECEIPT_HEADER_RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'True' 
							        
       WHEN @Date_Category =N'Future' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'True'
       
	   ELSE N'False'
       END =N'True')
       GROUP BY SOURCE_NAME

    /* CHART END*/ 
   
   /*SUMMARY TILES*/

/*TILE 1 and Tile 2*/
SELECT 
@TOTAL_RECEIPTS=COUNT(Distinct INTERNAL_RECEIPT_NUM),
@TOTAL_REC_LINES=count(DISTINCT  INTERNAL_RECEIPT_LINE_NUM)
--TOP 1 N'SUMMARYTILE_TOTAL_RECEIPTS' AS SUMMARYTILE_TOTAL_RECEIPTS,
--COUNT(DISTINCT(INTERNAL_RECEIPT_NUM))   AS TOTAL_RECEIPTS 
FROM METADATA_INSIGHT_RECEIPT_VIEW 
where warehouse=@warehouse AND CLOSE_DATE IS NULL 
AND RECEIPT_ID_TYPE=@receiptType

AND (  CASE 
       WHEN @Date_Category = N'Today' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'True'  
	        
       WHEN @Date_Category =N'Tomorrow' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'True'

       WHEN @Date_Category = N'Past due' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'True' 
	         
       WHEN @Date_Category =N'This week' AND ( CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) >= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 0)
                                       AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) <= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 6)) THEN N'True'

       WHEN @Date_Category = N'This month' AND (DATEPART(MM,RECEIPT_HEADER_RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
                                         AND DATEPART(yy, RECEIPT_HEADER_RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'True' 
							        
       WHEN @Date_Category =N'Future' AND CONVERT(DATE,RECEIPT_HEADER_RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'True'
       
	   ELSE N'False'
       END =N'True')

/* Tile 3 */
SET @RECT_VALUE=(SELECT SUM(TOTAL_VALUE) from RECEIPT_HEADER where warehouse=@warehouse AND CLOSE_DATE IS NULL
AND RECEIPT_ID_TYPE=@receiptType
 AND ( CASE 
       WHEN @Date_Category = N'Today' AND CONVERT(DATE,RECEIPT_DATE) =CONVERT(DATE,@wareHouseDate)THEN N'True'  
	        
       WHEN @Date_Category =N'Tomorrow' AND CONVERT(DATE,RECEIPT_DATE)=CONVERT(DATE,@wareHouseDate+1)THEN N'True'

       WHEN @Date_Category = N'Past due' AND CONVERT(DATE,RECEIPT_DATE) < CONVERT(DATE,@wareHouseDate)THEN N'True' 
	         
      WHEN @Date_Category =N'This week' AND ( CONVERT(DATE,RECEIPT_DATE) >= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 0)
                                       AND CONVERT(DATE,RECEIPT_DATE) <= DATEADD(wk, DATEDIFF(wk,0,@wareHouseDate), 6)) THEN N'True'

       WHEN @Date_Category = N'This month' AND (DATEPART(MM,RECEIPT_DATE)=(DATEPART(MM,@wareHouseDate))
									     AND DATEPART(yy, RECEIPT_DATE) = DATEPART(yy, @wareHouseDate))THEN N'True' 
							        
       WHEN @Date_Category =N'Future' AND CONVERT(DATE,RECEIPT_DATE) > (SELECT CONVERT(DATE,@wareHouseDate)) THEN N'True'
       
	   ELSE N'False'
       END =N'True'))



SELECT
TOP 1 N'SUMMARYTILE_TOTAL_RECEIPTS' AS SUMMARYTILE_TOTAL_RECEIPTS,
@TOTAL_RECEIPTS  AS TOTAL_RECEIPTS 

SELECT 
TOP 1 N'SUMMARYTILE_TOTAL_REC_LINES' AS SUMMARYTILE_TOTAL_REC_LINES,
@TOTAL_REC_LINES AS TOTAL_REC_LINES 

SELECT 
TOP 1 N'SUMMARYTILE_TOTAL_REC_VALUE' AS SUMMARYTILE_TOTAL_REC_VALUE, 
@RECT_VALUE AS TOTAL_REC_VALUE; 
   
   /*SUMMARY TILES END*/
   
   /*SUMMARY TILES END*/
