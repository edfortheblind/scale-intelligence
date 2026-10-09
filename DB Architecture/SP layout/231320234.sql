/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	191074		| DN		| 01/23/2017	| Updated parameter types

*/
CREATE PROCEDURE wm_DDownloadItem01
	@RowsAffected int OUTPUT,
	@ProcessStamp nvarchar(100)
AS
	DELETE FROM DOWNLOAD_ITEM
	WHERE PROCESS_STAMP = @ProcessStamp;

SET @RowsAffected = @@ROWCOUNT
