-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_DDownloadItem01
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	DELETE FROM DOWNLOAD_ITEM
	WHERE PROCESS_STAMP = @ProcessStamp;

SET @RowsAffected = @@ROWCOUNT
