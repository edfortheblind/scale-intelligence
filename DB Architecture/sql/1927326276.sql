-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE wm_UDownloadOrderHeader01
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	UPDATE DOWNLOAD_ORDER_CONTAINER
	SET INTERFACE_CONDITION = N'<literal:1>'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:2>';

	SET @RowsAffected = @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_COMMENT
	SET INTERFACE_CONDITION = N'<literal:3>'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:4>';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

    UPDATE DOWNLOAD_ORDER_VAS_ACTIVITY
	SET INTERFACE_CONDITION = N'<literal:5>'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:6>';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
    
	UPDATE DOWNLOAD_ORDER_DETAIL
	SET INTERFACE_CONDITION = N'<literal:7>'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:8>';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_HEADER
	SET INTERFACE_CONDITION = N'<literal:9>'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:10>';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
