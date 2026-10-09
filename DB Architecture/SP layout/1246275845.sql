/*
	Task 	| Programmer	| Date   	| Description
	--------|---------------|---------------------------------------
	15328	| MD		| 2005.01.20	| Created.
*/





CREATE PROCEDURE wm_RInterfaceFlowStep02
	@DtlKeyNum numeric(9)
AS
	SELECT * FROM INTERFACE_FLOW_STEP
	WHERE DTL_KEY_NUM = @DtlKeyNum


