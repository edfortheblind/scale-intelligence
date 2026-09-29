-- DOCUMENTATION ONLY: literals/comments removed; do not execute.

/* [comment omitted] */












CREATE PROCEDURE CCB_UpdateCCPlan(
	@iPlanNum numeric(9),
	@stUserName nvarchar(30))
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	
	-- [comment omitted]
	if (@iPlanNum is null
		OR @iPlanNum <= 0)
		return -1;
	
	-- [comment omitted]
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
	       PROCESS_STAMP = N'<literal:1>',
	       DATE_TIME_STAMP = GETUTCDATE()
	  FROM (SELECT ISNULL(SUM(CASE WHEN CONDITION = N'<literal:2>' OR CONDITION = N'<literal:3>'
							THEN 1
							ELSE 0
							END),0) totalOpen,
				   ISNULL(SUM(CASE WHEN CONDITION = N'<literal:4>' 
							THEN 1
							ELSE 0
							END),0) totalReviewed,
				   ISNULL(SUM(CASE WHEN CONDITION = N'<literal:5>' 
							THEN 1
							ELSE 0
							END),0) totalClosed,
				   ISNULL(SUM(CASE WHEN CONDITION = N'<literal:6>'
							THEN 0
							ELSE 1
							END),0) totalNotClosed
			  FROM CYCLE_COUNT_REQUEST
			 WHERE INTERNAL_PLAN_NUM = @iPlanNum) cr
	 WHERE INTERNAL_PLAN_NUM = @iPlanNum;
	if (@@ERROR <> 0) return -1;
-- [comment omitted]


