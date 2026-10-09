/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_RStorageTemplateHeader01
	@StorageTemplate nvarchar(25)
AS
	SELECT * FROM STORAGE_TEMPLATE_HEADER
	WHERE STORAGE_TEMPLATE = @StorageTemplate

