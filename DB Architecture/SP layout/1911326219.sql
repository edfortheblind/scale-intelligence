/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/17	| Updated parameter types

*/

	CREATE PROCEDURE wm_UDownloadItem01
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	UPDATE DOWNLOAD_ITEM
	SET INTERFACE_CONDITION = N'Processed'
	WHERE PROCESS_STAMP = @ProcessStamp;

SET @RowsAffected = @@ROWCOUNT
