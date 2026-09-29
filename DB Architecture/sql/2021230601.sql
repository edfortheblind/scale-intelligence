-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








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
   
SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'

	IF(@indicatorTileName = N'<literal:2>')
	Begin
		SELECT TOP 1 N'<literal:3>'AS  INDICATORTILE_REC_OVER_HOURS,
		COUNT(INTERNAL_RECEIPT_NUM) AS REC_OVER_HOURS,
		(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT INTERNAL_RECEIPT_NUM))) as N'<literal:4>' ,
		(SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT INTERNAL_RECEIPT_NUM))) as N'<literal:5>'
		FROM RECEIPT_HEADER where warehouse=@warehouse AND 
		DATE_TIME_STAMP < DateAdd(DAY, -1, GETUTCDATE()) and CLOSE_DATE is null
		
	END


	ELSE IF(@indicatorTileName = N'<literal:6>')
       Begin
              SELECT TOP 1 N'<literal:7>'AS  INDICATORTILE_PEND_PUT_HOURS,
              COUNT(INTERNAL_INSTRUCTION_NUM) AS PEND_PUT_HOURS,
              (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT INTERNAL_INSTRUCTION_NUM))) as N'<literal:8>' ,
              (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT INTERNAL_INSTRUCTION_NUM))) as N'<literal:9>'
              FROM WORK_INSTRUCTION WHERE (FROM_WHS=@warehouse or TO_WHS=@warehouse) 
              and AGING_DATE_TIME <DATEADD(hh, -4, GETUTCDATE())
              and INSTRUCTION_TYPE=N'<literal:10>' AND CONDITION<>N'<literal:11>' AND INTERNAL_NUM_TYPE=N'<literal:12>';
       END


	ELSE IF(@indicatorTileName = N'<literal:13>')
	Begin
		SELECT TOP 1 N'<literal:14>'AS  INDICATORTILE_REC_WITH_QC,
		count(DISTINCT rh.INTERNAL_RECEIPT_NUM) AS REC_WITH_QC,
		(SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT rh.INTERNAL_RECEIPT_NUM))) as N'<literal:15>' ,
        (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT rh.INTERNAL_RECEIPT_NUM))) as N'<literal:16>'
		from RECEIPT_HEADER rh, RECEIPT_CONTAINER rc where warehouse=@warehouse 
		AND rh.INTERNAL_RECEIPT_NUM=rc.INTERNAL_RECEIPT_NUM
        and rc.Status <900 and QC_INSPECTION=N'<literal:17>'
	END