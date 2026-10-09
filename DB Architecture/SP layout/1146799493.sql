/*
    Task       | By         | Date                  | Modification Description
    --------------------------------------------------------------------
    256927	   | PMB        | 08/12/20				| Created to unassign group number on work instruction for system  directed work.
*/

CREATE PROCEDURE WRK_UnAssignGroupForSystemDirectedWork(
@groupNumber nvarchar(50),
@processStamp nvarchar(100),
@userStamp nvarchar(30),
@dateTimeStamp datetime
)  
AS

IF(ISNULL(@groupNumber , N'') != N'')
	BEGIN
	
	-- RESET GROUP NUMBER AND UNASSIGN THE WORKINSTRUCTIOS FOR THE PASSED GROUP ID.
	UPDATE WORK_INSTRUCTION
	SET  GROUP_NUM = NULL
		,USER_ASSIGNED = NULL
		,TEAM_ASSIGNED = NULL
		,USER_STAMP = @userStamp
		,PROCESS_STAMP =@processStamp
		,DATE_TIME_STAMP =@dateTimeStamp
		WHERE GROUP_NUM = @groupNumber AND INTERNAL_NUM_TYPE = N'RECEIPT';
	

	END