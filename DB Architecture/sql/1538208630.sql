-- DOCUMENTATION ONLY: literals/comments removed; do not execute.
/* [comment omitted] */






CREATE PROCEDURE TRAV_EX02_ScheduledJob
AS
	DECLARE @DS TABLE (
		[ID]		int IDENTITY(1,1),
		[WORK_UNIT]	nvarchar(50),
		[DONE]		nchar(1) DEFAULT (N'<literal:1>')
	)

	/* [comment omitted] */




	INSERT INTO @DS ([WORK_UNIT])
	SELECT [WORK_UNIT] FROM [TRAV_LANE] WITH(NOLOCK)
	WHERE ([PRIORITY_ESCALATED] IS NULL OR [PRIORITY_ESCALATED] = N'<literal:2>')

	DECLARE 
		@WorkUnit	nvarchar(50),
		@ID			int

	WHILE EXISTS(SELECT 1 FROM @DS WHERE [DONE] = N'<literal:3>')
	BEGIN
		SELECT  TOP 1 
			@ID				= [ID],
			@WorkUnit		= [WORK_UNIT]
		FROM @DS WHERE [DONE] = N'<literal:4>'

		UPDATE [TRAV_LANE] SET 
			[PRIORITY_ESCALATED] = N'<literal:5>' 
		WHERE [WORK_UNIT] = @WorkUnit

		IF EXISTS(SELECT 1 FROM [WORK_INSTRUCTION] WITH(NOLOCK) WHERE [WORK_UNIT] = @WorkUnit AND ([PRIORITY] IS NULL OR [PRIORITY] > 3))
		BEGIN
			UPDATE [WORK_INSTRUCTION] SET [PRIORITY] = 3 WHERE [WORK_UNIT] = @WorkUnit
		END

		UPDATE @DS SET [DONE] = N'<literal:6>'
		WHERE [ID] = @ID 
	END

