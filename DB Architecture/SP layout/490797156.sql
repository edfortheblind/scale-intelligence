/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	15053	| MD	| 10/01/04	| Added support for appointment schedule download.
	16023	| KMD	| 01/26/05	| Added support for serial number download.
	18633	| VK	| 02/10/06	| Added support for purchase order download.
	191074	| DN	| 01/23/17	| Updated parameter types
*/

CREATE PROCEDURE wm_UDownloadReceiptHeader01
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	UPDATE DOWNLOAD_RECEIPT_CONTAINER
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @@ROWCOUNT

	UPDATE DOWNLOAD_RECEIPT_DETAIL
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_RECEIPT_HEADER
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_SERIAL_NUMBER
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_APPT_SCHEDULE
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp AND INTERFACE_LINK_TYPE = N'Receiving';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
	
	UPDATE DOWNLOAD_PURCHASE_ORDER_HEADER
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
	
	UPDATE DOWNLOAD_PURCHASE_ORDER_DETAIL
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT