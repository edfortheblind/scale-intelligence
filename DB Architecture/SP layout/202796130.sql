/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	16763	| SMF	| 06/21/05	| Modified to only return the configured number of records
					  Merged Oracle and SQLServer
	16780	| SP 	| 09/06/05	| Added Record_type to query
	17111	| VK	| 11/25/05	| Moved the changes of 16763 to new SP wm_RUDownloadItem02
*/
	



CREATE PROCEDURE wm_RUDownloadItem01
	@ProcessStamp nvarchar(100)
AS

	UPDATE DOWNLOAD_ITEM
	SET INTERFACE_CONDITION = N'In Process', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_RECORD_ID IN (
		SELECT INTERFACE_RECORD_ID
		FROM DOWNLOAD_ITEM
		WHERE INTERFACE_CONDITION = N'Ready' OR INTERFACE_CONDITION IS NULL);

	SELECT N'DM ITM DW', *
	FROM DOWNLOAD_ITEM
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'Processed';




