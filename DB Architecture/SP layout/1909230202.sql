/*
	Mod Number	| Programmer	| Date   	| Modification Description
	--------------------------------------------------------------------
	9211		| RAB			| 05/31/02	| Created.
	11870		| TBS			| 10/06/03	| Added MultiByte support.
	9593		| RAB			| 10/09/02	| Modified for standards.
	19864           | NN                    | 08/31/06      | Removed the Read Locks from Select Statements
	97383		| TDA			| 04/06/12	| Update Date Time Stamp and Process Stamp on container
   
	Updates the ReceiptContainers status and propogates the change
	through the ReceiptTree.
	
	Parameters
		int		@iIntRecContNum		ReceiptContainer being updated.
		int		@iStatus			Status being set.
*/	

CREATE PROCEDURE RCB_SetStatus(
	@iIntRecContNum numeric(9), 
	@iStatus numeric(3))
AS
	SET NOCOUNT ON;

	-- local variables
	declare @iError int;
	declare @iIntRecNum numeric(9);
	declare @iParent numeric(9);

	-- retrieve information about the current contaiener
	SELECT @iParent = PARENT,
		   @iIntRecNum = INTERNAL_RECEIPT_NUM
	  FROM RECEIPT_CONTAINER WITH (NOLOCK)
	 WHERE INTERNAL_REC_CONT_NUM = @iIntRecContNum;

	-- update the container
	UPDATE RECEIPT_CONTAINER
	   SET STATUS = @iStatus,
   	       PROCESS_STAMP = N'RCB_SetStatus',
	       DATE_TIME_STAMP = GETUTCDATE()
	 WHERE INTERNAL_REC_CONT_NUM = @iIntRecContNum;
	if (@@ERROR <> 0) return -1;

	-- update any parents status up the ReceiptContainer tree.
	while (@iParent > 0)
	begin
		-- Parent containers always have the min status of
		-- their children.
		UPDATE RECEIPT_CONTAINER
		   SET STATUS = (SELECT MIN(STATUS) 
						   FROM RECEIPT_CONTAINER WITH (NOLOCK)
						  WHERE PARENT = @iParent),
			   PROCESS_STAMP = N'RCB_SetStatus',
			   DATE_TIME_STAMP = GETUTCDATE()
		 WHERE INTERNAL_REC_CONT_NUM = @iParent;
		if (@@ERROR <> 0) return -1;
		 
		-- Get the next parent.
		SELECT @iParent = PARENT
		  FROM RECEIPT_CONTAINER WITH (NOLOCK)
		 WHERE INTERNAL_REC_CONT_NUM = @iParent;
	end; -- end while up ShippingContainer tree.

	-- update the Receipt's status.
	exec @iError = RTH_UpdateHeader @iIntRecNum;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- end RCB_SetStatus
