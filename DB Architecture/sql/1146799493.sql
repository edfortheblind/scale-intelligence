-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */





CREATE PROCEDURE WRK_UnAssignGroupForSystemDirectedWork(
@groupNumber nvarchar(50),
@processStamp nvarchar(100),
@userStamp nvarchar(30),
@dateTimeStamp datetime
)  
AS

IF(ISNULL(@groupNumber , N'<literal:1>') != N'<literal:2>')
	BEGIN
	
	-- [comment omitted]
	UPDATE WORK_INSTRUCTION
	SET  GROUP_NUM = NULL
		,USER_ASSIGNED = NULL
		,TEAM_ASSIGNED = NULL
		,USER_STAMP = @userStamp
		,PROCESS_STAMP =@processStamp
		,DATE_TIME_STAMP =@dateTimeStamp
		WHERE GROUP_NUM = @groupNumber AND INTERNAL_NUM_TYPE = N'<literal:3>';
	

	END