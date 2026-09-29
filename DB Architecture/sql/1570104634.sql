-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE wm_RUploadOrderHeader02
AS
	-- [comment omitted]

	SELECT *
	FROM UPLOAD_ORDER_HEADER
	WHERE INTERFACE_CONDITION = N'<literal:1>';