-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







	



CREATE PROCEDURE wm_RUDownloadItem01
	@ProcessStamp nvarchar(100)
AS

	UPDATE DOWNLOAD_ITEM
	SET INTERFACE_CONDITION = N'<literal:1>', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_RECORD_ID IN (
		SELECT INTERFACE_RECORD_ID
		FROM DOWNLOAD_ITEM
		WHERE INTERFACE_CONDITION = N'<literal:2>' OR INTERFACE_CONDITION IS NULL);

	SELECT N'<literal:3>', *
	FROM DOWNLOAD_ITEM
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:4>';




