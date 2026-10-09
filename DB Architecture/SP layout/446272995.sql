/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	15053	| MD	| 10/01/04	| Added support for appointment schedule download.
	18633	| VK	| 02/10/06	| Added support for purchase order download
*/

CREATE PROCEDURE wm_DDownloadReceiptHeader01
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	DELETE FROM DOWNLOAD_SERIAL_NUMBER
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @@ROWCOUNT

	DELETE FROM DOWNLOAD_APPT_SCHEDULE
	WHERE PROCESS_STAMP = @ProcessStamp AND INTERFACE_LINK_TYPE = N'Receiving';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	DELETE FROM DOWNLOAD_RECEIPT_CONTAINER
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	DELETE FROM DOWNLOAD_RECEIPT_DETAIL
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	DELETE FROM DOWNLOAD_RECEIPT_HEADER
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
	
	DELETE FROM DOWNLOAD_PURCHASE_ORDER_HEADER
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
	
	DELETE FROM DOWNLOAD_PURCHASE_ORDER_DETAIL
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT


