/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_UDownloadOrderHeader02
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	UPDATE DOWNLOAD_ORDER_CONTAINER
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_COMMENT
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_DETAIL
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT

	UPDATE DOWNLOAD_ORDER_HEADER
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp;

	SET @RowsAffected = @RowsAffected + @@ROWCOUNT