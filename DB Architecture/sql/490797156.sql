-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */








CREATE PROCEDURE wm_UDownloadReceiptHeader01
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	UPDATE DOWNLOAD_RECEIPT_CONTAINER
	SET INTERFACE_CONDITION = N'<literal:1>'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @@ROWCOUNT

	UPDATE DOWNLOAD_RECEIPT_DETAIL
	SET INTERFACE_CONDITION = N'<literal:2>'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_RECEIPT_HEADER
	SET INTERFACE_CONDITION = N'<literal:3>'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_SERIAL_NUMBER
	SET INTERFACE_CONDITION = N'<literal:4>'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_APPT_SCHEDULE
	SET INTERFACE_CONDITION = N'<literal:5>'
	WHERE PROCESS_STAMP = @ProcessStamp AND INTERFACE_LINK_TYPE = N'<literal:6>';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
	
	UPDATE DOWNLOAD_PURCHASE_ORDER_HEADER
	SET INTERFACE_CONDITION = N'<literal:7>'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
	
	UPDATE DOWNLOAD_PURCHASE_ORDER_DETAIL
	SET INTERFACE_CONDITION = N'<literal:8>'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT