-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */

















	

CREATE PROCEDURE RTH_UpdateHeader(
	@iIntRecNum numeric(9))
AS
	SET NOCOUNT ON;

	-- [comment omitted]

	declare @closedSts numeric(3);
	DECLARE @warehouse nvarchar(25);

	set @closedSts = (SELECT dbo.STSfn_RtrvSts(N'<literal:1>', N'<literal:2>'));
	SELECT @warehouse = WAREHOUSE FROM RECEIPT_HEADER WHERE INTERNAL_RECEIPT_NUM = @iIntRecNum;

	UPDATE RECEIPT_HEADER
	
		   -- [comment omitted]
	   SET TRAILING_STS = isnull(a.trailingSts, TRAILING_STS),
		   TRAILING_STS_DATE = CASE WHEN isnull(a.trailingSts, TRAILING_STS) <> TRAILING_STS
									THEN (SELECT dbo.DHfn_GetDateNoTime(dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())))
									ELSE TRAILING_STS_DATE
									 END,
		   TRAILING_STS_FAILED = CASE WHEN isnull(a.trailingSts, TRAILING_STS) <> TRAILING_STS
									THEN N'<literal:3>'
									ELSE TRAILING_STS_FAILED
									 END,
									 
		   -- [comment omitted]
		   LEADING_STS = isnull(a.leadingSts, LEADING_STS),
		   LEADING_STS_DATE = CASE WHEN isnull(a.leadingSts, LEADING_STS) <> LEADING_STS
								   THEN (SELECT dbo.DHfn_GetDateNoTime(dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())))
								   ELSE LEADING_STS_DATE
								    END,
		   LEADING_STS_FAILED = CASE WHEN isnull(a.leadingSts, LEADING_STS) <> LEADING_STS
								   THEN N'<literal:4>'
								   ELSE LEADING_STS_FAILED
								    END,
			
		   -- [comment omitted]
		   CLOSE_DATE = CASE WHEN isnull(a.trailingSts, TRAILING_STS) <> TRAILING_STS
							  AND a.trailingSts = @closedSts
							 THEN (GETUTCDATE())
							 ELSE CLOSE_DATE
							  END,
		   PROCESS_STAMP = N'<literal:5>',
		   DATE_TIME_STAMP = GETUTCDATE()
			
				   -- [comment omitted]
				   -- [comment omitted]
	  FROM (SELECT CASE WHEN dtl.openQty > 0.0 
						THEN (SELECT dbo.STSfn_RtrvStsForAction(N'<literal:6>', 
																N'<literal:7>'))
						ELSE cnt.minCntSts 
						 END trailingSts,

				   -- [comment omitted]
				   cnt.maxCntSts leadingSts
				   
			  FROM (SELECT MIN(STATUS) minCntSts,
						   MAX(STATUS) maxCntSts
					  FROM RECEIPT_CONTAINER WITH (NOLOCK)
					 WHERE INTERNAL_RECEIPT_NUM = @iIntRecNum) cnt,
				   (SELECT SUM(OPEN_QTY) openQty
				      FROM RECEIPT_DETAIL WITH (NOLOCK)
				     WHERE INTERNAL_RECEIPT_NUM = @iIntRecNum) dtl) a
	 WHERE INTERNAL_RECEIPT_NUM = @iIntRecNum;
	if (@@ERROR <> 0) return -1;

	-- [comment omitted]
	INSERT INTO WAREHOUSE_ALERT_REQUEST (
		ALERT_TYPE, 
		INTERNAL_ALERT_NUM,
		INTERNAL_SOURCE_NUM, 
		WAREHOUSE, PROCESSED, 
		ACTIVITY_DATE_TIME, 
		USER_STAMP, PROCESS_STAMP, 
		DATE_TIME_STAMP, 
		PRIORITY, 
		MESSAGE, 
		IDENTIFIER1)
	SELECT ALERT.ALERT_TYPE,
	       ALERT.INTERNAL_ALERT_NUM,
	       REC.INTERNAL_RECEIPT_NUM, 
	       REC.WAREHOUSE,
	       N'<literal:8>',
	       GETUTCDATE(),
	       N'<literal:9>',
	       N'<literal:10>',
	       GETUTCDATE(),
	       ALERT.PRIORITY,
	       ALERT.MESSAGE,
	       @closedSts
	 FROM RECEIPT_HEADER REC WITH (NOLOCK), WAREHOUSE_ALERT ALERT WITH (NOLOCK) 
	 WHERE ALERT.ALERT_TYPE = N'<literal:11>'
	    AND REC.INTERNAL_RECEIPT_NUM = @iIntRecNum
	    AND REC.TRAILING_STS = @closedSts 
	    AND ALERT.ACTIVE = N'<literal:12>'
	    AND NOT EXISTS (SELECT REQUEST.INTERNAL_ALERT_REQ_NUM
	                    FROM WAREHOUSE_ALERT_REQUEST REQUEST WITH (NOLOCK) 
	                    WHERE REQUEST.INTERNAL_ALERT_NUM = ALERT.INTERNAL_ALERT_NUM
	                      AND REQUEST.INTERNAL_SOURCE_NUM = REC.INTERNAL_RECEIPT_NUM
	                      AND REQUEST.IDENTIFIER1 = @closedSts);

	if (@@ERROR <> 0) return -1;
-- [comment omitted]
