/*
	Task	| By	| Date		| Modification Description
	---------------------------------------------------------------
	19524	| SSG	| 08/07/06	| Created.
	19524	| SSG	| 08/17/06	| Passed warehouse as parameter
	84295	| MMM	| 06/09/11	| Updated procedure to return records of warehouses for which user has access and removed Oracle code
	143144	| TDA	| 06/04/14	| Fixed warehouse access query
	
	Returns:
		Total number of work instruction details for Open Replenishments

*/

-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;


CREATE PROCEDURE PM_WorkInstruction02
(
	@WAREHOUSE nvarchar(25) = NULL,
	@USERNAME nvarchar(30)
)

AS
BEGIN
	SET NOCOUNT ON;

	IF @Warehouse = N''
	SET @Warehouse = NULL;

	SELECT 
		COUNT(*) AS TOTAL_WORK_INSTRUCTIONS
	FROM
		WORK_INSTRUCTION
	WHERE 
		INSTRUCTION_TYPE = N'Detail'
	AND
		CONDITION <> N'Closed'
	AND
		INTERNAL_NUM_TYPE = N'Replenishment'
	AND
		FROM_WHS = ISNULL(@Warehouse, FROM_WHS)
	AND 
		FROM_WHS in 
		(SELECT DISTINCT WH.WAREHOUSE from WAREHOUSE WH, USER_PROFILE UP, WAREHOUSE_ACCESS WA
		WHERE UP.USER_NAME = @USERNAME
		AND ((UP.WAREHOUSE_AUTH = N'All')
			OR
				(UP.WAREHOUSE_AUTH = N'List'
				 AND WA.USER_NAME = @USERNAME
				 AND WA.WAREHOUSE = WH.WAREHOUSE)
			));

END -- PM_WorkInstruction02
