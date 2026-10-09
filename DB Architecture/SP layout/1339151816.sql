





/*
Mod Number	| Programmer	| Date   	| Modification Description	
------------|---------------|-----------|-------------------------
EX08		| Luciano Peres	| 9/27/18	| Create the stored procedure TRAV_EX08_ScheduledJob
EX08		| Luciano Peres	| 10/4/18	| Added the prefix TRAV_ to the custom tables. 
EX08		| Shawn Hinkle	| 2/21/19	| Added "and work_unit != 'NONE'" to INSERT INTO @DS statement 
EX08		| Shawn Hinkle	| 3/05/19	| Added statement to insert into TRAV_PALLET transfer records with renamed work units and DELETE (self clean) TRAV_PALLET
EX08		| Shawn Hinkle	| 3/06/19	| Added UPDATE to WORK_INSTRUCTION to make all open status Transfer to STZ-R% to Priority 5 (same as putaway)

*/

CREATE PROCEDURE [dbo].[TRAV_EX08_ScheduledJob]
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
	and work_unit != 'NONE'  -- Shawn 2019-02-21

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

	--insert transfer work unit into TRAV_PALLET if headed for R locations and is different from the parent instruction (indicates LPN rename)
	BEGIN
		INSERT INTO TRAV_PALLET (WORK_UNIT, LOCATION, LANE_NUMBER, DATE_TIME_STAMP)
			SELECT 	wi.WORK_UNIT, to_loc, INCOMING_PD_LOC as LANE_NUMBER, wi.DATE_TIME_STAMP
			FROM	dbo.WORK_INSTRUCTION wi left join TRAV_PALLET tp 
					 on wi.work_unit = tp.WORK_UNIT 
			WHERE	INSTRUCTION_TYPe = 'Detail' and		
			CONDITION in ('Open','In Process')
			and work_type IN ('STZ-Transfer', 'STZ-Transfer to R')
			and to_loc like 'STZ-R%'
			and tp.WORK_UNIT is null
			and INCOMING_PD_LOC is not null
			and wi.work_unit != CAST(PARENT_INSTR AS nvarchar(100))
			and ISNUMERIC(wi.work_unit) = 1
		order by wi.work_unit, parent_instr
	END

	BEGIN
		--garbage disposal for the TRAV_PALLET table
		DELETE from trav_pallet where work_unit NOT IN (select work_unit from WORK_INSTRUCTION)
	END	

		/*
		--set all priorities on transfer work to 5 --
		UPDATE dbo.WORK_INSTRUCTION  
		set		priority = 5
		WHERE	CONDITION in ('Open')
		and		work_type = 'STZ-Transfer'
		and		to_loc like 'STZ-R%'
		and		INCOMING_PD_LOC is not null
		and		PRIORITY NOT IN (3,5)
		*/

	BEGIN
		--update Transfers and replenishments out of R with Drop locations.
		UPDATE WORK_INSTRUCTION
		SET OUTGOING_PD_LOC = 
			CASE 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('01','02') THEN 'DROP-02' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('03','04') THEN 'DROP-04' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('05','06') THEN 'DROP-06' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('07','08') THEN 'DROP-08' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('09','10') THEN 'DROP-10' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('11','12') THEN 'DROP-12' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('13','14') THEN 'DROP-14' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('15','16') THEN 'DROP-16' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('17','18') THEN 'DROP-18' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('19','20') THEN 'DROP-20' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('21','22') THEN 'DROP-22' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('23','24') THEN 'DROP-24' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('25','26') THEN 'DROP-26' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('27','28') THEN 'DROP-28' 
				WHEN FROM_TEMPL_FIELD2 = 'R' and FROM_TEMPL_FIELD3 in ('29','30') THEN 'DROP-30' 
			end
		WHERE INTERNAL_INSTRUCTION_NUM in (
			SELECT 
				INTERNAL_INSTRUCTION_NUM
			FROM WORK_INSTRUCTION WITH(NOLOCK)
			WHERE --LAUNCH_NUM = @LAUNCHNUM
				--AND 
				OUTGOING_PD_LOC IS NULL AND
				 CONDITION = 'Open'
				AND WORK_GROUP IN (N'Stock Control-Transfer')
				AND INSTRUCTION_TYPE = N'Detail'
				AND WORK_TYPE IN (
					'STZ-Replen', 
					'STZ-Transfer',
					'STZ-Transfer from R Upper',
					'STZ-Transfer-Walking'
						)
				AND FROM_TEMPL_FIELD1 = 'STZ'
				AND FROM_TEMPL_FIELD2 = 'R'
				AND TO_TEMPL_FIELD1 = 'STZ'
				AND TO_TEMPL_FIELD2 IN ('F','S','M')
				)
	END