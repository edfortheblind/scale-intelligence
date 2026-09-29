-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */










CREATE Procedure INV_MonitorInventoryIndicatorTile
@filterCriteria NVARCHAR(MAX),
@indicatorTileName NVARCHAR(100),
@cautionCriteria NVARCHAR(MAX),
@warningCriteria NVARCHAR(MAX),
@culture NVARCHAR(10)
AS
	
Set NoCount ON
	DECLARE @warehouse as nVarchar(50);
	DECLARE @criteriaTempTable TABLE 
	(
    filterName nVarchar(300),
    filterValue nVarchar(300)
	)

DECLARE @cautionValue as NUMERIC(9);
DECLARE @warningValue as NUMERIC(9);


/* [comment omitted] */
DECLARE @ALMOSTEMPTYLOCS table(LOCATIONS nvarchar(50),QUANTITY numeric(20));
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)

	SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'<literal:1>'

	IF(@indicatorTileName = N'<literal:2>')
	Begin
		SELECT TOP 1 N'<literal:3>'AS  INDICATORTILE_ALMOST_EMPTY_LOCS,
		COUNT(DISTINCT LOCATION) AS ALMOST_EMPTY_LOCS,
		 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(distinct LOCATION))) as N'<literal:4>' ,
		(SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(distinct LOCATION))) as N'<literal:5>'  
		from Metadata_Insight_Inventory_View where WAREHOUSE=@warehouse AND (ON_HAND_QTY > 0 AND ON_HAND_QTY < 10)
	END
   ELSE
   IF(@indicatorTileName = N'<literal:6>')
	Begin
		SELECT TOP 1 N'<literal:7>'AS  INDICATORTILE_PENDING_REPLEN,
		COUNT(distinct WORK_UNIT) AS PENDING_REPLEN,
		 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(WORK_UNIT))) as N'<literal:8>' ,
		 (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(WORK_UNIT))) as N'<literal:9>' 
		from WORK_INSTRUCTION where CONDITION in (N'<literal:10>', N'<literal:11>') AND (FROM_WHS=@warehouse or TO_WHS=@warehouse) and WORK_GROUP=N'<literal:12>'
	END
	ELSE
	IF(@indicatorTileName = N'<literal:13>')
	Begin
		SELECT TOP 1 N'<literal:14>'AS  INDICATORTILE_PENDING_CYCLE_COUNTS,
		count(DISTINCT WORK_UNIT) AS N'<literal:15>',
	     (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(INTERNAL_INSTRUCTION_NUM))) as N'<literal:16>' ,
	     (SELECT  dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(INTERNAL_INSTRUCTION_NUM)))	 as N'<literal:17>' 
	  from WORK_INSTRUCTION where CONDITION in (N'<literal:18>', N'<literal:19>') AND (FROM_WHS=@warehouse or TO_WHS=@warehouse) AND WORK_GROUP =N'<literal:20>'
   END
	ELSE
	IF(@indicatorTileName = N'<literal:21>')
	Begin
	    SELECT TOP 1 N'<literal:22>'AS  INDICATORTILE_PERM_LOC_ITEM_ZERO_OH,
		COUNT(DISTINCT loc.LOCATION) AS PERM_LOC_ITEM_ZERO_OH, 
		 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(distinct loc.LOCATION))) as N'<literal:23>' ,
		 (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(distinct loc.LOCATION))) as N'<literal:24>' 
		from(
			select  Item,Company, Location from 
			 Metadata_Insight_Inventory_View where 
			 WAREHOUSE=@warehouse AND LOCATION_STS=N'<literal:25>' and Permanent =N'<literal:26>'  and IN_TRANSIT_QTY = 0
			 )Loc
			where loc.location not in
			 ( Select location from location_inventory where item = loc.ITEM and (Company is null and Loc.COMPANY is null or Company = null)
				 and  on_hand_qty > 0 and warehouse =@warehouse) 
	END

	
