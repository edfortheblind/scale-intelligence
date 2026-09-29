-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */














	

CREATE PROCEDURE RCB_SetStatus(
	@iIntRecContNum numeric(9), 
	@iStatus numeric(3))
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	declare @iError int;
	declare @iIntRecNum numeric(9);
	declare @iParent numeric(9);

	-- [comment omitted]
	SELECT @iParent = PARENT,
		   @iIntRecNum = INTERNAL_RECEIPT_NUM
	  FROM RECEIPT_CONTAINER WITH (NOLOCK)
	 WHERE INTERNAL_REC_CONT_NUM = @iIntRecContNum;

	-- [comment omitted]
	UPDATE RECEIPT_CONTAINER
	   SET STATUS = @iStatus,
   	       PROCESS_STAMP = N'<literal:1>',
	       DATE_TIME_STAMP = GETUTCDATE()
	 WHERE INTERNAL_REC_CONT_NUM = @iIntRecContNum;
	if (@@ERROR <> 0) return -1;

	-- [comment omitted]
	while (@iParent > 0)
	begin
		-- [comment omitted]
		-- [comment omitted]
		UPDATE RECEIPT_CONTAINER
		   SET STATUS = (SELECT MIN(STATUS) 
						   FROM RECEIPT_CONTAINER WITH (NOLOCK)
						  WHERE PARENT = @iParent),
			   PROCESS_STAMP = N'<literal:2>',
			   DATE_TIME_STAMP = GETUTCDATE()
		 WHERE INTERNAL_REC_CONT_NUM = @iParent;
		if (@@ERROR <> 0) return -1;
		 
		-- [comment omitted]
		SELECT @iParent = PARENT
		  FROM RECEIPT_CONTAINER WITH (NOLOCK)
		 WHERE INTERNAL_REC_CONT_NUM = @iParent;
	end; -- [comment omitted]

	-- [comment omitted]
	exec @iError = RTH_UpdateHeader @iIntRecNum;
	if (@@ERROR <> 0) return -1; else if (@iError <> 0) return @iError;
-- [comment omitted]
