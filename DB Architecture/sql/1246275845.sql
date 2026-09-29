-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE PROCEDURE wm_RInterfaceFlowStep02
	@DtlKeyNum numeric(9)
AS
	SELECT * FROM INTERFACE_FLOW_STEP
	WHERE DTL_KEY_NUM = @DtlKeyNum


