/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	184494	| NRJ	| 08/16/16	| Created
	186774	| AU	| 12/16/16	| Created
	195660	| RJR	| 01/11/17	| Added warehouse.
*/


CREATE PROCEDURE WAVE_InsightDetailPaneData
(@InternalLaunchNum numeric(9) , @culture nvarchar(10)) 
 
AS 
BEGIN

SET NOCOUNT ON;

--temporary store for selected row in grid
select INTERNAL_LAUNCH_NUM,LAUNCH_NAME, WAREHOUSE INTO #tempLaunchStats
FROM LAUNCH_STATISTICS
WHERE INTERNAL_LAUNCH_NUM = @InternalLaunchNum;

--header section data
SELECT top 1 N'SCALAR' AS SCALAR,
    tempLS.INTERNAL_LAUNCH_NUM AS WaveNumber,
	tempLS.LAUNCH_NAME AS WaveName, 
	tempLS.WAREHOUSE as WAREHOUSE
FROM #tempLaunchStats tempLS;

--Indicator Tile
SELECT top 1 N'SCALAR' AS SCALAR,
COUNT(INTERNAL_SHIPMENT_NUM) AS PlannedShipments
from SHIPMENT_HEADER
where LAUNCH_NUM = @InternalLaunchNum AND LEADING_STS < 300;

SELECT top 1 N'SCALAR' AS SCALAR,
COUNT(INTERNAL_SHIPMENT_NUM) AS WavedShipments
from SHIPMENT_HEADER
where LAUNCH_NUM=@InternalLaunchNum AND LEADING_STS>=300;

SELECT top 1 N'SCALAR' AS SCALAR,
COUNT(INTERNAL_SHIPMENT_LINE_NUM) AS Lines
from METADATA_INSIGHT_SHIPMENT_DETAIL_VIEW
where LAUNCH_NUM=@InternalLaunchNum;

SELECT top 1 N'SCALAR' AS SCALAR,
COUNT(INTERNAL_CONTAINER_NUM) AS ParentContainers 
from METADATA_INSIGHT_SHIPPING_CONTAINER_VIEW 
where TREE_UNIT=INTERNAL_CONTAINER_NUM AND LAUNCH_NUM=@InternalLaunchNum; 

SELECT top 1 N'SCALAR' AS SCALAR,
COUNT(INTERNAL_INSTRUCTION_NUM) AS WorkUnits 
from WORK_INSTRUCTION 
where INSTRUCTION_TYPE=N'Header' AND LAUNCH_NUM=@InternalLaunchNum; 

END