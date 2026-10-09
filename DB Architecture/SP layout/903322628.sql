/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RInterfaceDetail01
	@DtlKeyNum numeric(9)
AS
	SELECT * FROM INTERFACE_DETAIL
	WHERE DTL_KEY_NUM = @DtlKeyNum
