/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RStorageTemplateDetail03
	@StorageTemplate nvarchar(25)
AS
	SELECT * FROM STORAGE_TEMPLATE_DETAIL
	WHERE STORAGE_TEMPLATE = IsNull(@StorageTemplate,N'*Default')
	AND SEQUENCE = (SELECT MIN(SEQUENCE) FROM STORAGE_TEMPLATE_DETAIL
		WHERE STORAGE_TEMPLATE = IsNull(@StorageTemplate,N'*Default'))

