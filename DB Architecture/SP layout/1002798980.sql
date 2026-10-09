/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	174114	| MHM	| 12/16/15	| Created	    
    176560  | MHM   |03/23/16   | Rename Actiontile to Indicatortile.
	176298	| RJR	| 10/26/16	| Consider to_whs as well.
	216453	| MJ	| 12/11/17	| Modified to make db compatible with Azure SQL.
	219206	| MHM	| 02/16/18	| Modified Date to UTCDate.
    253638  | SO    | 06/23/20  | Modified to return correct risk works count agingdatetime is less than yesterday.
*/

CREATE Procedure WRK_MonitorCustomerIndicatorTile
(   
@filterCriteria NVARCHAR(MAX),
@indicatorTileName NVARCHAR(100),
@cautionCriteria NVARCHAR(MAX),
@warningCriteria NVARCHAR(MAX),
@culture NVARCHAR(10)
)
AS
    Set NoCount ON
	DECLARE @warehouse as nVarchar(50);
	DECLARE @criteriaTempTable TABLE 
	(
    filterName nVarchar(300),
    filterValue nVarchar(300)
	)


 /*get the where clause value*/
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)
  SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'FROM_WHS'

DECLARE @cautionValue as NUMERIC(9);
DECLARE @warningValue as NUMERIC(9);

  IF(@indicatorTileName = N'IndicatorTileAtRiskWork')
   BEGIN
     SELECT TOP 1 N'INDICATORTILE_ATRISKWORK' AS N'INDICATORTILE_ATRISKWORK', COUNT(DISTINCT WORK_UNIT) AS N'AT_RISK_WORK',
	  (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT WORK_UNIT))) as N'CAUTION',
	   (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT WORK_UNIT)))  as N'WARNING' 
	   FROM WORK_INSTRUCTION WHERE  
      (FROM_WHS =@warehouse or TO_WHS = @warehouse) AND CONDITION IN (N'OPEN', N'IN PROCESS') AND AGING_DATE_TIME < DateAdd(DAY, -1, GETUTCDATE())
   END
  ELSE 
   IF(@indicatorTileName = N'IndicatorTilePriorityWork')
    BEGIN
     SELECT TOP 1 N'INDICATORTILE_PRIORITYWORK' AS N'INDICATORTILE_PRIORITYWORK', COUNT(DISTINCT WORK_UNIT) AS N'PRIORITY_WORK',
	 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT WORK_UNIT))) as N'CAUTION',
	  (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT WORK_UNIT))) as N'WARNING' 
	   FROM WORK_INSTRUCTION WHERE 
      (FROM_WHS =@warehouse or TO_WHS = @warehouse) AND CONDITION IN (N'OPEN', N'IN PROCESS') AND PRIORITY <= 10
    END  
  ELSE 
    IF(@indicatorTileName = N'IndicatorTileWorkOnHold')
     BEGIN
     SELECT TOP 1 N'INDICATORTILE_WORKONHOLD' AS N'INDICATORTILE_WORKONHOLD', COUNT(DISTINCT WORK_UNIT) AS N'WORK_ON_HOLD',
	 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT WORK_UNIT))) as N'CAUTION',
	 (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT WORK_UNIT))) as N'WARNING'  FROM WORK_INSTRUCTION WHERE 
      (FROM_WHS =@warehouse or TO_WHS = @warehouse) AND CONDITION IN (N'OPEN', N'IN PROCESS') AND HOLD_CODE IS NOT NULL
    END 
   ELSE 
    IF(@indicatorTileName = N'IndicatorTileOpenWork')
     BEGIN
     SELECT TOP 1 N'INDICATORTILE_OPENWORK' AS N'INDICATORTILE_OPENWORK', COUNT(DISTINCT WORK_UNIT) AS N'OPENWORK',
	 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT WORK_UNIT))) as N'CAUTION',
	 (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT WORK_UNIT))) as N'WARNING'  FROM WORK_INSTRUCTION WHERE 
      (FROM_WHS =@warehouse or TO_WHS = @warehouse) AND CONDITION IN (N'OPEN', N'IN PROCESS')
    END 	
	ELSE 
    IF(@indicatorTileName = N'IndicatorTileInProgressWork')
     BEGIN
     SELECT TOP 1 N'INDICATORTILE_INPROGRESSWORK' AS N'INDICATORTILE_INPROGRESSWORK', COUNT(DISTINCT WORK_UNIT) AS N'INPROGRESSWORK',
	  (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT WORK_UNIT))) as N'CAUTION',
	  (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT WORK_UNIT))) as N'WARNING'  FROM WORK_INSTRUCTION WHERE 
      (FROM_WHS =@warehouse or TO_WHS = @warehouse) AND CONDITION IN (N'IN PROCESS') AND USER_ASSIGNED IS NOT NULL  
    END 	
	
	      
    If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)