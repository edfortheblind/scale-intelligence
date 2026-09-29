-- DOCUMENTATION ONLY: literals/comments removed; do not execute.






/* [comment omitted] */










CREATE PROCEDURE [dbo].[TRAV_EX08_ScheduledJob]
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
	and work_unit != '<literal:3>'  -- [comment omitted]

	DECLARE 
		@WorkUnit	nvarchar(50),
		@ID			int

	WHILE EXISTS(SELECT 1 FROM @DS WHERE [DONE] = N'<literal:4>')
	BEGIN
		SELECT  TOP 1 
			@ID				= [ID],
			@WorkUnit		= [WORK_UNIT]
		FROM @DS WHERE [DONE] = N'<literal:5>'

		UPDATE [TRAV_LANE] SET 
			[PRIORITY_ESCALATED] = N'<literal:6>' 
		WHERE [WORK_UNIT] = @WorkUnit

		IF EXISTS(SELECT 1 FROM [WORK_INSTRUCTION] WITH(NOLOCK) WHERE [WORK_UNIT] = @WorkUnit AND ([PRIORITY] IS NULL OR [PRIORITY] > 3))
		BEGIN
			UPDATE [WORK_INSTRUCTION] SET [PRIORITY] = 3 WHERE [WORK_UNIT] = @WorkUnit
		END

		UPDATE @DS SET [DONE] = N'<literal:7>'
		WHERE [ID] = @ID 
	END

	-- [comment omitted]
	BEGIN
		INSERT INTO TRAV_PALLET (WORK_UNIT, LOCATION, LANE_NUMBER, DATE_TIME_STAMP)
			SELECT 	wi.WORK_UNIT, to_loc, INCOMING_PD_LOC as LANE_NUMBER, wi.DATE_TIME_STAMP
			FROM	dbo.WORK_INSTRUCTION wi left join TRAV_PALLET tp 
					 on wi.work_unit = tp.WORK_UNIT 
			WHERE	INSTRUCTION_TYPe = '<literal:8>' and		
			CONDITION in ('<literal:9>','<literal:10>')
			and work_type IN ('<literal:11>', '<literal:12>')
			and to_loc like '<literal:13>'
			and tp.WORK_UNIT is null
			and INCOMING_PD_LOC is not null
			and wi.work_unit != CAST(PARENT_INSTR AS nvarchar(100))
			and ISNUMERIC(wi.work_unit) = 1
		order by wi.work_unit, parent_instr
	END

	BEGIN
		-- [comment omitted]
		DELETE from trav_pallet where work_unit NOT IN (select work_unit from WORK_INSTRUCTION)
	END	

		/* [comment omitted] */










	BEGIN
		-- [comment omitted]
		UPDATE WORK_INSTRUCTION
		SET OUTGOING_PD_LOC = 
			CASE 
				WHEN FROM_TEMPL_FIELD2 = '<literal:14>' and FROM_TEMPL_FIELD3 in ('<literal:15>','<literal:16>') THEN '<literal:17>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:18>' and FROM_TEMPL_FIELD3 in ('<literal:19>','<literal:20>') THEN '<literal:21>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:22>' and FROM_TEMPL_FIELD3 in ('<literal:23>','<literal:24>') THEN '<literal:25>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:26>' and FROM_TEMPL_FIELD3 in ('<literal:27>','<literal:28>') THEN '<literal:29>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:30>' and FROM_TEMPL_FIELD3 in ('<literal:31>','<literal:32>') THEN '<literal:33>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:34>' and FROM_TEMPL_FIELD3 in ('<literal:35>','<literal:36>') THEN '<literal:37>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:38>' and FROM_TEMPL_FIELD3 in ('<literal:39>','<literal:40>') THEN '<literal:41>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:42>' and FROM_TEMPL_FIELD3 in ('<literal:43>','<literal:44>') THEN '<literal:45>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:46>' and FROM_TEMPL_FIELD3 in ('<literal:47>','<literal:48>') THEN '<literal:49>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:50>' and FROM_TEMPL_FIELD3 in ('<literal:51>','<literal:52>') THEN '<literal:53>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:54>' and FROM_TEMPL_FIELD3 in ('<literal:55>','<literal:56>') THEN '<literal:57>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:58>' and FROM_TEMPL_FIELD3 in ('<literal:59>','<literal:60>') THEN '<literal:61>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:62>' and FROM_TEMPL_FIELD3 in ('<literal:63>','<literal:64>') THEN '<literal:65>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:66>' and FROM_TEMPL_FIELD3 in ('<literal:67>','<literal:68>') THEN '<literal:69>' 
				WHEN FROM_TEMPL_FIELD2 = '<literal:70>' and FROM_TEMPL_FIELD3 in ('<literal:71>','<literal:72>') THEN '<literal:73>' 
			end
		WHERE INTERNAL_INSTRUCTION_NUM in (
			SELECT 
				INTERNAL_INSTRUCTION_NUM
			FROM WORK_INSTRUCTION WITH(NOLOCK)
			WHERE -- [comment omitted]
				-- [comment omitted]
				OUTGOING_PD_LOC IS NULL AND
				 CONDITION = '<literal:74>'
				AND WORK_GROUP IN (N'<literal:75>')
				AND INSTRUCTION_TYPE = N'<literal:76>'
				AND WORK_TYPE IN (
					'<literal:77>', 
					'<literal:78>',
					'<literal:79>',
					'<literal:80>'
						)
				AND FROM_TEMPL_FIELD1 = '<literal:81>'
				AND FROM_TEMPL_FIELD2 = '<literal:82>'
				AND TO_TEMPL_FIELD1 = '<literal:83>'
				AND TO_TEMPL_FIELD2 IN ('<literal:84>','<literal:85>','<literal:86>')
				)
	END