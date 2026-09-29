-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE wm_DDownloadOrderHeader02
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	DELETE FROM DOWNLOAD_ORDER_CONTAINER
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @@ROWCOUNT

	DELETE FROM DOWNLOAD_ORDER_COMMENT
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	DELETE FROM DOWNLOAD_ORDER_DETAIL
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	DELETE FROM DOWNLOAD_ORDER_HEADER
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
