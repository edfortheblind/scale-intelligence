-- DOCUMENTATION ONLY: literals/comments removed; do not execute.




/* [comment omitted] */







CREATE PROCEDURE [dbo].[TRAV_EX08_WorkCreationAfterExitPoint]
    @SESSIONVALUE xml,
    @PROCESS nvarchar(max),
	@LAUNCHNUM nvarchar(max)
AS

DECLARE
	@WorkUnit		nvarchar(50),
	@ToLoc			nvarchar(25),
	@IncomingPdLoc	nvarchar(25),
	@LaunchNumber	numeric(9,0),
	@ID				int

	SET @LaunchNumber = @LAUNCHNUM

	/* [comment omitted] */




	DECLARE @DS TABLE(
		[ID]				int IDENTITY(1,1),
		[WORK_UNIT]			nvarchar(50) ,
		[TO_LOC]			nvarchar(25) ,
		[INCOMING_PD_LOC]	nvarchar(25) ,
		[DONE]				char(1) DEFAULT(N'<literal:1>')
	)

	INSERT INTO @DS (
		[WORK_UNIT], 
		[TO_LOC], 
		[INCOMING_PD_LOC]
	)
	SELECT DISTINCT 
		[WORK_UNIT], 
		[TO_LOC], 
		[INCOMING_PD_LOC]
	FROM [WORK_INSTRUCTION] WITH(NOLOCK)
	WHERE [LAUNCH_NUM] = @LaunchNumber
		AND [WORK_UNIT] IS NOT NULL
		AND [TO_LOC] IS NOT NULL
		AND [INCOMING_PD_LOC] IS NOT NULL
		AND [WORK_GROUP] IN (N'<literal:2>', N'<literal:3>')
		AND [INSTRUCTION_TYPE] = N'<literal:4>'
		AND [WORK_TYPE] IN (
			N'<literal:5>'
		)

	WHILE EXISTS(SELECT 1 FROM @DS WHERE [DONE] = N'<literal:6>')
	BEGIN
		SELECT  TOP 1 
			@ID				= [ID],
			@WorkUnit		= [WORK_UNIT],
			@ToLoc			= [TO_LOC],
			@IncomingPdLoc  = [INCOMING_PD_LOC]
		FROM @DS WHERE [DONE] = N'<literal:7>'

		IF EXISTS (SELECT 1 FROM [TRAV_PALLET] WITH(NOLOCK) WHERE [WORK_UNIT] = @WorkUnit)
		BEGIN
			UPDATE [TRAV_PALLET] SET 
				[LOCATION]			= @ToLoc, 
				[LANE_NUMBER]		= @IncomingPdLoc, 
				[DATE_TIME_STAMP]	= GETDATE()
			WHERE [WORK_UNIT]	= @WorkUnit
		END
		ELSE
		BEGIN
			INSERT INTO [TRAV_PALLET] (
				[WORK_UNIT], 
				[LOCATION], 
				[LANE_NUMBER], 
				[DATE_TIME_STAMP]
			)
			VALUES (
				@WorkUnit, 
				@ToLoc, 
				@IncomingPdLoc, 
				GETDATE()
			)
		END
		
		UPDATE @DS SET [DONE] = N'<literal:8>'
		WHERE [ID] = @ID 
 	END