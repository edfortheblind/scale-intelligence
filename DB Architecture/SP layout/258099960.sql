/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	9390		| RAB			| 07/11/02	| Added fields to update.
	9593		| RAB			| 10/09/02	| Modified for standards.
	14473		| TDL			| 04/13/04	| Fixed Apostrophes
	10632		| MD			| 07/12/04	| Added fields to update
	16780		| TDL			| 09/07/05	| Force Recompile
	10527		| AK			| 09/19/07	| Captured milliseconds on the End date time for work instructions 
	79376		| DRK			| 02/08/2011| Set Start and End Datetime on WI from Fullscreen
	95201       | MHM           | 02/17/12  | Added UpdateHeader method.
	191074		| DN			| 01/23/17	| Updated parameter types
	Updates the specified WorkInstruction header.
	
	Parameters
		int		iHdrInstrNum	The WorkInstruction headers internalInstructionNum.
*/

CREATE PROCEDURE [dbo].[WTH_UpdateHeader](
	@iHdrInstrNum numeric(9),
	@endDateTime datetime = null,
	@userAssigned nvarchar(30)=null)
AS
	SET NOCOUNT ON;
	
	-- #DEFINE WMW.JSharp.General com.pronto.general.Constants Constants;
	
	-- validate parameters.
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
					   THEN N'Closed'
					   ELSE CONDITION
					   END,
     		   END_DATE_TIME = CASE WHEN dtls.totFromQty + dtls.totToQty = 0.0
				   THEN case when @endDateTime is null then GETUTCDATE() else @endDateTime end
				   ELSE NULL
				   END,	
		   PROCESS_STAMP = N'WTH_UpdateHeader', 
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
	     PROCESS_STAMP = N'WTH_UpdateHeader',
             DATE_TIME_STAMP = GETUTCDATE()
	WHERE INTERNAL_INSTRUCTION_NUM = @iHdrInstrNum and Condition = N'Closed';

	if (@@ERROR <> 0) return -1;