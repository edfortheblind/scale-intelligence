-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */









CREATE PROCEDURE wm_RUDownloadOrderHeader02
	@ProcessStamp nvarchar(100),
	@MaxRecords numeric(9)
AS
	declare @ready nvarchar(25);
	declare @inProcess nvarchar(25);
	declare @sql nvarchar(1000);
	
	set @ready = N'<literal:1>';
	set @inProcess = N'<literal:2>';
	
	set @sql = N'<literal:3>'


+convert(varchar, @maxRecords)+N'<literal:4>'


;

	exec sp_executesql @sql,N'<literal:5>'

,
		@readyParam = @ready,
		@inProcessParam = @inProcess,
		@processStampParam = @ProcessStamp; 

	set @maxRecords = @maxRecords - @@ROWCOUNT;	

	IF (@maxRecords > 0)
	BEGIN		
		set @sql = N'<literal:6>'


+convert(varchar, @maxRecords)+N'<literal:7>'





;

		exec sp_executesql @sql,N'<literal:8>'

,
			@readyParam = @ready,
			@inProcessParam = @inProcess,
			@processStampParam = @ProcessStamp; 

		set @maxRecords = @maxRecords - @@ROWCOUNT;
	END;

	IF (@maxRecords > 0)
	BEGIN
		set @sql = N'<literal:9>'


+convert(varchar, @maxRecords)+N'<literal:10>'












;

		exec sp_executesql @sql,N'<literal:11>'

,
			@readyParam = @ready,
			@inProcessParam = @inProcess,
			@processStampParam = @ProcessStamp; 

		set @maxRecords = @maxRecords - @@ROWCOUNT;
	END;

	IF (@maxRecords > 0)
	BEGIN
		set @sql = N'<literal:12>'


+convert(varchar, @maxRecords)+N'<literal:13>'









;

		exec sp_executesql @sql,N'<literal:14>'

,
			@readyParam = @ready,
			@inProcessParam = @inProcess,
			@processStampParam = @ProcessStamp; 

        set @maxRecords = @maxRecords - @@ROWCOUNT;
	END;

	IF (@maxRecords > 0)
	BEGIN
		set @sql = N'<literal:15>'


+convert(varchar, @maxRecords)+N'<literal:16>'









;

		exec sp_executesql @sql,N'<literal:17>'

