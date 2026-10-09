/*
Mod Number | Programmer | Date | Modification Description
--------------------------------------------------------------------
 | CRW | 2/18/2026 | Added
*/

CREATE PROCEDURE TRAV_CC_Reconcile (@culture nvarchar(100))
AS
BEGIN 
	DECLARE @WorkUnit NVARCHAR(max)

	--declare @temptableforcc table (work_unit NVARCHAR(max),
	--from_whs NVARCHAR(max),
	--from_loc NVARCHAR(max))

	DECLARE sl_workunits CURSOR LOCAL STATIC READ_ONLY FORWARD_ONLY
	FOR
		SELECT work_unit
		FROM work_instruction WITH(NOLOCK)
		WHERE INTERNAL_NUM_TYPE = N'Cycle Count'
		AND condition = N'In Process'
		GROUP BY work_unit
		HAVING Count(work_unit) = 1
		ORDER BY work_unit ASC;

	OPEN sl_workunits;
	
	FETCH next FROM sl_workunits INTO @WorkUnit
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
	
		--INSERT INTO @temptableforcc (work_unit, from_whs, from_loc)
		
		--SELECT work_unit, from_whs, from_loc
		--FROM work_instruction
		--WHERE work_unit = @WorkUnit
		--AND instruction_type = N'Header'
		
		UPDATE work_instruction
		SET condition = N'Closed',
		process_stamp = N'CCUpdates'
		WHERE work_unit = @WorkUnit
		AND instruction_type = N'HEADER'
		AND INTERNAL_NUM_TYPE = N'Cycle Count'
		 
		EXEC Deactivatework @WorkUnit

		FETCH next FROM sl_workunits INTO @WorkUnit
	END;
	
	CLOSE sl_workunits
	DEALLOCATE sl_workunits
	
	--SELECT *
	--FROM @temptableforcc

END

