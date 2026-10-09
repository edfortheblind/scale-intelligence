
/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	197715	| MMM	| 05/03/17	| Created.
	197715	| MMM	| 05/12/17	| Updated default values for CreateWork, ExpiresByDays and MaximumCount fields
*/


CREATE PROCEDURE MetaTrans_CycleCountQuickPlan(
	@Warehouse nvarchar(25) = null, 
	@culture nvarchar(200))
AS

	DECLARE @defaultCycleCountGroupSize numeric(9);
	DECLARE @createCCQuickPlanWork nvarchar(200);

	--Fetch default cycle count group size from system config
	SELECT @defaultCycleCountGroupSize = SYSTEM_VALUE  
    FROM SYSTEM_CONFIG_DETAIL  
    WHERE SYS_KEY = N'100' AND RECORD_TYPE = N'Cycle Count';

	--Fetch Create Activity Driven & Quick Plan CC Work flag from system configuration
	SELECT @createCCQuickPlanWork = SYSTEM_VALUE  
    FROM SYSTEM_CONFIG_DETAIL  
    WHERE SYS_KEY = N'90' AND RECORD_TYPE = N'Cycle Count';

	SET NOCOUNT ON;				
	SELECT TOP 1 N'SCALAR' AS N'EntityType',
	N'CCQuickPlan' AS N'EntityName',
	N'' as N'Company',	
	@defaultCycleCountGroupSize as N'CountPerGroup',
	CASE WHEN @createCCQuickPlanWork = N'Y' THEN CONVERT(BIT, 1) ELSE CONVERT(BIT, 0) END AS N'CreateWork',
	NULL as N'ExpiresByDays',
	N'' as N'Department',
	N'' as N'Description',
	N'' as N'Division',
	N'' as N'InventoryStatus',
	N'' as N'Item',
	N'' as N'ItemCategory1',
	N'' as N'ItemCategory2',
	N'' as N'ItemCategory3',
	N'' as N'ItemCategory4',
	N'' as N'ItemCategory5',
	N'' as N'ItemCategory6',
	N'' as N'ItemCategory7',
	N'' as N'ItemCategory8',
	N'' as N'ItemCategory9',
	N'' as N'ItemCategory10',
	N'' as N'ItemClass',
	N'' as N'ItemColor',
	N'' as N'ItemSize',
	N'' as N'ItemStyle',
	N'' as N'ItemUserDef1',
	N'' as N'ItemUserDef2',
	N'' as N'ItemUserDef3',
	N'' as N'ItemUserDef4',
	N'' as N'ItemUserDef5',
	N'' as N'ItemUserDef6',
	0 as N'ItemUserDef7',
	0 as N'ItemUserDef8',
	0 as N'ListPrice',
	N'' as N'Location',
	N'' as N'Lot',
	NULL as N'MaximumCount',
	Convert(BIT, 0) as N'MultiItem',
	N'' as N'NegativeAdjType',
	Convert(BIT, 0) as N'Permanent',
	N'' as N'PositiveAdjType',
	Convert(BIT, 0) as N'SerialNumberTracked',
	Convert(BIT, 0) as N'TrackContainers',
	Convert(BIT, 0) as N'UpdateCountToIncludeAllItems',
	@Warehouse as N'Warehouse';