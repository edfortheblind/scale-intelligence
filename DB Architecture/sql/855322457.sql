-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_RGenericConfigDetail03
	@RecordType nvarchar(50)
AS
	SELECT *
	FROM GENERIC_CONFIG_DETAIL
	WHERE RECORD_TYPE = @RecordType
	AND active = N'<literal:1>'
	ORDER BY DESCRIPTION
