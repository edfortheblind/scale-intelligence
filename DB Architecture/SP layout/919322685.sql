/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RInterfaceDetail02
	@HdrKeyNum numeric(9)
AS
	SELECT * FROM INTERFACE_DETAIL
	WHERE HDR_KEY_NUM = @HdrKeyNum
	ORDER BY SEQUENCE