,
			@readyParam = @ready,
			@inProcessParam = @inProcess,
			@processStampParam = @ProcessStamp; 

	END;

	UPDATE DOWNLOAD_ORDER_DETAIL
	SET INTERFACE_CONDITION = N'<literal:18>', PROCESS_STAMP = @ProcessStamp
	WHERE 
		INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_ORDER_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:19>'
			AND INTERFACE_CONDITION <> N'<literal:20>');
			
	
	UPDATE DOWNLOAD_ORDER_CONTAINER
	SET INTERFACE_CONDITION = N'<literal:21>',PROCESS_STAMP = @ProcessStamp
	WHERE 
		INTERFACE_LINK_ID IN (
		SELECT INTERFACE_RECORD_ID
		FROM DOWNLOAD_ORDER_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:22>'
			AND INTERFACE_CONDITION <> N'<literal:23>');

	-- [comment omitted]
   	UPDATE DOWNLOAD_ORDER_CONTAINER
	SET INTERFACE_CONDITION = N'<literal:24>',PROCESS_STAMP = @ProcessStamp
	WHERE 
		INTERFACE_LINK_ID IN (
		SELECT INTERFACE_RECORD_ID
		FROM DOWNLOAD_ORDER_CONTAINER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:25>'
			AND INTERFACE_CONDITION <> N'<literal:26>');

	-- [comment omitted]
   	UPDATE DOWNLOAD_ORDER_CONTAINER
	SET INTERFACE_CONDITION = N'<literal:27>',PROCESS_STAMP = @ProcessStamp
	WHERE 
		INTERFACE_LINK_ID IN (
		SELECT INTERFACE_RECORD_ID
		FROM DOWNLOAD_ORDER_CONTAINER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:28>'
			AND INTERFACE_CONDITION <> N'<literal:29>');

	-- [comment omitted]
   	UPDATE DOWNLOAD_ORDER_CONTAINER
	SET INTERFACE_CONDITION = N'<literal:30>',PROCESS_STAMP = @ProcessStamp
	WHERE 
		INTERFACE_LINK_ID IN (
		SELECT INTERFACE_RECORD_ID
		FROM DOWNLOAD_ORDER_CONTAINER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:31>'
			AND INTERFACE_CONDITION <> N'<literal:32>');

	-- [comment omitted]
	UPDATE DOWNLOAD_ORDER_CONTAINER
	SET INTERFACE_CONDITION = N'<literal:33>',PROCESS_STAMP = @ProcessStamp
	WHERE 
		INTERFACE_PARENT_LINK_ID IN (
		SELECT INTERFACE_RECORD_ID
		FROM DOWNLOAD_ORDER_CONTAINER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:34>'
			AND INTERFACE_CONDITION <> N'<literal:35>');

	UPDATE DOWNLOAD_ORDER_COMMENT
	SET INTERFACE_CONDITION = N'<literal:36>', PROCESS_STAMP = @ProcessStamp
	WHERE  (INTERFACE_CONDITION = N'<literal:37>' OR INTERFACE_CONDITION IS NULL) AND
		INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_ORDER_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:38>'
			AND INTERFACE_CONDITION <> N'<literal:39>');

	UPDATE DOWNLOAD_ORDER_COMMENT
	SET INTERFACE_CONDITION = N'<literal:40>', PROCESS_STAMP = @ProcessStamp
	WHERE  (INTERFACE_CONDITION = N'<literal:41>' OR INTERFACE_CONDITION IS NULL) AND
		INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_ORDER_DETAIL WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:42>'
			AND INTERFACE_CONDITION <> N'<literal:43>');

	UPDATE DOWNLOAD_ORDER_VAS_ACTIVITY
	SET INTERFACE_CONDITION = N'<literal:44>', PROCESS_STAMP = @ProcessStamp
	WHERE  (INTERFACE_CONDITION = N'<literal:45>' OR INTERFACE_CONDITION IS NULL) AND
		INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_ORDER_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:46>'
			AND INTERFACE_CONDITION <> N'<literal:47>');

	UPDATE DOWNLOAD_ORDER_VAS_ACTIVITY
	SET INTERFACE_CONDITION = N'<literal:48>', PROCESS_STAMP = @ProcessStamp
	WHERE  (INTERFACE_CONDITION = N'<literal:49>' OR INTERFACE_CONDITION IS NULL) AND
		INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_ORDER_DETAIL WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'<literal:50>'
			AND INTERFACE_CONDITION <> N'<literal:51>');

	SELECT N'<literal:52>', *
	FROM DOWNLOAD_ORDER_HEADER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:53>'
	AND INTERFACE_CONDITION <> N'<literal:54>'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'<literal:55>', *
	FROM DOWNLOAD_ORDER_DETAIL
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:56>'
	AND INTERFACE_CONDITION <> N'<literal:57>'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'<literal:58>', *
	FROM DOWNLOAD_ORDER_CONTAINER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:59>'
	AND INTERFACE_CONDITION <> N'<literal:60>'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'<literal:61>', *
	FROM DOWNLOAD_ORDER_COMMENT
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:62>'
	AND INTERFACE_CONDITION <> N'<literal:63>'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'<literal:64>', *
	FROM DOWNLOAD_ORDER_VAS_ACTIVITY
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:65>'
	AND INTERFACE_CONDITION <> N'<literal:66>'
    AND (ERP_ORDER_LINE_NUM <= 0 OR ERP_ORDER_LINE_NUM IS NULL)
	ORDER BY INTERFACE_RECORD_ID;

    SELECT N'<literal:67>', *
	FROM DOWNLOAD_ORDER_VAS_ACTIVITY
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'<literal:68>'
	AND INTERFACE_CONDITION <> N'<literal:69>'
    AND ERP_ORDER_LINE_NUM > 0
	ORDER BY INTERFACE_RECORD_ID;

SELECT CASE WHEN (SUM(ALIAS.TOTAL)>0) 
	THEN N'<literal:70>' ELSE N'<literal:71>' END AreRecordsRemaining
	FROM (
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_ORDER_HEADER
		WHERE INTERFACE_CONDITION = N'<literal:72>' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_ORDER_DETAIL
		WHERE INTERFACE_CONDITION = N'<literal:73>' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_ORDER_CONTAINER
		WHERE INTERFACE_CONDITION = N'<literal:74>' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_ORDER_COMMENT
		WHERE INTERFACE_CONDITION = N'<literal:75>' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_ORDER_VAS_ACTIVITY
		WHERE INTERFACE_CONDITION = N'<literal:76>' OR INTERFACE_CONDITION IS NULL
	      ) ALIAS;

