-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE WAVE_InsightDetailPaneData
(@InternalLaunchNum numeric(9) , @culture nvarchar(10)) 
 
AS 
BEGIN

SET NOCOUNT ON;

-- [comment omitted]
select INTERNAL_LAUNCH_NUM,LAUNCH_NAME, WAREHOUSE INTO #tempLaunchStats
FROM LAUNCH_STATISTICS
WHERE INTERNAL_LAUNCH_NUM = @InternalLaunchNum;

-- [comment omitted]
SELECT top 1 N'<literal:1>' AS SCALAR,
    tempLS.INTERNAL_LAUNCH_NUM AS WaveNumber,
	tempLS.LAUNCH_NAME AS WaveName, 
	tempLS.WAREHOUSE as WAREHOUSE
FROM #tempLaunchStats tempLS;

-- [comment omitted]
SELECT top 1 N'<literal:2>' AS SCALAR,
COUNT(INTERNAL_SHIPMENT_NUM) AS PlannedShipments
from SHIPMENT_HEADER
where LAUNCH_NUM = @InternalLaunchNum AND LEADING_STS < 300;

SELECT top 1 N'<literal:3>' AS SCALAR,
COUNT(INTERNAL_SHIPMENT_NUM) AS WavedShipments
from SHIPMENT_HEADER
where LAUNCH_NUM=@InternalLaunchNum AND LEADING_STS>=300;

SELECT top 1 N'<literal:4>' AS SCALAR,
COUNT(INTERNAL_SHIPMENT_LINE_NUM) AS Lines
from METADATA_INSIGHT_SHIPMENT_DETAIL_VIEW
where LAUNCH_NUM=@InternalLaunchNum;

SELECT top 1 N'<literal:5>' AS SCALAR,
COUNT(INTERNAL_CONTAINER_NUM) AS ParentContainers 
from METADATA_INSIGHT_SHIPPING_CONTAINER_VIEW 
where TREE_UNIT=INTERNAL_CONTAINER_NUM AND LAUNCH_NUM=@InternalLaunchNum; 

SELECT top 1 N'<literal:6>' AS SCALAR,
COUNT(INTERNAL_INSTRUCTION_NUM) AS WorkUnits 
from WORK_INSTRUCTION 
where INSTRUCTION_TYPE=N'<literal:7>' AND LAUNCH_NUM=@InternalLaunchNum; 

END