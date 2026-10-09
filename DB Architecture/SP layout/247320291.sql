/*
59031   | DRK   | 09/25/09  | Added VAS Download functionality   
51519	| MDL   | 01/20/10  | Modified to delete only processed records
191074	| DN	| 01/23/17  | Updated parameter types
*/

CREATE PROCEDURE wm_DDownloadOrderHeader01
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	DELETE FROM DOWNLOAD_ORDER_CONTAINER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'Processed';

	SET @RowsAffected = @@ROWCOUNT

	DELETE FROM DOWNLOAD_ORDER_COMMENT
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'Processed';
	

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	DELETE FROM DOWNLOAD_ORDER_VAS_ACTIVITY
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'Processed';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

    DELETE FROM DOWNLOAD_ORDER_DETAIL
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'Processed';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	DELETE FROM DOWNLOAD_ORDER_HEADER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'Processed';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
