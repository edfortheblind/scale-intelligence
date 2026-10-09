/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	182444	| AU	| 08/09/16	| Created
    176298	| RJR	| 10/26/16	| Consider to_whs as well.
	216453	| MJ	| 12/11/17	| Modified to make db compatible with Azure SQL.
	219206	| MHM	| 02/16/18	| Modified Date to UTCDate.
	242694  | SKT   | 12/19/19  | Modified if: MNU_RECEIPT_MONITORINGIndicatorTile2, to return distinct count of internal receipt number
*/
CREATE Procedure RCPT_MonitorReceiptsIndicatorTiles
@filterCriteria NVARCHAR(MAX),
@indicatorTileName NVARCHAR(100),
@cautionCriteria NVARCHAR(MAX),
@warningCriteria NVARCHAR(MAX),
@culture NVARCHAR(10)
AS
DECLARE @criteriaTempTable TABLE (
    filterName nVarchar(300),
    filterValue nVarchar(300))
DECLARE @warehouse as nVarchar(50);

INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)
   
SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'warehouse'

	IF(@indicatorTileName = N'MNU_RECEIPT_MONITORINGIndicatorTile0')
	Begin
		SELECT TOP 1 N'INDICATORTILE_REC_OVER_HOURS'AS  INDICATORTILE_REC_OVER_HOURS,
		COUNT(INTERNAL_RECEIPT_NUM) AS REC_OVER_HOURS,
		(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT INTERNAL_RECEIPT_NUM))) as N'CAUTION' ,
		(SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT INTERNAL_RECEIPT_NUM))) as N'WARNING'
		FROM RECEIPT_HEADER where warehouse=@warehouse AND 
		DATE_TIME_STAMP < DateAdd(DAY, -1, GETUTCDATE()) and CLOSE_DATE is null
		
	END


	ELSE IF(@indicatorTileName = N'MNU_RECEIPT_MONITORINGIndicatorTile1')
       Begin
              SELECT TOP 1 N'INDICATORTILE_PEND_PUT_HOURS'AS  INDICATORTILE_PEND_PUT_HOURS,
              COUNT(INTERNAL_INSTRUCTION_NUM) AS PEND_PUT_HOURS,
              (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT INTERNAL_INSTRUCTION_NUM))) as N'CAUTION' ,
              (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT INTERNAL_INSTRUCTION_NUM))) as N'WARNING'
              FROM WORK_INSTRUCTION WHERE (FROM_WHS=@warehouse or TO_WHS=@warehouse) 
              and AGING_DATE_TIME <DATEADD(hh, -4, GETUTCDATE())
              and INSTRUCTION_TYPE=N'HEADER' AND CONDITION<>N'CLOSED' AND INTERNAL_NUM_TYPE=N'RECEIPT';
       END


	ELSE IF(@indicatorTileName = N'MNU_RECEIPT_MONITORINGIndicatorTile2')
	Begin
		SELECT TOP 1 N'INDICATORTILE_REC_WITH_QC'AS  INDICATORTILE_REC_WITH_QC,
		count(DISTINCT rh.INTERNAL_RECEIPT_NUM) AS REC_WITH_QC,
		(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT rh.INTERNAL_RECEIPT_NUM))) as N'CAUTION' ,
        (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT rh.INTERNAL_RECEIPT_NUM))) as N'WARNING'
		from RECEIPT_HEADER rh, RECEIPT_CONTAINER rc where warehouse=@warehouse 
		AND rh.INTERNAL_RECEIPT_NUM=rc.INTERNAL_RECEIPT_NUM
        and rc.Status <900 and QC_INSPECTION=N'Y'
	END