-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */







CREATE PROCEDURE MetaTrans_CycleCountQuickPlan(
	@Warehouse nvarchar(25) = null, 
	@culture nvarchar(200))
AS

	DECLARE @defaultCycleCountGroupSize numeric(9);
	DECLARE @createCCQuickPlanWork nvarchar(200);

	-- [comment omitted]
	SELECT @defaultCycleCountGroupSize = SYSTEM_VALUE  
    FROM SYSTEM_CONFIG_DETAIL  
    WHERE SYS_KEY = N'<literal:1>' AND RECORD_TYPE = N'<literal:2>';

	-- [comment omitted]
	SELECT @createCCQuickPlanWork = SYSTEM_VALUE  
    FROM SYSTEM_CONFIG_DETAIL  
    WHERE SYS_KEY = N'<literal:3>' AND RECORD_TYPE = N'<literal:4>';

	SET NOCOUNT ON;				
	SELECT TOP 1 N'<literal:5>' AS N'<literal:6>',
	N'<literal:7>' AS N'<literal:8>',
	N'<literal:9>' as N'<literal:10>',	
	@defaultCycleCountGroupSize as N'<literal:11>',
	CASE WHEN @createCCQuickPlanWork = N'<literal:12>' THEN CONVERT(BIT, 1) ELSE CONVERT(BIT, 0) END AS N'<literal:13>',
	NULL as N'<literal:14>',
	N'<literal:15>' as N'<literal:16>',
	N'<literal:17>' as N'<literal:18>',
	N'<literal:19>' as N'<literal:20>',
	N'<literal:21>' as N'<literal:22>',
	N'<literal:23>' as N'<literal:24>',
	N'<literal:25>' as N'<literal:26>',
	N'<literal:27>' as N'<literal:28>',
	N'<literal:29>' as N'<literal:30>',
	N'<literal:31>' as N'<literal:32>',
	N'<literal:33>' as N'<literal:34>',
	N'<literal:35>' as N'<literal:36>',
	N'<literal:37>' as N'<literal:38>',
	N'<literal:39>' as N'<literal:40>',
	N'<literal:41>' as N'<literal:42>',
	N'<literal:43>' as N'<literal:44>',
	N'<literal:45>' as N'<literal:46>',
	N'<literal:47>' as N'<literal:48>',
	N'<literal:49>' as N'<literal:50>',
	N'<literal:51>' as N'<literal:52>',
	N'<literal:53>' as N'<literal:54>',
	N'<literal:55>' as N'<literal:56>',
	N'<literal:57>' as N'<literal:58>',
	N'<literal:59>' as N'<literal:60>',
	N'<literal:61>' as N'<literal:62>',
	N'<literal:63>' as N'<literal:64>',
	0 as N'<literal:65>',
	0 as N'<literal:66>',
	0 as N'<literal:67>',
	N'<literal:68>' as N'<literal:69>',
	N'<literal:70>' as N'<literal:71>',
	NULL as N'<literal:72>',
	Convert(BIT, 0) as N'<literal:73>',
	N'<literal:74>' as N'<literal:75>',
	Convert(BIT, 0) as N'<literal:76>',
	N'<literal:77>' as N'<literal:78>',
	Convert(BIT, 0) as N'<literal:79>',
	Convert(BIT, 0) as N'<literal:80>',
	Convert(BIT, 0) as N'<literal:81>',
	@Warehouse as N'<literal:82>';