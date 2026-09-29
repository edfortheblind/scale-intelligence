-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */







CREATE PROCEDURE wm_RUDownloadReceiptHeader02
	@ProcessStamp nvarchar(100),
	@MaxRecords numeric(9)
AS
	declare @ready nvarchar(25);
	declare @inProcess nvarchar(25);
	declare @receiving nvarchar(25);
	declare @sql nvarchar(1000);

	set @ready = N'<literal:1>';
	set @inProcess = N'<literal:2>';
	set @receiving = N'<literal:3>';

	set @sql = N'<literal:4>'



+convert(varchar, @maxRecords)+N'<literal:5>'



;
	exec sp_executesql @sql,N'<literal:6>'

,
		 @readyParam = @ready,
		 @inProcessParam = @inProcess,
		 @processStampParam = @ProcessStamp;
	set @maxRecords = @maxRecords - @@ROWCOUNT;
	
	IF (@maxRecords > 0)
	BEGIN
		set @sql = N'<literal:7>'



+convert(varchar, @maxRecords)+N'<literal:8>'







;
		exec sp_executesql @sql,N'<literal:9>'

,
		 	@readyParam = @ready,
		 	@inProcessParam = @inProcess,
		 	@processStampParam = @ProcessStamp;
		set @maxRecords = @maxRecords - @@ROWCOUNT;
	END;
	
	IF (@maxRecords > 0)
	BEGIN
		set @sql = N'<literal:10>'



+convert(varchar, @maxRecords)+N'<literal:11>'



;

		exec sp_executesql @sql,N'<literal:12>'

,
			 @readyParam = @ready,
			 @inProcessParam = @inProcess,
			 @processStampParam = @ProcessStamp;

		set @maxRecords = @maxRecords - @@ROWCOUNT;
	END;
	
	IF (@maxRecords > 0)
	BEGIN
		set @sql = N'<literal:13>'



+convert(varchar, @maxRecords)+N'<literal:14>'







;

		exec sp_executesql @sql,N'<literal:15>'

,
		 	@readyParam = @ready,
		 	@inProcessParam = @inProcess,
		 	@processStampParam = @ProcessStamp;

		set @maxRecords = @maxRecords - @@ROWCOUNT;

	END;

	IF (@maxRecords > 0)
	BEGIN
		set @sql = N'<literal:16>'



+convert(varchar, @maxRecords)+N'<literal:17>'










;

		exec sp_executesql @sql,N'<literal:18>'

,
		 	@readyParam = @ready,
		 	@inProcessParam = @inProcess,
		 	@processStampParam = @ProcessStamp;

		set @maxRecords = @maxRecords - @@ROWCOUNT;
	END;

	-- [comment omitted]
	IF (@maxRecords > 0)
	BEGIN
		set @sql = 	N'<literal:19>'



+convert(varchar, @maxRecords)+N'<literal:20>'








;

		exec sp_executesql @sql,N'<literal:21>'


,
		 	@readyParam = @ready,
		 	@inProcessParam = @inProcess,
		 	@processStampParam = @ProcessStamp,
			@receivingParam = @receiving;

		set @maxRecords = @maxRecords - @@ROWCOUNT;
	END;

	IF (@maxRecords > 0)
	BEGIN
		SET @sql = N'<literal:22>'



+convert(varchar, @maxRecords)+N'<literal:23>'










 ;
		
		exec sp_executesql @sql,N'<literal:24>'

,
			 @readyParam = @ready,
			 @inProcessParam = @inProcess,
			 @processStampParam = @processStamp;
	END;

	UPDATE DOWNLOAD_PURCHASE_ORDER_DETAIL
	SET INTERFACE_CONDITION = N'<literal:25>', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_PURCHASE_ORDER_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:26>');
	
	UPDATE DOWNLOAD_RECEIPT_DETAIL
	SET INTERFACE_CONDITION = N'<literal:27>', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_RECEIPT_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:28>');

	UPDATE DOWNLOAD_RECEIPT_CONTAINER
	SET INTERFACE_CONDITION = N'<literal:29>', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_RECEIPT_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:30>');
			
	-- [comment omitted]
	UPDATE DOWNLOAD_RECEIPT_CONTAINER
	SET INTERFACE_CONDITION = N'<literal:31>', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_RECEIPT_CONTAINER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:32>');

	-- [comment omitted]
	UPDATE DOWNLOAD_APPT_SCHEDULE
	SET INTERFACE_CONDITION = N'<literal:33>', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_RECEIPT_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp 
			AND INTERFACE_CONDITION <> N'<literal:34>');
	
	-- [comment omitted]
	UPDATE DOWNLOAD_SERIAL_NUMBER
	   SET INTERFACE_CONDITION = N'<literal:35>', PROCESS_STAMP = @ProcessStamp
	 WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			  FROM DOWNLOAD_RECEIPT_CONTAINER WITH (NOLOCK)
			 WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:36>');

	-- [comment omitted]
	-- [comment omitted]
	UPDATE DOWNLOAD_SERIAL_NUMBER
	   SET INTERFACE_CONDITION = N'<literal:37>', PROCESS_STAMP = @ProcessStamp
	 WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			  FROM DOWNLOAD_SERIAL_NUMBER WITH (NOLOCK)
			 WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:38>');
	
	SELECT N'<literal:39>', *
	FROM DOWNLOAD_PURCHASE_ORDER_HEADER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:40>'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'<literal:41>', *
	FROM DOWNLOAD_PURCHASE_ORDER_DETAIL
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:42>'
	ORDER BY INTERFACE_RECORD_ID;
	
	SELECT N'<literal:43>', *
	FROM DOWNLOAD_RECEIPT_HEADER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:44>'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'<literal:45>', *
	FROM DOWNLOAD_RECEIPT_DETAIL
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:46>'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'<literal:47>', *
	FROM DOWNLOAD_RECEIPT_CONTAINER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:48>'
	ORDER BY INTERFACE_RECORD_ID;
	
	SELECT N'<literal:49>', *
	FROM DOWNLOAD_SERIAL_NUMBER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:50>'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'<literal:51>', *
	FROM DOWNLOAD_APPT_SCHEDULE
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:52>'
	ORDER BY INTERFACE_RECORD_ID;
	
	SELECT CASE WHEN (SUM(ALIAS.TOTAL)>0) 
	THEN N'<literal:53>' ELSE N'<literal:54>' END AreRecordsRemaining
	FROM (
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_RECEIPT_HEADER
		WHERE INTERFACE_CONDITION = N'<literal:55>' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_RECEIPT_DETAIL
		WHERE INTERFACE_CONDITION = N'<literal:56>' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_RECEIPT_CONTAINER
		WHERE INTERFACE_CONDITION = N'<literal:57>' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_APPT_SCHEDULE
		WHERE INTERFACE_CONDITION = N'<literal:58>' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_SERIAL_NUMBER
		WHERE INTERFACE_CONDITION = N'<literal:59>' OR INTERFACE_CONDITION IS NULL
	) ALIAS; 
	



