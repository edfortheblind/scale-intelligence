-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */


















CREATE PROCEDURE [dbo].[WTH_UpdateHeader](
	@iHdrInstrNum numeric(9),
	@endDateTime datetime = null,
	@userAssigned nvarchar(30)=null)
AS
	SET NOCOUNT ON;
	
	-- [comment omitted]
	
	-- [comment omitted]
	if (@iHdrInstrNum is null
		OR @iHdrInstrNum <= 0)
		return -1;
	
	UPDATE WORK_INSTRUCTION 
	   SET FROM_QTY = dtls.totFromQty,
		   QUANTITY = dtls.totQuantity,
		   TO_QTY = dtls.totToQty,
		   CONVERTED_QTY = dtls.totConvertedQty,
		   TOTAL_VALUE = dtls.totValue,
		   TOTAL_VOLUME = dtls.totVolume,
		   TOTAL_WEIGHT = dtls.totWeight,
		   CONDITION = CASE WHEN dtls.totFromQty + dtls.totToQty = 0.0
					   THEN N'<literal:1>'
					   ELSE CONDITION
					   END,
     		   END_DATE_TIME = CASE WHEN dtls.totFromQty + dtls.totToQty = 0.0
				   THEN case when @endDateTime is null then GETUTCDATE() else @endDateTime end
				   ELSE NULL
				   END,	
		   PROCESS_STAMP = N'<literal:2>', 
           USER_ASSIGNED= CASE WHEN @userAssigned IS NOT NULL  
                               THEN @userAssigned
                               ELSE USER_ASSIGNED
                               END,
		   DATE_TIME_STAMP = GETUTCDATE()
	  FROM (SELECT SUM(FROM_QTY) totFromQty,
				   SUM(QUANTITY) totQuantity,
				   SUM(TO_QTY) totToQty,
				   SUM(CONVERTED_QTY) totConvertedQty,
				   SUM(TOTAL_VALUE) totValue,
				   SUM(TOTAL_VOLUME) totVolume,
				   SUM(TOTAL_WEIGHT) totWeight
			  FROM WORK_INSTRUCTION
			 WHERE PARENT_INSTR = @iHdrInstrNum) dtls
	 WHERE INTERNAL_INSTRUCTION_NUM = @iHdrInstrNum;
	 
	UPDATE WORK_INSTRUCTION 
	    SET COMPLETED_BY_USER = USER_ASSIGNED,
	     PROCESS_STAMP = N'<literal:3>',
             DATE_TIME_STAMP = GETUTCDATE()
	WHERE INTERNAL_INSTRUCTION_NUM = @iHdrInstrNum and Condition = N'<literal:4>';

	if (@@ERROR <> 0) return -1;