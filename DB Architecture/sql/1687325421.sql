-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RStorageTemplateDetail03
	@StorageTemplate nvarchar(25)
AS
	SELECT * FROM STORAGE_TEMPLATE_DETAIL
	WHERE STORAGE_TEMPLATE = IsNull(@StorageTemplate,N'<literal:1>')
	AND SEQUENCE = (SELECT MIN(SEQUENCE) FROM STORAGE_TEMPLATE_DETAIL
		WHERE STORAGE_TEMPLATE = IsNull(@StorageTemplate,N'<literal:2>'))

