
/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9593		| RAB			| 10/08/02	| Created.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	50836		| DN			| 04/27/09	| Modified to set values to 0 when sum is null.
	5276		| SKR			| 09/17/21	| Modified to include Pending Reviews requests counts in Total Open counts
	Updates the CycleCountPlan based on its requests. 
	
	Parameters
		int		iPlanNum		The CycleCountPlan to update.
		String	stUserName		The current user.
*/
CREATE PROCEDURE CCB_UpdateCCPlan(
	@iPlanNum numeric(9),
	@stUserName nvarchar(30))
AS
	SET NOCOUNT ON;

	-- #DEFINE WMW.Jsharp.Inventory com.pronto.general.CCConstants CCCons;
	
	-- validate parameters.
	if (@iPlanNum is null
		OR @iPlanNum <= 0)
		return -1;
	
	-- update the plan.
	UPDATE CYCLE_COUNT_PLAN
	   SET TOTAL_OPEN = cr.totalOpen,
	       TOTAL_REVIEWED = cr.totalReviewed,
	       TOTAL_CLOSED = cr.totalClosed,
	       COMPLETED_DATE = CASE WHEN cr.totalNotClosed <= 0 
									  AND MASTER_NAME IS NOT NULL
								 THEN GETUTCDATE()
								 ELSE null
								 END,
	       USER_STAMP = @stUserName,
	       PROCESS_STAMP = N'CCB_UpdateCCPlan',
	       DATE_TIME_STAMP = GETUTCDATE()
	  FROM (SELECT ISNULL(SUM(CASE WHEN CONDITION = N'Open' OR CONDITION = N'Pending Review'
							THEN 1
							ELSE 0
							END),0) totalOpen,
				   ISNULL(SUM(CASE WHEN CONDITION = N'Pending Review' 
							THEN 1
							ELSE 0
							END),0) totalReviewed,
				   ISNULL(SUM(CASE WHEN CONDITION = N'Closed' 
							THEN 1
							ELSE 0
							END),0) totalClosed,
				   ISNULL(SUM(CASE WHEN CONDITION = N'Closed'
							THEN 0
							ELSE 1
							END),0) totalNotClosed
			  FROM CYCLE_COUNT_REQUEST
			 WHERE INTERNAL_PLAN_NUM = @iPlanNum) cr
	 WHERE INTERNAL_PLAN_NUM = @iPlanNum;
	if (@@ERROR <> 0) return -1;
-- end CCB_UpdateCCPlan


