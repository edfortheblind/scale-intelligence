/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/
CREATE PROCEDURE wm_RGenericConfigDetail03
	@RecordType nvarchar(50)
AS
	SELECT *
	FROM GENERIC_CONFIG_DETAIL
	WHERE RECORD_TYPE = @RecordType
	AND active = N'Y'
	ORDER BY DESCRIPTION
