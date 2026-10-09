




/*
Mod Number	| Programmer	| Date   	| Modification Description	
------------|---------------|-----------|-------------------------
			| MJ			| 02/07/19	| Create the stored procedure to update the Outgoing PND location.
*/

CREATE PROCEDURE [dbo].[EXP_WorkCreationAfterExitPoint]
    @SESSIONVALUE xml,
    @PROCESS nvarchar(max),
	@LAUNCHNUM nvarchar(max)
AS

BEGIN

	/* Updating work with Outgoing PND location to Drop-1 where inventory is being moved from R locations to F locations.
	*/
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
		WHERE LAUNCH_NUM = @LAUNCHNUM
			--AND OUTGOING_PD_LOC IS NULL
			AND CONDITION = 'Open'
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

	/*Calling EX08 Store procedure to insert data into EMIT Conveyor if the SP exists
	*/
	IF EXISTS (SELECT 1 FROM sys.objects WHERE [name] = N'TRAV_EX08_WorkCreationAfterExitPoint')
	BEGIN 
		EXEC TRAV_EX08_WorkCreationAfterExitPoint @SESSIONVALUE, @PROCESS, @LAUNCHNUM
	END

 END