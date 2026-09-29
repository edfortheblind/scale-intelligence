-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */











	
CREATE PROCEDURE NNR_RtrvNextLaunchNum(
	@stWhs nvarchar(25),
	@iLaunchNum numeric(9) output)
AS
	SET NOCOUNT ON;
	
	-- [comment omitted]
	-- [comment omitted]
	INSERT INTO LAUNCH_STATISTICS
		   (AUTO_RELEASE, 
			DATE_TIME_STAMP,
		    CLOSED, 
		    LAUNCH_FLOW,
		    LAUNCH_MODE,
		    LAUNCH_NAME,
		    WAREHOUSE)
	VALUES (N'<literal:1>', -- [comment omitted]
			GETUTCDATE(), -- [comment omitted]
			N'<literal:2>', -- [comment omitted]
			N'<literal:3>', -- [comment omitted]
			N'<literal:4>', -- [comment omitted]
			N'<literal:5>', -- [comment omitted]
			@stWhs); -- [comment omitted]
	if (@@ERROR <> 0) return -1;
	
	set @iLaunchNum = scope_identity();
	
	DELETE LAUNCH_STATISTICS
	 WHERE INTERNAL_LAUNCH_NUM = @iLaunchNum;
	if (@@ERROR <> 0) return -1;
-- [comment omitted]