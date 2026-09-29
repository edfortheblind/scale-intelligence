-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	CREATE PROCEDURE wm_UDownloadItem01
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	UPDATE DOWNLOAD_ITEM
	SET INTERFACE_CONDITION = N'<literal:1>'
	WHERE PROCESS_STAMP = @ProcessStamp;

SET @RowsAffected = @@ROWCOUNT
