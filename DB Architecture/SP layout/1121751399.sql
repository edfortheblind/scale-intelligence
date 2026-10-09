/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB		| 05/31/02	| Created.
	11868       	| TBS           | 09/15/03  	| Added multi-byte support.
	11868		| TBS		| 10/06/03	| Added "N" prefix to string literals (removed by
			|				|			| precompiler if single-byte database).
	9593		| RAB			| 10/09/02	| Modified for standards.
	17784		| SMF			| 11/09/05	| Write warehouse alert when receipt is closed
	19864           | NN                    | 08/31/06      | Removed the Read Locks from Select Statements
	66813		| MMM		| 02/01/11	| Modified updation of CLOSE_DATE field to include time value when
										| receipt is closed and removed ORACLE block
	224225		| SO			| 05/17/18	| Modified To updated trailing/leading status date with warehouse date. 

	Updates the status of the ReceiptHeader
	
	Parameters
		int		@iIntRecNum		ReceiptHeader being updated.
*/	

CREATE PROCEDURE RTH_UpdateHeader(
	@iIntRecNum numeric(9))
AS
	SET NOCOUNT ON;

	-- #DEFINE WMW.Jsharp.General com.pronto.general.Constants Constants;

	declare @closedSts numeric(3);
	DECLARE @warehouse nvarchar(25);

	set @closedSts = (SELECT dbo.STSfn_RtrvSts(N'Inbound', N'10'));
	SELECT @warehouse = WAREHOUSE FROM RECEIPT_HEADER WHERE INTERNAL_RECEIPT_NUM = @iIntRecNum;

	UPDATE RECEIPT_HEADER
	
		   -- only change trailingSts fields if trailingSts will change.
	   SET TRAILING_STS = isnull(a.trailingSts, TRAILING_STS),
		   TRAILING_STS_DATE = CASE WHEN isnull(a.trailingSts, TRAILING_STS) <> TRAILING_STS
									THEN (SELECT dbo.DHfn_GetDateNoTime(dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())))
									ELSE TRAILING_STS_DATE
									 END,
		   TRAILING_STS_FAILED = CASE WHEN isnull(a.trailingSts, TRAILING_STS) <> TRAILING_STS
									THEN N'N'
									ELSE TRAILING_STS_FAILED
									 END,
									 
		   -- only change leadingSts fields if leadingSts will change.
		   LEADING_STS = isnull(a.leadingSts, LEADING_STS),
		   LEADING_STS_DATE = CASE WHEN isnull(a.leadingSts, LEADING_STS) <> LEADING_STS
								   THEN (SELECT dbo.DHfn_GetDateNoTime(dbo.GetWarehouseTimezoneValue(@warehouse,GETUTCDATE())))
								   ELSE LEADING_STS_DATE
								    END,
		   LEADING_STS_FAILED = CASE WHEN isnull(a.leadingSts, LEADING_STS) <> LEADING_STS
								   THEN N'N'
								   ELSE LEADING_STS_FAILED
								    END,
			
		   -- if changing the trailingSts to Closed, update the closeDate
		   CLOSE_DATE = CASE WHEN isnull(a.trailingSts, TRAILING_STS) <> TRAILING_STS
							  AND a.trailingSts = @closedSts
							 THEN (GETUTCDATE())
							 ELSE CLOSE_DATE
							  END,
		   PROCESS_STAMP = N'RTH_UpdateHeader',
		   DATE_TIME_STAMP = GETUTCDATE()
			
				   -- trailiingSts is AddReceiptSts if there is openQty left on
				   -- any detail or the minimum container status if no openQty.
	  FROM (SELECT CASE WHEN dtl.openQty > 0.0 
						THEN (SELECT dbo.STSfn_RtrvStsForAction(N'Inbound', 
																N'20'))
						ELSE cnt.minCntSts 
						 END trailingSts,

				   -- leadingSts is always the maximum container status.
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

	-- insert warehouse alert requests for receipts that are now closed
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
	       N'N',
	       GETUTCDATE(),
	       N'RTH_UpdateHeader',
	       N'RTH_UpdateHeader',
	       GETUTCDATE(),
	       ALERT.PRIORITY,
	       ALERT.MESSAGE,
	       @closedSts
	 FROM RECEIPT_HEADER REC WITH (NOLOCK), WAREHOUSE_ALERT ALERT WITH (NOLOCK) 
	 WHERE ALERT.ALERT_TYPE = N'Inbound'
	    AND REC.INTERNAL_RECEIPT_NUM = @iIntRecNum
	    AND REC.TRAILING_STS = @closedSts 
	    AND ALERT.ACTIVE = N'Y'
	    AND NOT EXISTS (SELECT REQUEST.INTERNAL_ALERT_REQ_NUM
	                    FROM WAREHOUSE_ALERT_REQUEST REQUEST WITH (NOLOCK) 
	                    WHERE REQUEST.INTERNAL_ALERT_NUM = ALERT.INTERNAL_ALERT_NUM
	                      AND REQUEST.INTERNAL_SOURCE_NUM = REC.INTERNAL_RECEIPT_NUM
	                      AND REQUEST.IDENTIFIER1 = @closedSts);

	if (@@ERROR <> 0) return -1;
-- end RTH_UpdateHeader
