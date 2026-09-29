-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






	


CREATE PROCEDURE wm_RUDownloadItem02
	@ProcessStamp nvarchar(100),
	@MaxRecords numeric(9)
AS

	declare @ready nvarchar(25);
	declare @inProcess nvarchar(25);
	declare @sql nvarchar(1000);

	set @ready = N'<literal:1>';
	set @inProcess = N'<literal:2>';

	set @sql = N'<literal:3>'

+convert(varchar, @MaxRecords)+N'<literal:4>'


;

	exec sp_executesql @sql,N'<literal:5>'

,
		 	@readyParam = @ready,
		 	@inProcessParam = @inProcess,
		 	@processStampParam = @ProcessStamp;

	SELECT N'<literal:6>', *
	FROM DOWNLOAD_ITEM
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:7>'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT CASE WHEN (COUNT(*) >0)
		 THEN N'<literal:8>' ELSE N'<literal:9>' END AreRecordsRemaining
	FROM DOWNLOAD_ITEM 
	WHERE INTERFACE_CONDITION IS NULL OR INTERFACE_CONDITION = N'<literal:10>';




