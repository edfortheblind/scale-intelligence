-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RStorageTemplateHeader01
	@StorageTemplate nvarchar(25)
AS
	SELECT * FROM STORAGE_TEMPLATE_HEADER
	WHERE STORAGE_TEMPLATE = @StorageTemplate

