-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_UDownloadOrderHeader02
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	UPDATE DOWNLOAD_ORDER_CONTAINER
	SET INTERFACE_CONDITION = N'<literal:1>'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_COMMENT
	SET INTERFACE_CONDITION = N'<literal:2>'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_DETAIL
	SET INTERFACE_CONDITION = N'<literal:3>'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_HEADER
	SET INTERFACE_CONDITION = N'<literal:4>'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT