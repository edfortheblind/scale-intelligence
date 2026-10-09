
CREATE PROCEDURE wm_RStorageTemplateDetail02
	@StorageTemplate nvarchar(25)
AS
	SELECT
		*
	FROM
		STORAGE_TEMPLATE_DETAIL
	WHERE
		STORAGE_TEMPLATE = @StorageTemplate
	ORDER BY
		SEQUENCE;


