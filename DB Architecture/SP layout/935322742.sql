/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RInterfaceHeader01
	@HdrKeyNum numeric(9)
AS
	SELECT * FROM INTERFACE_HEADER
	WHERE HDR_KEY_NUM = @HdrKeyNum
