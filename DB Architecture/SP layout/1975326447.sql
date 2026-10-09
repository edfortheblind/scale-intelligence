/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	9390		| RAB			| 07/27/02	| Added stConfQtyList, stConfTypeList, and iFROMTO.
	9593		| RAB			| 11/01/02	| Deprecated.

	Calls WTH_UpdateStatus for each internalInstructionNum passed
	in stInstrList.  
	
	Parameters
		varchar		@stInstrList	A comma-delimited string of 
									internalInstructionNums.
		varchar		@stConfQtyList	A comma-delimited string of 
									confirmed qty.
		varchar		@stInstrType	The type of work we are processing.							
		int			@iFromTo		Constants.iFROM to symbolize a pick, 
									Constants.iTO for putaway,
									Constants.iFROMTO for both.
		int			@stConfTypeList	Constants.iFULL for full confirmation,
									Constants.iSHORT for short pick,
									Constants.iPARTIAL for partial pick.
*/	
CREATE PROCEDURE WTH_UpdateStatusBatch(@stInstrList varchar(8000),
									   @stConfQtyList varchar(8000),
									   @stInstrType varchar(25),
									   @iFromTo int,
									   @stConfTypeList varchar(8000))
AS

	-- Deprecated.  We now call WTH_UpdateStatus in a loop on the Java side.

-- end WTH_UpdateStatusBatch
