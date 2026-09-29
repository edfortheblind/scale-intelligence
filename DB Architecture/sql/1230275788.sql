-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE PROCEDURE wm_RInterfaceFlowStep01
	@IntFlowKeyNum numeric(9)
AS
	SELECT * FROM INTERFACE_FLOW_STEP
	WHERE INTERNAL_FLOW_KEY_NUM = @IntFlowKeyNum 


