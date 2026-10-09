/*
	51519	   | MDL | 01/20/10  | Created   
	191074	   | DN	 | 01/23/17	 | Updated parameter types
*/

CREATE PROCEDURE wm_UDownloadOrderHeader04
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	UPDATE DOWNLOAD_ORDER_CONTAINER
	SET INTERFACE_CONDITION = N'Error'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'In Process';

	SET @RowsAffected = @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_COMMENT
	SET INTERFACE_CONDITION = N'Error'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'In Process';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

    UPDATE DOWNLOAD_ORDER_VAS_ACTIVITY
	SET INTERFACE_CONDITION = N'Error'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'In Process';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
    
	UPDATE DOWNLOAD_ORDER_DETAIL
	SET INTERFACE_CONDITION = N'Error'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'In Process';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_HEADER
	SET INTERFACE_CONDITION = N'Error'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION = N'In Process';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
