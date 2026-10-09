/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RAllocationRuleHeader01
	@AllocationName nvarchar(25)
AS
	SELECT * FROM ALLOCATION_RULE_HEADER
	WHERE ALLOCATION_NAME = @AllocationName
