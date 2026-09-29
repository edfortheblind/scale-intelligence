-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */















CREATE PROCEDURE CCP_InsertCCPlan(
	@iGroupSize numeric(9),
	@stWhs nvarchar(25),
	@stUserName nvarchar(30),
	@iPlanNum numeric(9) output)
AS
	SET NOCOUNT ON;

	-- [comment omitted]
	INSERT INTO CYCLE_COUNT_PLAN
		   (CREATED_DATE,
		    GROUP_SIZE,
		    MASTER_NAME,
			IN_CREATION,
		    RELEASED,
		    TOTAL_OPEN,
		    TOTAL_CLOSED,
		    TOTAL_REVIEWED,
		    WAREHOUSE,
			USER_STAMP,
			PROCESS_STAMP,
			DATE_TIME_STAMP)
	VALUES (GETUTCDATE(), -- [comment omitted]
			@iGroupSize,
			null, -- [comment omitted]
			N'<literal:1>', -- [comment omitted]
			N'<literal:2>', -- [comment omitted]
			0, -- [comment omitted]
			0, -- [comment omitted]
			0, -- [comment omitted]
			@stWhs,
			@stUserName, -- [comment omitted]
			N'<literal:3>', -- [comment omitted]
			GETUTCDATE()); -- [comment omitted]
	if (@@ERROR <> 0) return -1;
	
	set @iPlanNum = scope_identity();
-- [comment omitted]