-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_DDownloadOrderHeader01
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	DELETE FROM DOWNLOAD_ORDER_CONTAINER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'<literal:1>';

	SET @RowsAffected = @@ROWCOUNT

	DELETE FROM DOWNLOAD_ORDER_COMMENT
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'<literal:2>';
	

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	DELETE FROM DOWNLOAD_ORDER_VAS_ACTIVITY
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'<literal:3>';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

    DELETE FROM DOWNLOAD_ORDER_DETAIL
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'<literal:4>';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	DELETE FROM DOWNLOAD_ORDER_HEADER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'<literal:5>';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
