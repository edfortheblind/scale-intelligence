-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RAllocationRuleHeader01
	@AllocationName nvarchar(25)
AS
	SELECT * FROM ALLOCATION_RULE_HEADER
	WHERE ALLOCATION_NAME = @AllocationName
