/*
59031   | DRK   | 09/25/09  | Added VAS Download functionality 
51519	| MDL   | 01/20/10  | Modified for not to update In Process records
191074	| DN	| 01/23/17	| Updated parameter types
*/

CREATE PROCEDURE wm_UDownloadOrderHeader01
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	UPDATE DOWNLOAD_ORDER_CONTAINER
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'In Process';

	SET @RowsAffected = @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_COMMENT
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'In Process';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

    UPDATE DOWNLOAD_ORDER_VAS_ACTIVITY
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'In Process';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
    
	UPDATE DOWNLOAD_ORDER_DETAIL
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'In Process';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_HEADER
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'In Process';

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT
