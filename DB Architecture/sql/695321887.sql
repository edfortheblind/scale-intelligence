-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RCustomStatusFlowHeader01
	@FlowName nvarchar(25)
AS
	SELECT * FROM CUSTOM_STATUS_FLOW_HEADER
	 WHERE FLOW_NAME = @FlowName
