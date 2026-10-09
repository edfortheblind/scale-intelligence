/*
Mod Number	| Programmer	| Date   	| Modification Description	
------------|---------------|-----------|-------------------------
EX02		| Luciano Peres	| 9/27/18	| Create the stored procedure TRAV_EX02_ScheduledJob
EX02		| Luciano Peres	| 10/4/18	| Added the prefix TRAV_ to the custom tables. 
*/

CREATE PROCEDURE TRAV_EX02_ScheduledJob
AS
	DECLARE @DS TABLE (
		[ID]		int IDENTITY(1,1),
		[WORK_UNIT]	nvarchar(50),
		[DONE]		nchar(1) DEFAULT (N'N')
	)

	/*
	Using a table to store the work_unit to be processed so
	we can iterate through that without using a cursor
	*/

	INSERT INTO @DS ([WORK_UNIT])
	SELECT [WORK_UNIT] FROM [TRAV_LANE] WITH(NOLOCK)
	WHERE ([PRIORITY_ESCALATED] IS NULL OR [PRIORITY_ESCALATED] = N'N')

	DECLARE 
		@WorkUnit	nvarchar(50),
		@ID			int

	WHILE EXISTS(SELECT 1 FROM @DS WHERE [DONE] = N'N')
	BEGIN
		SELECT  TOP 1 
			@ID				= [ID],
			@WorkUnit		= [WORK_UNIT]
		FROM @DS WHERE [DONE] = N'N'

		UPDATE [TRAV_LANE] SET 
			[PRIORITY_ESCALATED] = N'Y' 
		WHERE [WORK_UNIT] = @WorkUnit

		IF EXISTS(SELECT 1 FROM [WORK_INSTRUCTION] WITH(NOLOCK) WHERE [WORK_UNIT] = @WorkUnit AND ([PRIORITY] IS NULL OR [PRIORITY] > 3))
		BEGIN
			UPDATE [WORK_INSTRUCTION] SET [PRIORITY] = 3 WHERE [WORK_UNIT] = @WorkUnit
		END

		UPDATE @DS SET [DONE] = N'Y'
		WHERE [ID] = @ID 
	END

