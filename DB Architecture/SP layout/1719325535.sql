/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RStorageTemplateHeader02
	@ItemClass nvarchar(50)
AS
	SELECT * FROM STORAGE_TEMPLATE_HEADER
	WHERE STORAGE_TEMPLATE IN
		(SELECT isNull(SYS1VALUE,N'*Default') FROM GENERIC_CONFIG_DETAIL
			WHERE RECORD_TYPE = N'ITEMCLASS'
			AND IDENTIFIER = @ItemClass)

