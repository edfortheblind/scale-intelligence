



/*
Mod Number	| Programmer	| Date   	| Modification Description	
------------|---------------|-----------|-------------------------
EX08		| Luciano Peres	| 9/27/18	| Create the stored procedure TRAV_EX08_WorkCreationAfterExitPoint
EX08		| Luciano Peres	| 10/1/18	| Added the Work_Type criteria as defined by customer.
EX08		| Luciano Peres	| 10/4/18	| Added the prefix TRAV_ to the custom tables. 
*/

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

	/*
	Using a temporary table to store data from WORK_INSTRUCTION table so
	we can iterate through the table without using a cursor
	*/

	DECLARE @DS TABLE(
		[ID]				int IDENTITY(1,1),
		[WORK_UNIT]			nvarchar(50) ,
		[TO_LOC]			nvarchar(25) ,
		[INCOMING_PD_LOC]	nvarchar(25) ,
		[DONE]				char(1) DEFAULT(N'N')
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
		AND [WORK_GROUP] IN (N'Receiving', N'Stock Control-Transfer')
		AND [INSTRUCTION_TYPE] = N'Detail'
		AND [WORK_TYPE] IN (
			N'STZ-Putaway'
		)

	WHILE EXISTS(SELECT 1 FROM @DS WHERE [DONE] = N'N')
	BEGIN
		SELECT  TOP 1 
			@ID				= [ID],
			@WorkUnit		= [WORK_UNIT],
			@ToLoc			= [TO_LOC],
			@IncomingPdLoc  = [INCOMING_PD_LOC]
		FROM @DS WHERE [DONE] = N'N'

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
		
		UPDATE @DS SET [DONE] = N'Y'
		WHERE [ID] = @ID 
 	END