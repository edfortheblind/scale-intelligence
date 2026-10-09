/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	15328	| MD		| 2005.01.20	| Created.
*/





CREATE PROCEDURE wm_RInterfaceFlowStep01
	@IntFlowKeyNum numeric(9)
AS
	SELECT * FROM INTERFACE_FLOW_STEP
	WHERE INTERNAL_FLOW_KEY_NUM = @IntFlowKeyNum 


