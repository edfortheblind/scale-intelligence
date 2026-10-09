/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RCustomStatusFlowHeader01
	@FlowName nvarchar(25)
AS
	SELECT * FROM CUSTOM_STATUS_FLOW_HEADER
	 WHERE FLOW_NAME = @FlowName
