-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_RStorageTemplateHeader02
	@ItemClass nvarchar(50)
AS
	SELECT * FROM STORAGE_TEMPLATE_HEADER
	WHERE STORAGE_TEMPLATE IN
		(SELECT isNull(SYS1VALUE,N'<literal:1>') FROM GENERIC_CONFIG_DETAIL
			WHERE RECORD_TYPE = N'<literal:2>'
			AND IDENTIFIER = @ItemClass)

