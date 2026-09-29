-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */










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


 /* [comment omitted] */
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)
  SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'

DECLARE @cautionValue as NUMERIC(9);
DECLARE @warningValue as NUMERIC(9);

  IF(@indicatorTileName = N'<literal:2>')
   BEGIN
     SELECT TOP 1 N'<literal:3>' AS N'<literal:4>', COUNT(DISTINCT WORK_UNIT) AS N'<literal:5>',
	  (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT WORK_UNIT))) as N'<literal:6>',
	   (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT WORK_UNIT)))  as N'<literal:7>' 
	   FROM WORK_INSTRUCTION WHERE  
      (FROM_WHS =@warehouse or TO_WHS = @warehouse) AND CONDITION IN (N'<literal:8>', N'<literal:9>') AND AGING_DATE_TIME < DateAdd(DAY, -1, GETUTCDATE())
   END
  ELSE 
   IF(@indicatorTileName = N'<literal:10>')
    BEGIN
     SELECT TOP 1 N'<literal:11>' AS N'<literal:12>', COUNT(DISTINCT WORK_UNIT) AS N'<literal:13>',
	 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT WORK_UNIT))) as N'<literal:14>',
	  (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT WORK_UNIT))) as N'<literal:15>' 
	   FROM WORK_INSTRUCTION WHERE 
      (FROM_WHS =@warehouse or TO_WHS = @warehouse) AND CONDITION IN (N'<literal:16>', N'<literal:17>') AND PRIORITY <= 10
    END  
  ELSE 
    IF(@indicatorTileName = N'<literal:18>')
     BEGIN
     SELECT TOP 1 N'<literal:19>' AS N'<literal:20>', COUNT(DISTINCT WORK_UNIT) AS N'<literal:21>',
	 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT WORK_UNIT))) as N'<literal:22>',
	 (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT WORK_UNIT))) as N'<literal:23>'  FROM WORK_INSTRUCTION WHERE 
      (FROM_WHS =@warehouse or TO_WHS = @warehouse) AND CONDITION IN (N'<literal:24>', N'<literal:25>') AND HOLD_CODE IS NOT NULL
    END 
   ELSE 
    IF(@indicatorTileName = N'<literal:26>')
     BEGIN
     SELECT TOP 1 N'<literal:27>' AS N'<literal:28>', COUNT(DISTINCT WORK_UNIT) AS N'<literal:29>',
	 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT WORK_UNIT))) as N'<literal:30>',
	 (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT WORK_UNIT))) as N'<literal:31>'  FROM WORK_INSTRUCTION WHERE 
      (FROM_WHS =@warehouse or TO_WHS = @warehouse) AND CONDITION IN (N'<literal:32>', N'<literal:33>')
    END 	
	ELSE 
    IF(@indicatorTileName = N'<literal:34>')
     BEGIN
     SELECT TOP 1 N'<literal:35>' AS N'<literal:36>', COUNT(DISTINCT WORK_UNIT) AS N'<literal:37>',
	  (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(DISTINCT WORK_UNIT))) as N'<literal:38>',
	  (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(DISTINCT WORK_UNIT))) as N'<literal:39>'  FROM WORK_INSTRUCTION WHERE 
      (FROM_WHS =@warehouse or TO_WHS = @warehouse) AND CONDITION IN (N'<literal:40>') AND USER_ASSIGNED IS NOT NULL  
    END 	
	
	      
    If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)