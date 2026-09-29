-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */














CREATE PROCEDURE SCB_SetStatus(
	@iIntContNum numeric(9),
	@iNewSts numeric(3))
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	declare @iParent numeric(9);

	-- [comment omitted]
	SELECT @iParent = PARENT
	  FROM SHIPPING_CONTAINER
	 WHERE INTERNAL_CONTAINER_NUM = @iIntContNum;

	-- [comment omitted]
	UPDATE SHIPPING_CONTAINER
	   SET STATUS = @iNewSts,
		   PROCESS_STAMP = N'<literal:1>',
		   DATE_TIME_STAMP = GETUTCDATE()
	 WHERE INTERNAL_CONTAINER_NUM = @iIntContNum;
	if (@@ERROR <> 0) return -1;
	 
	-- [comment omitted]
	while (@iParent > 0)
	begin
		-- [comment omitted]
		-- [comment omitted]
		UPDATE SHIPPING_CONTAINER
		   SET STATUS = (SELECT MIN(STATUS) 
						   FROM SHIPPING_CONTAINER
						  WHERE PARENT = @iParent),
			   PROCESS_STAMP = N'<literal:2>',
			   DATE_TIME_STAMP = GETUTCDATE()
		 WHERE INTERNAL_CONTAINER_NUM = @iParent;
		if (@@ERROR <> 0) return -1;
		 
		-- [comment omitted]
		SELECT @iParent = PARENT
		  FROM SHIPPING_CONTAINER
		 WHERE INTERNAL_CONTAINER_NUM = @iParent;
	end; -- [comment omitted]
-- [comment omitted]
