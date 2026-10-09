/*
	Task	| By	| Date		| Modification Description
	--------------------------------------------------------------------
	17111	| VK	| 11/22/05	| Created
	18633	| VK	| 02/10/06	| Added support for purchase orders
	19199	| MAG	| 04/24/06	| Order the Selection of records by Interface_Record_Id
*/

CREATE PROCEDURE wm_RUDownloadReceiptHeader02
	@ProcessStamp nvarchar(100),
	@MaxRecords numeric(9)
AS
	declare @ready nvarchar(25);
	declare @inProcess nvarchar(25);
	declare @receiving nvarchar(25);
	declare @sql nvarchar(1000);

	set @ready = N'Ready';
	set @inProcess = N'In Process';
	set @receiving = N'Receiving';

	set @sql = N'UPDATE DOWNLOAD_PURCHASE_ORDER_HEADER
			SET INTERFACE_CONDITION = @inProcessParam, 
			    PROCESS_STAMP = @processStampParam
			WHERE INTERFACE_RECORD_ID IN (	
				SELECT TOP '+convert(varchar, @maxRecords)+N' INTERFACE_RECORD_ID
				FROM DOWNLOAD_PURCHASE_ORDER_HEADER
				WHERE INTERFACE_CONDITION = @readyParam 
				  OR INTERFACE_CONDITION IS NULL
				ORDER BY INTERFACE_RECORD_ID)';
	exec sp_executesql @sql,N'@readyParam nvarchar(25),
		 @inProcessParam nvarchar(25),
		 @processStampParam nvarchar(100)',
		 @readyParam = @ready,
		 @inProcessParam = @inProcess,
		 @processStampParam = @ProcessStamp;
	set @maxRecords = @maxRecords - @@ROWCOUNT;
	
	IF (@maxRecords > 0)
	BEGIN
		set @sql = N'UPDATE DOWNLOAD_PURCHASE_ORDER_DETAIL
				SET INTERFACE_CONDITION = @inProcessParam, 
				    PROCESS_STAMP = @processStampParam
				WHERE INTERFACE_RECORD_ID IN(	
					SELECT TOP '+convert(varchar, @maxRecords)+N' INTERFACE_RECORD_ID 
				 	FROM DOWNLOAD_PURCHASE_ORDER_DETAIL
					WHERE (INTERFACE_CONDITION = @readyParam 
					     OR INTERFACE_CONDITION IS NULL)
			      		    AND (INTERFACE_LINK_ID IS NULL 
				   		 OR INTERFACE_LINK_ID NOT IN (
							SELECT INTERFACE_RECORD_ID
							FROM DOWNLOAD_PURCHASE_ORDER_HEADER WITH (NOLOCK)))
					ORDER BY INTERFACE_RECORD_ID)';
		exec sp_executesql @sql,N'@readyParam nvarchar(25),
		 	@inProcessParam nvarchar(25),
		 	@processStampParam nvarchar(100)',
		 	@readyParam = @ready,
		 	@inProcessParam = @inProcess,
		 	@processStampParam = @ProcessStamp;
		set @maxRecords = @maxRecords - @@ROWCOUNT;
	END;
	
	IF (@maxRecords > 0)
	BEGIN
		set @sql = N'UPDATE DOWNLOAD_RECEIPT_HEADER
			SET INTERFACE_CONDITION = @inProcessParam, 
			    PROCESS_STAMP = @processStampParam
			WHERE INTERFACE_RECORD_ID IN (	
				SELECT TOP '+convert(varchar, @maxRecords)+N' INTERFACE_RECORD_ID
				FROM DOWNLOAD_RECEIPT_HEADER
				WHERE INTERFACE_CONDITION = @readyParam 
				  OR INTERFACE_CONDITION IS NULL
				ORDER BY INTERFACE_RECORD_ID)';

		exec sp_executesql @sql,N'@readyParam nvarchar(25),
			 @inProcessParam nvarchar(25),
			 @processStampParam nvarchar(100)',
			 @readyParam = @ready,
			 @inProcessParam = @inProcess,
			 @processStampParam = @ProcessStamp;

		set @maxRecords = @maxRecords - @@ROWCOUNT;
	END;
	
	IF (@maxRecords > 0)
	BEGIN
		set @sql = N'UPDATE DOWNLOAD_RECEIPT_DETAIL
				SET INTERFACE_CONDITION = @inProcessParam, 
				    PROCESS_STAMP = @processStampParam
				WHERE INTERFACE_RECORD_ID IN(	
					SELECT TOP '+convert(varchar, @maxRecords)+N' INTERFACE_RECORD_ID 
				 	FROM DOWNLOAD_RECEIPT_DETAIL
					WHERE (INTERFACE_CONDITION = @readyParam 
					     OR INTERFACE_CONDITION IS NULL)
			      		    AND (INTERFACE_LINK_ID IS NULL 
				   		 OR INTERFACE_LINK_ID NOT IN (
							SELECT INTERFACE_RECORD_ID
							FROM DOWNLOAD_RECEIPT_HEADER WITH (NOLOCK)))
					ORDER BY INTERFACE_RECORD_ID)';

		exec sp_executesql @sql,N'@readyParam nvarchar(25),
		 	@inProcessParam nvarchar(25),
		 	@processStampParam nvarchar(100)',
		 	@readyParam = @ready,
		 	@inProcessParam = @inProcess,
		 	@processStampParam = @ProcessStamp;

		set @maxRecords = @maxRecords - @@ROWCOUNT;

	END;

	IF (@maxRecords > 0)
	BEGIN
		set @sql = N'UPDATE DOWNLOAD_RECEIPT_CONTAINER
				SET INTERFACE_CONDITION = @inProcessParam,
				    PROCESS_STAMP = @processStampParam
				WHERE INTERFACE_RECORD_ID IN (
					SELECT TOP '+convert(varchar, @maxRecords)+N' INTERFACE_RECORD_ID
					FROM DOWNLOAD_RECEIPT_CONTAINER
					WHERE (INTERFACE_CONDITION = @readyParam 
					     OR INTERFACE_CONDITION IS NULL)
					    AND (INTERFACE_LINK_ID IS NULL 
						 OR INTERFACE_LINK_ID NOT IN (
							SELECT INTERFACE_RECORD_ID
							FROM DOWNLOAD_RECEIPT_HEADER WITH (NOLOCK))
						 OR INTERFACE_LINK_ID NOT IN (
							SELECT INTERFACE_RECORD_ID
							FROM DOWNLOAD_RECEIPT_CONTAINER WITH (NOLOCK)))
					ORDER BY INTERFACE_RECORD_ID)';

		exec sp_executesql @sql,N'@readyParam nvarchar(25),
		 	@inProcessParam nvarchar(25),
		 	@processStampParam nvarchar(100)',
		 	@readyParam = @ready,
		 	@inProcessParam = @inProcess,
		 	@processStampParam = @ProcessStamp;

		set @maxRecords = @maxRecords - @@ROWCOUNT;
	END;

	-- update appointments on receipt
	IF (@maxRecords > 0)
	BEGIN
		set @sql = 	N'UPDATE DOWNLOAD_APPT_SCHEDULE
				SET INTERFACE_CONDITION = @inProcessParam,
			            PROCESS_STAMP = @processStampParam
				WHERE INTERFACE_RECORD_ID IN(
					SELECT TOP '+convert(varchar, @maxRecords)+N' INTERFACE_RECORD_ID
					FROM DOWNLOAD_APPT_SCHEDULE
					WHERE (INTERFACE_CONDITION = @readyParam 
					     OR INTERFACE_CONDITION IS NULL)
					    AND INTERFACE_LINK_TYPE = @receivingParam
					    AND (INTERFACE_LINK_ID IS NULL 
						 OR INTERFACE_LINK_ID NOT IN (
							SELECT INTERFACE_RECORD_ID
							FROM DOWNLOAD_RECEIPT_HEADER WITH (NOLOCK)))
					ORDER BY INTERFACE_RECORD_ID)';

		exec sp_executesql @sql,N'@readyParam nvarchar(25),
		 	@inProcessParam nvarchar(25),
		 	@processStampParam nvarchar(100),
			@receivingParam nvarchar(25)',
		 	@readyParam = @ready,
		 	@inProcessParam = @inProcess,
		 	@processStampParam = @ProcessStamp,
			@receivingParam = @receiving;

		set @maxRecords = @maxRecords - @@ROWCOUNT;
	END;

	IF (@maxRecords > 0)
	BEGIN
		SET @sql = N'UPDATE DOWNLOAD_SERIAL_NUMBER
		 	    SET INTERFACE_CONDITION = @inProcessParam,
			        PROCESS_STAMP = @processStampParam
			    WHERE INTERFACE_RECORD_ID IN (
					SELECT TOP '+convert(varchar, @maxRecords)+N' INTERFACE_RECORD_ID
				       	FROM DOWNLOAD_SERIAL_NUMBER 
				      	WHERE (INTERFACE_CONDITION = @readyParam
				              OR INTERFACE_CONDITION IS NULL) 
					    AND (INTERFACE_LINK_ID IS NULL  
					         OR (INTERFACE_LINK_ID NOT IN ( 	
								SELECT INTERFACE_RECORD_ID 
								FROM DOWNLOAD_RECEIPT_HEADER WITH (NOLOCK)) 
					             AND INTERFACE_LINK_ID NOT IN ( 	
								SELECT INTERFACE_RECORD_ID 
								FROM DOWNLOAD_SERIAL_NUMBER)))
					ORDER BY INTERFACE_RECORD_ID)' ;
		
		exec sp_executesql @sql,N'@readyParam nvarchar(25),
			 @inProcessParam nvarchar(25),
			 @processStampParam nvarchar(100)',
			 @readyParam = @ready,
			 @inProcessParam = @inProcess,
			 @processStampParam = @processStamp;
	END;

	UPDATE DOWNLOAD_PURCHASE_ORDER_DETAIL
	SET INTERFACE_CONDITION = N'In Process', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_PURCHASE_ORDER_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'Processed');
	
	UPDATE DOWNLOAD_RECEIPT_DETAIL
	SET INTERFACE_CONDITION = N'In Process', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_RECEIPT_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'Processed');

	UPDATE DOWNLOAD_RECEIPT_CONTAINER
	SET INTERFACE_CONDITION = N'In Process', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_RECEIPT_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'Processed');
			
	--nested containers
	UPDATE DOWNLOAD_RECEIPT_CONTAINER
	SET INTERFACE_CONDITION = N'In Process', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_RECEIPT_CONTAINER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'Processed');

	-- update appointments on receipt
	UPDATE DOWNLOAD_APPT_SCHEDULE
	SET INTERFACE_CONDITION = N'In Process', PROCESS_STAMP = @ProcessStamp
	WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			FROM DOWNLOAD_RECEIPT_HEADER WITH (NOLOCK)
			WHERE PROCESS_STAMP = @ProcessStamp 
			AND INTERFACE_CONDITION <> N'Processed');
	
	-- stamp master serial numbers and lone serial numbers.
	UPDATE DOWNLOAD_SERIAL_NUMBER
	   SET INTERFACE_CONDITION = N'In Process', PROCESS_STAMP = @ProcessStamp
	 WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			  FROM DOWNLOAD_RECEIPT_CONTAINER WITH (NOLOCK)
			 WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'Processed');

	-- stamp minor serial numbers.  note that we do this in a different
	-- update as the masters got stamped in the previous.
	UPDATE DOWNLOAD_SERIAL_NUMBER
	   SET INTERFACE_CONDITION = N'In Process', PROCESS_STAMP = @ProcessStamp
	 WHERE INTERFACE_LINK_ID IN (
			SELECT INTERFACE_RECORD_ID
			  FROM DOWNLOAD_SERIAL_NUMBER WITH (NOLOCK)
			 WHERE PROCESS_STAMP = @ProcessStamp
			AND INTERFACE_CONDITION <> N'Processed');
	
	SELECT N'DM POH DW', *
	FROM DOWNLOAD_PURCHASE_ORDER_HEADER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'Processed'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'DM POD DW', *
	FROM DOWNLOAD_PURCHASE_ORDER_DETAIL
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'Processed'
	ORDER BY INTERFACE_RECORD_ID;
	
	SELECT N'DM RCH DW', *
	FROM DOWNLOAD_RECEIPT_HEADER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'Processed'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'DM RCD DW', *
	FROM DOWNLOAD_RECEIPT_DETAIL
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'Processed'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'DM RCC DW', *
	FROM DOWNLOAD_RECEIPT_CONTAINER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'Processed'
	ORDER BY INTERFACE_RECORD_ID;
	
	SELECT N'DM SN DW', *
	FROM DOWNLOAD_SERIAL_NUMBER
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'Processed'
	ORDER BY INTERFACE_RECORD_ID;

	SELECT N'DM AS DW', *
	FROM DOWNLOAD_APPT_SCHEDULE
	WHERE PROCESS_STAMP = @ProcessStamp
	AND INTERFACE_CONDITION <> N'Processed'
	ORDER BY INTERFACE_RECORD_ID;
	
	SELECT CASE WHEN (SUM(ALIAS.TOTAL)>0) 
	THEN N'1' ELSE N'0' END AreRecordsRemaining
	FROM (
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_RECEIPT_HEADER
		WHERE INTERFACE_CONDITION = N'Ready' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_RECEIPT_DETAIL
		WHERE INTERFACE_CONDITION = N'Ready' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_RECEIPT_CONTAINER
		WHERE INTERFACE_CONDITION = N'Ready' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_APPT_SCHEDULE
		WHERE INTERFACE_CONDITION = N'Ready' OR INTERFACE_CONDITION IS NULL
		UNION
		SELECT COUNT(*) TOTAL FROM DOWNLOAD_SERIAL_NUMBER
		WHERE INTERFACE_CONDITION = N'Ready' OR INTERFACE_CONDITION IS NULL
	) ALIAS; 
	



