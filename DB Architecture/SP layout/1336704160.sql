
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	182441	| SSD	| 07/22/16	| Created	
	176298	| RJR	| 10/26/16	| Consider to_whs as well.
	176298	| AH	| 04/21/17	| Modfied MNU_INVENTORY_MONITORINGIndicatorTile3 to Consider IN_TRANSIT_QTY = 0.
	176298	| AU	| 06/13/17	| Modfied MNU_INVENTORY_MONITORINGIndicatorTile0 to not include Empty Locations.
	208308  | KSS   | 08/01/17  | Modified code to calculate the ALMOST_EMPTY_LOCS 
	216453	| MJ	| 12/11/17	| Modified to make db compatible with Azure SQL.
*/

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


/*get the where clause value*/
DECLARE @ALMOSTEMPTYLOCS table(LOCATIONS nvarchar(50),QUANTITY numeric(20));
  INSERT INTO @criteriaTempTable SELECT * FROM fn_GetMonitorFilterParameters(@filterCriteria)

	SELECT @warehouse = filterValue from @criteriaTempTable WHERE filterName = N'WAREHOUSE'

	IF(@indicatorTileName = N'MNU_INVENTORY_MONITORINGIndicatorTile0')
	Begin
		SELECT TOP 1 N'INDICATORTILE_ALMOST_EMPTY_LOCS'AS  INDICATORTILE_ALMOST_EMPTY_LOCS,
		COUNT(DISTINCT LOCATION) AS ALMOST_EMPTY_LOCS,
		 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(distinct LOCATION))) as N'CAUTION' ,
		(SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(distinct LOCATION))) as N'WARNING'  
		from Metadata_Insight_Inventory_View where WAREHOUSE=@warehouse AND (ON_HAND_QTY > 0 AND ON_HAND_QTY < 10)
	END
   ELSE
   IF(@indicatorTileName = N'MNU_INVENTORY_MONITORINGIndicatorTile1')
	Begin
		SELECT TOP 1 N'INDICATORTILE_PENDING_REPLEN'AS  INDICATORTILE_PENDING_REPLEN,
		COUNT(distinct WORK_UNIT) AS PENDING_REPLEN,
		 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(WORK_UNIT))) as N'CAUTION' ,
		 (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(WORK_UNIT))) as N'WARNING' 
		from WORK_INSTRUCTION where CONDITION in (N'Open', N'In Process') AND (FROM_WHS=@warehouse or TO_WHS=@warehouse) and WORK_GROUP=N'Replenishment'
	END
	ELSE
	IF(@indicatorTileName = N'MNU_INVENTORY_MONITORINGIndicatorTile2')
	Begin
		SELECT TOP 1 N'INDICATORTILE_PENDING_CYCLE_COUNTS'AS  INDICATORTILE_PENDING_CYCLE_COUNTS,
		count(DISTINCT WORK_UNIT) AS N'PENDING_CYCLE_COUNTS',
	     (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(INTERNAL_INSTRUCTION_NUM))) as N'CAUTION' ,
	     (SELECT  dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(INTERNAL_INSTRUCTION_NUM)))	 as N'WARNING' 
	  from WORK_INSTRUCTION where CONDITION in (N'Open', N'In Process') AND (FROM_WHS=@warehouse or TO_WHS=@warehouse) AND WORK_GROUP =N'Cycle Counting'
   END
	ELSE
	IF(@indicatorTileName = N'MNU_INVENTORY_MONITORINGIndicatorTile3')
	Begin
	    SELECT TOP 1 N'INDICATORTILE_PERM_LOC_ITEM_ZERO_OH'AS  INDICATORTILE_PERM_LOC_ITEM_ZERO_OH,
		COUNT(DISTINCT loc.LOCATION) AS PERM_LOC_ITEM_ZERO_OH, 
		 (SELECT  dbo.fn_GetCriticalLevel(@cautionCriteria, COUNT(distinct loc.LOCATION))) as N'CAUTION' ,
		 (SELECT dbo.fn_GetCriticalLevel(@warningCriteria, COUNT(distinct loc.LOCATION))) as N'WARNING' 
		from(
			select  Item,Company, Location from 
			 Metadata_Insight_Inventory_View where 
			 WAREHOUSE=@warehouse AND LOCATION_STS=N'Empty' and Permanent =N'Y'  and IN_TRANSIT_QTY = 0
			 )Loc
			where loc.location not in
			 ( Select location from location_inventory where item = loc.ITEM and (Company is null and Loc.COMPANY is null or Company = null)
				 and  on_hand_qty > 0 and warehouse =@warehouse) 
	END

	
