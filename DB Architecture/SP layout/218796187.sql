/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	17111	| VK	| 11/21/05	| Created
	19199	| MAG	| 04/24/06	| Order the Selection of records by Interface_Record_Id

*/
	


CREATE PROCEDURE wm_RUDownloadItem02
	@ProcessStamp nvarchar(100),
	@MaxRecords numeric(9)
AS

	declare @ready nvarchar(25);
	declare @inProcess nvarchar(25);
	declare @sql nvarchar(1000);

	set @ready = N'Ready';
	set @inProcess = N'In Process';

	set @sql = N'UPDATE DOWNLOAD_ITEM
		    SET INTERFACE_CONDITION = @inProcessParam, PROCESS_STAMP = @processStampParam
		    WHERE INTERFACE_RECORD_ID IN (SELECT TOP '+convert(varchar, @MaxRecords)+N' INTERFACE_RECORD_ID
				FROM DOWNLOAD_ITEM
				WHERE INTERFACE_CONDITION = @readyParam OR INTERFACE_CONDITION IS NULL
				ORDER BY INTERFACE_RECORD_ID)';

	exec sp_executesql @sql,N'@readyParam nvarchar(25),
		 	@inProcessParam nvarchar(25),
		 	@processStampParam nvarchar(100)',
		 	@readyParam = @ready,
		 	@inProcessParam = @inProcess,
		 	@processStampParam = @ProcessStamp;

	SELECT N'DM ITM DW', *
	FROM DOWNLOAD_ITEM
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'Processed'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT CASE WHEN (COUNT(*) >0)
		 THEN N'1' ELSE N'0' END AreRecordsRemaining
	FROM DOWNLOAD_ITEM 
	WHERE INTERFACE_CONDITION IS NULL OR INTERFACE_CONDITION = N'Ready';




