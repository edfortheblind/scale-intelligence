/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RFunctionalAreaStatusFlow01
	@FunctionalArea nvarchar(25),
	@SystemSts nvarchar(50)
AS
	SELECT * FROM FUNCTIONAL_AREA_STATUS_FLOW
	WHERE FUNCTIONAL_AREA = @FunctionalArea
	AND SYSTEM_STS = @SystemSts
	
